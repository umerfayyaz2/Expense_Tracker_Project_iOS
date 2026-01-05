import Foundation

final class ConsoleApp {

    private let listViewModel: ExpenseListViewModel
    private let summaryViewModel: ExpenseSummaryViewModel

    init() {
        let store = InMemoryExpenseStore()
        let listVM = ExpenseListViewModel(store: store)

        self.listViewModel = listVM
        self.summaryViewModel = ExpenseSummaryViewModel {
            listVM.expenses
        }
    }

    func run() {
        while true {
            ConsoleUtils.clearScreen()
            showMainMenu()

            let choice = ConsoleUtils.readInt(prompt: "Choose an option:")

            switch choice {
            case 1:
                addExpense()
            case 2:
                listExpenses()
            case 3:
                deleteExpense()
            case 4:
                showSummary()
            case 0:
                ConsoleUtils.clearScreen()
                print("Exiting Expense Tracker. Goodbye.")
                return
            default:
                print("Invalid option.")
                ConsoleUtils.pause()
            }
        }
    }

    private func showMainMenu() {
        print("===== Expense Tracker =====")
        print("")
        print("1. Add Expense")
        print("2. List Expenses")
        print("3. Delete Expense")
        print("4. Monthly Summary")
        print("0. Exit")
        print("")
        print("===========================")

    }

    private func addExpense() {
        ConsoleUtils.clearScreen()
        print("=== Add Expense ===\n")

        let amount = Decimal(ConsoleUtils.readInt(prompt: "Enter amount (PKR):"))
        let note = ConsoleUtils.readString(prompt: "Enter note:")

        print("\nSelect category:")
        for (index, category) in ExpenseCategory.allCases.enumerated() {
            print("\(index + 1). \(category.rawValue)")
        }

        let categoryIndex = ConsoleUtils.readInt(prompt: "Choice:") - 1
        guard ExpenseCategory.allCases.indices.contains(categoryIndex) else {
            print("Invalid category.")
            ConsoleUtils.pause()
            return
        }

        let category = ExpenseCategory.allCases[categoryIndex]

        listViewModel.addExpense(
            amount: amount,
            category: category,
            note: note,
            date: Date()
        )

        print("\nExpense added successfully.")
        ConsoleUtils.pause()
    }

    private func listExpenses() {
        while true {
            ConsoleUtils.clearScreen()
            print("=== Expense List ===\n")

            let expenses = listViewModel.expenses

            if expenses.isEmpty {
                print("No expenses found.")
            } else {
                for (index, expense) in expenses.enumerated() {
                    print("\(index + 1).")
                    print("Amount: \(expense.amount)")
                    print("Category: \(expense.category.rawValue)")
                    print("Note: \(expense.note ?? "—")")
                    print("Date: \(expense.date)")
                    print("-------------------------")

                }
            }

            print("0. Return to Main Menu")
            let choice = ConsoleUtils.readInt(prompt: "Choice:")

            if choice == 0 {
                return
            }
        }
    }

    private func deleteExpense() {
        ConsoleUtils.clearScreen()
        print("=== Delete Expense ===\n")

        let expenses = listViewModel.expenses

        if expenses.isEmpty {
            print("No expenses to delete.")
            ConsoleUtils.pause()
            return
        }

        for (index, expense) in expenses.enumerated() {
            print("\(index + 1). \(expense.category.rawValue) - \(expense.amount)")
        }

        print("\n0. Return to Main Menu")
        let choice = ConsoleUtils.readInt(prompt: "Select expense:")

        if choice == 0 { return }

        let index = choice - 1
        guard expenses.indices.contains(index) else {
            print("Invalid selection.")
            ConsoleUtils.pause()
            return
        }

        let id = expenses[index].id
        listViewModel.deleteExpense(id: id)

        print("Expense deleted.")
        ConsoleUtils.pause()
    }

    private func showSummary() {
        ConsoleUtils.clearScreen()
        print("=== Monthly Summary ===\n")

        let calendar = Calendar.current
        let now = Date()

        let month = calendar.component(.month, from: now)
        let year = calendar.component(.year, from: now)

        let total = summaryViewModel.totalFor(month: month, year: year)
        let breakdown = summaryViewModel.categoryBreakdown(month: month, year: year)

        print("Month: \(month)/\(year)")
        print("Total: \(total)\n")
        print("Category Breakdown:")

        for (category, amount) in breakdown {
            print("- \(category.rawValue): \(amount)")
        }

        ConsoleUtils.pause()
    }
}
