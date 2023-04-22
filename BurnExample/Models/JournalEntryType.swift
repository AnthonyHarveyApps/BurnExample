//
//  JournalEntryType.swift
//  BurnExample
//
//  Created by Anthony Harvey on 4/21/23.
//

import Foundation

enum JournalEntryType: String, CaseIterable {
    case supplements
    case lifestyle
    case drinks
    
    func optionsForType() -> [String] {
        switch self {
        case .supplements:
            return ["Magnesium", "Tumeric", "Vitamin B-12", "Vitaimin C", "Omega 3 DHA", "Creatine", "Vitamin E", "Ginseng"]
        case .lifestyle:
            return ["Cardio", "Weight Training", "Meditation", "Movie", "Nature Walk", "Deep Work", "Study", "Yoga"]
        case .drinks:
            return ["Coffee", "Red Bull", "Green Smoothie", "Water", "Diet Coke", "Powerade", "Black Tea", "Alcohol"]
        }
    }
}
