# WeatherApp ☀️🌧️

Welcome to **WeatherApp**! This is an application developed in **Swift** and **SwiftUI** that allows users to observe real-time weather information for a specific location. The project implements the **MVVM** architecture while adhering to **SOLID** design principles and best practices of **Clean Code**, as well as making REST API calls to retrieve weather data.

---

#### **Table of Contents**
- [Project Description](#project-description)
- [Features](#features)
- [Architecture](#architecture)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [Contributions](#contributions)
- [License](#license)

---

### **Project Description**

WeatherApp is a simple yet robust application that presents the current weather for any location. Weather information is obtained through REST API calls and displayed in a modern, user-friendly interface designed with SwiftUI.

The main goal of this project is to demonstrate how to correctly apply the MVVM architecture while utilizing SOLID principles and Clean Code to keep the code modular, scalable, and easy to maintain.

---

### **Features**

- 📡 **REST API Consumption**: Connects to an online weather data provider to fetch updated information.
- 🔄 **MVVM Architecture**: Clear separation between business logic, presentation logic, and views.
- 🧹 **SOLID Principles and Clean Code**: Clean, readable, and maintainable code.
- 🌙 **SwiftUI Design**: Elegant and responsive user interface.
- 📍 **Location-Based Weather Search**: Enter a location to get the current weather.

---

### **Architecture**

The project follows the **MVVM (Model-View-ViewModel)** architecture. Here’s a brief description of the components:

- **Model**: Represents the application data, such as API response models.
- **View**: The user interface created with SwiftUI.
- **ViewModel**: Acts as an intermediary between the view and the model, managing business logic and providing processed data to the view.

The design adheres to **SOLID** principles, ensuring:

- **S**: Single responsibility for each component.
- **O**: Open for extension but closed for modification.
- **L**: Safe substitution of derived classes.
- **I**: Specific interfaces for each client.
- **D**: Dependency injection to improve testability.

---

### **Technologies Used**

- **Language**: Swift
- **UI Framework**: SwiftUI
- **Architecture**: MVVM
- **Networking**: URLSession for REST API calls
- **Design Principles**: SOLID and Clean Code

---

### **Installation**

Follow these steps to clone and run the project on your local machine:

1. Clone this repository:
   ```bash
   git clone https://github.com/agmcoder/Weather-Tracker-SwifUI-MVVM

3. Configure your API Key in the configuration folder by editing APIKeys.json with your own API Key from https://www.weatherapi.com/login.aspx




https://github.com/user-attachments/assets/2b511a13-67bd-4449-ae3f-651757a4bd8e


