//
//  Country.swift
//  CountryMania
//
//  Created by Timothy Hu on 4/19/22.
//

import SwiftUI


//The Continent struct is used to hold the name of the continent and the countries within that continent. This struct is the model that is used in the JSON file to get all of the countries for each continent to question the user with.
struct Continent: Codable, Identifiable {
    let id: UUID
    let name: String
    let countries: [Country]
}

//This is the data for each country that is taken from the JSON file. They each have their own unique ID in addition to their name, coordinates (latitude + longitude), the picture of their flag, their leader, and the capital. 
struct Country: Codable, Equatable, Identifiable {
    let id: UUID
    let name: String
    let latitude: Double
    let longitude: Double
    let flagPicture: String
    let leaderPicture: String
    let capital: String
    
    #if DEBUG
    static let example = Country(id: UUID(), name: "United States", latitude: 39.8283, longitude: 98.5795, flagPicture: "United States", leaderPicture: "United States", capital: "Washington D.C.")
    #endif
}

