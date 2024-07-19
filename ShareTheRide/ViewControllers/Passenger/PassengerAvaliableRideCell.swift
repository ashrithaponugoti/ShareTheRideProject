//
//  PassengerAvaliableRideCell.swift
//  ShareTheRide
//
//  Created by Ashritha Ponugoti on 4/28/23.
//

import UIKit

class PassengerAvaliableRideCell: UITableViewCell {

    @IBOutlet weak var rideFrom: UILabel!
    @IBOutlet weak var rideTo: UILabel!
    @IBOutlet weak var rideDate: UILabel!
    @IBOutlet weak var rideFare: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
