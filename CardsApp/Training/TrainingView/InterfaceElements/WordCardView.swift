//
//  CardView.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 09.05.2022.
//

import UIKit

final class WordCardView: UIView {
    private let wordForTraining: String
    private let wordTextField = UILabel()
    
    init(wordForTraining: String) {
        self.wordForTraining = wordForTraining
        super.init(frame: .zero)
        
        backgroundColor = .white
        configureCardView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCardView() {
        wordTextField.text = wordForTraining
        wordTextField.textColor = .black
        wordTextField.font = .systemFont(ofSize: 20)
        
        addSubview(wordTextField)
        
        wordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            wordTextField.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            wordTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50)
        ])
    }
}
