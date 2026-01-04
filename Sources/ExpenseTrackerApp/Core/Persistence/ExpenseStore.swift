import Foundation

public protocol ExpenseStore {

    /// Returns all stored expenses
    func fetchAll() -> [Expense]

    /// Saves a new expense
    func save(_ expense: Expense)

    /// Deletes an expense by ID
    func delete(id: UUID)

    /// Deletes all expenses
    func deleteAll()
}
