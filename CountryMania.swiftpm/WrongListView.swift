//
//  WrongListView.swift
//  CountryMania
//
//  Created by Timothy Hu on 4/24/22.
//

import SwiftUI

//This view shows the list of wrong values after the PlayMapView and the playing is done.
struct WrongListView: View {
    var wrongCountries: [String]
    var body: some View {
        ScrollView {
            //The wrongCountries.count will be at a constant when passed through the ForEach, so this warning is not to be worried about.
        ForEach(0..<wrongCountries.count) { i in
            Text("\(wrongCountries[i])")
        }
        }
    }
}

