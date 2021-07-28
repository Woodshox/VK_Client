//
//  ViewController.swift
//  VK_Client
//
//  Created by Woodshox on 22.05.21.
//

import UIKit

class ViewController: UIViewController {
    
    let fromLoginToTabBar = "fromLoginToTabBar"
    // MARK - Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageVK: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    // MARK -- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWasShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

    // MARK -- Functions
    @IBAction func pressButton(_ sender: Any) {
//        guard let login = loginTextField.text,
//              let password = passwordTextField.text
//        else {
//            return
//        }
        
       //if login == "admin" && password == "123"{
            performSegue(withIdentifier: fromLoginToTabBar, sender: nil)
//        }
//        else{
//            performSegue(withIdentifier: "fromLoginToError", sender: nil)
//        }
    }
    
    @objc func keyBoardWasShow(_ notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue)?.cgRectValue.size
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize?.height ?? 0, right: 0)
        
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
        scrollView.scrollRectToVisible(enterButton.frame, animated: true)
    }
    
    @objc func keyBoardWillHide(_ notification: Notification) {
        scrollView.contentInset = .zero
    }
}

