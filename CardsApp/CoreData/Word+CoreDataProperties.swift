//
//  Word+CoreDataProperties.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 08.05.2022.
//
//

import Foundation
import CoreData

extension Words {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Words> {
        return NSFetchRequest<Words>(entityName: "Words")
    }

    @NSManaged public var word: String
    @NSManaged public var translation: String
    @NSManaged public var context: String?
    @NSManaged public var dateLastShow: Date?
    @NSManaged public var successfulGuessesCount: Int
    @NSManaged public var isShownAsTranslationLastTime: Bool
    @NSManaged public var shownTranslationWordCount: Int
    @NSManaged public var shownOriginalWordCount: Int
}
