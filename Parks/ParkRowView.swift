//
//  ParkRowView.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import SwiftUI
import SwiftData

struct ParkRowView: View {
  let park: ParkModel
  
    var body: some View {
      HStack {
        Image(uiImage: park.viewImage)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(height: 60.0)
          .clipShape(.rect(cornerRadius: 8))
        VStack {
          Text(park.name)
            .font(.title)
          Text(park.viewLocation)
            .fontWeight(.light)
        }
        Spacer()
      }
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
  
  return ParkRowView(park: park)
}
