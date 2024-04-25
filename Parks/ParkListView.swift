//
//  ParkListView.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

struct ParkListView: View {
  @Query private var parks: [ParkModel]
  
  init(sortOrder: SortOrder, filterOn: Bool) {
    let sort = [SortDescriptor(\ParkModel.name, order: sortOrder)]
    let filter = #Predicate<ParkModel> { park in
      park.country == "United States"
    }
    /* “Query property wrapper’s stored property” */
    _parks = Query(filter: filterOn ? filter : nil, sort: sort)
  }
    var body: some View {
      List(parks) { park in
      ParkRowView(park: park)
      }
    }
}

#Preview {
  ParkListView(sortOrder: SortOrder.forward, filterOn: true)
    .modelContainer(ParkModel.preview)
}
