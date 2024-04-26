//
//  ParkDetailView.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

struct ParkDetailView: View {
  let park: ParkModel
  
    var body: some View {
      Form {
        Image(uiImage: park.viewImage)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .clipShape(.rect(cornerRadius: 8))
        LabeledContent("Location") {
          Text(park.viewLocation)
        }
        LabeledContent("Rating") {
          Text(park.rating, format: .number)
        }
        LabeledContent("Visited?") {
          Text(park.visited == nil ? "No" : "Yes")
        }
      }
      .navigationTitle(park.name)
    }
}

#Preview {
  let container = try! ModelContainer(for: ParkModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
  
  let park = ParkModel(
    name: "Arches",
    image: UIImage(resource: .arches).pngData()!,
    region: "Utah",
    country: "United States",
    rating: 6
  )
  container.mainContext.insert(park)
  
  return NavigationStack { ParkDetailView(park: park)
  }
}
