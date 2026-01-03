/// Manual test runner for Expense logic
import Foundation

struct ManualTests {

    static func runExpenseSummaryTests() {

        let expenses = [
            Expense(
                id: UUID(),
                amount: 500,
                category: .food,
                note: "Lunch",
                date: makeDate(day: 5, month: 1, year: 2026)
            ),
            Expense(
                id: UUID(),
                amount: 1000,
                category: .transport,
                note: "Taxi",
                date: makeDate(day: 10, month: 1, year: 2026)
            ),
            Expense(
                id: UUID(),
                amount: 300,
                category: .food,
                note: nil,
                date: makeDate(day: 2, month: 2, year: 2026)
            ),
        ]

        let summaryVM = ExpenseSummaryViewModel(expenses: expenses)

        let januaryTotal = summaryVM.totalFor(month: 1, year: 2026)
        print("January Total:", januaryTotal)

        let januaryBreakdown = summaryVM.categoryBreakdown(month: 1, year: 2026)
        print("January Breakdown:", januaryBreakdown)
    }

    /// Helper to create consistent test dates
    private static func makeDate(day: Int, month: Int, year: Int) -> Date {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        return Calendar.current.date(from: components)!
    }
}
