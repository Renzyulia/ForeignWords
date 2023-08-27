//
//  MainPageView.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 19.04.2022.
//

import UIKit

final class MenuView: UIView {
    weak var delegate: MenuViewDelegate?
    
    private let newWordButton = ActionButton(title: "New Word")
    private let trainingButton = ActionButton(title: "Training")
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .lightGray
        
        configureNewWordButton()
        configureTrainingButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureNewWordButton() {
        newWordButton.addTarget(self, action: #selector(didTapNewWordButton), for: .touchUpInside)
        
        addSubview(newWordButton)
        
        newWordButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newWordButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            newWordButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 90),
            newWordButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -90)
        ])
    }
    
    @objc private func didTapNewWordButton() {
        delegate?.didTapNewWordButton()
    }
    
    private func configureTrainingButton() {
        trainingButton.addTarget(self, action: #selector(didTapTrainingButton), for: .touchUpInside)
        
        addSubview(trainingButton)
        
        trainingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trainingButton.topAnchor.constraint(equalTo: newWordButton.bottomAnchor, constant: 50),
            trainingButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 90),
            trainingButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -90)
        ])
    }
    
    @objc private func didTapTrainingButton() {
        delegate?.didTapTrainingButton()
    }
}
