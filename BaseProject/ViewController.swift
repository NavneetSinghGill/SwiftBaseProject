//
//  ViewController.swift
//  BaseProject
//
//  Created by Navneet Singh on 14/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var verticalAlignConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text = "asdada"
        passwordTextField.text = "123123"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        emailTextField.becomeFirstResponder()
    }

    @IBAction func loginButtonTapped() {
        if let email = emailTextField.text?.trim(),
           let password = passwordTextField.text?.trim() {
            UserRequestManager().loginWith(email, password) { (success, response, error) in
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "OpenMenuController", sender: "LoginViewController")
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.destination)
    }
    
    //MARK: - Observers
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardHeight = (notification.userInfo!["UIKeyboardFrameEndUserInfoKey"]! as! CGRect).size.height
        let bottomOfTextfield = passwordTextField.frame.origin.y + passwordTextField.frame.size.height + 80
        let adjustmentValue = bottomOfTextfield - (self.view.frame.size.height - keyboardHeight)
        
        if adjustmentValue > 0 {
            verticalAlignConstraint.constant = -adjustmentValue
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        verticalAlignConstraint.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    //MARK:- Gesture methods
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

