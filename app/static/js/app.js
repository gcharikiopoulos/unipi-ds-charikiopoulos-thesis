document.addEventListener('DOMContentLoaded', function () {
    // Check if required libraries are loaded
    if (typeof L === 'undefined') {
        console.error("Leaflet (L) is not loaded!");
        alert("Error: Leaflet library is not loaded. Please check your internet connection.");
        return;
    }
    
    if (typeof $ === 'undefined') {
        console.error("jQuery ($) is not loaded!");
        alert("Error: jQuery library is not loaded. Please check your internet connection.");
        return;
    }
    
    if (typeof moment === 'undefined') {
        console.error("Moment.js is not loaded!");
        alert("Error: Moment.js library is not loaded. Please check your internet connection.");
        return;
    }

    // === Map Initialization ===
    const map = L.map('map').setView([32, -90], 4);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; OpenStreetMap contributors'
    }).addTo(map);

    let markersLayer = L.layerGroup().addTo(map);
    let heatLayer = null;
    let medoidsLayer = null;
    let currentView = "markers"; // "markers", "heatmap", or "medoids"
    let cachedVessels = null;

    // === Update Button States for Better UX ===
    function updateButtonStates() {
        const buttons = {
            "show-markers": "markers",
            "show-heatmap": "heatmap", 
            "show-medoids": "medoids"
        };

        Object.entries(buttons).forEach(([buttonId, viewType]) => {
            const button = document.getElementById(buttonId);
            if (button) {
                if (currentView === viewType) {
                    button.classList.add("active");
                    button.disabled = true; // Disable the active button
                } else {
                    button.classList.remove("active");
                    button.disabled = false; // Enable inactive buttons
                }
            }
        });
    }

    // === Utility Function to Switch Layers ===
    function switchMapLayer(newLayer, targetView) {
        // Remove existing layers
        if (heatLayer) map.removeLayer(heatLayer);
        if (markersLayer) map.removeLayer(markersLayer);
        if (medoidsLayer) map.removeLayer(medoidsLayer);
    
        // Add the new layer
        if (newLayer) map.addLayer(newLayer);
    
        // Switch sidebar content based on view
        switchSidebarContent(targetView);
    }

    // === Switch Sidebar Content Based on View ===
    function switchSidebarContent(targetView) {
        const standardSidebar = document.getElementById("standard-sidebar");
        const medoidsSidebar = document.getElementById("medoids-sidebar");
        
        if (targetView === "medoids") {
            // Hide standard sidebar, show medoids sidebar
            if (standardSidebar) standardSidebar.style.display = "none";
            if (medoidsSidebar) medoidsSidebar.style.display = "block";
        } else {
            // Show standard sidebar, hide medoids sidebar
            if (standardSidebar) standardSidebar.style.display = "block";
            if (medoidsSidebar) medoidsSidebar.style.display = "none";
            
            // Reinitialize date range picker and event listeners for standard view
            if (targetView === "markers" || targetView === "heatmap") {
                setTimeout(() => {
                    initDateRangePicker(() => {
                        cachedVessels = null;
                        if (currentView === "markers") showMarkers();
                        else if (currentView === "heatmap") showHeatmap();
                    });

                    $('#datetime-range').on('apply.daterangepicker', function () {
                        cachedVessels = null;
                        if (currentView === "markers") showMarkers();
                        else if (currentView === "heatmap") showHeatmap();
                    });

                    const vesselTypeSelect = document.getElementById("vessel-type");
                    if (vesselTypeSelect) {
                        vesselTypeSelect.addEventListener("change", () => {
                            cachedVessels = null;
                            if (currentView === "markers") showMarkers();
                            else if (currentView === "heatmap") showHeatmap();
                        });
                    }
                }, 100);
            }
        }
        
        // Update button states
        updateButtonStates();
    }

    // === Fetch Vessel Data ===
    async function fetchVesselData() {
        try {
            const query = window.buildVesselDataQuery(map);
        
            const response = await fetch('/data?' + query);
            
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            
            const data = await response.json();
            return data;
        } catch (error) {
            console.error("Error fetching vessel data:", error);
            alert("Error loading vessel data. Please check the console for details.");
            return [];
        }
    }

    // === Create Vessel Marker ===
    // Moved to helper.js as createVesselMarker()

    function updateSummaryPanel(count) {
        // Use the helper function
        window.updateSummaryPanel(map, count);
    }

    // === Show Markers ===
    async function showMarkers() {
        // Check if already in markers mode (but allow initial load)
        if (currentView === "markers" && cachedVessels !== null) {
            updateButtonStates();
            return;
        }

        if (!cachedVessels) {
            showLoader();
            cachedVessels = await fetchVesselData();
            hideLoader();
        }

        // Auto-switch if too many points
        if (cachedVessels.length > 10000) {
            alert("Too many markers for the selected range. Switching to heatmap.");
            showHeatmap();  // switch views
            return;         // exit current marker rendering
        }

        updateSummaryPanel(cachedVessels.length);

        markersLayer.clearLayers();
        cachedVessels.forEach(vessel => {
            const marker = window.createVesselMarker(vessel);
            marker.addTo(markersLayer);
        });

        switchMapLayer(markersLayer, "markers"); // Use the utility function
        currentView = "markers";
        updateButtonStates();
    }

    // === Show Heatmap ===
    async function showHeatmap() {
        // Check if already in heatmap mode (but allow initial load)
        if (currentView === "heatmap" && cachedVessels !== null) {
            updateButtonStates();
            return;
        }

        if (!cachedVessels) {
            showLoader();
            cachedVessels = await fetchVesselData();
            hideLoader();
        }

        updateSummaryPanel(cachedVessels.length);

        const heatData = cachedVessels.map(v => [v.lat, v.lon, 0.5]);

        heatLayer = L.heatLayer(heatData, {
            radius: 25,
            blur: 15,
            maxZoom: 12
        });

        switchMapLayer(heatLayer, "heatmap"); // Use the utility function
        currentView = "heatmap";
        updateButtonStates();
    }

    async function showMedoids() {
        // Check if already in medoids mode
        if (currentView === "medoids") {
            updateButtonStates();
            return;
        }

        showLoader();
    
        try {
            // Fetch medoids data from the server
            const medoids = await fetch('/medoids_trajectories')
                .then(res => res.json())
                .then(data => {
                    return data;
                });
        
            // Create a new layer group for medoids
            medoidsLayer = L.layerGroup();
        
            // Define a list of colors for the trajectories
            const colors = window.getTrajectoryColors();
        
            // Ensure all other layers are removed before adding medoids
            if (heatLayer) map.removeLayer(heatLayer);
            if (markersLayer) map.removeLayer(markersLayer);
            
            // Add the medoids layer and switch sidebar
            map.addLayer(medoidsLayer);
            switchSidebarContent("medoids");
            currentView = "medoids";
            
            // Get the checkbox container after sidebar switch and clear it
            const checkboxContainer = document.getElementById("checkbox-container");
            if (checkboxContainer) {
                checkboxContainer.innerHTML = ""; // Clear existing checkboxes
            }
            
            const polylines = []; // Store references to the polylines
        
            medoids.forEach((medoid, index) => {
                // Validate the trajectory
                if (!medoid.trajectory || medoid.trajectory.length === 0) {
                    console.warn(`Invalid trajectory for medoid with MMSI: ${medoid.mmsi}`);
                    return; // Skip this medoid
                }
        
                // Assign a color based on the index
                const color = colors[index % colors.length];
        
                // Create a polyline for the trajectory
                const trajectory = L.polyline(medoid.trajectory, {
                    color: color,
                    weight: 3,
                    opacity: 0.7
                }).addTo(medoidsLayer);
        
                // Store the polyline reference
                polylines.push(trajectory);
        
                // Add a marker at the medoid's central point
                const marker = window.createVesselMarker({
                    lat: medoid.trajectory[0][0], // Use the first point as the marker position
                    lon: medoid.trajectory[0][1],
                    vessel_name: medoid.vessel_name,
                    mmsi: medoid.mmsi,
                    vessel_type: medoid.vessel_type
                });
                marker.addTo(medoidsLayer);
        
                // Bind a popup to the trajectory with vessel details
                trajectory.bindPopup(window.generateMedoidPopupContent(medoid));
        
                // Add a checkbox for this trajectory only if container exists
                if (checkboxContainer) {
                    const checkboxWrapper = window.createTrajectoryCheckbox(medoid, index, color, trajectory, medoidsLayer);
                    checkboxContainer.appendChild(checkboxWrapper);
                }
            });
            
            updateButtonStates();
            hideLoader();
            
        } catch (error) {
            console.error("Error loading medoids:", error);
            alert("Error loading medoids data. Please check the console for details.");
            hideLoader();
        }
    }

    // === Map Event Listeners ===
    map.on("moveend", function () {
        cachedVessels = null;  // force fresh fetch
        if (currentView === "markers") showMarkers();
        else if (currentView === "heatmap") showHeatmap();
    });

    // === Initial Setup ===
    // UI button events are attached directly to elements that exist in HTML
    document.getElementById("show-markers").addEventListener("click", showMarkers);
    document.getElementById("show-heatmap").addEventListener("click", showHeatmap);
    document.getElementById("show-medoids").addEventListener("click", showMedoids);

    // Default view
    showMarkers();
    
    // Initialize button states
    updateButtonStates();
});