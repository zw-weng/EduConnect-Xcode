# Project Title

**Project Title:** Educonnect 
**Hackathon:** UMP Malaysia Hackathon 2024  
**Team Members:** <br>
                  1.Neo Zheng Weng 
                  <br>
                  2.Nicholas Wong Khai Shian 
                  <br>
                  3.Goh Jing Yang

---

## Project Description

Our project aims to bridge the educational gap in Malaysia by providing accessible educational resources and personalised tutoring for students in underserved, rural areas. The application focuses on students facing limitations in digital resources and internet access, especially those in Sabah and Sarawak. By delivering quality content, mentorship, and tutoring, we address the pressing need for educational equity in remote regions.

---

## Key Features

1. **Booking and Scheduling**
   - Enables students to book tutoring sessions, with flexibility in choosing time slots and subjects.

2. **Resource Sharing**
   - Allows tutors and administrators to upload and manage study resources, ensuring access even in low-internet environments.

3. **User Profiles and Personalisation**
   - Customisable profiles for students to set learning goals, track progress, and access tailored resources.

4. **Comprehensive Onboarding**
   - A user-friendly onboarding process that introduces new users to the application’s functionalities and guides initial profile setup.
---

Here’s a comprehensive explanation of the setup, dependencies, and usage based on the code files you've provided:

---

### Setup

To get started with the project, you’ll need to install a few essential tools. First, ensure you have the **Flutter SDK** installed. Flutter is the primary framework used for building this mobile application, offering a cross-platform solution for iOS and Android. The recommended version is 3.0.0 or later, which includes the latest tools and performance improvements for a smoother development experience. For installation instructions, refer to the official [Flutter website](https://flutter.dev/docs/get-started/install).

Alongside Flutter, the **Dart SDK** is required, as Dart is the programming language used in Flutter applications. Dart is typically bundled with Flutter, but you can confirm installation by running the `dart --version` command in your terminal.

For testing and debugging, you'll also need **Android Studio** or **Xcode**. Android Studio is recommended for Android devices, and Xcode is required if you plan to test the app on an iOS simulator. Both IDEs provide essential emulation and debugging tools.

To set up the project locally, start by cloning the repository using:
```bash
git clone <repository-url>
cd project-directory
```
Once you’re in the project directory, install the necessary dependencies specified in the `pubspec.yaml` file by running:
```bash
flutter pub get
```
This command fetches all required packages for the project to function correctly. After the dependencies are installed, you can launch the application on an emulator or a connected device with:
```bash
flutter run
```
If you're preparing the app for distribution, you can build a release APK using:
```bash
flutter build apk --release
```
This command creates a production-ready APK file in the `build/app/outputs/flutter-apk/` directory.

---

### Dependencies

The project uses several critical dependencies managed via Flutter’s package manager. Here’s an overview of each:

- **flutter**: The core dependency for the app, providing the foundational UI elements and tools needed for cross-platform development.
- **provider**: A state management library that simplifies sharing data across multiple widgets. It’s especially useful for managing global states like user sessions, making it easier to maintain app-wide consistency without complex code.
- **http**: Used for making HTTP requests to APIs, this package is essential if the app needs to communicate with a backend server to fetch or send data.
- **shared_preferences**: This package allows the app to store small amounts of data locally on the device, such as user session data or user settings, enabling persistent experiences between app restarts.

---

### Usage

The application provides several key functionalities aimed at improving access to quality education in rural areas of Malaysia:

1. **User Registration and Login**: Users can create an account and log in through the login screen (`login_screen.dart`). The `login_model.dart` and `register_model.dart` files handle the backend logic for secure user authentication. Firebase may be used here for a seamless and secure login experience.

2. **Profile Customisation**: Once logged in, users can personalise their profiles to reflect learning goals and preferences. The `fill_profile_screen.dart` and `edit_profile_screen.dart` files facilitate profile setup and editing, providing a personalised learning experience for each user.

3. **Booking Tutoring Sessions**: The app offers a feature to book tutoring sessions, where students can select tutors based on their availability and expertise. The `book_tutor_screen.dart` and `booking_screen.dart` files handle this functionality, allowing users to schedule sessions with their preferred tutors and view upcoming appointments.

4. **Accessing Educational Resources**: The app includes a repository of educational materials, accessible through the `materials_screen.dart`, `pdf_preview_screen.dart`, and `video_preview_screen.dart` files. Students can view a variety of learning resources, including PDFs and videos, enabling them to access quality content suited to their needs.

5. **Resource Upload**: For administrators or tutors, the `add_resource_screen.dart` file provides an interface to upload new educational materials. This feature supports continuous content growth, ensuring students always have access to fresh, relevant resources.

---

## Project Files

### Core Models

- **`colors.dart`**: Defines the app's colour scheme for consistent UI styling.
- **`course.dart`**: Manages course details and educational content.
- **`initial_user.dart`**: Handles initial user setup and configurations.
- **`login_model.dart`** & **`register_model.dart`**: Implements user authentication with login and registration functionalities.
- **`resource.dart`**: Manages educational content resources.
- **`session.dart`**: Handles session scheduling and management.
- **`tutor.dart`**: Manages tutor profiles and availability.

### Screens

- **`onboarding_screen.dart`**: Manages the user onboarding experience.
- **`add_resource_screen.dart`**: Allows uploading new educational resources.
- **`base_screen.dart`**: The foundational layout and navigation management.
- **`book_tutor_screen.dart`** & **`booking_screen.dart`**: Facilitate tutor bookings and session management.
- **`edit_profile_screen.dart`** & **`fill_profile_screen.dart`**: Enable users to create and edit profiles.
- **`home_screen.dart`**: Main dashboard showcasing resources, sessions, and recommendations.
- **`login_screen.dart`** & **`register_screen.dart`**: Authentication screens for user login and registration.
- **`materials_screen.dart`**: Displays available study materials.
- **`pdf_preview_screen.dart`**: Allows users to preview PDF resources.
- **`profile_screen.dart`**: User profile overview.
- **`resources_screen.dart`**: List of available educational resources.
- **`tuition_screen.dart`**: Interface for tuition session details.
- **`tutor_detail_screen.dart`**: Tutor profile and session details.
- **`video_preview_screen.dart`**: Video resource preview functionality.
- **`main.dart`**: Main entry point for the application.

---

# Educonnect

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



