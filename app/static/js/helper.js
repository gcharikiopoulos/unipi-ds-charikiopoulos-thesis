function initDateRangePicker(onApplyCallback) {
    window.selectedStart = moment.utc("2024-01-01 00:00", "YYYY-MM-DD HH:mm").toDate();
    window.selectedEnd = moment.utc("2024-01-01 01:00", "YYYY-MM-DD HH:mm").toDate();

    $('#datetime-range').daterangepicker({
        timePicker: true,
        timePicker24Hour: true,
        showDropdowns: true,
        timePickerSeconds: false,
        startDate: moment.utc("2024-01-01 00:00", "YYYY-MM-DD HH:mm"),
        endDate: moment.utc("2024-01-01 01:00", "YYYY-MM-DD HH:mm"),
        minDate: moment.utc("2024-01-01 00:00", "YYYY-MM-DD HH:mm"),
        maxDate: moment.utc("2024-12-31 23:59", "YYYY-MM-DD HH:mm"),
        locale: {
            format: 'YYYY-MM-DD HH:mm',
            applyLabel: "Apply",
            cancelLabel: "Cancel"
        }
    }, function (start, end) {
        window.selectedStart = moment.utc(start.format('YYYY-MM-DD HH:mm')).toDate();
        window.selectedEnd = moment.utc(end.format('YYYY-MM-DD HH:mm')).toDate();
    });

    // Hook into apply event
    $('#datetime-range').on('apply.daterangepicker', () => {
        if (typeof onApplyCallback === 'function') {
            onApplyCallback(window.selectedStart, window.selectedEnd);
        }
    });
}

function generatePopupContent(vessel) {
    const vesselType = getVesselTypeName(vessel.vessel_type);

    // Format values with conditional units
    const formatValue = (value, unit) => {
        if (value === null || value === undefined || value === "" || Number.isNaN(value)) {
            return "-";
        }
        return unit ? `${value} ${unit}` : value;
    };

    const headingValue = (vessel.heading === 511 || vessel.heading == null)
        ? "N/A"
        : `${vessel.heading}°`;

    return `
    <div class="vessel-popup">
        <div class="popup-header"><strong>${vessel.vessel_name || "Unknown"}</strong></div>
        <div class="popup-columns">
            <table class="popup-table">
                <tr><td><b>MMSI:</b></td><td>${vessel.mmsi || "-"}</td></tr>
                <tr><td><b>Datetime:</b></td><td>${vessel.datetime_utc || "-"}</td></tr>
                <tr><td><b>Latitude:</b></td><td>${formatValue(vessel.lat)}</td></tr>
                <tr><td><b>Longitude:</b></td><td>${formatValue(vessel.lon)}</td></tr>
                <tr><td><b>Speed:</b></td><td>${formatValue(vessel.sog, "knots")}</td></tr>
                <tr><td><b>Course:</b></td><td>${formatValue(vessel.cog, "°")}</td></tr>
                <tr><td><b>Heading:</b></td><td>${headingValue}</td></tr>
            </table>
            <table class="popup-table">
                <tr><td><b>Call Sign:</b></td><td>${vessel.callsign || "-"}</td></tr>
                <tr><td><b>Type:</b></td><td>${vesselType || "-"}</td></tr>
                <tr><td><b>Status:</b></td><td>${vessel.status || "-"}</td></tr>
                <tr><td><b>Size:</b></td><td>${formatValue(vessel.length)} × ${formatValue(vessel.width)}</td></tr>
                <tr><td><b>Draft:</b></td><td>${formatValue(vessel.draft, "m")}</td></tr>
                <tr><td><b>Cargo:</b></td><td>${formatValue(vessel.cargo)}</td></tr>
                <tr><td><b>Transceiver:</b></td><td>${vessel.transceiver_class || "-"}</td></tr>
            </table>
        </div>
    </div>
    `;
}

function generateMedoidPopupContent(medoid) {
    return `
        <strong>${medoid.vessel_name || "Unknown Vessel"}</strong><br>
        <b>MMSI:</b> ${medoid.mmsi || "-"}<br>
        <b>Type:</b> ${medoid.vessel_type || "-"}<br>
        <b>Trajectory Length:</b> ${medoid.trajectory.length} points
    `;
}

