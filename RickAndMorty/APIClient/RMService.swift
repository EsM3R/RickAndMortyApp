//
//  RMServic .swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 25.02.2024.
//

import Foundation

enum RMServiceError : Error{
    case failedToCreatedRequest
    case failedToGetData
}

protocol RMServiceProtocol{
    
    func execute<T : Codable>(_ request : RMRequest ,expectingType : T.Type , onSuccess : @escaping (T) -> () , onFailure : @escaping (Error) -> ())
}

final class RMService: RMServiceProtocol{
    
    
    static let shared = RMService()
    
    private init(){}
    
    
    func execute<T : Codable>(_ request: RMRequest,
                    expectingType: T.Type,
                    onSuccess: @escaping (T) -> (),
                    onFailure: @escaping (Error) -> ()) {
        
        guard let urlRequest = self.request(from: request) else {
            onFailure(RMServiceError.failedToCreatedRequest)
            return
        }
        let task =  URLSession.shared.dataTask(with: urlRequest) { data, _ , error in
            
            guard let data = data , error == nil else{
                onFailure(error ?? RMServiceError.failedToGetData)
                return
            }
            
            do{
                let json = try JSONDecoder().decode(T.self, from: data)
                onSuccess(json)
            }catch{
                onFailure(error)
            }
            
        }
        task.resume()
    
        
    }
    
    
    private func request(from rmRequest : RMRequest) -> URLRequest?{
        
        guard let url = rmRequest.url else {return nil}
    
        var request = URLRequest(url: url)
        
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }



    
}
