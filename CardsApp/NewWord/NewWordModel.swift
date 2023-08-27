//
//  NewWordModel.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 03.05.2022.
//

import UIKit
import CoreData

final class NewWordModel {
    weak var delegate: NewWordModelDelegate?
    var newWord: String? = nil
    var translation: String? = nil
    var context: String? = nil
    
    private let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func viewDidLoad() {
        delegate?.showNewWordView()
    }
    
    func didTapSaveButton() {
        guard let newWord = newWord, let translation = translation else { return }
        guard storage.checkRepeat(word: newWord) else {
            delegate?.showRepeatWordError()
            return
        }
        let word = storage.emptyWord()
        word.word = newWord
        word.translation = translation
        word.successfulGuessesCount = 0
        word.dateLastShow = nil
        word.isShownAsTranslationLastTime = true
        word.shownTranslationWordCount = 0
        word.shownOriginalWordCount = 0
        
        if let context = context {
            word.context = context
        }
        
        if storage.save() {
            delegate?.showNewWordView()
            
            self.newWord = nil
            self.translation = nil
            self.context = nil
        } else {
            delegate?.showSavingError()
        }
    }
    
    func didTapBackButton() {
        delegate?.notifyCompletion()
    }
}
