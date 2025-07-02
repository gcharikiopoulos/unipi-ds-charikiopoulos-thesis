from flask import Flask
from app.routes.routes import main

def create_app():
    app = Flask(__name__, template_folder="templates", static_folder="static")

    # Load configuration (if needed)
    app.config.from_pyfile('../config.py')

    app.register_blueprint(main)

    return app