import SwiftUI

struct DashboardView<dashboardViewModel: DashboardViewModelProtocol>: View {
    private let mockTransactions: [Transaction] = [
        Transaction(id: UUID(), amount: 250.00, currency: "USD", title: "Netflix", createdAt: Date(), type: .debit),
        Transaction(id: UUID(), amount: 1500.00, currency: "USD", title: "Salary", createdAt: Date(), type: .credit),
        Transaction(id: UUID(), amount: 45.00, currency: "USD", title: "Uber", createdAt: Date(), type: .debit),
        Transaction(id: UUID(), amount: 800.00, currency: "USD", title: "Freelance", createdAt: Date(), type: .credit),
        Transaction(id: UUID(), amount: 120.00, currency: "USD", title: "Groceries", createdAt: Date(), type: .debit)
    ]
    @StateObject var vm: dashboardViewModel

    init(vm: dashboardViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                profileView
                balanceCard
                buttonCardStack
                dashboardTransactionCard
                List{
                    Section {
                        ForEach(mockTransactions){ transaction in
                            transactionRow(transaction)
                        }
                    } header: {
                        HStack {
                            Text("Recent")
                                .font(.headline)
                            Spacer()
                            Button("See all") { }
                                .foregroundColor(.green)
                                .font(.caption)
                        }
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }.padding(.horizontal)
        }
    }

}

// extracted Functions
extension DashboardView {
    private func transactionRow(_ transaction: Transaction) -> some View {
        HStack(spacing: 12) {
            // icon
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray6))
                .frame(width: 50, height: 50)
                .overlay(
                    Image(systemName: "dollarsign")
                        .foregroundColor(.gray)
                )
            
            // title and date
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.title)
                    .fontWeight(.medium)
                Text(transaction.createdAt.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // amount
            Text("\(transaction.type == .credit ? "+" : "-")$\(transaction.amount.description)")
                .foregroundColor(transaction.type == .credit ? .green : .red)
                .fontWeight(.semibold)
        }
    }

    
    private func buttonCard(image: String, color: Color, action: @escaping () -> Void) -> some View {
        Button {
            action()
        }label: {
            Image(systemName: image)
                .foregroundColor(color)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .background(Color(.systemGray6))
                .cornerRadius(12)
            
            
        }
    }
    
    private func transactionCard(heading: String, amount: String) -> some View {
        VStack(alignment: .leading, spacing: 5){
            Text(heading)
                .font(.caption)
                .fontWeight(.light)
            Text(amount)
                .font(.callout)
                .fontWeight(.bold)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)


        .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 0.5)
                    .opacity(0.6)
            )
        
    }
}

// computed properties
extension DashboardView {

    var dashboardTransactionCard: some View{
        HStack(spacing: 20){
            transactionCard(heading: "Recent transaction", amount: "$8,420")
            transactionCard(heading: "previous transaction", amount: "$6,420")
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
    }
    
    private var buttonCardStack: some View {
        HStack(spacing: 30){
            buttonCard(image: "arrow.up", color: Color.green, action: {})
            buttonCard(image: "arrow.down", color: Color.gray, action: {})
            buttonCard(image: "plus", color: Color.gray, action: {})
            buttonCard(image: "ellipsis", color: Color.gray, action: {})
        }.padding()
        
    }
    
    
    private var balanceCard: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("TOTAL BALANCE")
                .font(.caption2)
                .foregroundColor(.gray)

            Text("$24,580.20")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.white)

            HStack(spacing: 4) {
                Image(systemName: "arrowtriangle.up.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.green)
                Text("2.4 %")
                    .font(.caption)
                    .foregroundColor(.green)
                Text("this month")
                    .font(.caption)
                    .foregroundColor(.white)
                Spacer()
            }
        }.padding(20)
            .background(.black)
            .cornerRadius(20)
    }

    private var profileView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hi, Hamza")
                Text("Account active")
                    .opacity(0.7)
                    .foregroundColor(.green)
            }
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
                .clipShape(.circle)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
}

#Preview {
    DashboardView(
        vm: DashboardViewModel(
            getAccountUseCase: MockAccountUseCase(),
            getTransactionsUseCase: MockTransactionsUseCase()
        )
    )
}
