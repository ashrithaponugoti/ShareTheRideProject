//
//  PassengerRequestCellTableViewCell.swift
//  ShareTheRide
//
//  Created by Palavelli,Bala Harinadh on 4/28/23.
//

import UIKit

class PassengerRequestCellTableViewCell: UITableViewCell {

    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
