//
//  Decoder.swift
//  CountryMania
//
//  Created by Timothy Hu on 4/19/22.
//


// This program is used to help load the JSON file in an easier fashion and apply it to the structs in the Country file

import UIKit

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil)
        else {
            fatalError("Failed to locate \(file)")
        }

        guard let data = try? Data(contentsOf: url)
        else {
            fatalError("Failed to load \(file)")
        }

        let decoder = JSONDecoder()

        guard let result = try? decoder.decode(T.self, from: data)
        else {
            fatalError("Failed to decode \(file)")
        }

        return result
    }
}

