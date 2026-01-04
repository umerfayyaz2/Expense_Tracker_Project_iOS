#if canImport(SwiftUI)
    import SwiftUI

    struct ExpenseListView: View {

        @StateObject private var viewModel: ExpenseListViewModel

        init(viewModel: ExpenseListViewModel) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }

        var body: some View {
            List {
                ForEach(viewModel.expenses) { expense in
                    VStack(alignment: .leading) {
                        Text(expense.category.rawValue.capitalized)
                            .font(.headline)

                        Text("PKR \(expense.amount)")
                            .font(.subheadline)

                        if let note = expense.note {
                            Text(note)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete { indexSet in
                    indexSet
                        .map { viewModel.expenses[$0].id }
                        .forEach(viewModel.deleteExpense)
                }
            }
            .navigationTitle("Expenses")
        }
    }
#endif
