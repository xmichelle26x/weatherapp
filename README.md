# Weather App

Minimalistic weather application. The frontend will be developed in Flutter/Dart, displaying weather information based on user input. The backend, written in JavaScript, will fetch data from a weather API and relay it to the frontend.

Simple User Interface: Design a basic UI where users can input a city name.
Display Weather Data: Show temperature and general weather conditions (e.g., sunny, cloudy) retrieved from the backend.

## Frontend
Flutter Application
Requirements: Flutter and Dart installed on your machine.

### Steps to set up and run the server:

Open a terminal and navigate to the Flutter application directory weatherapp> lib.
Run the following command to get the project dependencies: `flutter pub get`

Ensure you have an emulator or a connected device.

Run the Flutter application with the following command: `flutter run`

This will launch the application on the emulator or connected device.

## Backend
API Server (Node.js)
Requirements: Node.js installed on your machine.

### Steps to set up and run the server:

Open a terminal and navigate to the server directory weatherapp> backend.
Run the following command to install the project dependencies: `npm install`

Next, start the server with the following command: `node server.js`

The server will start at http://localhost:3001.

## API Endpoints
The API exposes a single endpoint for retrieving weather data for a specific city.

Endpoint: /weather
Method: GET
Query Parameters:
city (required): Name of the city for which weather information is desired.
