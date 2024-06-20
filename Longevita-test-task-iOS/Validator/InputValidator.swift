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
    case sex
}

struct ValidatorInput: ValidatorConvertible {
    
    //MARK: - ErrorMessages
    
    private enum ErrorMessages: String {
        case dateError = "Invalid date input"
        case hourError = "Invalid input, hour value should be 0-23"
        case minuteError = "Invalid input, minute value should be 0-59"
        case nameError = "Invalid name input"
        case surnameError = "Invalid surname input"
        case sexInputError = "Invalid sex input"
    }
    
    private enum Gender: String {
        case male = "Male"
        case female = "Female"
    }
    
    //MARK: - Validated
    
    func validated(_ value: String, type: ValidatorType) throws -> String {
        
        switch type {
        case .date:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = DateFormat.dayMonthYear.format(separator: " / ")
            if dateFormatter.date(from: value) == nil {
                throw ValidationError(ErrorMessages.dateError.rawValue)
            }
        case .hour:
            guard !(0...23 !~= value.intValue) && !value.isEmpty else {
                throw ValidationError(ErrorMessages.hourError.rawValue)
            }
        case .minute:
            guard !(0...59 !~= value.intValue) && !value.isEmpty else {
                throw ValidationError(ErrorMessages.minuteError.rawValue)
        }
        case .name:
            guard value.isNameValid && !value.isEmpty else { throw ValidationError(ErrorMessages.nameError.rawValue)}
            
        case .surname:
            if value.isEmpty {
                return ""
            } else {
                guard value.isNameValid else { throw ValidationError(ErrorMessages.surnameError.rawValue)}
            }
            
        case .sex:
            if Gender.male.rawValue.caseInsensitiveCompare(value) != .orderedSame && Gender.female.rawValue.caseInsensitiveCompare(value) != .orderedSame {
                throw ValidationError(ErrorMessages.sexInputError.rawValue)
            }
        }
        return value
    }
}
