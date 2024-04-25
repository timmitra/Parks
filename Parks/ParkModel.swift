//
//  ParksModel.swift
//  Parks
//
//  Created by Tim Mitra on 2024-04-25.
//

import Foundation
import SwiftData

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
