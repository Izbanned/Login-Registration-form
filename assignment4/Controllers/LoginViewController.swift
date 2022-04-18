//
//  LoginViewController.swift
//  assignment4
//
//  Created by Dias Karimov on 18.04.2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Wrong format", message: "The email address/password is badly formatted", preferredStyle: .alert)
        let actionDefault = UIAlertAction(title: "OK", style: .default)
        alert.addAction(actionDefault)
        
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
            if let e = error {
                print(e)
                self.present(alert, animated: true, completion: nil)
            } else {
            self.performSegue(withIdentifier: "goToLogin", sender: self)
            }
        }
    }

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
