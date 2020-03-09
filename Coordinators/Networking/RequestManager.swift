//
//  RequestManager.swift
//  Coordinators
//
//  Created by Shayan Mehranpoor on 3/9/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import Foundation

typealias Headers = [String: String]
typealias Parameters = [String : Any]

protocol RequestManagerProtocol {
    func get<T:Modelable>(url: String, callback: @escaping (T?, RequestManager.RequestError?) -> Void)
    func post<T:Modelable>(url: String, parameters: Parameters?, callback: @escaping (T?, RequestManager.RequestError?) -> Void)
    func put<T:Modelable>(url: String, parameters: Parameters?, callback: @escaping (T?, RequestManager.RequestError?) -> Void)
    func patch<T:Modelable>(url: String, parameters: Parameters?, callback: @escaping (T?, RequestManager.RequestError?) -> Void)
    func delete<T:Modelable>(url: String, callback: @escaping (T?, RequestManager.RequestError?) -> Void)
    func upload<T:Modelable>(url: String, image: Data?, callback: @escaping (T?, RequestManager.RequestError?) -> Void)
}

enum EndPoint {
    
    case baseUrl
    
    var path: String {
        switch self {
        case .baseUrl:
            return "https://example.com/"
        }
    }
}

final class RequestManager: RequestManagerProtocol {
    
    enum HTTPMethod: String {
        case get     = "GET"
        case post    = "POST"
        case put     = "PUT"
        case delete  = "DELETE"
        case patch   = "PATCH"
    }
    
    enum RequestError: Error {
        case unknownError
        case connectionError
        case authorizationError
        case invalidRequest
        case notFound
        case invalidResponse
        case serverError
        case serverUnavailable
    }
    
    static let shared = RequestManager()
    private var headers: Headers? = nil
    
    private init() {}
    
    func get<T:Modelable>(url: String, callback: @escaping (T?, RequestError?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: EndPoint.baseUrl.path + url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error)")
                callback(nil, RequestError.connectionError)
            } else if let data = data, let responseCode = response as? HTTPURLResponse {
                switch responseCode.statusCode {
                case 200:
                    let decodedData = T(data: data)
                    callback(decodedData, nil)
                case 400...499:
                    callback(nil, RequestError.authorizationError)
                case 500...599:
                    callback(nil, RequestError.serverError)
                default:
                    callback(nil, RequestError.unknownError)
                    break
                }
            }
        }.resume()
    }
    
    func post<T:Modelable>(url: String, parameters: Parameters?, callback: @escaping (T?, RequestError?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: EndPoint.baseUrl.path + url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        urlRequest.httpMethod = HTTPMethod.post.rawValue
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters ?? [:], options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error)")
                callback(nil, RequestError.connectionError)
            } else if let data = data, let responseCode = response as? HTTPURLResponse {
                switch responseCode.statusCode {
                case 200:
                    let decodedData = T(data: data)
                    callback(decodedData, nil)
                case 400...499:
                    callback(nil, RequestError.authorizationError)
                case 500...599:
                    callback(nil, RequestError.serverError)
                default:
                    callback(nil, RequestError.unknownError)
                    break
                }
            }
        }.resume()
    }
    
    func put<T:Modelable>(url: String, parameters: Parameters?, callback: @escaping (T?, RequestError?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: EndPoint.baseUrl.path + url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        urlRequest.httpMethod = HTTPMethod.put.rawValue
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters ?? [:], options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error)")
                callback(nil, RequestError.connectionError)
            } else if let data = data, let responseCode = response as? HTTPURLResponse {
                switch responseCode.statusCode {
                case 200:
                    let decodedData = T(data: data)
                    callback(decodedData, nil)
                case 400...499:
                    callback(nil, RequestError.authorizationError)
                case 500...599:
                    callback(nil, RequestError.serverError)
                default:
                    callback(nil, RequestError.unknownError)
                    break
                }
            }
        }.resume()
    }
    
    func delete<T:Modelable>(url: String,  callback: @escaping (T?, RequestError?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: EndPoint.baseUrl.path + url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        urlRequest.httpMethod = HTTPMethod.delete.rawValue
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error)")
                callback(nil, RequestError.connectionError)
            } else if let data = data, let responseCode = response as? HTTPURLResponse {
                switch responseCode.statusCode {
                case 200:
                    let decodedData = T(data: data)
                    callback(decodedData, nil)
                case 400...499:
                    callback(nil, RequestError.authorizationError)
                case 500...599:
                    callback(nil, RequestError.serverError)
                default:
                    callback(nil, RequestError.unknownError)
                    break
                }
            }
        }.resume()
    }
    
    func patch<T:Modelable>(url: String, parameters: Parameters?, callback: @escaping (T?, RequestError?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: EndPoint.baseUrl.path + url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        urlRequest.httpMethod = HTTPMethod.patch.rawValue
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters ?? [:], options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error)")
                callback(nil, RequestError.connectionError)
            } else if let data = data, let responseCode = response as? HTTPURLResponse {
                switch responseCode.statusCode {
                case 200:
                    let decodedData = T(data: data)
                    callback(decodedData, nil)
                case 400...499:
                    callback(nil, RequestError.authorizationError)
                case 500...599:
                    callback(nil, RequestError.serverError)
                default:
                    callback(nil, RequestError.unknownError)
                    break
                }
            }
        }.resume()
    }
    
    func upload<T:Modelable>(url: String, image: Data?, callback: @escaping (T?, RequestManager.RequestError?) -> Void) {
        var urlRequest = URLRequest(url: URL(string: EndPoint.baseUrl.path + url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        let boundary = UUID().uuidString
        urlRequest.allHTTPHeaderFields = ["Content-Type": "multipart/form-data; boundary=\(boundary)"]
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpMethod = HTTPMethod.post.rawValue
        
        let body = NSMutableData()
        body.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"fileToUpload\"; filename=\"poll.png\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        body.append(image!)
        body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        urlRequest.httpBody = body as Data
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error)")
                callback(nil, RequestError.connectionError)
            } else if let data = data, let responseCode = response as? HTTPURLResponse {
                switch responseCode.statusCode {
                case 200:
                    let decodedData = T(data: data)
                    callback(decodedData, nil)
                case 400...499:
                    callback(nil, RequestError.authorizationError)
                case 500...599:
                    callback(nil, RequestError.serverError)
                default:
                    callback(nil, RequestError.unknownError)
                    break
                }
            }
        }.resume()
    }
}
