//
//  ModelDelegate.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 03.05.2022.
//

import UIKit

protocol NewWordModelDelegate: AnyObject {
    func showNewWordView()
    func showSavingError()
    func showRepeatWordError()
    func notifyCompletion()
}
