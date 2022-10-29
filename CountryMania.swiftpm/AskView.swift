//
//  AskView.swift
//  CountryMania
//
//  Created by Timothy Hu on 4/21/22.
//

import SwiftUI


// Ask View is the view that appears when the program wants to recap the questions or provide them during Play. It is the value at the bottom of the MapView that says "Which country has this _____" and the appropriate value for it.
// It contains the environment object selection and takes in other parameters such as country and question which are the respective country being asked and what is being asked about that country (whether its flag, leader, or capital). The selection environment object is used to find whether or not the user has added the "cheat" function to show the answers when each AskView is created.
//It is split into three if statements because of the different formatting required for the flags such as using an Image rather than plain text.


struct AskView: View {
    @EnvironmentObject var selection: Selection
    let country: Country
    let question: String
    
    var body: some View {
        //If the question is about flags, then this view is created and shown
        if question == "Flag" {
            VStack {
                Text("Which country has this flag?")
                    .padding()
                Image("\(country.flagPicture)")
                    .resizable()
                    .frame(width: 150, height: 90)
                    .border(Color.black)
                if(selection.cheat) {
                Text("\(country.name)")
                }
            }
        }
        //If the question is about leaders, then this view is shown
        else if question == "Leader" {
            VStack {
                Text("Which country has this leader?")
                    .padding()
                
                HStack {
                Text("\(country.leaderPicture)")
                    .font(.title)
                    if(selection.cheat) {
                        Text("\(country.name)")
                    }
                }
            }
        }
        
        //If the question is about capitals, then this view is shown
        else if question == "Capital" {
            
            VStack {
                Text("Which country has this capital?")
                    .padding()
                HStack {
                Text("\(country.capital)")
                    .font(.title)
                    
                    if(selection.cheat) {
                    Text("\(country.name)")
                    }
                }
            }
        }
    }
}

