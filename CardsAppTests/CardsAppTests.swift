//
//  CardsAppTests.swift
//  CardsAppTests
//
//  Created by Yulia Ignateva on 13.06.2022.
//

import XCTest
@testable import CardsApp

final class Word: CoreDataWord {
    var word: String
    var translation: String
    var context: String?
    var dateLastShow: Date?
    var successfulGuessesCount: Int
    var isShownAsTranslationLastTime: Bool
    var shownTranslationWordCount: Int
    var shownOriginalWordCount: Int
    
    init(word: String, translation: String, context: String? = nil, dateLastShow: Date? = nil, successfulGuessesCount: Int, isShownAsTranslationLastTime: Bool, shownTranslationWordCount: Int, shownOriginalWordCount: Int) {
        self.word = word
        self.translation = translation
        self.context = context
        self.dateLastShow = dateLastShow
        self.successfulGuessesCount = successfulGuessesCount
        self.isShownAsTranslationLastTime = isShownAsTranslationLastTime
        self.shownTranslationWordCount = shownTranslationWordCount
        self.shownOriginalWordCount = shownOriginalWordCount
    }
}

final class Delegate: NewWordModelDelegate {
    var executionCount = 0
    
    func showNewWordView() {
        executionCount += 1
    }
    
    func showSavingError() {
        executionCount += 1
    }
    
    func showRepeatWordError() {
        executionCount += 1
    }
    
    func notifyCompletion() {
        executionCount += 1
    }
}

final class CoreData: Storage {
    var executioReturnWordCount = 0
    var executionSuccessSavingWordCount = 0
    var executionSuccessLoadingWords = 0
    var executionCheckRepeatWordCount = false
    
    func emptyWord() -> CardsApp.CoreDataWord {
        executioReturnWordCount += 1
        return Word(word: " ", translation: " ", successfulGuessesCount: 0, isShownAsTranslationLastTime: false, shownTranslationWordCount: 0, shownOriginalWordCount: 0)
    }
    
    func save() -> Bool {
        executionSuccessSavingWordCount += 1
        return true
    }
    
    func checkRepeat(word: String) -> Bool {
        return true
    }
    
    func loadWords() -> [CardsApp.Words]? {
        let savedWords = [Words]()
        executionSuccessLoadingWords += 1
        return savedWords
    }
}

final class CardsAppTests: XCTestCase {
    let delegate = Delegate()
    let storage = CoreData()
    lazy var model = {
        return NewWordModel(storage: storage)
    }()
    

    func testViewDidLoad() {
        model.delegate = delegate as any NewWordModelDelegate
        
        model.viewDidLoad()
        XCTAssertEqual(delegate.executionCount, 1)
    }
    
    func testDidTapSaveButton() {
        model.delegate = delegate as any NewWordModelDelegate
        model.newWord = " "
        model.translation = " "
        model.didTapSaveButton()
        
        XCTAssertEqual(storage.checkRepeat(word: ""), true)
        XCTAssertEqual(storage.executioReturnWordCount, 1)
        XCTAssertEqual(storage.save(), true)
        XCTAssertEqual(delegate.executionCount, 1)
    }
    
    func testDidTapBackButton() {
        model.delegate = delegate as any NewWordModelDelegate
        
        model.didTapBackButton()
        XCTAssertEqual(delegate.executionCount, 1)
    }
}
