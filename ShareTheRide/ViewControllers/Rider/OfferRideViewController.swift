//
//  OfferRideViewController.swift
//  ShareTheRide
//
//  Created by Pandula,Samyuktha on 4/23/23.
//

import UIKit

class OfferRideViewController: UIViewController {
  
    @IBOutlet weak var rideFrom: UITextField!
    @IBOutlet weak var rideTo: UITextField!
    @IBOutlet weak var rideFare: UITextField!
    @IBOutlet weak var rideAvailableTime: UIDatePicker!
    
    var riderIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rideAvailableTime.minimumDate = Date()
    }

    @IBAction func saveRideDetails(_ sender: UIButton) {
        guard let from = rideFrom.text, !from.isEmpty else {return}
        guard let to = rideTo.text, !to.isEmpty else {return}
        guard let fareText = rideFare.text, !fareText.isEmpty, let fare = Double(fareText) else {return}
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let date = rideAvailableTime.date
        let dateString = dateFormatter.string(from: date)
        
        AvaliableRides.avaliableRide.append(RideDetails(rideId: riderIndex, from: from, to: to, date: dateString, rideFare: fare))
        
        let alert = UIAlertController(title: "Ride Added", message: "Ride Details successfully added.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
            self?.rideFrom.text = ""
            self?.rideTo.text = ""
            self?.rideFare.text = ""
        }))
        self.present(alert, animated: true)
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        if identifier == "rideRequestsSegue" {
            guard let destination = segue.destination as? MyRequestedRidesViewController else {return}
            destination.riderIndex = riderIndex
        }
    }
}
