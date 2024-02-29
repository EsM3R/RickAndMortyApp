//
//  RMCharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 27.02.2024.
//

import UIKit

protocol RMCharacterListViewViewModelDelegate : AnyObject{
    
    func  didLoadInitialCharacters()
}

final class RMCharacterListViewViewModel  : NSObject{
    
    public  weak var delegate : RMCharacterListViewViewModelDelegate?
    
    private var characters : [RMCharacter] =  []{
        didSet{
            for character in characters{
                let viewModel =  RMCharacterCollectionViewCellViewModel(
                    imageViewURL: URL(string: character.image),
                    nameLabel: character.name ,
                    statusLabel: character.status)
            cellViewModels.append(viewModel)
            }
           
        }
    }
    
    private var cellViewModels : [RMCharacterCollectionViewCellViewModel] = []
    
    
    func fetchAllCharacters(){
        
        RMService.shared.execute(.listCharactersRequest,
                                 expectingType: RMGetAllCharactersResponse.self) { [weak self] response in
            
            let characters =  response.results
            self?.characters =  characters
            
            DispatchQueue.main.async {
                self?.delegate?.didLoadInitialCharacters()
            }
            
        } onFailure: { error in
            print(error.localizedDescription)
        }

    }
}

extension RMCharacterListViewViewModel : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionListViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionListViewCell else {
            fatalError("Unsupported")
        }
        
        cell.configure(with: cellViewModels[indexPath.row])
        
        return cell
    }
    
    
}

extension RMCharacterListViewViewModel : UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) /  2
        return CGSize(width: width , height: width * 1.5)
    }
}
