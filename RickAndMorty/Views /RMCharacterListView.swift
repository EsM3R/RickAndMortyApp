//
//  RMCharacterListView.swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 27.02.2024.
//

import UIKit

final class RMCharacterListView : UIView {
    
    private let viewModel = RMCharacterListViewViewModel()
    
    
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    
    private let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.register(RMCharacterCollectionListViewCell.self, 
                                forCellWithReuseIdentifier: RMCharacterCollectionListViewCell.cellIdentifier)
        
        return collectionView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(collectionView , spinner)
        addConstraints()
        
        initDelegate()
        initService()
        initSpinner()
       
    }
    
    private func initDelegate(){
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        viewModel.delegate = self
    }
    
    private func initService(){
        viewModel.fetchAllCharacters()
    }
    private func initSpinner(){
        spinner.startAnimating()
    }
    

    
    
    
    private func addConstraints(){
        
        NSLayoutConstraint.activate([
            
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
    
    
        ])
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension RMCharacterListView : RMCharacterListViewViewModelDelegate{
    func didLoadInitialCharacters() {
        self.spinner.stopAnimating()
        self.collectionView.isHidden = false
        collectionView.reloadData()
        UIView.animate(withDuration: 0.4) {
            self.collectionView.alpha = 1
        }
        
    }
    
    
}
