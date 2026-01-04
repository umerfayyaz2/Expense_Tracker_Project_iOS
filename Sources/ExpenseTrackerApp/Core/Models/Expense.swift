import Foundation

public struct Expense: Identifiable {

    public let id: UUID
    public let amount: Decimal
    public let category: ExpenseCategory
    public let note: String?
    public let date: Date

    public init(
        id: UUID,
        amount: Decimal,
        category: ExpenseCategory,
        note: String?,
        date: Date
    ) {
        self.id = id
        self.amount = amount
        self.category = category
        self.note = note
        self.date = date
    }
}