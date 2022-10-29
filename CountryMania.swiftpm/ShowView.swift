//
//  ShowView.swift
//  CountryMania
//
//  Created by Timothy Hu on 4/21/22.
//

import SwiftUI

//This view shows the user inside of the MapView. Depending on the question, it shows the User: "This is the capital/leader/flag of _____" at the bottom of the MapView when learning. 
struct ShowView: View {
    let country: Country
    let question: String 
    var body: some View {
        if question == "Flag" {
            VStack {
                Text("The flag of \(country.name) is ")
                    .padding()
                Image("\(country.flagPicture)")
                    .resizable()
                    .frame(width: 150, height: 90)
                    .border(Color.black)
            }
        }
        else if question == "Leader" {
            VStack {
                Text("The leader of \(country.name) is ")
                    .padding()
                Text("\(country.leaderPicture)")
                    .font(.title)
            }
        }
        else if question == "Capital" {
            VStack {
                Text("The capital of \(country.name) is ")
                    .padding()
                Text("\(country.capital)")
                    .font(.title)
            }
        }
    }
}


