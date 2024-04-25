//
//  QueryRequeryFetch.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

struct QueryRequeryFetch: View {
  @Environment(\.modelContext) private var modelContext
  @State private var sortOrder = SortOrder.forward
  @State private var filterOn = false
  
  private var filteredAndSortedParks: [ParkModel] {
    let sortDescriptors = [SortDescriptor(\ParkModel.name, order: sortOrder)]
    let predicate = #Predicate<ParkModel> { park in
      park.country == "United States"
    }
    let fetch = FetchDescriptor(predicate: filterOn ? predicate : nil, sortBy: sortDescriptors)
    return try! modelContext.fetch(fetch)
  }
  
    var body: some View {
      NavigationStack {
        List(filteredAndSortedParks) { park in
          ParkRowView(park: park)
        }
        .navigationTitle("Parks - Fetch")
        .toolbar{
          Button("", systemImage: "arrow.up.arrow.down.circle") {
            sortOrder = sortOrder == .forward ? .reverse : .forward
          }
          .symbolVariant(sortOrder == .forward ? .none : .fill)
          Button("", systemImage: "line.3.horizontal.decrease.circle") {
            filterOn.toggle()
          }
          .symbolVariant(sortOrder == .forward ? .fill : .none)

        }
      }
    }
}

#Preview {
    QueryRequeryFetch()
    .modelContainer(ParkModel.preview)
}
