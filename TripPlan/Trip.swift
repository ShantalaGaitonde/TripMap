//
//  Trip.swift
//  TripPlan
//
//  Created by Shantala Gaitonde on 11/9/23.
//

import Foundation

struct Trip: Decodable {
    let source: String
    let destination: String
    let startDate: Date?
    let endDate: Date?
    
}
