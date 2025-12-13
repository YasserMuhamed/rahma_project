# Rahma - Islamic Companion App

A comprehensive Flutter application designed to help Muslims in their daily spiritual journey. Rahma provides essential Islamic tools and features including prayer times, Islamic remembrances (Azkar), Qibla direction finder, and more.

## 📱 Features

- **Prayer Times**: Get accurate prayer times based on your location
- **Azkar (Islamic Remembrances)**: Access a collection of Islamic prayers and remembrances organized by category
- **Qibla Direction**: Find the Qibla direction using device compass
- **Local Storage**: Cache data locally using Hive for offline access
- **Multi-language Support**: Full support for multiple languages with localization
- **Push Notifications**: Receive prayer reminders via Firebase Cloud Messaging
- **Responsive Design**: Optimized UI that adapts to different screen sizes

## 🏗️ Architecture

The project follows **Clean Architecture** principles with **BLoC** state management:

```
lib/
├── config/          # App configuration and theming
├── core/            # Core utilities, DI, and services
├── features/        # Feature modules (azkar, prayer, quibla, home)
├── generated/       # Auto-generated localization files
└── l10n/           # Localization strings
```

## 🔧 Tech Stack

### Core Framework

- **Flutter**: Cross-platform mobile framework
- **Dart**: Programming language

### State Management & Architecture

- **BLoC**: Business Logic Component pattern
- **GetIt**: Service locator for dependency injection
- **Dartz**: Functional programming for Either types

### Data & Storage

- **Dio**: HTTP client for API requests
- **Hive**: Local database for offline storage
- **Shared Preferences**: Simple key-value storage
- **Firebase Core & Messaging**: Cloud messaging and push notifications

### UI & UX

- **Flutter ScreenUtil**: Responsive design utilities
- **Flutter Staggered Grid View**: Advanced grid layouts
- **Cached Network Image**: Image caching
- **Skeletonizer**: Loading skeleton screens
- **Font Awesome Flutter**: Icon library

### Services & Utilities

- **Flutter Compass**: Device compass integration
- **Geolocator**: Location services
- **Geocoding**: Address and coordinate conversion
- **Flutter Local Notifications**: Local notification handling
- **Workmanager**: Background task scheduling

### Localization & Fonts

- **Flutter Localizations**: Multi-language support
- **Intl**: Internationalization package
- **Custom Arabic Fonts**: Tajawal, Almarai, UthmanicHafs

### Development Tools

- **Logger**: Debug logging
- **Pretty Dio Logger**: Network request logging
- **Build Runner**: Code generation
- **Flutter Lints**: Code quality

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.10.0 or higher
- Dart SDK 3.10.0 or higher
- Android Studio or Xcode (for mobile development)

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd rahma_project
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run code generation**

   ```bash
   flutter pub run build_runner build
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

## 📝 Project Structure

- **azkar/**: Islamic remembrances feature module
- **prayer/**: Prayer times and scheduling feature
- **quibla/**: Qibla direction finder
- **home/**: Main home screen and navigation
- **core/**: Core services, utilities, and dependency injection
- **config/**: App configuration, theming, and routing

## 🌐 Localization

The app supports multiple languages through Flutter's localization system. Language strings are defined in the `lib/l10n` directory and auto-generated into `lib/generated/l10n.dart`.

To add a new language:

1. Add translation strings to the appropriate `.arb` files
2. Run code generation: `flutter pub run build_runner build`

## 🔐 Data Persistence

- **Hive**: Stores prayer data and Azkar categories
- **Shared Preferences**: Stores app settings and user preferences
- **Firebase**: Cloud messaging for notifications

## 📲 Building for Release

### Android

```bash
flutter build apk
```

### iOS

```bash
flutter build ios
```

## 📚 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Pattern Guide](https://bloclibrary.dev/)
- [Clean Architecture in Flutter](https://resocoder.com/flutter-clean-architecture)
- [Firebase Setup for Flutter](https://firebase.google.com/docs/flutter/setup)

## 👨‍💻 Development

### Running Tests

```bash
flutter test
```

### Code Analysis

```bash
flutter analyze
```

## 📄 License

This project is licensed under a proprietary license. All rights reserved.

## 🤝 Contributing

For contribution guidelines, please contact the development team.

## 📧 Support

For support and questions, please reach out to the development team or open an issue in the repository.
