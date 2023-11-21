//
//  DetailViewController.swift
//  TripPlan
//
//  Created by Shantala Gaitonde on 11/20/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    var trip: Trip!
    var tripImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Adjust the date format according to your needs

                // Check if trip and startDate are not nil
                if let trip = trip, let startDate = trip.startDate {
                    sourceDestinationLabel.text = "\(trip.source) to \(trip.destination)"
                    fromToLabel.text = "\(dateFormatter.string(from: startDate)) to \(dateFormatter.string(from:trip.endDate!))"
                } else {
                    // Handle the case where trip or startDate is nil
                    sourceDestinationLabel.text = "N/A"
                    fromToLabel.text = "N/A"
                }
            if let tripImage = tripImage {
                    cityImageView.image = tripImage
                }
        
    }
    
    @IBOutlet weak var cityImageView: UIImageView!
    
    @IBOutlet weak var fromToLabel: UILabel!
    
     @IBOutlet weak var sourceDestinationLabel: UILabel!
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
