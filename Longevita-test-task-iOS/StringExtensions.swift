//
//  StringExtensions.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 17/06/2024.
//

import Foundation

extension String {
    
    var isNameValid: Bool {
        guard self.count > 3, self.count < 18 else { return false }
        let predicateTest = NSPredicate(format: "SELF MATCHES %@", "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$")
        return predicateTest.evaluate(with: self)
    }
    
    var intValue: Int {
        return Int(self) ?? 0
    }

}

