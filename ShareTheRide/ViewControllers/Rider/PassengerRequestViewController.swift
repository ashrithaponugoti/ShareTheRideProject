//
//  PassengerRequestViewController.swift
//  ShareTheRide
//
//  Created by Palavelli,Bala Harinadh on 4/28/23.
//

import UIKit

class PassengerRequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var passengerRequestTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if PassengerRides.requestedRide.count == 0 {
            let alert = UIAlertController(title: "No Rides", message: "No requested rides available.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel,handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
        passengerRequestTV.delegate = self
        passengerRequestTV.dataSource = self
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PassengerRides.requestedRide.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "passengerRequestCell", for: indexPath) as? PassengerRequestCellTableViewCell else {return UITableViewCell()}
        
        cell.from.text = PassengerRides.requestedRide[indexPath.row].from
        cell.to.text = PassengerRides.requestedRide[indexPath.row].to
        cell.date.text = PassengerRides.requestedRide[indexPath.row].date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let requestDetails = Users.passengers[PassengerRides.requestedRide[indexPath.row].rideId]
        let showRequestDetails = UIAlertController(title: "Request Details", message: "passenger Name: \(requestDetails.psngrUserName) \n Passenger Contact number: \(requestDetails.psngrContact)", preferredStyle: .alert)
        showRequestDetails.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(showRequestDetails, animated: true)
    }
}
