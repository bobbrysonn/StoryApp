//
//  Book.swift
//  StoryApp
//
//  Created by Bob Moriasi on 6/19/24.
//

import Foundation

struct Book {
    init(title: String, image: String, rating: Double, description: String, story: String) {
        self.title = title
        self.image = image
        self.rating = rating
        self.description = description
        self.story = story
    }
    
    var title: String
    var image: String
    var rating: Double
    var description: String
    var story: String
}
