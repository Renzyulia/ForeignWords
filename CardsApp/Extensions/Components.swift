//
//  Components.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 10.06.2022.
//

import UIKit

struct Components: Comparable {
    let day: Int
    let month: Int
    let year: Int
    
    init?(date: DateComponents) {
        guard let day = date.day, let month = date.month, let year = date.year else { return nil }
        self.day = day
        self.month = month
        self.year = year
    }
    
    static func < (lhs: Components, rhs: Components) -> Bool {
        if lhs.year != rhs.year {
            return lhs.year < rhs.year
        } else if lhs.month != rhs.month {
            return lhs.month < rhs.month
        } else if lhs.day != rhs.day {
            return lhs.day < rhs.day
        } else {
            return false
        }
    }
    
    static func == (lhs: Components, rhs: Components) -> Bool {
        if lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day {
            return true
        } else {
            return false
        }
    }
    
    static func > (lhs: Components, rhs: Components) -> Bool {
        if lhs.year != rhs.year {
            return lhs.year > rhs.year
        } else if lhs.month != rhs.month {
            return lhs.month > rhs.month
        } else if lhs.day != rhs.day {
            return lhs.day > rhs.day
        } else {
            return false
        }
    }
}
