//
//  UsersData.swift
//  ShareTheRide
//
//  Created by Pandula,Samyuktha on 4/26/23.
//

import Foundation

struct Rider{
    var rdrUsernme : String
    var rdrPassword : String
    
}

struct Passenger{
    var psngrUsername : String
    var psngrPassword : String
    
}

var rider1 = Rider(rdrUsernme: "samy", rdrPassword: "1234")
var psngr1 = Passenger(psngrUsername: "ash", psngrPassword: "1234")

var riderList = [rider1]
var psngrList = [psngr1]
