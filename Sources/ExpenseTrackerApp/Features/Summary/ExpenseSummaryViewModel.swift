/// ViewModel responsible for calculating expense summaries
import Foundation

final class ExpenseSummaryViewModel {

    /// All expenses used for summary calculations
    private let expenses: [Expense]

    init(expenses: [Expense]) {
        self.expenses = expenses
    }

    /// Calculates total expense amount for a given month
    func totalFor(month: Int, year: Int) -> Decimal {
        let filteredExpenses = expenses.filter { expense in
            let components = Calendar.current.dateComponents([.month, .year], from: expense.date)
            return components.month == month && components.year == year
        }

        return filteredExpenses.reduce(Decimal(0)) { result, expense in
            result + expense.amount
        }
    }

    /// Calculates total expense per category for a given month
    func categoryBreakdown(month: Int, year: Int) -> [ExpenseCategory: Decimal] {

        var breakdown: [ExpenseCategory: Decimal] = [:]

        let filteredExpenses = expenses.filter { expense in
            let components = Calendar.current.dateComponents([.month, .year], from: expense.date)
            return components.month == month && components.year == year
        }

        for expense in filteredExpenses {
            breakdown[expense.category, default: 0] += expense.amount
        }

        return breakdown
    }
}
