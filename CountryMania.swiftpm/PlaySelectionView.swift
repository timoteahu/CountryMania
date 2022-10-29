//
//  PlaySelectionView.swift
//  CountryMania
//
//  Created by Timothy Hu on 4/23/22.
//

import SwiftUI

//This PlaySelectionView is the same as the LearnSelection View except the choice for the speed is removed as there is no "playing speed" but only "learning speed". 
struct PlaySelectionView: View {
    @EnvironmentObject var selection: Selection
    @State private var continent = "North America"
    @State private var question = "Flag"
    @State private var cheat = false
    
    let continents = ["North America", "South America", "Europe", "Asia", "Africa", "Australia"]
    let questions = ["Flag", "Capital", "Leader"]
    var choice: String
    
    var body: some View {
        NavigationView {
            
            
            Form {
                Section {
                    Text("Which continent are you testing?")
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
                    Text("Which topic do you want to test?")
                        .font(.largeTitle)
                        .padding()
                    Picker("Which topic do you want to test?", selection: $question) {
                        ForEach(questions, id: \.self) {
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
                    Button("Let's Play!") {
                        selection.choice = choice
                        selection.continent = continent
                        selection.question = question
                        selection.cheat = cheat
                    }
                    NavigationLink("", destination: PlayMapView())
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
