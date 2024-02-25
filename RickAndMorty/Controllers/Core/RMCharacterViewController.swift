//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 25.02.2024.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest.init(endpoint: .character,queryParameters: [URLQueryItem(name: "name", value: "rick"),URLQueryItem(name: "status", value: "alive")])
        
        
        RMService.shared.execute(.listCharactersRequest, expectingType: RMGetAllCharactersResponse.self) { items in
            print(items.results.count)
        } onFailure: { error in
            print(error)
        }
        
    }
    

  

}
