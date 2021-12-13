//
//  ViewController.swift
//  AndresAppNoStoryBoard
//
//  Created by Andres Calizaya on 03/12/2021.
//

import UIKit

class MainTabBar: UITabBarController,UITabBarControllerDelegate {
    var appUser: [String:String]?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let welcomeVC = UINavigationController(rootViewController: WelcomeView())
        let tracksTableVC = UINavigationController(rootViewController: TrackTableView())
        
        welcomeVC.navigationController?.navigationBar.prefersLargeTitles = true
        welcomeVC.navigationItem.largeTitleDisplayMode = .always
        welcomeVC.navigationBar.prefersLargeTitles = true
        welcomeVC.title = "Home"
        welcomeVC.navigationBar.topItem?.title = "Home"
       
        tracksTableVC.navigationController?.navigationBar.prefersLargeTitles = true
        tracksTableVC.navigationItem.largeTitleDisplayMode = .always
        tracksTableVC.navigationBar.prefersLargeTitles = true
        tracksTableVC.title = "Library"
        tracksTableVC.navigationBar.topItem?.title = "Library"
        
        UITabBar.appearance().tintColor = UIColor(named: "TextColor")
        //self.tabBar.barTintColor = .clear
        let controllers = [welcomeVC,tracksTableVC]
        self.viewControllers = controllers
        
        guard let items = self.tabBar.items else { return }
        let images = ["house","music.note"]

        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        

    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            self.navigationController?.title = viewController.title
            print("Should select viewController: \(viewController.title ?? "") ?")
            return true;
    }
    
}

