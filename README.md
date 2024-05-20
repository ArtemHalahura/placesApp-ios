# Places App

## Overview
This project is built using SwiftUI and follows the Composable Architecture pattern. The application allows users to view various places, and upon selecting a specific place, it navigates to the Wikipedia app's "Places" tab. The Wikipedia app must be installed on your device or simulator for this functionality to work.

## Features
- **SwiftUI**
- **Composable Architecture**: Implements the Composable Architecture for better state management and scalability.

## Requirements
- **iOS 16.0+**
- **Xcode 15.0+**
- **Wikipedia App**: Ensure the Wikipedia app is installed on your device or simulator.

## Setup and Run
To automate the setup process, follow the steps below:

1. **Open Terminal**
2. **Run the setup script**:
    ```sh
    ./setup_and_run.sh
    ```

This script will configure the project and clone the repository containing the Wikipedia app.

## Script Details
The `setup_and_run.sh` script performs the following actions:
1. Configures the project dependencies.
2. Clones the Wikipedia app repository.
3. Builds and runs the project.

## Installation
1. Clone the repository:
    ```sh
    git clone https://github.com/ArtemHalahura/placesApp-ios.git
    ```

    ```
    cd placesApp-ios
    ```

2. Run the setup script:
    ```sh
    ./setup_and_run.sh
    ```

3. Open the project `Wikipedia` in Xcode:
    ```sh
    open Wikipedia.xcodeproj
    ```
4. Build and run the project `Wikipedia` in your preferred simulator or device.
    
5. Open the project `PlacesApp` in Xcode:
    ```sh
    open PlacesApp.xcodeproj
    ```

6. Build and run the project `PlacesApp` in your preferred simulator or device. Launch on the same simulator or device from step 4.

   **Ensure both the `PlacesApp` and the `Wikipedia` app are running on the same simulator or device.**
## 

Enjoy exploring places with the Places App!
