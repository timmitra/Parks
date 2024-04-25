//
//  Query_Requery_Subview.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI

struct QueryRequerySubview: View {
  
  @State private var sortOrder = SortOrder.forward
  @State private var filterOn = false
  
    var body: some View {
      NavigationStack {
        ParkListView(sortOrder: sortOrder, filterOn: filterOn)
          .navigationTitle("Parks - Subview")
          .toolbar{
            Button("", systemImage: "arrow.up.arrow.down.circle") {
              sortOrder = sortOrder == .forward ? .reverse : .forward
            }
            .symbolVariant(sortOrder == .forward ? .none : .fill)
            Button("", systemImage: "line.3.horizontal.decrease.circle") {
              sortOrder = sortOrder == .forward ? .reverse : .forward
            }
            .symbolVariant(sortOrder == .forward ? .fill : .none)

          }
      }
    }
}

#Preview {
    QueryRequerySubview()
    .modelContainer(ParkModel.preview)
}