function getVesselTypeName(code) {
    if (code == null || isNaN(code)) return "Unknown";

    const c = Math.floor(Number(code));

    switch (true) {
        case c === 30: return "Fishing";
        case c === 31: return "Towing";
        case c === 32: return "Towing (Long/Heavy)";
        case c >= 33 && c <= 35: return "Special Operations";
        case c === 36: return "Sailing";
        case c === 37: return "Pleasure Craft";
        case c >= 40 && c <= 49: return "High Speed Craft";
        case c >= 50 && c <= 59: return "Service Vessel";
        case c >= 60 && c <= 69: return "Passenger";
        case c >= 70 && c <= 79: return "Cargo";
        case c >= 80 && c <= 89: return "Tanker";
        case c >= 20 && c <= 29: return "Wing in Ground (WIG)";
        case c >= 1 && c <= 19: return "Reserved";
        case c >= 90 && c <= 99: return "Other";
        default: return "Not Available";
    }
}

function formatCoord(lat, lon) {
    const ns = lat >= 0 ? "N" : "S";
    const ew = lon >= 0 ? "E" : "W";
    return `${Math.abs(lat).toFixed(2)}° ${ns}, ${Math.abs(lon).toFixed(2)}° ${ew}`;
}

// === Date/Time Formatting Utilities ===
function formatDateTime(date) {
    return date.toLocaleString("en-GB", {
        year: 'numeric',
        month: 'short',
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit',
        hour12: false,
        timeZone: 'UTC'
    });
}

// === Summary Panel Update Utility ===
function updateSummaryPanel(map, count) {
    const bounds = map.getBounds();
    const typeSelect = document.getElementById("vessel-type");
    const typeLabel = typeSelect.options[typeSelect.selectedIndex].text;

    const start = window.selectedStart || new Date("2024-01-01T00:00:00Z");
    const end = window.selectedEnd || new Date("2024-01-01T23:59:59Z");

    const minLat = bounds.getSouthWest().lat;
    const minLon = bounds.getSouthWest().lng;
    const maxLat = bounds.getNorthEast().lat;
    const maxLon = bounds.getNorthEast().lng;

    document.getElementById("vessel-count").textContent = count;
    document.getElementById("min-coords").textContent = formatCoord(minLat, minLon);
    document.getElementById("max-coords").textContent = formatCoord(maxLat, maxLon);
    document.getElementById("date-from").textContent = formatDateTime(start);
    document.getElementById("date-to").textContent = formatDateTime(end);
    document.getElementById("summary-type").textContent = typeLabel;
}

// === Vessel Marker Creation Utility ===
function createVesselMarker(vessel) {
    const type = getVesselTypeName(vessel.vessel_type);

    // Define rotation logic
    let rotation = 0;
    if (vessel.heading && vessel.heading !== 511) {
        rotation = vessel.heading;
    } else if (vessel.cog) {
        rotation = vessel.cog;
    }

    const isMoving = vessel.sog && vessel.sog > 0.5;
    const icon = isMoving
        ? createVesselSVGIcon(type, rotation)
        : createStoppedSVGIcon(type);

    const marker = L.marker([vessel.lat, vessel.lon], { icon: icon });
    marker.bindPopup(generatePopupContent(vessel));

    return marker;
}

// === Trajectory Colors Utility ===
function getTrajectoryColors() {
    return ['blue', 'red', 'green', 'orange', 'purple'];
}

// === Format Value with Units Utility ===
function formatValue(value, unit) {
    if (value === null || value === undefined || value === "" || Number.isNaN(value)) {
        return "-";
    }
    return unit ? `${value} ${unit}` : value;
}

function showLoader() {
    document.getElementById("loader-overlay").classList.add("active");
}

function hideLoader() {
    document.getElementById("loader-overlay").classList.remove("active");
}

function getVesselColor(type) {
    const colorMap = {
        "Cargo": "#00ff00",
        "Tanker": "#ff0000",
        "Passenger": "#0000ff",
        "High Speed Craft": "#ffff00",
        "Tug": "#40e0d0",
        "Fishing": "#ffa500",
        "Pleasure Craft": "#ffc0cb",
        "Other": "#808080"
    };
    return colorMap[type] || "#808080";
}

