//
//  QueryOnModel.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

struct QueryOnModel: View {
  @Query(ParkModel.firstFive) private var firstFiveParks: [ParkModel]
  
    var body: some View {
      NavigationStack {
        List(firstFiveParks) { park in
          ParkRowView(park: park)
        }
        .navigationTitle("First Five Parks")
      }
    }
}

#Preview {
    QueryOnModel()
    .modelContainer(ParkModel.preview)
}
