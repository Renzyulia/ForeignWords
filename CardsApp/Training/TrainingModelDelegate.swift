//
//  TrainingModelDelegate.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 28.05.2022.
//

import UIKit

protocol TrainingModelDelegate: AnyObject {
    func showTrainingView(for: String, translation: String, context: String, showTranslation: Bool)
    func showWordDetailsView()
    func showNoSavedWordsError()
    func showNoTodayTrainingWords()
    func showSavingChangesError()
    func showFinishTraining()
    func notifyCompletion()
}
