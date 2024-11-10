# Teko Hiring Test

## Overview
- **Clean Architecture**: Ensures separation of concerns, maintainability, and scalability with a well-structured codebase.
- **State Management (Bloc)**: Manages app state efficiently by separating business logic from the UI.
- **Dependency Injection** (GetIt): Simplifies dependency management, making components modular and easy to test.
- **Navigation (AutoRoute)**: Provides type-safe, declarative navigation with minimal boilerplate.
- **Network (Dio)**: Facilitates robust HTTP requests with features like interceptors and error handling.
- **Local Database (Floor)**: Simplifies local data storage with an abstraction layer over SQLite.

## Extra Feature
- **CI/CD**: Implements a streamlined CI/CD pipeline with GitHub Actions, automating APK builds to ensure faster, more reliable deployment and continuous integration. This setup reduces manual intervention, improving development efficiency and consistency across builds.
- **Unit Testing**: Focuses on testing the local database to ensure data integrity and reliable data operations, supporting robust, error-free database functionality.
- **Product List Screen**: Accessed via a floating button on the main screen, this screen uses load-more functionality to enhance performance and user experience by loading data incrementally as the user scrolls.

