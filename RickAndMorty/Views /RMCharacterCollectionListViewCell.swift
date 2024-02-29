//
//  RMCharacterCollectionListView.swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 27.02.2024.
//

import UIKit


final class RMCharacterCollectionListViewCell  : UICollectionViewCell{
    
    static let cellIdentifier = "RMCharacterCollectionListView"
    
    private let imageView : UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleAspectFill
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.clipsToBounds = true
        return imageV
    }()
    
    private let nameLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18 , weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    private let statusLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16 , weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView,nameLabel,statusLabel)
        addConstraints()
        setUpLayer()
    }
    
    private func setUpLayer(){
        contentView.layer.cornerRadius = 5 
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.shadowOpacity = 0.33
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
//        contentView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setUpLayer()
    }
    
    private func addConstraints(){
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor ,constant: -1),
            
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor ,constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor ,constant: -5),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),
            
            
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor ,constant: 5),
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor ,constant: -5),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    
    
    func configure(with viewModel : RMCharacterCollectionViewCellViewModel ){
        
        nameLabel.text = viewModel.characterNameText
        statusLabel.text = viewModel.characterStatusText
    
        viewModel.fetchImage { [weak self] data in
            
            DispatchQueue.main.async {
                
                let image =  UIImage(data: data)
                
                self?.imageView.image = image
                
            }
            
        } onFailure: { error in
            print(error)
        }

    }
}
