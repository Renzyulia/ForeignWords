//
//  UIViewController+HidingKeyboard.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 25.05.2022.
//

import UIKit

extension UIViewController {
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
}
