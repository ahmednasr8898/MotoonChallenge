//
//  Networking.swift
//  Starter Project
//
//  Created by Ahmed Nasr on 29/03/2023.
//

import Foundation

//MARK: - networking
//
class Networking {
    static let shared = Networking()
    private init() {}
}


//MARK: - generic networking func -
//
extension Networking {
    func connectToServer<T: Decodable>(EndPoint: URL, method: RequestMethod, completion: @escaping (Result<T?, Error>) -> Void) {
        
        var components = URLComponents(url: EndPoint, resolvingAgainstBaseURL: false)
        let queryItem = URLQueryItem(name: "client_id", value: Settings.client_Api)
        components?.queryItems = [queryItem]
        
        var request = URLRequest(url: (components?.url!)!)
        request.httpMethod = method.rawValue
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                guard let data = data else { return }
                do {
                    let json = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(json))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
