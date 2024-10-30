# Project Title

**Project Title:** Educonnect 
**Hackathon:** UMP Malaysia Hackathon 2024  
**Team Members:** <br>
                  1. Neo Zheng Weng 
                  <br>
                  2. Nicholas Wong Khai Shian 
                  <br>
                  3. Goh Jing Yang



## Project Description

Our project aims to bridge the educational gap in Malaysia by providing accessible educational resources and personalised tutoring for students in underserved, rural areas. The application focuses on students facing limitations in digital resources and internet access, especially those in Sabah and Sarawak. By delivering quality content, mentorship, and tutoring, we address the pressing need for educational equity in remote regions.



## Key Features

1. **Booking and Scheduling**
   - Enables students to book tutoring sessions, with flexibility in choosing time slots and subjects.

2. **Resource Sharing**
   - Allows tutors and administrators to upload and manage study resources, ensuring access even in low-internet environments.

3. **User Profiles and Personalisation**
   - Customisable profiles for students to set learning goals, track progress, and access tailored resources.

4. **Comprehensive Onboarding**
   - A user-friendly onboarding process that introduces new users to the application’s functionalities and guides initial profile setup.



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



### Dependencies
The libraries included in your pubspec.yaml for EduConnect, along with their main functions:
### Core Flutter Libraries
- **`flutter`**: This is the core SDK that provides widgets and tools to create Flutter applications for multiple platforms, including Android, iOS, and the web.
- **`cupertino_icons`**: Provides Cupertino-styled icons to support iOS design language in the Flutter app. Ideal for cross-platform consistency, particularly for iOS devices.

### Navigation & Interface
- **`google_nav_bar`**: Offers a Google-style navigation bar, typically used for the bottom navigation in the app. It's highly customisable, making it a popular choice for creating smooth, modern navigation experiences.
- **`carousel_slider`**: A package that provides a slider widget, allowing you to create image or content sliders, often used for introductory screens, promotional displays, or featured content.

### Media & PDF Handling
- **`pdfx`**: A robust PDF viewer library that allows rendering and displaying PDF documents. It’s useful for any educational content or documents within the app.
- **`youtube_player_flutter`**: Integrates a YouTube video player directly into the Flutter app, allowing seamless video playback within your app.
- **`youtube_explode_dart`**: A powerful library to access YouTube metadata, such as video details, playlists, and streaming URLs, giving more control over YouTube content beyond simple embedding.

### File and Path Management
- **`flutter_file_dialog`**: Facilitates file selection and management, especially for picking files, saving files, or accessing specific directories.
- **`external_path`**: Helps obtain paths for external storage directories, especially valuable when managing files or storing media on Android devices.
- **`path`**: Essential for handling and manipulating file paths within the app, regardless of the operating system. It’s commonly used for consistent path formatting.

### Development Dependencies
- **`flutter_test`**: This package includes tools and frameworks for testing Flutter apps. It's standard for setting up unit tests, widget tests, and integration tests.
- **`flutter_lints`**: Provides recommended lint rules for Dart and Flutter code to encourage best practices, catch errors, and maintain code quality.

### Asset Management and Fonts
- **`assets` section**: Defines directories for images, icons, PDFs, and fonts (`Poppins`). The font customisation allows you to use specific weights and styles for text consistency across the app.



### Usage

The application provides several key functionalities aimed at improving access to quality education in rural areas of Malaysia:

1. **User Registration and Login**: Users can create an account and log in through the login screen (`login_screen.dart`). The `login_model.dart` and `register_model.dart` files handle the backend logic for secure user authentication. Firebase may be used here for a seamless and secure login experience.

2. **Profile Customisation**: Once logged in, users can personalise their profiles to reflect learning goals and preferences. The `fill_profile_screen.dart` and `edit_profile_screen.dart` files facilitate profile setup and editing, providing a personalised learning experience for each user.

3. **Booking Tutoring Sessions**: The app offers a feature to book tutoring sessions, where students can select tutors based on their availability and expertise. The `book_tutor_screen.dart` and `booking_screen.dart` files handle this functionality, allowing users to schedule sessions with their preferred tutors and view upcoming appointments.

4. **Accessing Educational Resources**: The app includes a repository of educational materials, accessible through the `materials_screen.dart`, `pdf_preview_screen.dart`, and `video_preview_screen.dart` files. Students can view a variety of learning resources, including PDFs and videos, enabling them to access quality content suited to their needs.

5. **Resource Upload**: For administrators or tutors, the `add_resource_screen.dart` file provides an interface to upload new educational materials. This feature supports continuous content growth, ensuring students always have access to fresh, relevant resources.



## Project Files

Here’s an expanded explanation of each code component to provide a clear understanding of how your app functions:

