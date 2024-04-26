//
//  ParkModel.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import Foundation
import SwiftData
import UIKit

@Model
class ParkModel {
  var name: String
  var image: Data
  var region: String
  var country: String
  var rating: Int
  var visited: Date?
  init(
    name: String,
    image: Data,
    region: String,
    country: String,
    rating: Int,
    visited: Date? = nil
  ) {
    self.name = name
    self.image = image
    self.region = region
    self.country = country
    self.rating = rating
    self.visited = visited
  }
}

extension ParkModel {
  
  var viewImage: UIImage {
    if let image = UIImage(data: image) {
      return image
    } else {
      return UIImage(systemName: "photo")! // SF Symbol
    }
  }
  var viewLocation: String {
    region + ", " + country
  }
  
  var viewRating: String {
    "\(rating).circle.fill"
  }
}

extension ParkModel {
  @MainActor
  static var preview: ModelContainer {
    let container = try! ModelContainer(for: ParkModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(ParkModel(name: "Arches", image: UIImage(resource: .arches).pngData()!, region: "Utah", country: "United States", rating: 6))
    container.mainContext.insert(ParkModel(name: "Yellowstone", image: UIImage(resource: .yellowstone).pngData()!, region: "Wyoming", country: "United States", rating: 4))
    container.mainContext.insert(ParkModel(name: "Yosemite", image: UIImage(resource: .yosemite).pngData()!, region: "California", country: "United States", rating: 7))
    container.mainContext.insert(ParkModel(name: "Zion", image: UIImage(resource: .zion).pngData()!, region: "Utah", country: "United States", rating: 5, visited: Date.now-354))
    container.mainContext.insert(ParkModel(name: "Grand Teton", image: UIImage(resource: .tetons).pngData()!, region: "Wyoming", country: "United States", rating: 11))
    container.mainContext.insert(ParkModel(name: "Banff", image: UIImage(resource: .banff).pngData()!, region: "Alberta", country: "Canada", rating: 3))
    container.mainContext.insert(ParkModel(name: "Jasper", image: UIImage(resource: .jasper).pngData()!, region: "Alberta", country: "Canada", rating: 6))
    container.mainContext.insert(ParkModel(name: "Bavarian Forest", image: UIImage(resource: .bavarian).pngData()!, region: "Bavaria", country: "Germany", rating: 13))
    container.mainContext.insert(ParkModel(name: "Swiss", image: UIImage(resource: .swiss).pngData()!, region: "Zernez", country: "Switzerland", rating: 4))
    container.mainContext.insert(ParkModel(name: "Dolomites", image: UIImage(resource: .dolomites).pngData()!, region: "Belluno", country: "Italy", rating: 1, visited: Date.now-354))
    container.mainContext.insert(ParkModel(name: "Abel Tasman", image: UIImage(resource: .abelTasman).pngData()!, region: "South Island", country: "New Zealand", rating: 10))
    container.mainContext.insert(ParkModel(name: "Dartmoor", image: UIImage(resource: .dartmoor).pngData()!, region: "Devon", country: "United Kingdom", rating: 12))
    container.mainContext.insert(ParkModel(name: "Grampians", image: UIImage(resource: .grampians).pngData()!, region: "Victoria", country: "Australia", rating: 8))

    return container
  }
}

extension ParkModel {
  static var firstFive: FetchDescriptor<ParkModel> {
    var fetch = FetchDescriptor<ParkModel>()
    fetch.sortBy = [SortDescriptor(\ParkModel.name)]
    fetch.fetchLimit = 5
    
    return fetch
  }
}
