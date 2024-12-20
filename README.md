# Weather Tracker

Weather Tracker is an iOS application that allows users to track weather data for their selected cities. It uses local storage with `UserDefaults` to persist the selected city and update the weather information every time the app is launched.

## Features
- Search for a city and view current weather information.
- Save the selected city and reload weather data on app launch.
- Simple, clean, and user-friendly interface.
- Support for fetching weather data via an API.

## Technologies Used
- Swift
- SwiftUI
- UserDefaults for local storage
- API Integration (WeatherAPI.com)

## Installation

1. Clone this repository:

2. Open the project in Xcode.

3. Build and run the app on your iOS simulator or device.

## Usage

- Upon opening the app, you will be prompted to search for a city.
- Once a city is selected, the weather information will be displayed.
- The app will store the selected city in `UserDefaults`, so the weather will be reloaded on subsequent launches.

## Screenshots

<img src="https://github.com/user-attachments/assets/3fe45ab7-2749-4578-9763-59c6574eab8c" width="150" />
<img src="https://github.com/user-attachments/assets/f9bd2b28-eb00-462c-8c0e-40083f16fd0c" width="150" />
<img src="https://github.com/user-attachments/assets/9f583c49-4965-4b33-b29e-991a3a0732aa" width="150" />

## Acknowledgements

- Weather data sourced from [WeatherAPI.com](https://www.weatherapi.com/docs/)
