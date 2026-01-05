# Expense Tracker (iOS Architecture-First Project)

An **offline-first Expense Tracker application** built using **Swift**, following **SwiftUI + MVVM architectural principles**, with a **console-based execution layer** to ensure full logic validation on **Windows**.

This project focuses on **clean architecture, correctness, testability, and separation of concerns**, rather than platform-specific UI rendering.

---

## 📌 Project Overview

This Expense Tracker allows users to:

- Add expenses with amount, category, note, and date  
- View all recorded expenses  
- Delete individual expenses  
- View monthly summaries  
- See category-wise expense breakdown  

The application is designed as a **real iOS app**, but implemented in a way that makes it **fully executable and verifiable on Windows** using the Swift CLI.

---

## ⚠️ Platform Limitation & Design Decision

### Why SwiftUI UI is not runnable on Windows

SwiftUI requires **Apple SDKs (Xcode, iOS Simulator, UIKit/AppKit bindings)** which are **not available on Windows**.

Because of this limitation:

- SwiftUI **Views are written for architectural completeness**
- UI execution is **not possible on Windows**
- Core logic **must still be testable and reviewable**

### Solution Used

Instead of compromising on quality or correctness:

- A **Console-based application engine** is implemented
- All business logic runs through **ViewModels**
- The console app acts as a **UI simulator**
- The same ViewModels would be reused in a real iOS SwiftUI app

This ensures:
- 100% logic correctness
- Clean MVVM architecture
- Full project review without iOS runtime

---

## 🧠 Architecture Overview

The project follows **MVVM (Model–View–ViewModel)** with feature-based modularization.

### Layers

- **Models** → Pure data structures  
- **Persistence** → Storage abstraction  
- **ViewModels** → Business logic & state  
- **Views** → SwiftUI UI (design-only)  
- **ConsoleUI** → Executable testing interface  
- **main.swift** → Application entry point  

---

## 📂 Project Structure

ExpenseTrackerApp
├── ConsoleUI
│ ├── ConsoleApp.swift
│ └── ConsoleUtils.swift
│
├── Core
│ ├── Models
│ │ ├── Expense.swift
│ │ └── ExpenseCategory.swift
│ │
│ └── Persistence
│ ├── ExpenseStore.swift
│ └── InMemoryExpenseStore.swift
│
├── Features
│ ├── ExpenseList
│ │ └── ExpenseListViewModel.swift
│ │
│ └── Summary
│ └── ExpenseSummaryViewModel.swift
│
├── Views
│ ├── AddExpense
│ │ └── AddExpenseView.swift
│ │
│ └── ExpenseList
│ └── ExpenseListView.swift
│
└── main.swift


---

## 🧩 Core Components Explained

### Expense Model

Represents a single expense entry:

- `UUID` identifier  
- `Decimal` amount (currency-safe)  
- Category enum  
- Optional note  
- Date  

---

### ExpenseStore Protocol

Defines a **storage abstraction**:

- Fetch all expenses  
- Save new expense  
- Delete by ID  
- Delete all expenses  

This allows swapping persistence layers without touching business logic.

---

### InMemoryExpenseStore

A lightweight in-memory implementation used for:

- Logic testing  
- Console execution  
- Architecture validation  

(Core Data schema is designed separately for iOS.)

---

### ExpenseListViewModel

Handles:

- Expense validation  
- Adding expenses  
- Deleting expenses  
- Maintaining sorted state  

This ViewModel is UI-agnostic and reusable across platforms.

---

### ExpenseSummaryViewModel

Uses a **closure-based dependency injection** pattern:

- Pulls latest expenses dynamically  
- Calculates monthly totals  
- Produces category-wise breakdown  

This avoids tight coupling between ViewModels.

---

## 🖥️ Console Application (Execution Layer)

Since SwiftUI cannot run on Windows, the app includes a **fully interactive console UI**.

### Console Features

- Menu-driven interface  
- Add / List / Delete expenses  
- Monthly summary  
- Category breakdown  
- Real-time ViewModel interaction  

### Entry Point

```swift
let app = ConsoleApp()
app.run()
```

## ▶️ How to Run the Project

### Requirements

- Swift Toolchain installed on Windows  
- Swift 5.9 or later  

### Run Command

```bash
swift run --disable-index-store
```

### Expected Output
- Interactive menu
- User input prompts
- Live expense updates
- Accurate monthly summaries

This confirms the project works end-to-end.

### 🧪 Testing Strategy
No separate manual test files

Logic validated through:

- Console interaction
- ViewModel state changes
- Real execution flow
- This approach ensures:
- Practical validation
- Business logic reliability
- Clear execution trace

📱 SwiftUI Views (Design-Only)
SwiftUI views are included under conditional compilation:
```
#if canImport(SwiftUI)
```

They demonstrate:
- Proper state binding
- ViewModel integration
- iOS-ready UI structure

These views will run unchanged on macOS or iOS.

### 🎯 Key Engineering Decisions
Architecture-first development

- Platform-independent business logic
- Protocol-based persistence
- Dependency injection via closures
- Decimal-safe financial calculations
- Feature-based modular structure


### 👤 Author
Umer Fayyaz
BS-IT (6th Semester)
Swift • MVVM • Architecture-Driven Development
