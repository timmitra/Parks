//
//  ContentView.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  // A key path is a way to point to a property
  //@Query(sort: \ParkModel.name) private var parks: [ParkModel]
  
  //@Query(sort: \ParkModel.name, order: .reverse) private var parks: [ParkModel]
  
  // sort on multiple
  //@Query(sort: [SortDescriptor(\ParkModel.country), SortDescriptor(\ParkModel.rating, order: .reverse)]) private var parks: [ParkModel]
  
  /* @Query(filter: #Predicate<ParkModel>{ park in
    park.country == "Canada"
  }) private var parks: [ParkModel] */

 /* @Query<ParkModel>(filter: #Predicate { park in
    park.country == "Canada"
  }) private var parks: [ParkModel] */

  @Query<ParkModel>(filter: #Predicate { park in
    (park.country == "United States" && park.region == "Utah")
    || park.country == "Italy"
    
  }) private var parks: [ParkModel]

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
