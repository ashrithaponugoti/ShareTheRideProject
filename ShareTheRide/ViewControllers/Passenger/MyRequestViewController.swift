//
//  MyRequestViewController.swift
//  ShareTheRide
//
//  Created by Palavelli,Bala Harinadh on 4/30/23.
//

import UIKit

class MyRequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myRequestTableView: UITableView!
    
    var passengerIndex: Int = -1
    var myRequests: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.getMyRequest()
        
        if myRequests.count == 0 {
            let alert = UIAlertController(title: "No Rides", message: "No requests are added by you yet.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel,handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
        
        self.myRequestTableView.delegate = self
        self.myRequestTableView.dataSource = self
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func getMyRequest() {
        myRequests.removeAll()
        
        for (i, riderDetails) in PassengerRides.requestedRide.enumerated() {
            if riderDetails.rideId == self.passengerIndex {
                myRequests.append(i)
            }
        }
        
        print(myRequests.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.myRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myRequestCell", for: indexPath) as? MyRequestTableViewCell else {return UITableViewCell()}
        
        cell.from.text = PassengerRides.requestedRide[myRequests[indexPath.row]].from
        cell.to.text = PassengerRides.requestedRide[myRequests[indexPath.row]].to
        cell.date.text = PassengerRides.requestedRide[myRequests[indexPath.row]].date
        
        return cell
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
