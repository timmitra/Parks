//
//  QueryDynamicSortAndOrder.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

struct QueryDynamicSortAndOrder: View {
  @Environment(\.modelContext) private var modelContext
  @State private var parks: [ParkModel] = []
  @State private var sortByProperty = \ParkModel.name
  @State private var orderAscending = true
  
    var body: some View {
      NavigationStack {
        List(parks) { park in
          ParkRowView(park: park)
        }
        .navigationTitle("Parks")
        .toolbar {
          Menu("Sort by") {
            Picker("", selection: $sortByProperty) {
              Text("Name").tag(\ParkModel.name)
              Text("Region").tag(\ParkModel.region)
              Text("Country").tag(\ParkModel.country)
            }
          }
          Button(orderAscending ? "Desc" : "Asc") {
            orderAscending.toggle()
            updateParks()
          }
          .symbolVariant(orderAscending ? .none : .fill)
          .onChange(of: sortByProperty) {
            updateParks()
          }
        }
        .onAppear {
          updateParks()
        }
      }
    }
  private func updateParks() {
    var descriptor = FetchDescriptor<ParkModel>()
    descriptor.sortBy = [SortDescriptor(sortByProperty, // sort takes a keypath
                                        order: orderAscending ? .forward : .reverse )]
    parks = try! modelContext.fetch(descriptor)
  }
}

#Preview {
    QueryDynamicSortAndOrder()
    .modelContainer(ParkModel.preview)
}
