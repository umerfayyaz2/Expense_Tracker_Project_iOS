/// ViewModel responsible for managing the expense list
import Foundation

final class ExpenseListViewModel {

    /// All expenses stored in memory (temporary)
    private(set) var expenses: [Expense] = []

    /// Adds a new expense to the list
    func addExpense(
        amount: Decimal,
        category: ExpenseCategory,
        note: String?,
        date: Date
    ) {
        let newExpense = Expense(
            id: UUID(),
            amount: amount,
            category: category,
            note: note,
            date: date
        )

        expenses.append(newExpense)
        sortExpensesByDate()
    }

    /// Deletes an expense using its unique ID
    func deleteExpense(id: UUID) {
        expenses.removeAll { $0.id == id }
    }

    /// Sorts expenses by date (latest first)
    private func sortExpensesByDate() {
        expenses.sort { $0.date > $1.date }
    }
}
