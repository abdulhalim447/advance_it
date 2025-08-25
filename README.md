# Advance IT LTD Flutter App

A Flutter application built using Clean Architecture principles with Provider for state management. The app implements a pixel-perfect design based on the provided screenshot.

## Design Implementation

The app follows the design shown in the screenshot with the following key elements:

- Yellow primary color (customizable theme)
- Blue foreground/accent color for icons and text
- Custom app bar with menu icon, logo, and notification icon
- Tab bar with custom styling
- Banner section with gradient background
- Social media quick links row
- Action buttons section with dividers
- Category grid with icons and labels
- Custom bottom navigation bar

## Clean Architecture

This project follows the Clean Architecture pattern, which separates the codebase into distinct layers:

### 1. Domain Layer
- **Entities**: Core business objects (`Category`, `MenuItem`)
- **Repositories (interfaces)**: Abstract definitions of data operations
- **Use Cases**: Application-specific business rules

### 2. Data Layer
- **Models**: Data objects that extend entities with data-specific functionality
- **Repositories (implementations)**: Concrete implementations of repository interfaces
- **Data Sources**: Local and remote data sources

### 3. Presentation Layer
- **Providers**: State management using Provider package
- **Pages**: UI screens
- **Widgets**: Reusable UI components

### Core
Shared elements used across the application:
- **Constants**: App-wide constants
- **Errors**: Custom failures and exceptions
- **Network**: Network connectivity services
- **Theme**: Application theming
- **Utils**: Utility functions and services

## Dependency Injection
This project uses `get_it` for dependency injection to provide loose coupling between components.

## State Management
Provider package is used for state management to maintain a unidirectional data flow:
- **HomeProvider**: Manages home screen data and state

## Project Structure
```
lib/
  ├── config/                 # App configuration
  │   ├── app_router.dart     # Navigation routes
  │   └── injection_container.dart # Dependency injection
  │
  ├── core/                   # Core functionality
  │   ├── constants/          # Constants
  │   ├── errors/             # Failure and exceptions
  │   ├── network/            # Network info
  │   ├── theme/              # App theme
  │   └── utils/              # Utility classes
  │
  ├── features/               # App features
  │   ├── home/               # Home feature
  │   │   ├── data/           # Data layer
  │   │   │   ├── datasources/    # Data sources
  │   │   │   ├── models/         # Data models
  │   │   │   └── repositories/   # Repository implementations
  │   │   │
  │   │   ├── domain/         # Domain layer
  │   │   │   ├── entities/       # Business entities
  │   │   │   ├── repositories/   # Repository interfaces
  │   │   │   └── usecases/       # Use cases
  │   │   │
  │   │   └── presentation/   # Presentation layer
  │   │       ├── providers/      # State management
  │   │       ├── pages/          # UI screens
  │   │       └── widgets/        # Reusable widgets
  │   │
  │   └── sample_feature/     # Example feature (template)
  │
  └── main.dart              # Entry point
```

## Dependencies
This project uses the following major dependencies:
- Provider: State management
- Get_it: Dependency injection
- HTTP: API communication
- Shared Preferences: Local storage
- Dartz: Functional programming
- Equatable: Value equality
- Flutter SVG: SVG rendering

## Getting Started

1. Clone this repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the application


## Screenshots

<p align="center">
  <img src="https://ozevjsmzqipxejdwxptt.supabase.co/storage/v1/object/public/photos/IMG-20250825-WA0004.jpg" alt="Home Screen" width="250" style="margin-right:15px/>
  <img src="https://ozevjsmzqipxejdwxptt.supabase.co/storage/v1/object/public/photos/IMG-20250825-WA0002.jpg" alt="Home Screen" width="250" style="margin-right:15px/>
  <img src="https://ozevjsmzqipxejdwxptt.supabase.co/storage/v1/object/public/photos/IMG-20250825-WA0003.jpg" alt="Home Screen" width="250" style="margin-right:15px/>
  <img src="https://ozevjsmzqipxejdwxptt.supabase.co/storage/v1/object/public/photos/IMG-20250825-WA0003.jpg" alt="Home Screen" width="250"style="margin-right:15px/>
</p>
