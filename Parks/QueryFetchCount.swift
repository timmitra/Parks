//
//  QueryFetchCount.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

struct QueryFetchCount: View {
  @Environment(\.modelContext) private var modelContext
  @State private var parksCount = 0
  
    var body: some View {
      NavigationStack {
        Form {
          NavigationLink {
            QueryView()
          } label: {
            LabeledContent("Parks", value: parksCount, format: .number)
          }
        }
        .task {
          let predicate = #Predicate<ParkModel> { park in
            park.country == "Canada"
          }
          parksCount = try! modelContext.fetchCount(
            FetchDescriptor(predicate: predicate)
          )
        }
        .navigationTitle("Overview")
      }
    }
}

#Preview {
    QueryFetchCount()
    .modelContainer(ParkModel.preview)
}
