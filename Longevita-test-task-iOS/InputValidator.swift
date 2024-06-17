//
//  InputValidator.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 17/06/2024.
//

import Foundation

protocol ValidatorConvertible {
    func validated(_ value: String, type: ValidatorType) throws -> String
}

//MARK: - ValidationError

class ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

//MARK: - ValidatorType

enum ValidatorType {
    case date
    case hour
    case minute
    case name
    case surname
}


struct ValidatorInput: ValidatorConvertible {
    
    private enum ErrorMessages: String {
        case dateError = "Invalid date input"
        case hourError = "Invalid input, hour value should be 0-23"
        case minuteError = "Invalid input, minute value should be 0-59"
        case nameError = "Invalid name input"
        case surnameError = "Invalid surname input"
    }
    
    func validated(_ value: String, type: ValidatorType) throws -> String {
        
        switch type {
        case .date:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = DateFormat.dayMonthYear.format(separator: " / ")
            if dateFormatter.date(from: value) == nil {
                throw ValidationError(ErrorMessages.dateError.rawValue)
            }
        case .hour:
            if 0...23 !~= value.intValue {
                throw ValidationError(ErrorMessages.hourError.rawValue)
        }
        case .minute:
            if 0...59 !~= value.intValue {
                throw ValidationError(ErrorMessages.minuteError.rawValue)
        }
        case .name:
            guard value.isNameValid else { throw ValidationError(ErrorMessages.nameError.rawValue)}
            
        case .surname:
            if value.isEmpty {
                return ""
            } else {
                guard value.isNameValid else { throw ValidationError(ErrorMessages.surnameError.rawValue)}
            }
        }
        return value
    }
}
