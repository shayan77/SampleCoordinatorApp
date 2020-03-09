//
//  Modelable.swift
//  Coordinators
//
//  Created by Shayan Mehranpoor on 3/9/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import Foundation

protocol Modelable {
    init(data: Data)
}

public struct AnyDecodable : Decodable {
    
    let value: Any

    public init<T>(_ value :T?) {
        self.value = value ?? ()
    }

    public init(from decoder :Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let string = try? container.decode(String.self) {
            self.init(string)
        } else if let int = try? container.decode(Int.self) {
            self.init(int)
        } else if let bool = try? container.decode(Bool.self) {
            self.init(bool)
        } else {
            self.init(())
        }
    }
}
