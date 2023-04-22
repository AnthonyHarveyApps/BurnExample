//
//  BurnReading.swift
//  BurnExample
//
//  Created by Anthony Harvey on 4/21/23.
//

import Foundation

struct BurnReading: Hashable {
    var dateTime: Date
    var percentBurned: Int
    static let example1 = BurnReading(dateTime: Date.init(timeIntervalSinceNow: -500), percentBurned: 5)
    static let example2 = BurnReading(dateTime: Date.init(timeIntervalSinceNow: -400), percentBurned: 60)
    static let example3 = BurnReading(dateTime: Date.init(timeIntervalSinceNow: -300), percentBurned: 55)
    static let example4 = BurnReading(dateTime: Date.init(timeIntervalSinceNow: -200), percentBurned: 33)
    static let example5 = BurnReading(dateTime: Date.init(timeIntervalSinceNow: -100), percentBurned: 45)
    static let example6 = BurnReading(dateTime: Date(), percentBurned: 61)
}
