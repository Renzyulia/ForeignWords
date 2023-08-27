//
//  WordDetailsCardView.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 11.05.2022.
//

import UIKit

final class WordDetailsCardView: UIView {
    private let word: String
    private let translation: String
    private let context: String?
    private let wordLabel = UILabel()
    private let translationLabel = UILabel()
    private let contextLabel = UILabel()
    
    init(word: String, translation: String, context: String?) {
        self.word = word
        self.translation = translation
        self.context = context
        super.init(frame: .zero)
        backgroundColor = .white
        
        configureWordTextField()
        configureTranslationTextField()
        configureContextTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureWordTextField() {
        wordLabel.text = word
        wordLabel.font = .systemFont(ofSize: 20)
        wordLabel.textAlignment = .center
        wordLabel.numberOfLines = 1
        wordLabel.layer.borderWidth = 1.0
        wordLabel.layer.cornerRadius = 8
        
        addSubview(wordLabel)
        
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wordLabel.heightAnchor.constraint(equalToConstant: 40),
            wordLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -140),
            wordLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            wordLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }
    
    private func configureTranslationTextField() {
        translationLabel.text = translation
        translationLabel.font = .systemFont(ofSize: 20)
        translationLabel.textAlignment = .center
        translationLabel.numberOfLines = 1
        translationLabel.layer.borderWidth = 1.0
        translationLabel.layer.cornerRadius = 8
        
        addSubview(translationLabel)
        
        translationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            translationLabel.heightAnchor.constraint(equalToConstant: 40),
            translationLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 20),
            translationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            translationLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }
    
    private func configureContextTextView() {
        guard let context = context else { return }
        
        contextLabel.text = context
        contextLabel.font = .systemFont(ofSize: 18)
        contextLabel.textAlignment = .center
        contextLabel.numberOfLines = 0
        contextLabel.layer.borderWidth = 1.0
        contextLabel.layer.cornerRadius = 8
        
        addSubview(contextLabel)
        
        contextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contextLabel.heightAnchor.constraint(equalToConstant: 200),
            contextLabel.topAnchor.constraint(equalTo: translationLabel.bottomAnchor, constant: 20),
            contextLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            contextLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }
}
