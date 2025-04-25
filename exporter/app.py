from flask import Flask, Response
import requests
from prometheus_client import Gauge, generate_latest

app = Flask(__name__)
temp_gauge = Gauge('tallinn_temperature', 'Current temperature in Tallinn (°C)')

def fetch_temp():
    url = "https://api.open-meteo.com/v1/forecast"
    params = {
        "latitude": 59.43696,
        "longitude": 24.75353,
        "current_weather": "true"
    }
    resp = requests.get(url, params=params, timeout=5)
    data = resp.json()
    return data["current_weather"]["temperature"]

@app.route('/metrics')
def metrics():
    temp = fetch_temp()
    temp_gauge.set(temp)
    return Response(generate_latest(), mimetype='text/plain')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8000)
