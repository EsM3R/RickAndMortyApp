//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 25.02.2024.
//

import Foundation

fileprivate struct Constants{
    static let BASE_URL = "https://rickandmortyapi.com/api"
}

final class RMRequest{
    
    private let endpoint : RMEndpoint
    
    private let pathComponents : [String]
    
    private let queryParameters : [URLQueryItem]
    
    
    private var urlString : String {
        
        var string = "\(Constants.BASE_URL)/\(self.endpoint)"
        
        if !pathComponents.isEmpty {
            string += "/"
            for component in pathComponents {
                string += component
                string += ","
            }
            string.removeLast()
        }
       
        
        if !queryParameters.isEmpty{
            string += "/?"
            for queryParameter in queryParameters {
                string += "\(queryParameter.name)=\(queryParameter.value ?? "")"
                string += "&"
            }
            string.removeLast()
        }
       
        
        return string
    }
    
    public var url  : URL?{
        return URL(string: self.urlString)
    }
    
    init(endpoint: RMEndpoint, pathComponents: [String] = [] , queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
