//
//  RMTabbarViewController.swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 25.02.2024.
//

import UIKit

final class RMTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setUpTabs()
    }
    
    private func setUpTabs(){
        
        let charactersVC = RMCharacterViewController()
        let locationsVC = RMLocationViewController()
        let episodesVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
    
        for vc in [charactersVC , locationsVC  , episodesVC , settingsVC]{
            
            vc.navigationItem.largeTitleDisplayMode = .always
        }
        
        
        let nav1 = UINavigationController(rootViewController: charactersVC)
        let nav2 = UINavigationController(rootViewController: locationsVC)
        let nav3 = UINavigationController(rootViewController: episodesVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        
        nav1.tabBarItem = UITabBarItem(title: "Characters",
                                       image: UIImage(systemName: "person"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Locations",
                                       image: UIImage(systemName: "globe"),
                                       tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Episodes",
                                       image: UIImage(systemName: "tv"),
                                       tag: 1)
        nav4.tabBarItem = UITabBarItem(title: "Settings",
                                       image: UIImage(systemName: "gear"),
                                       tag: 1)
    
        for nav in [nav1 , nav2 , nav3 , nav4]{
            nav.navigationBar.prefersLargeTitles = true
        }
        
        
        
        setViewControllers([nav1 , nav2 , nav3 , nav4], animated: true)
        
    }


}

