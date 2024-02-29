//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 27.02.2024.
//

import Foundation


final class RMCharacterCollectionViewCellViewModel{
    
    private let imageViewURL : URL?
    private let nameLabel : String
    private let statusLabel : RMCharacterStatus
    
    init(imageViewURL: URL?, nameLabel: String, statusLabel: RMCharacterStatus) {
        self.imageViewURL = imageViewURL
        self.nameLabel = nameLabel
        self.statusLabel = statusLabel
    }
    

    
    public var characterStatusText : String {
        return "Status : \(self.statusLabel.rawValue.capitalized)"
    }
    
    public var characterNameText : String {
        return self.nameLabel
    }
    
    
    public func fetchImage(onSuccess : @escaping (Data) -> Void  ,  onFailure : @escaping (Error) -> Void){
        
        guard let  url = imageViewURL else {
            onFailure(URLError(.badURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _ , error in
            
            guard let data = data , error == nil else {
                return
            }
            
            onSuccess(data)
        }
        task.resume()
    }
}
