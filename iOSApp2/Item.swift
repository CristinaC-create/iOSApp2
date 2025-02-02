//
//  Item.swift
//  iOSApp2
//
//  Created by Cristina Cabral on 2025-02-02.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
