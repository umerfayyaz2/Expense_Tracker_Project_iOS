#if canImport(SwiftUI)
    import SwiftUI

    struct AddExpenseView: View {

        @ObservedObject var viewModel: ExpenseListViewModel

        @State private var amountText = ""
        @State private var selectedCategory: ExpenseCategory = .food
        @State private var note = ""
        @State private var date = Date()

        var body: some View {
            Form {
                TextField("Amount", text: $amountText)
                    .keyboardType(.decimalPad)

                Picker("Category", selection: $selectedCategory) {
                    ForEach(ExpenseCategory.allCases, id: \.self) {
                        Text($0.rawValue.capitalized)
                    }
                }

                TextField("Note", text: $note)
                DatePicker("Date", selection: $date, displayedComponents: .date)

                Button("Save") {
                    if let amount = Decimal(string: amountText) {
                        viewModel.addExpense(
                            amount: amount,
                            category: selectedCategory,
                            note: note.isEmpty ? nil : note,
                            date: date
                        )
                    }
                }
            }
            .navigationTitle("Add Expense")
        }
    }
#endif
