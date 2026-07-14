import Foundation
import SwiftUI

struct LoginView<ViewModel: LoginViewModelProtocol>: View {
    
    @StateObject var vm: ViewModel
    
    init(viewModel: ViewModel) {
        _vm = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack {
                    Spacer()
                    titleView
                    logoView
                    emailTextFieldView
                    passwordTextFieldView
                    Spacer()
                    errorMessage
                    if vm.isLoading {
                        ProgressView()
                    } else {
                        loginButtonView
                    }
                    Button{
                        // TODO: ForgetPassword func need to be implemented
                    }label:{
                        Text("Forget password")
                            .font(.caption)
                            .padding()
                    }
                    .shadow(radius: 10, x: -10, y: 10)
                }.padding()
            }
            .scrollBounceBehavior(.basedOnSize)
            .scrollIndicators(.hidden)
            registerNavigationLink // -> navigate to regiter view
        }
    }
}

// Computed properties
extension LoginView {
    var titleView: some View {
        Text("Welcome to Finance Engine")
            .font(.title)
            .bold()
            .multilineTextAlignment(.center)
            .shadow(radius: 10, x: -10, y: 10)
            .padding()
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
            .shadow(radius: 10, x: -10, y: 10)
            .padding()
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
                .padding(.top)
        }
        .shadow(radius: 10, x: -10, y: 10)
    }
    
    var registerNavigationLink: some View {
        NavigationLink(destination: RegisterViewControllerWrapper()) {
            Text("Are you not registered? ")
                .foregroundColor(.primary) +
            Text("Sign Up")
                .foregroundColor(.blue)
                .bold()
        }
        .font(.footnote)
    }
    
    var emailTextFieldView: some View {
        TextField("Email", text: $vm.email)
            .keyboardType(.emailAddress)
            .inputFieldStyle()
            .padding(.top)
            .shadow(radius: 10, x: -10, y: 10)
    }
    
    var passwordTextFieldView: some View {
        SecureField("Password", text: $vm.password)
            .inputFieldStyle()
            .padding(.bottom)
            .shadow(radius: 10, x: -10, y: 10)
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
