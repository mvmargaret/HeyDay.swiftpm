//
//  File.swift
//  
//
//  Created by Margarita Mayer on 18/02/24.
//

import Foundation
import SwiftUI

extension Bundle {
    
    func decode(_ file: String) -> [Person] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([Person].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
        
    }
    
}
