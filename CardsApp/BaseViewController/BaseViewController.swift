//
//  BaseViewController.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 28.05.2022.
//

import UIKit

class BaseViewController: UIViewController {
    private let navigationBarVisibility: Bool
    
    init(navigationBarVisibility: Bool) {
        self.navigationBarVisibility = navigationBarVisibility
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    func handleDidTapBackButton() {
        
    }
    
    private func configureNavigationBar() {
        navigationController?.isNavigationBarHidden = navigationBarVisibility
        
        let backButton = UIBarButtonItem(image: UIImage(named: "BackButton"), style: .plain, target: self, action: #selector(didTapBackButton))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func didTapBackButton() {
        view.endEditing(true)
        handleDidTapBackButton()
    }
}