function createVesselSVGIcon(typeLabel, rotation = 0) {
    const color = getVesselColor(typeLabel);

    const svg = `
    <svg width="28" height="28" viewBox="0 0 28 28" xmlns="http://www.w3.org/2000/svg"
         style="transform: rotate(${rotation}deg); transform-origin: center;">
        <path d="M14 2 L20 24 L14 20 L8 24 Z"
              fill="${color}" stroke="#555" stroke-width="0.5" stroke-linejoin="round" />
    </svg>
    `;

    return L.divIcon({
        html: svg,
        className: '',
        iconSize: [28, 28],
        iconAnchor: [14, 14]
    });
}

function createStoppedSVGIcon(typeLabel) {
    const color = getVesselColor(typeLabel);

    const svg = `
    <svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
        <circle cx="8" cy="8" r="6" fill="${color}" stroke="#555" stroke-width="0.5"/>
    </svg>
    `;

    return L.divIcon({
        html: svg,
        className: '',
        iconSize: [16, 16],
        iconAnchor: [8, 8]
    });
}

// === Data Fetching Utilities ===
function buildVesselDataQuery(map) {
    const bounds = map.getBounds();
    const bbox = bounds.getWest() + "," +
                 bounds.getSouth() + "," +
                 bounds.getEast() + "," +
                 bounds.getNorth();

    const vesselTypeElement = document.getElementById("vessel-type");
    const vesselType = vesselTypeElement ? vesselTypeElement.value : "all";

    // Default fallback range: Jan 1, 2024 from 00:00 to 01:00 UTC
    const start = window.selectedStart || new Date("2024-01-01T00:00:00Z");
    const end = window.selectedEnd || new Date("2024-01-01T01:00:00Z");

    return new URLSearchParams({
        bbox: bbox,
        start_datetime: start.toISOString(),
        end_datetime: end.toISOString(),
        vessel_type: vesselType
    }).toString();
}

// === Trajectory Checkbox Creation Utility ===
function createTrajectoryCheckbox(medoid, index, color, trajectory, medoidsLayer) {
    const checkbox = document.createElement("input");
    checkbox.type = "checkbox";
    checkbox.id = `trajectory-checkbox-${index}`;
    checkbox.checked = true; // Default to visible
    checkbox.addEventListener("change", () => {
        if (checkbox.checked) {
            medoidsLayer.addLayer(trajectory); // Show the polyline
        } else {
            medoidsLayer.removeLayer(trajectory); // Hide the polyline
        }
    });

    const label = document.createElement("label");
    label.htmlFor = `trajectory-checkbox-${index}`;
    label.textContent = medoid.vessel_name || `Trajectory ${index + 1}`;
    label.style.color = color; // Color the label to match trajectory
    label.style.fontWeight = "bold";

    const checkboxWrapper = document.createElement("div");
    checkboxWrapper.style.marginBottom = "8px";
    checkboxWrapper.appendChild(checkbox);
    checkboxWrapper.appendChild(label);

    return checkboxWrapper;
}

// === Global function exports ===
window.initDateRangePicker = initDateRangePicker;
window.generatePopupContent = generatePopupContent;
window.generateMedoidPopupContent = generateMedoidPopupContent;
window.createTrajectoryCheckbox = createTrajectoryCheckbox;
window.buildVesselDataQuery = buildVesselDataQuery;
window.getVesselTypeName = getVesselTypeName;
window.formatCoord = formatCoord;
window.showLoader = showLoader;
window.hideLoader = hideLoader;
window.createVesselSVGIcon = createVesselSVGIcon;
window.createStoppedSVGIcon = createStoppedSVGIcon;
window.formatDateTime = formatDateTime;
window.updateSummaryPanel = updateSummaryPanel;
window.createVesselMarker = createVesselMarker;
window.getTrajectoryColors = getTrajectoryColors;
window.formatValue = formatValue;
window.generateMedoidPopupContent = generateMedoidPopupContent;