### 1. **Models (Data Handling)**
   These files manage the app's core data, acting like a database that stores information used throughout the app:

   - **`course.dart`**: Defines what information is stored for each course, like the name, description, topics covered, and any other important details. This makes it easy to display course information in other parts of the app.
   - **`initial_user.dart`**: Sets up default values for a user when they start using the app for the first time. For example, it might initialise a default profile picture, default preferences, or empty fields that the user will fill in later.
   - **`login_model.dart` & `register_model.dart`**: Handle the processes for user authentication. They manage data when a user logs in or registers and ensure that sensitive information, like passwords, is handled securely.
   - **`resource.dart`**: Stores data about educational resources, such as documents, videos, and PDFs. This data includes things like resource titles, types, and locations, which the app displays in the resource browsing screens.
   - **`session.dart`**: Manages tutoring sessions by storing details like session time, date, tutor, and student information. This data helps in booking and viewing scheduled sessions.
   - **`tutor.dart`**: Contains information about tutors, including their names, subjects they teach, experience, and available times. This data is crucial for booking and viewing tutor profiles.

### 2. **Screens (User Interface)**
   These files make up the app’s visual interface and user flow. Each screen represents a different section of the app that users interact with:

   - **`onboarding_screen.dart`**: The first screen new users see. It introduces the app’s main features and helps users understand how to navigate the app.
   - **`add_resource_screen.dart`**: Allows administrators or tutors to upload new study materials or resources. Users with permission can add PDFs, videos, and other materials that will be available to students.
   - **`base_screen.dart`**: Acts as a foundational layout for navigating between different parts of the app, such as the home screen, profile, and resource library.
   - **`book_tutor_screen.dart` & `booking_screen.dart`**: Enable users to book and view tutoring sessions. Users can choose a tutor, pick an available time, and confirm their bookings.
   - **`edit_profile_screen.dart` & `fill_profile_screen.dart`**: Allow users to input and update their personal information, such as their name, age, learning preferences, and other profile details.
   - **`home_screen.dart`**: The main dashboard where users can quickly access resources, see upcoming sessions, and get personalised recommendations.
   - **`login_screen.dart` & `register_screen.dart`**: These screens handle user authentication. The login screen allows returning users to sign in, while the register screen enables new users to create an account.
   - **`materials_screen.dart`, `pdf_preview_screen.dart`, `video_preview_screen.dart`**: These screens let users view educational materials. For example, `pdf_preview_screen.dart` displays PDFs, while `video_preview_screen.dart` handles video content.
   - **`profile_screen.dart`**: Displays the user’s profile, showing their name, bio, and any other relevant information they have provided.
   - **`resources_screen.dart`**: Lists all available learning materials. Users can browse, search, and select resources they want to study.
   - **`tuition_screen.dart`**: Shows details of tutoring sessions that are available for booking, including session times and subjects.
   - **`tutor_detail_screen.dart`**: Provides a detailed profile of a tutor, including their qualifications, experience, and ratings.

### 3. **UI Components (Reusable Elements)**
   These are smaller, reusable parts of the interface, such as buttons and forms, which are used across multiple screens:

   - **Buttons**:
     - **`next_button.dart`, `get_started_button.dart`, `floating_add_button.dart`, `floating_download_button.dart`, `floating_video_button.dart`**: These files define buttons used for navigation (e.g., next steps), actions (e.g., adding resources), and downloading or viewing content.
   
   - **Profile Components**:
     - **`profile_card.dart`, `profile_form.dart`, `profile_text_field.dart`**: These components build and display sections of the user profile. `profile_card.dart` might be used to show a quick summary, while `profile_form.dart` and `profile_text_field.dart` help users edit their information.
   
   - **Cards and Indicators**:
     - **`course_card.dart`, `resource_card.dart`, `session_card.dart`**: These files create a visual card layout to display items like courses, resources, or sessions in an easy-to-read format. `dots_indicator.dart` shows progress indicators, such as steps completed in an onboarding sequence.
   
   - **Forms and Fields**:
     - **`login_form.dart`, `register_form.dart`, `search_field.dart`**: These forms and input fields handle user data entry for login, registration, and search functionalities. They help standardise how data is collected and processed across the app.

### 4. **Design and Styling**
   - **`colors.dart`**: Centralises the app’s colour scheme, ensuring all screens and elements follow the same design theme. This makes it easier to maintain a cohesive look across the app, as any colour change in this file will automatically apply to all screens.

### 5. **Main Application Entry**
   - **`main.dart`**: The main file that runs when the app starts. It sets up initial configurations, loads necessary resources, and decides which screen to show first. This file handles the overall flow and navigation, connecting all parts of the app.


### Summary

The app is built with the following structure:
- **Data Models**: Handle all the app’s main information, such as courses, users, and sessions.
- **Screens**: Define the various sections of the app that users interact with, like booking sessions or viewing materials.
- **UI Components**: Reusable elements like buttons and forms that maintain a consistent look and functionality across the app.
- **Design**: Ensures consistent colours and styles across the app for a cohesive user experience.
- **Main Application File (`main.dart`)**: Starts the app, sets up initial navigation, and connects all components.

This structure makes the app organised and modular, allowing users to log in, access educational resources, book tutors, and personalise their experience. By separating functionalities into specific files and components, it’s easy to add new features or make updates.


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



