//
//  WelcomeView.swift
//  AndresAppNoStoryBoard
//
//  Created by Andres Calizaya on 09/12/2021.
//

import UIKit

class WelcomeView: UIViewController {
    let mainView = UIView()
    let mainStack = UIStackView()
    
    let logoImage = Init(value: UIImageView()){
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.tintColor = UIColor(named: "TextColor")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let logOutButton = Init(value: UIButton()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Log out", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        $0.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        $0.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor(named: "BackgroundColor")
        view.addSubview(mainView)
        mainView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.fitInSuperviewSafeArea()
}
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImage.image = UIImage(named: "icon")
        
        mainView.addSubview(mainStack)

        mainStack.fitInSuperview()
        mainStack.axis          = .vertical
        mainStack.alignment     = .fill
        mainStack.distribution  = .fillProportionally
        mainStack.spacing       = 10
        mainStack.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        mainStack.isLayoutMarginsRelativeArrangement = true
        
        mainStack.addArrangedSubview(logoImage)
        mainStack.addArrangedSubview(logOutButton)
        logOutButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    @objc func goToLogin(sender: UIButton!){
//        let login = LoginView()
//        login.modalPresentationStyle = .fullScreen
//        self.present(login, animated: true, completion: nil)
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(LoginView())
//        for presenting modally
//        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)

//        for navigation
//        self.navigationController?.popToRootViewController(animated: true)
    }
}
