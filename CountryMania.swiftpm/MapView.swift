//
//  MapView.swift
//  CountryMania
//
//  Created by Timothy Hu on 4/19/22.
//

import SwiftUI
import MapKit

//MapView holds the most information for both the learning and testing. It contains the map in which the user can move around in and zoom in and out with. There are also annotations given in the map in which you can select the countries for your answers.
struct MapView: View {
    @EnvironmentObject var selection: Selection
    let cont = Bundle.main.decode([Continent].self, from: "locations.json")
    let lat = ["North America": 54.5260, "South America": -8.7932, "Europe": 54.5260, "Africa": -8.7832, "Asia": 34.047, "Australia": -22.7359]
    let long = ["North America": -105.2551, "South America": -55.4915, "Europe": 15.2551, "Africa": 34.5085, "Asia": 100.6197, "Australia": 140.0188]
    
    @State var region =
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
            span: MKCoordinateSpan(latitudeDelta: 150, longitudeDelta: 150)
        )
    
    
    @State private var currentCountries: [Country] = []
    @State private var hasStarted = false
    @State private var selectedVal: String = ""
    @State private var index = 0
    
    //Recap values
    @State private var gameOver = false
    @State private var recapCorrect = 0
    @State private var isRecap = false
    @State private var recapQuestions: [Country] = []
    
    //Alerts
    @State private var startRecapAlert = false
    @State private var showingRecapSuccessAlert = false
    @State private var showingRecapFailureAlert = false
    @State private var showingWinAlert = false
    
    var body: some View {
        
        //Generates the map here
        ForEach(cont) { section in
            if section.name == selection.continent {
                Map(coordinateRegion: $region, annotationItems: section.countries) { country in
                    
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: country.latitude, longitude: country.longitude), content: {
                        Button(country.name) {
                            selectedVal = country.name
                        }
                        .onAppear(perform: {
                            if(!currentCountries.contains(country)) {
                            currentCountries.append(country)
                            }
                        })
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    })

                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())
            }
            
        }
        
        //Creates either the ShowView or the AskView depending on whether the Recap is enabled

        VStack {
            
            if hasStarted && !gameOver {
                
                //If recap is disabled, then show this view
                if isRecap == false {
                    VStack {
                        ShowView(country: currentCountries[index], question: selection.question)
                        
                        
                        //Confirm button that increments the index of the value and sees if there is supposed to be a recap
                        Button("Confirm") {
                            recapQuestions.append(currentCountries[index])
                            index = index + 1
                            if index == currentCountries.count {
                                recapQuestions.shuffle()
                                isRecap = true
                                startRecapAlert.toggle()
                                region =
                                    MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(latitude: lat[selection.continent] ?? 0, longitude: long[selection.continent] ?? 0),
                                        span: MKCoordinateSpan(latitudeDelta: 75, longitudeDelta: 75)
                                    )
                            }

                            else if index % (Int(selection.speed) ?? 1) == 0 {
                                recapQuestions.shuffle()
                                isRecap = true
                                startRecapAlert.toggle()
                                
                                region =
                                    MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(latitude: lat[selection.continent] ?? 0, longitude: long[selection.continent] ?? 0),
                                        span: MKCoordinateSpan(latitudeDelta: 75, longitudeDelta: 75)
                                    )
                            }
                            else {
                                region =
                                    MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(latitude: currentCountries[index].latitude, longitude: currentCountries[index].longitude),
                                        span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
                                    )
                            }
      
                        }
                        .padding()
                    }
                    .alert("You got all of them correct!", isPresented: $showingRecapSuccessAlert) {
                        
                    } message: {
                        Text("Let's move on to the other countries!")
                    }
                    .alert("You got some of them wrong!", isPresented: $showingRecapFailureAlert) {
                        
                    } message: {
                        Text("Let's redo them to make sure you learn what they are!")
                    }
                }
                
                else {
                    
                    //If recap is enabled, then show this view
                    VStack {
                        AskView(country: recapQuestions[0], question: selection.question)

                        
                        //Confirm button that checks to see whether or not the the recap questions were all answered correctly and perform the appropriate operations 
                        Button("Confirm") {
                            if selectedVal == recapQuestions[0].name {
                                recapCorrect = recapCorrect + 1
                            }
                            recapQuestions.remove(at: 0)
                            
                            if recapQuestions.count == 0 {
                                
                                if index == currentCountries.count {
                                    if recapCorrect == Int(selection.speed) {
                                        gameOver = true
                                    }
                                    else if recapCorrect == (currentCountries.count % (Int(selection.speed) ?? 1)) {
                                        gameOver = true
                                    }
                                    else {
                                        recapCorrect = 0
                                        if(currentCountries.count % (Int(selection.speed) ?? 1) == 0) {
                                            index -= Int(selection.speed) ?? 0
                                        }
                                        else {
                                            index -= currentCountries.count % (Int(selection.speed) ?? 1)
                                        }
                                        
                                        isRecap = false
                                        showingRecapFailureAlert.toggle()
                                    }
                                    
                                }
                                else {
                                    if recapCorrect == Int(selection.speed) {
                                        recapCorrect = 0
                                        isRecap = false
                                        showingRecapSuccessAlert.toggle()
                                    }
                                    else {
                                        recapCorrect = 0
                                        index -= Int(selection.speed) ?? 0
                                        isRecap = false
                                        showingRecapFailureAlert.toggle()
                                    }
                                    region =
                                        MKCoordinateRegion(
                                            center: CLLocationCoordinate2D(latitude: currentCountries[index].latitude, longitude: currentCountries[index].longitude),
                                            span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
                                        )
                                }
    
                            }
                        }
                        .padding()
                        .alert("Now Let's Recap!", isPresented: $startRecapAlert) {
                            
                        }
                        
                        
                    }
                }
                
            }
            
            if(!hasStarted) {
            Button("Start") {
                region =
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: currentCountries[index].latitude, longitude: currentCountries[index].longitude),
                        span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
                    )
                hasStarted = true
                }
            .font(.largeTitle)
            .padding()
            }
            
            
            if(gameOver) {
                Text("Congratulations! You finished all of the countries! Click back to continue learning or try doing all of them at once to really cement your knowledge!")
                    .multilineTextAlignment(.center)
            }
            
            
            Text("Selected: \(selectedVal)")
        
            
            
        }
        
    }
    



    
}

