//
//  Selection.swift
//  CountryMania
//
//  Created by Timothy Hu on 4/18/22.
//

import Foundation

//Class that holds the selection of the user when using the LearnSelectionView or the PlaySelectionView
class Selection: ObservableObject, Identifiable, Codable {
    var id =  UUID()
    var choice = "None"
    var continent = "None"
    var question = "None"
    var speed = "None"
    var cheat = false
}
