//
//  ValidatorFactory.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 17/06/2024.
//

import Foundation

//MARK: - ValidatorFactory

enum ValidatorFactory {
    
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .date, .hour, .minute, .name, .surname, .sex: return ValidatorInput()
        }
    }
}
