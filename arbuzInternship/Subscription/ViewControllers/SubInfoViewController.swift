//
//  SubInfoViewController.swift
//  arbuzInternship
//
//  Created by Bibisara Kenesova on 23.05.2023.
//

import UIKit
import SnapKit

class SubInfoViewController: UIViewController {
    
    private lazy var authButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти в профиль", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupViews()
        setupConstraints()
    }

}

//MARK: - Setup Views and Constraints methods

private extension SubInfoViewController {
    
    func setupViews() {
        view.addSubview(authButton)
    }
    
    func setupConstraints() {
        authButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.leading.equalToSuperview().inset(15)
            make.height.equalTo(75)
        }
    }
}
