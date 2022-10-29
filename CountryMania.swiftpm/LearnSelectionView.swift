//
//  LearnSelectionView.swift
//  CountryMania
//
//  Created by Timothy Hu on 4/19/22.
//

import SwiftUI


//This view is supposed to give users the options for how they want to learn. it contains the Environment Ojbect selection in addition to all of the variables like continent, question, speed, and so forth. This view then selects all of the information that the user inputs and then navigates that information to the MapView to start the game with the information gathered here.

struct LearnSelectionView: View {
    
    //Create all of our states to help get the information
    @EnvironmentObject var selection: Selection
    @State private var continent = "North America"
    @State private var question = "Flag"
    @State private var speed = "5"
    @State private var startLearning = false
    @State private var cheat = false
    
    //Hold the options in these arrays
    let continents = ["North America", "South America", "Europe", "Asia", "Africa", "Australia"]
    let questions = ["Flag", "Capital", "Leader"]
    let speeds = ["3", "5", "7", "10"]
    var choice: String
    
    var body: some View {
        NavigationView {
            //Creating a form to get the inputs from the users.
            Form {
                
                //Create pickers to show which options are available and which options the users can choose from.
                Section {
                    Text("Which continent are you learning?")
                        .font(.largeTitle)
                        .padding()
                    Picker("Which continent do you want?", selection: $continent) {
                        ForEach(continents, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("Which topic do you want to learn?")
                        .font(.largeTitle)
                        .padding()
                    Picker("Which topic do you want to learn?", selection: $question) {
                        ForEach(questions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("What speed do you want to learn at? (Recap every __ questions)")
                        .font(.largeTitle)
                        .padding()
                    Picker("What speed do you want to learn at?(Recap every __ questions)", selection: $speed) {
                        ForEach(speeds, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    
                }
                
                Section {
                    Toggle("Enable Cheat Mode (see the answers to the questions):", isOn: $cheat)
                }
                Section {
                    ZStack {
                    Button("Let's Learn!") {
                        selection.choice = choice
                        selection.continent = continent
                        selection.question = question
                        selection.speed = speed
                        selection.cheat = cheat
    
                    }
                    NavigationLink("", destination: MapView())
                    }
                }
                
                
                
                
                
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
