//
//  AddTripViewController.swift
//  TripPlan
//
//  Created by Shantala Gaitonde on 11/10/23.
//

import UIKit
import Firebase

class AddTripViewController: UIViewController {

    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var sourceTextField: UITextField!
    
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let db = Firestore.firestore()
        let user_email = Auth.auth().currentUser?.email
        db.collection("users").document(user_email!).collection("user_trips").document().setData([
            "source": sourceTextField.text!,
            "destination": destinationTextField.text!,
            "startDate": startDatePicker.date,
            "endDate": endDatePicker.date
        ]) { err in
          if let err = err {
            print("Error writing document: \(err)")
          } else {
            print("Document successfully written!")
              self.loadView()
              
          }
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
