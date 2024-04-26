//
//  QuerySearchWithSearchable.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

struct QuerySearchWithSearchable: View {
  @Environment(\.modelContext) private var modelContext
  @State private var searchText = ""
  
  private var searchResults: [ParkModel] {
    let predicate = #Predicate<ParkModel> {
      [searchText] park in
      park.name.localizedStandardContains(searchText)
      || park.region.localizedStandardContains(searchText)
      || park.country.localizedStandardContains(searchText)
    }
    let sortBy = [SortDescriptor(\ParkModel.name)]
    let fetch = FetchDescriptor(predicate: predicate, sortBy: sortBy)
    return try! modelContext.fetch(fetch)
  }
  
    var body: some View {
      NavigationStack {
        List(searchResults) { park in
          NavigationLink {
            ParkDetailView(park: park)
          } label: {
            ParkRowView(park: park)
          }
        }
        .navigationTitle("Parks")
        .searchable(text: $searchText, prompt: "Search for a park")
        .overlay {
          if searchResults.isEmpty {
            ContentUnavailableView(searchText.isEmpty ? "Search for a park" : "no parks found",
            systemImage: "tree",
            description: Text("You can find a park by name of place"))
          }
        }
      }
    }
}

#Preview {
    QuerySearchWithSearchable()
    .modelContainer(ParkModel.preview)
}
