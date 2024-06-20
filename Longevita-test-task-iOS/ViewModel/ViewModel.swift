//
//  ViewModel.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 18/06/2024.
//

import UIKit

class ViewModel {
    
    let model: User
    
    init(model: User) {
        self.model = model
    }
    
    //MARK: - Fetch
    
    func fetch(completion:((User?, Error?) -> Void)?) {
        let network = Network(model: model)
        network.firePost {(result) in
            switch result {
            case .success(let user):
                completion?(user, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
    
    //MARK: - Validation
    
    func validate(completion:((String?) -> Void)?) {
        do {
            _ = try validatedText(validationType: .date, text: model.date).toDateString(format: .dayMonthYear)
            _ = try validatedText(validationType: .hour, text: model.hour)
            _ = try validatedText(validationType: .minute, text: model.minute)
            _ = try validatedText(validationType: .name, text: model.name)
            _ = try validatedText(validationType: .surname, text: model.surname ?? "")
            _ = try validatedText(validationType: .sex, text: model.sex)
            completion?(nil)
        } catch(let error) {
            completion?((error as! ValidationError).message)
        }
    }
}

extension ViewModel {
    
    //MARK: - ValidatedText
    
    func validatedText(validationType: ValidatorType, text: String) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(text, type: validationType)
    }
}
