//
//  SubMainViewController.swift
//  arbuzInternship
//
//  Created by Bibisara Kenesova on 23.05.2023.
//

import UIKit

final class SubMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UINavigationController(rootViewController: CategoryViewController())
        let vc2 = UINavigationController(rootViewController: SubBasketViewController())
        let vc3 = UINavigationController(rootViewController: SubFavoriteViewController())
        let vc4 = UINavigationController(rootViewController: SubInfoViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "text.magnifyingglass")
        vc2.tabBarItem.image = UIImage(systemName: "cart")
        vc3.tabBarItem.image = UIImage(systemName: "heart")
        vc4.tabBarItem.image = UIImage(systemName: "gearshape.2")
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }

}
