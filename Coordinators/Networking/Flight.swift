//
//  Flight.swift
//  Coordinators
//
//  Created by Shayan Mehranpoor on 3/9/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import Foundation

struct Flight: Decodable {
    
    var id: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var mobile: String?
    var gender: Int?
    var imageProfile: String?
    var birthDay: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case email
        case mobile
        case gender
        case imageProfile
        case birthDay = "BirthDayF"
    }
}

extension Flight: Modelable {
    init(data: Data) {
        do {
            let me = try JSONDecoder().decode(Flight.self, from: data)
            self = me
        }
        catch {
            print(error)
        }
    }
}
