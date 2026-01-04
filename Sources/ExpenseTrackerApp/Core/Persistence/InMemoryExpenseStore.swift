import Foundation

public final class InMemoryExpenseStore: ExpenseStore {

    private var storage: [Expense] = []

    public init() {}

    public func fetchAll() -> [Expense] {
        return storage
    }

    public func save(_ expense: Expense) {
        storage.append(expense)
    }

    public func delete(id: UUID) {
        storage.removeAll { $0.id == id }
    }

    public func deleteAll() {
        storage.removeAll()
    }
}
