//
//  Results.swift
//  Coordinators
//
//  Created by Shayan Mehranpoor on 3/9/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import Foundation

struct Results<T: Decodable>: Decodable {
    
    var data: T?
    var error: CustomError?
    var success: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case data
        case error
        case success
    }
    
    func isSucceeded() -> Bool {
        return ((success ?? false) == true) ? true : false
    }
}

extension Results: Modelable {
    init(data: Data) {
        do {
            let map = try JSONDecoder().decode(Results.self, from: data)
            self = map
        }
        catch {
            print(error)
        }
    }
}

struct CustomError: Decodable {
    
    var name: String?
    var status: Int?
    var message: String?
    var statusCode: Int?
    var code: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case status
        case message
        case statusCode
        case code
    }
}

extension CustomError: Modelable {
    init(data: Data) {
        do {
            let map = try JSONDecoder().decode(CustomError.self, from: data)
            self = map
        }
        catch {
            print(error)
        }
    }
}
