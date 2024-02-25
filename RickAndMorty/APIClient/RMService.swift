//
//  RMServic .swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 25.02.2024.
//

import Foundation

protocol RMServiceProtocol{
    
    func execute(_ request : RMRequest ,onSuccess : @escaping () -> ())
}

final class RMService : RMServiceProtocol{

    func execute(_ request: RMRequest, onSuccess: @escaping () -> ()) {
        
    }
    
    
    private init(){}
    
    static let shared = RMService()

    
}
