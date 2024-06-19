//
//  User.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 18/06/2024.
//

import Foundation

//MARK: - User

struct User: Codable {
    
    let date: String
    let hour: String
    let minute: String
    let name: String
    let surname: String?
    let sex: String
   
    private enum CodingKeys: String, CodingKey {
        case date, hour, minute, name, surname, sex
    }

    init(date: String, hour: String, minute: String, name: String, surname: String, sex: String) {
        self.date = date
        self.hour = hour
        self.minute = minute
        self.name = name
        self.surname = surname
        self.sex = sex
    }
    
    init() {
        date = ""
        hour = ""
        minute = ""
        name = ""
        surname = ""
        sex = ""
    }
}
