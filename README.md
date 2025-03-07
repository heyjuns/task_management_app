# Task Management App

This project is a task management application built using **Domain-Driven Design (DDD)** principles and **Riverpod** for state management.

## Architecture Overview

### Domain-Driven Design (DDD)
The application follows **DDD principles** to ensure a clean separation of concerns and maintainability. The domain layer contains the business logic and entities that represent the tasks.

- **Entities**: Represent the core business domain. In this case, `TaskEntity` is the central entity.
- **Value Objects**: Immutable objects that have a set of values used to describe the state of an entity. For example, `TaskPriority` is a value object.
- **Use Cases**: Define the actions that can be performed on the domain. For example, `GetTasksUseCase` is a use case.
- **Repository**: Abstracts the data access layer, providing a way to interact with the data storage.

### Riverpod
Riverpod is used for **state management**, providing a simple and efficient way to handle the application's state.

- **Providers**: Manage the state of the application. For example, `taskNotifierProvider` manages the list of tasks.
- **Notifiers**: Implement the business logic for updating the state. For example, `TaskNotifier` handles adding, updating, and deleting tasks.

## Key Features

- **Task Management**: Users can create, update, and delete tasks.
- **Filtering and Sorting**: Tasks can be filtered by priority and completion status, and sorted by due date.
- **Real-time Updates**: Tasks are updated in real-time using Riverpod's reactive state management.

## Technical Details

### Backend
- **Firebase Firestore** is used as the backend for storing tasks.

### Frontend
- **Flutter** is used for building the mobile application.

## Prerequisites
- Flutter SDK 3.29.0 or later

## Getting Started

1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-repo/task-management-app.git
   ```
2. **Navigate to the project directory:**
   ```sh
   cd task-management-app
   ```
3. **Install dependencies:**
   ```sh
   flutter pub get
   ```
4. **Run the application:**
   ```sh
   flutter run
   ```

## Contributing

Contributions are welcome! Please submit a pull request with your changes.

Feel free to modify this README to better fit your project's specific needs and details.

---
If you have any questions or need further assistance, feel free to ask!



