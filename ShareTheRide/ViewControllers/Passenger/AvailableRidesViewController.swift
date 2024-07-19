//
//  AvailableRidesViewController.swift
//  ShareTheRide
//
//  Created by Ashritha Ponugoti on 4/23/23.
//

import UIKit

class AvailableRidesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var AvailableRidesListOL: UITableView!
    
    var passengerIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if AvaliableRides.avaliableRide.count == 0 {
            let alert = UIAlertController(title: "No Rides", message: "Not Rides avaiable", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
        
        AvailableRidesListOL.dataSource = self
        AvailableRidesListOL.delegate = self
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func requestNewRide(_ sender: Any) {
        performSegue(withIdentifier: "newRideSegue", sender: passengerIndex)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AvaliableRides.avaliableRide.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "availableRideCell", for: indexPath) as? PassengerAvaliableRideCell else {return UITableViewCell()}
        cell.rideFrom.text = "\(AvaliableRides.avaliableRide[indexPath.row].from)"
        cell.rideTo.text = AvaliableRides.avaliableRide[indexPath.row].to
        cell.rideFare.text = "\(AvaliableRides.avaliableRide[indexPath.row].rideFare)"
        cell.rideDate.text = AvaliableRides.avaliableRide[indexPath.row].date
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let riderDetails = Users.riders[AvaliableRides.avaliableRide[indexPath.row].rideId]
        let showRiderDetails = UIAlertController(title: "Rider Details", message: "Rider Name : \(riderDetails.rdrUserName) \n Contact Number : \(riderDetails.rdrContact)", preferredStyle: .alert)
        showRiderDetails.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(showRiderDetails, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        if identifier == "newRideSegue" {
            guard let destination = segue.destination as? RequestRideViewController, let index = sender as? Int else {return}
            destination.passengerIndex = index
        }
    }
}
