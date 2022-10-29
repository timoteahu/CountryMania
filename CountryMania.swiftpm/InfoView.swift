//
//  InfoView.swift
//  CountryMania
//
//  Created by Timothy Hu on 4/23/22.
//

import SwiftUI

//This is the information view where all of the information for the program is being held. It is just a lot of text that is displayed to show users how to play and the important information about the program as well.

struct InfoView: View {
    var body: some View {
        ScrollView {
        VStack {
        Text("Important Information:")
            .font(.title)
            .padding()
        Text("1. For the best user experience, I recommend using portrait mode for the application. Landscape mode is enabled if users really prefer using that orientation, but portrait mode will end up being easier to navigate the map and select the countries and provide an overall better experience for the user.")
                .padding()
        Text("2. The image 'globebubble' (the globe on the home screen) was created by @yumeiihua on Instagram and gave permission to use the image in the project.")
                .padding()
        Text("3. The rest of the image assets (the flags) were all taken from Wikipedia under PUBLIC DOMAIN.")
                .padding()
        Text("4. If there were countries that fit into multiple continents, they only appear in one continent. This data is accurate up to the date of the creation of this application. The locations.json file was created by me but the information inside of the json file was taken from Wikipedia (being the coordinates, leader, flag picture, and capital).")
                .padding()
            VStack {
            Text("How to Play: Learn")
                    .font(.title)
                    .padding()
            Text("Preface: The map shown is used from Mapkit, which allows users to move around in the map and zoom in and out as they please. This will help show all of the buttons for each country and allow better navigation to find the country for the questions.")
            Text("1. First, you select your options for how and what you want to learn. There are 6 different regions which are split into the 6 countries (minus Antarctica). There are also three categories to learn in each continent being their flags, leaders, or capitals (yes the capitals are on the map, but you are still learning them!).")
                    .padding()
            Text("2. Depending on the speed of the learning 'X', you will go through 'X' countries and the application will show you the respective flag, leader, or capital. Then, you recap and have to answer the questions associated with the 'X' countries you just learned about. You do so by selecting the buttons on the Map to select the given country, and then click confirm to select that as our answer. The selected country is shown in the bottom menu. If you get any wrong, you have to redo the ones you just learned about until you get all of them right.")
                    .padding()
            Text("3. For the quickest and easiest experience of the Learn function, do South America as it has the least amount of countries (12 only) in addition to enabling cheat mode. This will allow you to know the answers and quickly go through the application for testing purposes. The other countries of Australia, North America, Asia, Europe, and Africa as the ranking of difficulty with Australia having 15 countries and Africa having 52.")
                    .padding()
            
            Text("How to Play: Play")
                    .font(.title)
                    .padding()
            Text("1. This is similar to the Learn function, except you are asked about all of the countries at once without learning them. At the end, you see how many you got correct and which countries you missed.")
                    .padding()
            Text("2. Again, for the easiest experience of the Play function, do South America as it has the least amount of countries to remember in addition to enabling cheat mode as well.")
                    .padding()
                
        Spacer()
            }
        }
        }
    }
}
