//
//  ViewController.swift
//  ShareTheRide
//
//  Created by Pandula,Samyuktha on 4/23/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameOL: UITextField!
    @IBOutlet weak var passwordOL: UITextField!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImage.image = UIImage(named: "logo")
        var width = logoImage.frame.width
                width += 40
                var height = logoImage.frame.height
                height = height + 40
                let x  =  logoImage.frame.origin.x-20
                let y = logoImage.frame.origin.y-20
                let largeFrame = CGRect(x: x, y: y, width: width, height: height)
                UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 200, animations: {
                    self.logoImage.frame = largeFrame
                })
        userNameOL.text = ""
        passwordOL.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userNameOL.text = ""
        passwordOL.text = ""
    }
    
    @IBAction func RiderLogin(_ sender: UIButton) {
        guard let username = userNameOL.text, !username.isEmpty else {return}
        guard let password = passwordOL.text, !password.isEmpty else {return}
        
        var riderFound: Bool = false
        
        for (i, rider) in Users.riders.enumerated() {
            if rider.rdrUserName == username, rider.rdrPassword == password {
                riderFound = true
                self.performSegue(withIdentifier: "riderSegue", sender: i)
            }
        }
        
        if riderFound == false {
            let alert = UIAlertController(title: "Invalid User", message: "Please enter valid user details", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel))
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func passengerLogin(_ sender: UIButton) {
        guard let username = userNameOL.text, !username.isEmpty else {return}
        guard let password = passwordOL.text, !password.isEmpty else {return}
        
        var riderFound: Bool = false
        
        for (i, rider) in Users.passengers.enumerated() {
            if rider.psngrUserName == username, rider.psngrPassword == password {
                riderFound = true
                self.performSegue(withIdentifier: "passengerSegue", sender: i)
            }
        }
        
        if riderFound == false {
            let alert = UIAlertController(title: "Invalid User", message: "Please enter valid user details", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel))
            self.present(alert, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        if identifier == "riderSegue" {
            guard let destination = segue.destination as? OfferRideViewController, let index = sender as? Int else {return}
            destination.riderIndex = index
        } else if identifier == "passengerSegue" {
            guard let destination = segue.destination as? AvailableRidesViewController, let index = sender as? Int else {return}
            destination.passengerIndex = index
        }
    }
}
