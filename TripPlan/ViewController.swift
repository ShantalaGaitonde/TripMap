//
//  ViewController.swift
//  TripPlan
//
//  Created by Shantala Gaitonde on 11/6/23.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // Handle invalid input, e.g., show an alert
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) {(authResult, error) in
            if let error = error {
                  // Show error alert
                } else {
                  print("Logged in")
                }
         }
    }
    
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
                      let password = passwordTextField.text, !password.isEmpty else {
                    // Handle invalid input, e.g., show an alert
                    return
                }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            var message: String = ""
            if let user = authResult?.user {
                            message = "User created successfully!"
                            print(user)
                
                        } else {
                            message = "There was an error."
                            
                        }
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.displayAlert(title: nil, message: message)
        }
        
    }
    func displayAlert(title: String?, message: String, completion: (() -> Void)? = nil) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                completion?()
            }))
            present(alertController, animated: true, completion: nil)
        }
    
    
}
    

