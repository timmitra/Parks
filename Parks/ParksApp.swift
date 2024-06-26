//
//  ParksApp.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

@main
struct ParksApp: App {
    var body: some Scene {
        WindowGroup {
          QueryFilteringWithSearchable()
            .modelContainer(for: ParkModel.self)
        }
    }
}
