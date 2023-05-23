//
//  ViewController.swift
//  arbuzInternship
//
//  Created by Bibisara Kenesova on 21.05.2023.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController {
    
    private lazy var authView: UIView = {
        let view = UIView()
        return view
        
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Введите email и пароль"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    private lazy var careLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.text = "Мы используем ваш email и пароль для авторизации"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var emailTextField = InfoTextField(with: .email)
    
    private lazy var passwordTextField = InfoTextField(with: .password)
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Продолжить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBackground
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupViews()
        setupConstraints()
    }

}

//MARK: - Setup views and constraints methods

private extension AuthViewController {
    func setupViews() {
        view.addSubview(authView)
        authView.addSubview(headerLabel)
        authView.addSubview(careLabel)
        authView.addSubview(emailTextField)
        authView.addSubview(passwordTextField)
        authView.addSubview(continueButton)
        authView.addSubview(registrationButton)
    }
    
    func setupConstraints() {
        authView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(10)
        }
        
        careLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(8)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(careLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(continueButton.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
    }
}
