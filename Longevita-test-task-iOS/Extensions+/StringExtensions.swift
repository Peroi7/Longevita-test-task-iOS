//
//  StringExtensions.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 17/06/2024.
//

import Foundation

//MARK: - String extensions

extension String {
    
    var isNameValid: Bool {
        guard self.count >= 3, self.count < 18 else { return false }
        let predicateTest = NSPredicate(format: "SELF MATCHES %@", "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$")
        return predicateTest.evaluate(with: self)
    }
    
    var intValue: Int {
        return Int(self) ?? 0
    }
        
    func toDateString(format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.format(separator: " / ")
        let date = dateFormatter.date(from: self) ?? Date()
        dateFormatter.dateFormat = "yyyy-MM-d"
        return dateFormatter.string(from: date)
    }
}

