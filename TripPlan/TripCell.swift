//
//  TripCell.swift
//  TripPlan
//
//  Created by Shantala Gaitonde on 11/8/23.
//

import UIKit

class TripCell: UITableViewCell {

    
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var cityImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sourceLabel.text = "FooBar"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
