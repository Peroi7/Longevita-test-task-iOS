//
//  Network.swift
//  Longevita-test-task-iOS
//
//  Created by Pero Ivic on 18/06/2024.
//

import Foundation

protocol Model {
    associatedtype T
}

protocol URLRequestable: Model where T: Codable {
    func post(model: T, completion: @escaping (URLRequest?, Error?)-> Void)
}

class Network<T: Codable> {
    
    let model: T
    
    fileprivate var urlSession: URLSession {
        return URLSession.shared
    }
    
    init(model: T) {
        self.model = model
    }
    
    //MARK: - Fire
    
    func firePost(completion: @escaping (Result<T, Error>)->Void) {
        post(model: model) {[weak self] (urlRequest, error) in
            guard let urlRequest = urlRequest else { return }
            guard let uSelf = self else { return }
            let task = self?.urlSession.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    do {
                        guard !data.isEmpty else {
                            completion(.success(uSelf.model))
                            //should be failure because data is empty (exception this case)
                        return } 
                        
                        let decoder = JSONDecoder()
                        let newData = try decoder.decode(T.self, from: data)
                        completion(.success(newData))
                    } catch let error {
                        completion(.failure(error))
                    }
                }
            }
            
            task?.resume()
        }
    }
}

extension Network: URLRequestable {
    
    //MARK: - Post Request
    
    typealias T = T
    
    func post(model: T, completion: @escaping (URLRequest?, Error?) -> Void) {
        let model = model
        var urlRequest = request
        urlRequest.httpMethod = HttpMethod.post.rawValue
        urlRequest.setValue("application/json",
                            forHTTPHeaderField: "Content-Type")
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(model)
            urlRequest.httpBody = data
            completion(urlRequest, nil)
            
        } catch let error {
            print(error)
            completion(nil, error)
        }
    }
}

extension Network {
    
    //MARK: - URL
    
    fileprivate var url: URL {
        if let url = URL(string: "https://bazihero.com/api/algo/firststep") {
            return url
        }
        return URL(fileURLWithPath: "")
    }
    
    fileprivate var request: URLRequest {
        get {
            return URLRequest(url: url)
        } set { }
    }
    
    fileprivate enum HttpMethod: String {
        case post = "POST"
        case get = "GET"
    }
}
