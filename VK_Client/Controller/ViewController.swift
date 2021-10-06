//
//  ViewController.swift
//  VK_Client
//
//  Created by Woodshox on 22.05.21.
//

import UIKit

class ViewController: UIViewController {
    
    let fromLoginToTabBar = "fromLoginToTabBar"
    let FriendsViewController = "FriendsViewController"
    // MARK - Outlets
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var loginLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var button: UIButton!
    
   
    
    
    
    // MARK -- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 15
//        button.layer.borderWidth = 3.0
        button.clipsToBounds = true
        button.backgroundColor = .blue
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWasShown(_:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

    // MARK -- Functions
    
   
    
    @objc func keyBoardWasShown(_ notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue)?.cgRectValue.size
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize?.height ?? 0, right: 0)
        
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
        scrollView.scrollRectToVisible(button.frame, animated: true)
        
    }
    
    @objc func keyBoardWillHide(_ notification: Notification) {
        scrollView.contentInset = .zero
    }
    
    func checkAuth() -> Bool {
        return (loginTextField.text ?? "").isEmpty &&
            (passwordTextField.text ?? "").isEmpty
    }
    func showAuthError() {
        let alertVC = UIAlertController(title: "Ошибка!", message: "Введите корректный данные", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showMainScreenID" && checkAuth() {
            return true
        } else {
            showAuthError()
            return false
        }
    }
}

    
   
