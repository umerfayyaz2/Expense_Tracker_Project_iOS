import Foundation

public final class ExpenseListViewModel {

    private let store: ExpenseStore
    public private(set) var expenses: [Expense] = []

    public init(store: ExpenseStore) {
        self.store = store
        self.expenses = store.fetchAll()
    }

    public func addExpense(
        amount: Decimal,
        category: ExpenseCategory,
        note: String?,
        date: Date
    ) {
        guard amount > 0 else { return }

        let expense = Expense(
            id: UUID(),
            amount: amount,
            category: category,
            note: note,
            date: date
        )

        store.save(expense)
        expenses = store.fetchAll()
        expenses.sort { $0.date > $1.date }
    }

    public func deleteExpense(id: UUID) {
        store.delete(id: id)
        expenses = store.fetchAll()
    }
}
