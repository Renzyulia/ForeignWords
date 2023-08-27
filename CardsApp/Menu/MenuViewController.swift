//
//  MenuViewController.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 28.05.2022.
//

import UIKit

final class MenuViewController: BaseViewController, MenuViewDelegate, NewWordAndTrainingViewControllersDelegate {
    var menuView: MenuView? = nil
    
    init() {
        super.init(navigationBarVisibility: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuView = MenuView()
        self.menuView = menuView
        menuView.delegate = self

        view.addSubview(menuView)
        
        menuView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: view.topAnchor),
            menuView.leftAnchor.constraint(equalTo: view.leftAnchor),
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func didTapNewWordButton() {
        let newWordViewController = NewWordViewController()
        newWordViewController.delegate = self
        navigationController?.pushViewController(newWordViewController, animated: true)
    }
    
    func didTapTrainingButton() {
        let trainingViewController = TrainingViewController()
        trainingViewController.delegate = self
        navigationController?.pushViewController(trainingViewController, animated: true)
    }
    
    func onFinish() {
        navigationController?.popViewController(animated: true)
    }
}
