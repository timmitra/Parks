//
//  ContentView.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Query(sort: \ParkModel.name) private var parks: [ParkModel]
  
    var body: some View {
        List(parks) { park in
          ParkRowView(park: park)
        }
        .navigationTitle("Parks")
    }
}

#Preview {
    ContentView()
    .modelContainer(ParkModel.preview)
}
