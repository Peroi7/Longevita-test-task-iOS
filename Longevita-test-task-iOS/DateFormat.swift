//
//  DateFormat.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 17/06/2024.
//

import Foundation

public enum DateFormat: String {
    case monthYear = "MM'$'yyyy"
    case dayMonthYear = "dd'*'MM'$'yyyy"
    case monthDayYear = "MM'$'dd'*'yyyy"
    case yearMonthDay = "yyyy'&'MM'$'dd"
    
    func format(separator: String) -> String {
        return self.rawValue
            .replacingOccurrences(of: "$", with: separator)
            .replacingOccurrences(of: "*", with: separator)
            .replacingOccurrences(of: "&", with: separator)
    }
}
