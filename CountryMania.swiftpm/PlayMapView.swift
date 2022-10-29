//
//  PlayMapView.swift
//  CountryMania
//
//  Created by Timothy Hu on 4/23/22.
//

import SwiftUI
import MapKit

//This structure is basically the same as the MapView except it removes all of the learning features such as the recapping and showing which item goes with which country.
struct PlayMapView: View {
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
    @State private var wrongCountries: [String] = []
    @State private var hasStarted = false
    @State private var selectedVal: String = ""
    @State private var index = 0
    @State private var gameOver = false
    
    var body: some View {
        
        //Creates the map for the play function
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
        
        VStack {
            
            //Creates the button that allows the index to advance and see the different countries
            if hasStarted && !gameOver {
                AskView(country: currentCountries[index], question: selection.question)
                
                Button("Confirm") {
                    if(selectedVal != currentCountries[index].name) {
                        wrongCountries.append(currentCountries[index].name)
                    }
                    index += 1
                    if(index == currentCountries.count) {
                        gameOver = true
                    }
                }
                .padding()
            }
            
            //If the game is over, show the list of countries that the person missed and how many the person got correct
            if(gameOver) {
                Text("You got \(currentCountries.count - wrongCountries.count)/ \(currentCountries.count)")

                
                if(wrongCountries.count != 0) {
                NavigationLink(destination: WrongListView(wrongCountries: wrongCountries)) {
                    Text("Here is a list of the countries you got incorrect!")
                }
                .padding()
                }
                else {
                    Text("You got none incorrect!")
                        .padding()
                }
            }
            if(!hasStarted) {
            Button("Start") {
                region =
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: lat[selection.continent] ?? 0, longitude: long[selection.continent] ?? 0),
                        span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50)
                    )
                hasStarted = true
                }
            .font(.largeTitle)
            .padding()
            }
            
            Text("Selected: \(selectedVal)")
        }
        
        
        
    }
}

