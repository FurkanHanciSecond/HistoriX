//
//  HistoryTabBarControllerViewController.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/21/21.
//

import UIKit

class HistoryTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
        setTabs()
    }
    
    private func configTabBar() {
        tabBar.barTintColor = Constants.Style.Color.black
        tabBar.tintColor = Constants.Style.Color.red
        
    }
    
    private func setTabs() {
        viewControllers = [
            historyListVC(),
            supportMeVC()
        ]
    }
    
    private func historyListVC() -> UINavigationController {
        let historyListViewController = HistoryListVC()
        let tabBarItem = UITabBarItem(title: Constants.Text.Bar.events, image: Constants.Style.Image.events, tag: 0)
        
        historyListViewController.tabBarItem = tabBarItem
        return UINavigationController(rootViewController: historyListViewController)
    }
    
    private func supportMeVC() -> UINavigationController {
        let supportMeViewController = SupportMeViewController()
        let tabBarItem = UITabBarItem(title: Constants.Text.Bar.support, image: Constants.Style.Image.support, tag: 1)
        supportMeViewController.tabBarItem = tabBarItem
        return UINavigationController(rootViewController: supportMeViewController)
    }

}
