//
//  SignUpViewController.swift
//  TripPlan
//
//  Created by Shantala Gaitonde on 11/10/23.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signupButtonTapped(_ sender: Any) {
        if (emailTextField.text != nil && passwordTextField.text != nil) {
            
            Auth.auth().createUser(withEmail: emailTextField.text! , password: passwordTextField.text!) { authResult, error in
                if error == nil {
                    print("Successfully signed up!")
                    self.loadView()
                } else {
                            print("Error !!")
                    }
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

}
