//
//  ContextView.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 19.04.2022.
//

import UIKit

final class ContextView: UIView {
    let textView = UITextView()
    
    init() {
        super.init(frame: .zero)
        configureTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextView() {
        textView.textAlignment = .left
        
        addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topAnchor),
            textView.leftAnchor.constraint(equalTo: leftAnchor),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor),
            textView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}
