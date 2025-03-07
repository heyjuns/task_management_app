# Technical Assessment

## Task Management App ☑️

**Objective**:

Develop a clean, scalable task management app using **Domain-Driven Design (DDD)** and **Riverpod** for state management. Focus on separation of concerns, testability, and adherence to best practices.

---

### **Core Features**

1. **Task Management**:
    - Create/Edit tasks with: `title`, `description`, `due date`, `priority` (low/medium/high).
    - Delete tasks.
    - Mark tasks as complete.
    - Filter tasks by `priority`, `completion status`, or `due date`.
2. **Online and Offline Support**:
    - Tasks must persist online, ensuring data integrity. (Firebase)
    - Cache tasks locally using a database (SQLite, Hive…).
    - Handle user authentication.
    - Handle sync conflicts gracefully (e.g., alert if data is stale).
3. **UI Requirements**:
    - List tasks with sorting/filtering options.
    - Detail screen for editing tasks.
    - Clean, responsive design (showcase your UI/UX skills).

---

### **Technical Requirements**

### **1. Domain-Driven Design (DDD) Structure**

Organize code into the following layers:

- **Domain Layer**:
    - Entities
    - Value objects
    - Repository interfaces
    - Failure handling
- **Application Layer**:
    - State management using **Riverpod** (providers, `StateNotifier`, states).
- **Infrastructure Layer**:
    - Repositories
    - Data sources
    - DTOs
- **Presentation Layer**:
    - Widgets and pages
    - Use `flutter_hooks` for cleaner code.
    - Create a separate UI kit for reusable components.

### **2. Riverpod Architecture**

- Scope providers appropriately (e.g., `autoDispose` for transient state).
- Implement error handling in UI (e.g., `AsyncValue` for loading/error states).

### **3. Testing**

- Unit tests for use cases, repositories, and state notifiers.
- Widget tests for critical UI components.
- Integration test for the main user flow (create → edit → delete).

---

### **Evaluation Criteria**

1. **Code Structure**: Adherence to DDD principles and layer separation.
2. **Riverpod Usage**: Correct provider scoping, state synchronization, and reactivity.
3. **Test Coverage**: Quality and completeness of tests.
4. **Online and Offline Handling**: Robust data persistence online and offline.
5. **Clean Code**: Readability, scalability, and use of best practices (SOLID, DRY).

---

### **Submission Guidelines**

1. Provide a **GitHub repository** with:
    - Complete Flutter project.
    - Clear `README` explaining your DDD/Riverpod architecture.
    - Instructions to run the app and tests.
2. Highlight any trade-offs or design decisions in the `README`.

---

### **Extra Credit (Optional)**

- Add push notifications for upcoming task deadlines.
- Implement undo/redo for task actions.
- Add a search feature with debouncing.
- Dark/light theme toggle using Riverpod.

---

### **Time Limit**: 2 days

---

**Final Notes**:

- Prioritize **quality over quantity**—focus on a few well-implemented features.

- We value clear documentation and maintainable code.

- Ask clarifying questions if needed!

Good luck! 🚀