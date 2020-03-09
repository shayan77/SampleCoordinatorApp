//
//  FlightService.swift
//  Coordinators
//
//  Created by Shayan Mehranpoor on 3/9/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import Foundation

typealias flightCompletionHandler = (Results<Flight>?, RequestManager.RequestError?) -> Void

protocol FlightServiceProtocol {
    func flight(parameters: Parameters, completionHandler: @escaping flightCompletionHandler)
}

enum FlightEndPoint {
    
    case flights
    
    var path: String {
        switch self {
        case .flights:
            return "flights"
        }
    }
}

class FlightService: FlightServiceProtocol {
    
    private let requestManager = RequestManager.shared
    
    func flight(parameters: Parameters, completionHandler: @escaping flightCompletionHandler) {
        self.requestManager.post(url: FlightEndPoint.flights.path, parameters: parameters) { (result: Results<Flight>?, error) in
            completionHandler(result, error)
        }
    }
}
