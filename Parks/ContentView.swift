//
//  ContentView.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

enum Country {
  case unitedStates, canada
}

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

 /* @Query<ParkModel>(filter: #Predicate { park in
    (park.country == "United States" && park.region == "Utah")
    || park.country == "Italy" */
  
  @State private var country: Country = .unitedStates
  
  @Query<ParkModel>(filter: #Predicate {
    $0.country == "United States"
  }) private var unitedStatesParks: [ParkModel]
  
  @Query<ParkModel>(filter: #Predicate {
    $0.country == "Canada"
  }) private var canadaParks: [ParkModel]


    var body: some View {
      VStack {
        Picker("", selection: $country) {
          Text("United States").tag(Country.unitedStates)
          Text("Canada").tag(Country.canada)
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
        List(country == .canada ? canadaParks : unitedStatesParks) { park in
            ParkRowView(park: park)
          }
        .listStyle(.plain)
      }
      .navigationTitle("Parks")
    }
}

#Preview {
    ContentView()
    .modelContainer(ParkModel.preview)
}
