//
//  RideRequestsViewController.swift
//  ShareTheRide
//
//  Created by Pandula,Samyuktha on 4/23/23.
//

import UIKit

class MyRequestedRidesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var requestedRidesOL: UITableView!
    var riderIndex: Int = -1
    var avaliableRidesForRider: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getAvaliaableRides()
        
        if avaliableRidesForRider.count == 0 {
            let alert = UIAlertController(title: "No Rides", message: "No requests are added by you yet.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel,handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
        
        requestedRidesOL.delegate = self
        requestedRidesOL.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.getAvaliaableRides()
    }
    
    private func getAvaliaableRides() {
        avaliableRidesForRider.removeAll()
        
        for (i, riderDetails) in AvaliableRides.avaliableRide.enumerated() {
            if riderDetails.rideId == self.riderIndex {
                avaliableRidesForRider.append(i)
            }
        }
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        avaliableRidesForRider.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "requestedRideCell", for: indexPath) as? MyRequestedRidesTableCell else {return UITableViewCell()}
        cell.rideFrom.text = "\(AvaliableRides.avaliableRide[avaliableRidesForRider[indexPath.row]].from)"
        cell.rideTo.text = AvaliableRides.avaliableRide[avaliableRidesForRider[indexPath.row]].to
        cell.rideFare.text = "\(AvaliableRides.avaliableRide[avaliableRidesForRider[indexPath.row]].rideFare)"
        cell.rideDate.text = AvaliableRides.avaliableRide[avaliableRidesForRider[indexPath.row]].date
        return cell
    }
}
