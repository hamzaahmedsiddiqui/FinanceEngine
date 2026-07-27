import UIKit
import SwiftUI

class RegisterViewController: UIViewController {

    //MARK: - UI Components
    private let firstNameTextField = UITextField()
    private let lastNameTextField = UITextField()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let phoneTextField = UITextField()
    private let registerButton = UIButton(type: .system)

    private let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }

    // MARK: - Setup
    private func setupUI() {
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        view.backgroundColor = .systemBackground

        textFieldModifiers(textField: firstNameTextField, placeHolder: "First Name", autocapitalizationType: .words)
        textFieldModifiers(textField: lastNameTextField, placeHolder: "Last Name", autocapitalizationType: .words)
        textFieldModifiers(textField: emailTextField, keyboardType: .emailAddress, placeHolder: "Email", autocapitalizationType: .none)
        textFieldModifiers(textField: passwordTextField, isSecureTextEntry: true, placeHolder: "Password", autocapitalizationType: .none)
        textFieldModifiers(textField: phoneTextField, keyboardType: .phonePad, placeHolder: "Phone Number", autocapitalizationType: .none)

        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .systemBlue
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 10
    }

    private func setupConstraints() {
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        
        [firstNameTextField, lastNameTextField, emailTextField,
         passwordTextField, phoneTextField].forEach {
            stackView.addArrangedSubview($0)
            $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
        
        view.addSubview(stackView)
        view.addSubview(registerButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            registerButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Private func
    private func textFieldModifiers(textField: UITextField, keyboardType: UIKeyboardType = .default, isSecureTextEntry: Bool = false, placeHolder: String = "", autocapitalizationType: UITextAutocapitalizationType) {
        textField.borderStyle = .roundedRect
        textField.keyboardType = keyboardType
        textField.autocapitalizationType = autocapitalizationType
        textField.placeholder = placeHolder
        textField.isSecureTextEntry = isSecureTextEntry
    }
    
    @objc private func registerTapped(){
        // TODO: connect to RegisterViewModel and call register
    }
    
}



struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = RegisterViewController

    func makeUIViewController(context: Context) -> RegisterViewController {
        RegisterViewController()
    }
    
    func updateUIViewController(_ uiViewController: RegisterViewController, context: Context) {
        // nothing needed here
    }
}

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View{
        ViewControllerRepresentable()
    }
}
