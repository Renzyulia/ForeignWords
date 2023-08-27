//
//  Word+CoreDataClass.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 08.05.2022.
//
//

import Foundation
import CoreData

protocol CoreDataWord: AnyObject {
    var word: String { get set }
    var translation: String { get set }
    var context: String? { get set }
    var dateLastShow: Date? { get set }
    var successfulGuessesCount: Int { get set }
    var isShownAsTranslationLastTime: Bool { get set }
    var shownTranslationWordCount: Int { get set }
    var shownOriginalWordCount: Int { get set }
}

@objc(Words)
public class Words: NSManagedObject, CoreDataWord {
    
}
