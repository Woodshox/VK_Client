//
//  MainTabBarController.swift
//  VK_Client
//
//  Created by Woodshox on 01.07.21.
//

import UIKit

class MainTabBarController: UITabBarController {

    
    func setupUser() -> [User] {
        var resultArray = [User]()
        
        let firstFotoArray = [UIImage(named: "1_1")!, UIImage(named: "1_2")!, UIImage(named: "2_3")!, UIImage(named: "1_4")!, UIImage(named: "1_5")!]
        let firstUser = User(name: "Iphone XR", photoArray: firstFotoArray, avatar: UIImage(named: "1_1")!)
        resultArray.append(firstUser)
            
            
        let secondFotoArray = [UIImage(named: "2_1")!, UIImage(named: "2_2")!, UIImage(named: "2_3")!, UIImage(named: "2_4")!, UIImage(named: "2_5")!]
        let secondUser = User(name: "Alex Pavlov", photoArray: secondFotoArray, avatar: UIImage(named: "2_1")!)
        resultArray.append(secondUser)
            
        return resultArray
        
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let friendsNavigationController =  self.viewControllers?.first as? UINavigationController,
           let friendsViewController = friendsNavigationController.viewControllers.first as? FriendsViewController {
            friendsViewController.cofigure(userArray: setupUser())
            
        }
        
    }
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


