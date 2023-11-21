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
            
            Auth.auth().createUser(withEmail: emailTextField.text! , password: passwordTextField.text!) { [self] authResult, error in
                if error == nil {
                    print("Successfully signed up!")
                    self.loadView()
                } else {
                        // The sourceLabel is nil, show an alert
                        let alertController = UIAlertController(title: "Error", message: "The email or password field is empty.", preferredStyle: .alert)

                        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                            // Handle OK button tap if needed
                        }
                        
                        alertController.addAction(okAction)

                        // Assuming you have a reference to your view controller to present the alert
                        self.present(alertController, animated: true, completion: nil)
                        
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
