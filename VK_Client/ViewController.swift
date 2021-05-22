//
//  ViewController.swift
//  VK_Client
//
//  Created by Woodshox on 22.05.21.
//

import UIKit

class ViewController: UIViewController {
    
    
    
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
        
        if loginTextField.text == "admin",
           passwordTextField.text == "123"{
            print("OK")
        }
        else{
            print("Error")
        }
    }
    
    
    
    
}

