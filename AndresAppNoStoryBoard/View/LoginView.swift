//
//  LoginView.swift
//  AndresAppNoStoryBoard
//
//  Created by Andres Calizaya on 09/12/2021.
//

import UIKit

class LoginView: UIViewController {
    var viewModel: LoginViewModel?

    var mainStackView       = UIStackView()
    var titleView           = UIView()
    var emailView           = UIView()
    var passwordView        = UIView()
    var dataInputView       = UIView()
    var dataInputStackView  = UIStackView()
    var loginView           = UIView()
    var noAccountView       = UIView()
    var socialAppLoginView  = UIView()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor(named: "BackgroundColor")
        setStackView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func setStackView(){
        view.addSubview(mainStackView)
        mainStackView.fitInSuperviewSafeArea()
        mainStackView.axis          = .vertical
        mainStackView.alignment     = .fill
        mainStackView.distribution  = .fillProportionally
        mainStackView.spacing       = 5
        mainStackView.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        mainStackView.isLayoutMarginsRelativeArrangement = true
        
        dataInputStackView.axis          = .vertical
        dataInputStackView.distribution  = .fillProportionally
        dataInputStackView.spacing       = 5
        setEachView()

        
    }
    func setEachView(){
//Configuro y añado el titulo
        titleView.addSubview(signUpTitle)
        signUpTitle.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        signUpTitle.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        mainStackView.addArrangedSubview(titleView)
//Configuro y añado los inputs de los datos
        dataInputView.addSubview(dataInputStackView)
        dataInputStackView.translatesAutoresizingMaskIntoConstraints = false
        dataInputStackView.widthAnchor.constraint(equalTo: dataInputView.widthAnchor).isActive = true
        dataInputStackView.addArrangedSubview(emailLabel)
        dataInputStackView.addArrangedSubview(emailTextField)
        dataInputStackView.addArrangedSubview(passwordLabel)
        dataInputStackView.addArrangedSubview(passwordTextField)
        dataInputStackView.centerYAnchor.constraint(equalTo: dataInputView.centerYAnchor).isActive = true
        mainStackView.addArrangedSubview(dataInputView)
//Configuro y añado el boton de registro
        loginView.addSubview(SignInButton)
        SignInButton.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        SignInButton.centerYAnchor.constraint(equalTo: loginView.centerYAnchor).isActive = true
        mainStackView.addArrangedSubview(loginView)
//Configuro y añado la vista del login
        noAccountView.addSubview(alreadyAccountLabel)
        noAccountView.addSubview(signUpButton)
        alreadyAccountLabel.centerYAnchor.constraint(equalTo: noAccountView.centerYAnchor).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: alreadyAccountLabel.trailingAnchor).isActive = true
        signUpButton.centerYAnchor.constraint(equalTo: alreadyAccountLabel.centerYAnchor).isActive = true
        mainStackView.addArrangedSubview(noAccountView)
//Configuro y añado los social apps login
//        socialAppLoginView.addSubview(socialAppLabel)
//        socialAppLoginView.addSubview(signUpFacebookButton)
//        socialAppLabel.centerXAnchor.constraint(equalTo: signUpFacebookButton.centerXAnchor).isActive = true
//        socialAppLabel.bottomAnchor.constraint(equalTo: signUpFacebookButton.topAnchor, constant: -5).isActive = true
//        signUpFacebookButton.centerXAnchor.constraint(equalTo: socialAppLoginView.centerXAnchor).isActive = true
//        signUpFacebookButton.centerYAnchor.constraint(equalTo: socialAppLoginView.centerYAnchor).isActive = true
//        signUpFacebookButton.widthAnchor.constraint(equalTo: socialAppLoginView.widthAnchor).isActive = true
        //mainStackView.addArrangedSubview(socialAppLoginView)
    }
//MARK: - Los elementos de la pantalla
    let signUpTitle = Init(value: UILabel()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Log In"
        $0.textColor = UIColor(named: "TextColor")
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 25)
        $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    let emailLabel = Init(value: UILabel()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Email or username"
        $0.textColor = UIColor(named: "TextColor")
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        $0.backgroundColor = UIColor(named: "BackgroundColor")
    }
    let emailTextField = Init(value: UITextField()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "your@email.com"
        $0.textColor = .gray
        $0.textAlignment = .left
        $0.backgroundColor = UIColor(named : "BackgroundColor")
        $0.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        $0.layer.cornerRadius = 3
        $0.borderStyle = .roundedRect
        $0.keyboardType = .emailAddress
        $0.autocapitalizationType = .none
    }
    let passwordLabel = Init(value: UILabel()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Password"
        $0.textColor = UIColor(named: "TextColor")
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        $0.backgroundColor = UIColor(named: "BackgroundColor")
        $0.heightAnchor.constraint(lessThanOrEqualToConstant: 16).isActive = true
    }
    let passwordTextField = Init(value: UITextField()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Password"
        $0.textColor = .gray
        $0.textAlignment = .left
        $0.backgroundColor = UIColor(named : "BackgroundColor")
        $0.layer.cornerRadius = 3
        $0.borderStyle = .roundedRect
        $0.isSecureTextEntry = true
    }
    let SignInButton = Init(value: UIButton()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Sign In", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        $0.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        $0.addTarget(self, action: #selector(validateData), for: .touchUpInside)


    }
    let alreadyAccountLabel = Init(value: UILabel()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Don't have an account?"
        $0.textColor = UIColor(named: "TextColor")
        $0.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.thin)
        $0.backgroundColor = UIColor(named: "BackgroundColor")
        
    }
    let signUpButton = Init(value: UIButton()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle(" Sign Up", for: .normal)
        $0.backgroundColor = UIColor(named: "BackgroundColor")
        $0.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        $0.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
    }
    let socialAppLabel = Init(value: UILabel()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Or sign up using social apps"
        $0.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.thin)
    }
    let signUpFacebookButton = Init(value: UIButton()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Sign Up with Facebook", for: .normal)
        $0.contentHorizontalAlignment = .center
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
    }
    @objc func goToRegister(sender: UIButton!){
        let register = RegisterView()
        self.present(register, animated: true, completion: nil)
    }
    @objc func validateData(sender: UIButton!){
        viewModel?.botonLoginTouch(user: emailTextField.text, pass: passwordTextField.text)
        guard let valid = viewModel?.validUser else { return }
        if valid {
            print("El usuario es valido")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(MainTabBar())
        }else {
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.repeatCount = 4
            animation.duration = 0.4/TimeInterval(animation.repeatCount)
            animation.autoreverses = true
            animation.values = [10, -10]
            guard let errorAnimation = viewModel?.errorAnimation else {return}
            if errorAnimation == 1{
                self.emailTextField.layer.add(animation, forKey: "shake")
            } else if errorAnimation == 2 {
                self.passwordTextField.layer.add(animation, forKey: "shake")
            }
        }
    }
    func bindViewModel(){
        viewModel = LoginViewModel()
    }
    
}
