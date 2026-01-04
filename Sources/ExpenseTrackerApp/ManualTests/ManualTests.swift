import Foundation

struct ManualTests {

    // MARK: - Expense Summary Tests
    static func runExpenseSummaryTests() {

        let store = InMemoryExpenseStore()
        let listVM = ExpenseListViewModel(store: store)

        // Add sample expenses
        listVM.addExpense(
            amount: 1000,
            category: ExpenseCategory.food,
            note: "Groceries",
            date: Date()
        )

        listVM.addExpense(
            amount: 2000,
            category: ExpenseCategory.transport,
            note: "Fuel",
            date: Date()
        )

        let summaryVM = ExpenseSummaryViewModel(expenses: listVM.expenses)

        // January = 1, Current year
        let month = Calendar.current.component(.month, from: Date())
        let year = Calendar.current.component(.year, from: Date())

        let breakdown = summaryVM.categoryBreakdown(month: month, year: year)

        let total = breakdown.values.reduce(0, +)

        print("Monthly Total:", total)
        print("Category Breakdown:", breakdown)
    }

    // MARK: - Expense List Screen Simulation
    static func simulateExpenseListScreen() {

        let store = InMemoryExpenseStore()
        let viewModel = ExpenseListViewModel(store: store)

        print("=== Expense List Screen Loaded ===")
        print("Expenses:", viewModel.expenses.count)

        print("\nUser taps Add Expense")

        viewModel.addExpense(
            amount: 1200,
            category: ExpenseCategory.food,
            note: "Dinner",
            date: Date()
        )

        print("Expense added.")
        print("Expenses:", viewModel.expenses.count)

        print("\nUser deletes first expense")

        if let first = viewModel.expenses.first {
            viewModel.deleteExpense(id: first.id)
        }

        print("Expenses after delete:", viewModel.expenses.count)
    }
}
