//
//  Friend.swift
//  Friends
//
//  Created by Aashish Adhikari on 1/31/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

struct Friend {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let id: Int
}

extension Friend{
    init?(json: JSON) {
        guard let id = json["id"] as? Int,
            let firstName = json["firstname"] as? String,
            let lastName = json["secondName"] as? String,
            let phoneNumber = json["phoneNumber"] as? String
        else {
            return nil
        }
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
}
