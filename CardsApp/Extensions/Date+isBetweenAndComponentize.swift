//
//  Date+isBetweenAndComponentize.swift
//  CardsApp
//
//  Created by Yulia Ignateva on 22.05.2022.
//

import UIKit

extension Date {
    func componentizeOnlyDate() -> DateComponents {
        let calendar = Calendar.current
        return calendar.dateComponents([.month, .day, .year], from: self)
    }
    
    func isBetween(_ date1: Date, _ date2: Date) -> Bool {
        if date1 > date2 {
            return isBetween(date2, date1)
        } else {
            let minDate = Components(date: date1.componentizeOnlyDate())
            let maxDate = Components(date: date2.componentizeOnlyDate())
            let todayDate = Components(date: self.componentizeOnlyDate())
            
            return todayDate! >= minDate! && todayDate! <= maxDate!
        }
    }
    
    func compareWithDateWithoutTime(_ date: Date) -> Bool {
        let date = Components(date: date.componentizeOnlyDate())
        let todayDate = Components(date: self.componentizeOnlyDate())
            
        return todayDate! > date!
    }
}
