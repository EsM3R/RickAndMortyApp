//
//  Extension.swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 27.02.2024.
//

import UIKit



extension UIView {
    
    func addSubviews(_ views : UIView...){
        
        views.forEach { addSubview($0)}
    }
}
