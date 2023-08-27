//
//  NewWordTextField.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 19.04.2022.
//

import UIKit

final class TextView: UIView {
    let textField = UITextField()
    
    private let placeholder: String
    
    init(placeholder: String) {
        self.placeholder = placeholder
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        configureTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextView() {
        textField.placeholder = placeholder
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.textAlignment = .left
        
        addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -5)
        ])
    }
}
