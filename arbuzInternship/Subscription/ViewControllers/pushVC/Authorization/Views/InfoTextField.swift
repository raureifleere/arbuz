//
//  InfoTextField.swift
//  arbuzInternship
//
//  Created by Bibisara Kenesova on 22.05.2023.
//

import UIKit

class InfoTextField: UITextField {

    init(with fieldType: FieldType) {
        super.init(frame: .zero)
        
        layer.cornerRadius = 15
        backgroundColor = .secondarySystemBackground
        
        leftViewMode = .always
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.size.height))
        
        autocorrectionType = .no
        autocapitalizationType = .none
        
        switch fieldType {
        case .email:
            placeholder = "Email adress"
            keyboardType = .emailAddress
            textContentType = .emailAddress
        case .password:
            placeholder = "Password"
            textContentType = .password
            isSecureTextEntry = true
        case .phone:
            placeholder = "+7"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

enum FieldType {
    case email, password
    case phone
}
