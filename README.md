# Flutter Authentication Application

This Flutter application provides a comprehensive authentication system, including user registration, sign-in, password recovery, and social sign-in options with Google and Apple. It is integrated with Firebase for backend services, ensuring a secure and robust authentication mechanism.

## Features

- **User Registration**: New users can sign up with their email and password.
- **User Sign-In**: Existing users can sign in using their email and password.
- **Forgot Password**: Users can reset their password if they forget it.
- **Google Sign-In**: Users can sign in using their Google account.
- **Apple Sign-In**: Users can sign in using their Apple account (available on iOS).

## Technologies Used

- **Flutter**: For building the cross-platform mobile application.
- **Firebase Authentication**: For managing user authentication and secure sign-in methods.
- **Google Sign-In**: For integrating Google sign-in functionality.
- **Apple Sign-In**: For integrating Apple sign-in functionality.

## Getting Started

### Prerequisites

Ensure you have the following installed:
- Flutter SDK
- Dart
- An IDE (e.g., VSCode, Android Studio)
- Firebase account

### Installation

1. **Clone the repository**:
   ```sh
   git clone https://github.com/your-username/flutter-auth-app.git
   cd flutter-auth-app

2. **Install dependencies**:
   ```sh
   flutter pub get

3. **Set up Firebase**:

- Go to the Firebase Console.
- Create a new project or use an existing one.
- Add an Android app and/or iOS app to your Firebase project.
- Follow the instructions to download the google-services.json (for Android) and GoogleService-Info.plist (for iOS) and place them in your Flutter project as per the Firebase setup instructions.
- Enable Email/Password, Google, and Apple sign-in methods in the Firebase Authentication section.

4. **Running the Application**:
   For Android & iOS:
   ```sh
   flutter run

### Screenshots

<img src="https://github.com/Sourav0174/full_auth_app/assets/146104055/0ce54714-8821-4396-923d-2ddfcdb9f0ac" width="300" />
<img src="https://github.com/Sourav0174/full_auth_app/assets/146104055/6f8eb1c7-9172-4c70-8ead-bef8a4ec8e94" width="300" />
