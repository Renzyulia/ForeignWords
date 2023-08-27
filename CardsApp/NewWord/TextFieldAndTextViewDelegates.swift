//
//  TextFieldDelegate.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 08.05.2022.
//

import UIKit

final class NewWordTextFieldDelegate: NSObject, UITextFieldDelegate {
    weak var delegate: NewWordModel?
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != " " {
            delegate?.newWord = textField.text
        }
    }
}

final class TranslationTextFieldDelegate: NSObject, UITextFieldDelegate {
    weak var delegate: NewWordModel?
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != " " {
            delegate?.translation = textField.text
        }
    }
}

final class ContextTextViewDelegate: NSObject, UITextViewDelegate {
    weak var delegate: NewWordModel?
    
    private let placeholder = NSAttributedString(
        string: "How the word can be used",
        attributes: [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.lightGray
        ])
    
    func didAttach(to textView: UITextView) {
        textView.attributedText = placeholder
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.attributedText == placeholder {
            textView.attributedText = NSAttributedString("")
        } else {
            textView.text = textView.text
        }
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 16)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.attributedText = placeholder
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        delegate?.context = textView.text
    }
}
