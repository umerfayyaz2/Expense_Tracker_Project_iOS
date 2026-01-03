/// Represents a single expense entry

import Foundation

struct Expense {

    /// Unique identifier for the expense
    let id: UUID

    /// Amount spent (Decimal for currency accuracy)
    let amount: Decimal

    /// Category of the expense
    let category: ExpenseCategory

    /// Optional note entered by the user
    let note: String?

    /// Date when the expense occurred
    let date: Date
}
