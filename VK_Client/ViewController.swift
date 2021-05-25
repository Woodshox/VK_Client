//
//  ViewController.swift
//  VK_Client
//
//  Created by Woodshox on 22.05.21.
//

import UIKit

class ViewController: UIViewController {
    
    let fromLoginToTabBar = "fromLoginToTabBar"
    
    @IBOutlet weak var imageVK: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func pressButton(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text
        else{
            print("Error")
            return
        }
        
        if login == "admin" && password == "123"{
            performSegue(withIdentifier: fromLoginToTabBar, sender: nil)
        }
        else{
            performSegue(withIdentifier: "fromLoginToError", sender: nil)
        }
    }
}

