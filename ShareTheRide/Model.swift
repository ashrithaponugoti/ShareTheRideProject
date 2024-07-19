//
//  User.swift
//  ShareTheRide
//
//  Created by Pandula,Samyuktha on 4/26/23.
//

import Foundation

struct Rider {
    var rdrUserName: String
    var rdrPassword: String
    var rdrContact: String
}

struct Passenger {
    var psngrUserName: String
    var psngrPassword: String
    var psngrContact: String
}

struct RideDetails {
    var rideId: Int
    var from: String
    var to: String
    var date: String
    var rideFare: Double
}

struct Users {
    static var riders: [Rider] = [
        Rider(rdrUserName: "sam", rdrPassword: "1234",rdrContact: "6605385263"),
        Rider(rdrUserName: "samy", rdrPassword: "0987",rdrContact: "9876123401")
    ]

    static var passengers: [Passenger] = [
        Passenger(psngrUserName: "ash", psngrPassword: "1234",psngrContact:"98033486"),
        Passenger(psngrUserName: "ash1", psngrPassword: "0987",psngrContact:"7896350998")
    ]
}

struct AvaliableRides {
    static var avaliableRide: [RideDetails] = []
}

struct PassengerRides {
    static var requestedRide: [RideDetails] = []
}
