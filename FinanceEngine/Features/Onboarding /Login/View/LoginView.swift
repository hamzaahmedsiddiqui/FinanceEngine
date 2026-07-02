import Foundation
import SwiftUI

struct LoginView<viewModel: LoginViewModelProtocol>: View {
    
    @StateObject var vm: viewModel
    
    init(viewModel: viewModel) {
        _vm = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                titleView
                logoView
                emailTextFieldView
                passwordTextFieldView
                errorMessage
                if vm.isLoading {
                    ProgressView()
                } else {
                    loginButtonView
                }
                Spacer()
            }.padding()
        }
    }
}

// Computed properties
extension LoginView {
    var titleView: some View {
        Text("Welcome to Finance Engine")
            .font(.title)
            .bold()
            .multilineTextAlignment(.center)  // alignment
    }
    
    @ViewBuilder
    var errorMessage: some View {
        if let error = vm.errorMessage {
            Text(error)
                .foregroundColor(.red)
                .font(.caption)
        }
    }
    
    var logoView: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    var loginButtonView: some View {
        Button {
            Task {
                await vm.login()
            }
        } label: {
            Text("Login")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
    
    var emailTextFieldView: some View {
        TextField("Email", text: $vm.email)
            .keyboardType(.emailAddress)
            .inputFieldStyle()
    }
    
    var passwordTextFieldView: some View {
        SecureField("Password", text: $vm.password)
            .inputFieldStyle()
            .padding(.bottom)
    }
}

extension View {
    func inputFieldStyle() -> some View {
        self.modifier(MyModifier())
    }
}

struct MyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
        
    }
}

#Preview {
    LoginView(
        viewModel: LoginViewModel(
            loginUseCase: MockLoginUseCase(), coordinator: AppCoordinator()
        )
    )
}
