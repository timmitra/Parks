//
//  QueryDynamicView.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

struct QueryDynamicView: View {
  
  @Query var parks: [ParkModel]
  @State private var orderAscending = true
  
  /* private var sortedParks: [ParkModel] {
    parks.sorted { park1, park2 in
      orderAscending ? park1.name < park2.name : park1.name > park2.name
    }
  } */
  
  /* shorter */
  private var sortedParks: [ParkModel] {
    parks.sorted {
      orderAscending ? $0.name < $1.name : $0.name > $1.name
    }
  }

    var body: some View {
      NavigationStack {
        List(sortedParks) { park in
          ParkRowView(park: park)
        }
        .navigationTitle("Parks")
        .toolbar {
          Button("", systemImage: "arrow.up.arrow.down.circle") {
            orderAscending.toggle()
          }
          .symbolVariant(orderAscending ? .none : .fill)
        }
      }
    }
}

#Preview {
    QueryDynamicView()
    .modelContainer(ParkModel.preview)
}
