//
//  Timeline.swift
//  HeyDay
//
//  Created by Margarita Mayer on 17/02/24.
//

import Foundation
import SwiftUI
import TipKit


struct SliderTip: Tip {
   
    var title: Text {
        Text("Explore the timeline")
            .foregroundStyle(.primary)
    }
    
    var message: Text? {
        Text("Navigate the timeline of notable women using the slider")
            .foregroundStyle(.secondary)
    }
    
//    var options: [TipOption] {
//        MaxDisplayCount(5)
//    }
    
    static let ContentViewDidOpen = Tips.Event(id: "ContentViewDidOpen")
    
    var rules: [Rule] {
        #Rule(SliderTip.ContentViewDidOpen) {
            $0.donations.count >= 1
        }
    }
    
    
}


struct PersonTip: Tip {
   
    var title: Text {
        Text("Read the stories")
            .foregroundStyle(.primary)
    }
    
    var message: Text? {
        Text("Press the button to read the story")
            .foregroundStyle(.secondary)
    }
    
    
    static let SliderMoved = Tips.Event(id: "SliderMoved")
    
    var rules: [Rule] {
        #Rule(PersonTip.SliderMoved) {
            $0.donations.count >= 1
        }
    }
    
    
}
