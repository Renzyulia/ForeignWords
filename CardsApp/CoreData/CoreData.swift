//
//  CoreData.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 08.05.2022.
//

import UIKit
import CoreData


final class CoreData: Storage {
    static let shared = CoreData()
    
    var coreDataContext: NSManagedObjectContext { CoreData.shared.persistentContainer.viewContext }
    
    lazy private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private init() {}
    
    func emptyWord() -> CoreDataWord {
        return Words(context: coreDataContext)
    }
    
    func save() -> Bool {
        do {
            try coreDataContext.save()
            return true
        } catch {
            return false
        }
    }
    
    func loadWords() -> [Words]? {
        do {
            let words = try coreDataContext.fetch(Words.fetchRequest())
            return words
        } catch {
            return nil
        }
    }
    
    func checkRepeat(word: String) -> Bool {
        do {
            let request = Words.fetchRequest()
            request.predicate = NSPredicate(format: "word = %@", word)
            let result = try coreDataContext.fetch(request)
            
            if result.isEmpty {
                return false
            } else {
                return true
            }
        } catch {
            return true
        }
    }
}

protocol Storage: AnyObject {
    func emptyWord() -> CoreDataWord
    func save() -> Bool
    func loadWords() -> [Words]?
    func checkRepeat(word: String) -> Bool
}
