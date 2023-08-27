//
//  NewWordView.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 19.04.2022.
//

import UIKit

final class NewWordView: UIView {
    let newWordTextFieldDelegate: UITextFieldDelegate //вот здесь же тоже должны быть слабые ссылки?
    let translationTextFieldDelegate: UITextFieldDelegate
    let contextTextViewDelegate: UITextViewDelegate
    let context = ContextView()
    weak var delegate: NewWordViewController?
    
    private let newWord = TextView(placeholder: "New Word")
    private let translation = TextView(placeholder: "Translation")
    private let saveButton = ActionButton(title: "Save")
    
    init(newWordTextFieldDelegate: UITextFieldDelegate, translationTextFieldDelegate: UITextFieldDelegate, contextTextViewDelegate: UITextViewDelegate) {
        self.newWordTextFieldDelegate = newWordTextFieldDelegate
        self.translationTextFieldDelegate = translationTextFieldDelegate
        self.contextTextViewDelegate = contextTextViewDelegate
        
        super.init(frame: .zero)
        
        backgroundColor = .lightGray
        
        configureNewWordTextView()
        configureTranslationTextView()
        configureContextTextView()
        configureSaveButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureNewWordTextView() {
        newWord.textField.delegate = newWordTextFieldDelegate
        newWord.layer.cornerRadius = 10
        newWord.layer.masksToBounds = true
        
        addSubview(newWord)
        
        newWord.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newWord.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -170),
            newWord.leftAnchor.constraint(equalTo: leftAnchor,constant: 42),
            newWord.rightAnchor.constraint(equalTo: rightAnchor, constant: -42)
        ])
    }
    
    private func configureTranslationTextView() {
        translation.textField.delegate = translationTextFieldDelegate
        translation.layer.cornerRadius = 10
        translation.layer.masksToBounds = true
        
        addSubview(translation)
        
        translation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            translation.topAnchor.constraint(equalTo: newWord.bottomAnchor, constant: 20),
            translation.leftAnchor.constraint(equalTo: leftAnchor, constant: 42),
            translation.rightAnchor.constraint(equalTo: rightAnchor, constant: -42)
        ])
    }
    
    private func configureContextTextView() {
        context.textView.delegate = contextTextViewDelegate
        context.layer.cornerRadius = 10
        context.layer.masksToBounds = true
        
        addSubview(context)
        
        context.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            context.heightAnchor.constraint(equalToConstant: 150),
            context.topAnchor.constraint(equalTo: translation.bottomAnchor, constant: 20),
            context.leftAnchor.constraint(equalTo: leftAnchor, constant: 42),
            context.rightAnchor.constraint(equalTo: rightAnchor, constant: -42)
        ])
    }
    
    private func configureSaveButton() {
        saveButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        
        addSubview(saveButton)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: context.bottomAnchor, constant: 20),
            saveButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 70),
            saveButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -70)
        ])
    }
    
    @objc private func didTapSaveButton() {
        delegate?.didTapSaveButton()
    }
}
