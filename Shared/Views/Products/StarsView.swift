//
//  StarsView.swift
//  xenShop
//
//  Created by Amit Kumar Swami on 10/6/22.
//

// NOTE: Referenced from https://swiftuirecipes.com/blog/star-rating-view-in-swiftui
import SwiftUI

struct StarsView: View {
  private static let MAX_RATING: Float = 5 // Defines upper limit of the rating
  private static let COLOR = Color.orange // The color of the stars

  let rating: Float
  private let fullCount: Int
  private let emptyCount: Int
  private let halfFullCount: Int

  init(rating: Float) {
    self.rating = rating
    fullCount = Int(rating)
    emptyCount = Int(StarsView.MAX_RATING - rating)
    halfFullCount = (Float(fullCount + emptyCount) < StarsView.MAX_RATING) ? 1 : 0
  }

  var body: some View {
    HStack {
        ForEach(0..<fullCount, id: \.self) { _ in
         self.fullStar
       }
       ForEach(0..<halfFullCount, id: \.self) { _ in
         self.halfFullStar
       }
       ForEach(0..<emptyCount, id: \.self) { _ in
         self.emptyStar
       }
     }
  }

  private var fullStar: some View {
      Image(systemName: "star.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .foregroundColor(StarsView.COLOR)
  }

  private var halfFullStar: some View {
      Image(systemName: "star.lefthalf.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .foregroundColor(StarsView.COLOR)
  }

  private var emptyStar: some View {
      Image(systemName: "star")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .foregroundColor(StarsView.COLOR)
  }
}
