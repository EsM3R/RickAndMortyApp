//
//  RMServic .swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 25.02.2024.
//

import Foundation

protocol RMServiceProtocol{
    
    func execute<T : Codable>(_ request : RMRequest ,expectingType : T.Type , onSuccess : @escaping (T) -> () , onFailure : @escaping (Error) -> ())
}

final class RMService: RMServiceProtocol{
    
    
    func execute<T>(_ request: RMRequest, 
                    expectingType: T.Type,
                    onSuccess: @escaping (T) -> (),
                    onFailure: @escaping (Error) -> ()) {
        print("ookoko")
        
    }
    

    static let shared = RMService()
    
    private init(){}


    
}
