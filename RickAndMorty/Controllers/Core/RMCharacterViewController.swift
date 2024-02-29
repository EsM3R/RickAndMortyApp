//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 25.02.2024.
//

import UIKit

final class RMCharacterViewController: UIViewController {
    
    private let rmCharacterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
    
        addConstraints()
        
    }
    
    private func addConstraints(){
        
        view.addSubview(rmCharacterListView)

        NSLayoutConstraint.activate([
        
            rmCharacterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rmCharacterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            rmCharacterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            rmCharacterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
        
        ])
    }
    

  

}
