//
//  QueryFilteringWithSearchable.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

struct QueryFilteringWithSearchable: View {
  @State private var filterText = ""
  @Query private var parks: [ParkModel]
  
  private var filteredParks: [ParkModel] {
    if filterText.isEmpty {
      return parks
    }
    return parks.filter { park in
      park.name.localizedCaseInsensitiveContains(filterText)
    }
  }
  
    var body: some View {
      NavigationStack {
        List(parks) { park in
          ParkRowView(park: park)
        }
        .navigationTitle("Parks")
        .searchable(text: $filterText, prompt: "Filter by park name")
        .overlay {
          if filteredParks.isEmpty {
            ContentUnavailableView.search
          }
        }
      }
    }
}

#Preview {
    QueryFilteringWithSearchable()
    .modelContainer(ParkModel.preview)
}
