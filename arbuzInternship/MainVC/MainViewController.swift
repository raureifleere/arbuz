//
//  MainViewController.swift
//  arbuzInternship
//
//  Created by Bibisara Kenesova on 22.05.2023.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: ProductsViewController())
        let vc3 = UINavigationController(rootViewController: BasketViewController())
        let vc4 = UINavigationController(rootViewController: FavoritesViewController())
        let vc5 = UINavigationController(rootViewController: InformationViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "text.magnifyingglass")
        vc3.tabBarItem.image = UIImage(systemName: "cart")
        vc4.tabBarItem.image = UIImage(systemName: "heart")
        vc5.tabBarItem.image = UIImage(systemName: "gearshape.2")
        
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }

}
