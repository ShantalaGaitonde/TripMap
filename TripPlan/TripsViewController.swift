//
//  TripsViewController.swift
//  TripPlan
//
//  Created by Shantala Gaitonde on 11/7/23.
//

import UIKit
import Firebase
import GooglePlaces
import Nuke

class TripsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var addTripButton: UIButton!
    let placesClient = GMSPlacesClient.shared()

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as! TripCell
        print(cell)
        let trip = trips[indexPath.row]
        if cell.cityImageView == nil {
                print("Error: cityImageView outlet is not connected.")
            }
        print(cell.sourceLabel == nil)
        cell.textLabel?.text = "\(trip.source) to \(trip.destination)"
       let imageURL = "https://placebear.com/g/200/200"

        if let url = URL(string: imageURL) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    // Handle the error
                    print("Error loading image: \(error.localizedDescription)")
                    return
                }

                if let data = data {
                    DispatchQueue.main.async {
                        print(cell.cityImageView == nil)
                        print(data)
                        cell.imageView?.image = UIImage(data: data)
                    }
                }
            }
            task.resume()
        }

        /*let query = "Boston"
        let filter = GMSAutocompleteFilter()
        let sessionToken = GMSAutocompleteSessionToken()

        placesClient.findAutocompletePredictions(fromQuery: query, filter: filter, sessionToken: sessionToken) { (predictions, error) in
            guard let prediction = predictions?.first else {
                print("Error fetching autocomplete predictions: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            let placeID = prediction.placeID

            let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt64(UInt(GMSPlaceField.photos.rawValue)))

            self.placesClient.fetchPlace(fromPlaceID: placeID, placeFields: fields, sessionToken: nil) { (place, error) in
                if let error = error {
                    print("An error occurred fetching place details: \(error.localizedDescription)")
                    return
                }

                if let place = place, let photoMetadata = place.photos?.first {
                    self.placesClient.loadPlacePhoto(photoMetadata) { (photo, error) in
                        if let error = error {
                            print("Error loading place photo: \(error.localizedDescription)")
                            return
                        }
                        print("hello")
                        // Assuming cityImageView is an outlet in your TripCell
                        cell.imageView?.image = photo
                        
                    }
                }
            }
        }*/
        
        return cell
    }

    @IBOutlet weak var TripsTableView: UITableView!
    private var trips: [Trip] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TripsTableView.register(TripCell.self, forCellReuseIdentifier: "TripCell")
        TripsTableView.delegate = self
        TripsTableView.dataSource = self
        
       let db = Firestore.firestore()
        let user_email = (Auth.auth().currentUser?.email)!
        
        db.collection("users").document(user_email).collection("user_trips")
            .getDocuments() { [self] (querySnapshot, err) in
            if let err = err {
              print("Error getting documents: \(err)")
            } else {
              for document in querySnapshot!.documents {
                //print("\(document.documentID) => \(document.data())")
                  let tripData = document.data()
                  
                  let source = tripData["source"] as? String ?? ""
                      let destination = tripData["destination"] as? String ?? ""
                    if let timestampStartDate = tripData["startDate"] as? Timestamp,
                       let timestampEndDate = tripData["endDate"] as? Timestamp {
                        //print(tripData)
                        let startDate = timestampStartDate.dateValue()
                                let endDate = timestampEndDate.dateValue()
                        let trip = Trip(source: source, destination: destination, startDate: startDate, endDate: endDate)
                            trips.append(trip)
                        
                    }
                  
                  TripsTableView.reloadData()
              }
                
            }
               
          }
        
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
