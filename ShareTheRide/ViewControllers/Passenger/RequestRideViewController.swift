//
//  RequestRideViewController.swift
//  ShareTheRide
//
//  Created by Ashritha Ponugoti on 4/23/23.
//

import UIKit

class RequestRideViewController: UIViewController {

    @IBOutlet weak var requestRidefrom: UITextField!
    @IBOutlet weak var requestRideTo: UITextField!
    @IBOutlet weak var requestRideDate: UIDatePicker!
    
    var passengerIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestRideDate.minimumDate = Date()
    }
    
    @IBAction func requestRideButton(_ sender: UIButton) {
        guard let from = requestRidefrom.text, !from.isEmpty else {return}
        guard let to = requestRideTo.text, !to.isEmpty else {return}
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let date = requestRideDate.date
        let dateString = dateFormatter.string(from: date)
        
        PassengerRides.requestedRide.append(RideDetails(rideId: passengerIndex, from: from, to: to, date: dateString, rideFare: 0.0))
        
        let alert = UIAlertController(title: "Request Added", message: "Request details successfully added.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
            self?.requestRidefrom.text = ""
            self?.requestRideTo.text = ""
        }))
        self.present(alert, animated: true)
    }
    
    
    @IBAction func myRequest(_ sender: Any) {
        performSegue(withIdentifier: "myRequestSegue", sender: passengerIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        if identifier == "myRequestSegue" {
            guard let destination = segue.destination as? MyRequestViewController else {return}
            destination.passengerIndex = passengerIndex
        }
    }
}
