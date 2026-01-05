import Foundation

final class ExpenseSummaryViewModel {

    /// Closure that provides latest expenses
    private let expenseProvider: () -> [Expense]

    init(expenseProvider: @escaping () -> [Expense]) {
        self.expenseProvider = expenseProvider
    }

    private var expenses: [Expense] {
        expenseProvider()
    }

    func totalFor(month: Int, year: Int) -> Decimal {
        let filtered = expenses.filter {
            let components = Calendar.current.dateComponents([.month, .year], from: $0.date)
            return components.month == month && components.year == year
        }

        return filtered.reduce(Decimal(0)) { $0 + $1.amount }
    }

    func categoryBreakdown(month: Int, year: Int) -> [ExpenseCategory: Decimal] {
        var result: [ExpenseCategory: Decimal] = [:]

        let filtered = expenses.filter {
            let components = Calendar.current.dateComponents([.month, .year], from: $0.date)
            return components.month == month && components.year == year
        }

        for expense in filtered {
            result[expense.category, default: Decimal(0)] += expense.amount
        }

        return result
    }
}
