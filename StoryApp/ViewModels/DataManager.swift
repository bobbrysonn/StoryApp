//
//  Data.swift
//  StoryApp
//
//  Created by Bob Moriasi on 6/19/24.
//

import Foundation

class DataManager {
    private init() {}
    
    static let shared = DataManager()
    
    let categories: [Category] = [
        .init(name: "all", books: [enchanted, neon, tales, mermaid, desert, thief]),
        .init(name: "fiction", books: [enchanted, neon, tales]),
        .init(name: "mystery", books: [desert, thief]),
        .init(name: "romance", books: [mermaid, thief, enchanted]),
        .init(name: "action", books: [tales, neon]),
        .init(name: "comedy", books: [mermaid, desert, thief])
    ]
    
    let frequent: [Book] = [enchanted, neon, tales, mermaid, desert, thief]
    
    private let books = [enchanted, neon, tales, mermaid, desert, thief]
    
}


let enchanted = Book(
    title: "The Enchanted Wanderer",
    image: "mystical_forest",
    rating: 4.8,
    description: "Journey through a mystical forest filled with ancient secrets and magical creatures.",
    story: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque fermentum luctus nulla, non accumsan massa. Integer condimentum mollis purus vitae gravida. Curabitur tincidunt hendrerit sapien, eu tincidunt libero congue et. Suspendisse ut sem vitae augue consequat hendrerit nec eget arcu. Cras a ante et purus condimentum hendrerit. Sed quam massa, iaculis at neque vel, venenatis aliquet lectus. Mauris pharetra nec orci nec viverra. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget tempus felis. Morbi facilisis dignissim velit, eget rutrum mauris cursus nec. Mauris rhoncus lorem et magna rhoncus mattis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin porttitor nunc eu velit ornare, vitae consequat enim accumsan. Suspendisse faucibus augue nec nunc finibus tempor.Curabitur tristique enim mauris. Suspendisse pretium nisl at ipsum mollis euismod. Ut ut orci et orci pharetra mattis. Suspendisse dapibus arcu sit amet laoreet euismod. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec a nunc sit amet ex lobortis tempus. Maecenas molestie euismod sapien nec aliquet. Cras aliquam orci sit amet quam malesuada pharetra. Nulla facilisi. Ut et enim a augue semper elementum vitae ut massa. In vel accumsan turpis.Curabitur quis vehicula est, sit amet vehicula risus. Quisque vehicula justo ut hendrerit interdum. Nam elementum, lorem quis imperdiet accumsan, risus lorem placerat odio, non cursus nisi ipsum non augue. Nunc dictum, odio ut dapibus posuere, arcu metus convallis ipsum, lacinia dictum nulla neque in libero. Cras commodo in purus et consequat. Aenean nibh nisi, egestas eu posuere a, blandit ac nisi. Aliquam auctor erat at mauris posuere, gravida gravida nulla laoreet. Donec commodo enim ipsum, non faucibus odio commodo sit amet. Duis dictum in est sed gravida. Integer pellentesque metus eget ipsum pretium pulvinar. Sed nisl neque, luctus sit amet sem vel, posuere congue ex. Aliquam ullamcorper, purus vel porttitor dapibus, felis mi interdum tortor, et maximus elit justo id orci.Fusce tristique facilisis purus. Etiam eu est dui. In et vestibulum purus, non condimentum sapien. Quisque euismod convallis ultricies. Vestibulum porta consequat dictum. Donec blandit porttitor ultricies. Integer nec maximus erat. Vestibulum tempus elementum magna ac ornare. Aliquam sit amet nulla mauris. Maecenas nec cursus lorem. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.Etiam id lacus pulvinar, tempus lacus vitae, accumsan tellus. Donec arcu tellus, facilisis a sapien quis, vehicula tincidunt lectus. Proin commodo ipsum et ligula laoreet venenatis. Cras interdum scelerisque mi bibendum pellentesque. Sed pretium id eros id porttitor. Maecenas sit amet scelerisque dui. Mauris posuere quis libero non finibus. Suspendisse eget ornare tortor."
)
let neon = Book(
    title: "Neon Horizon",
    image: "futuristic_cityscape",
    rating: 4.7,
    description: "A young hero with a robotic arm navigates a futuristic city to uncover a hidden conspiracy.",
    story: "In a sprawling city of towering skyscrapers and neon lights, young Alex discovers that his robotic arm holds secrets that could change the world. As he delves deeper into the city's underbelly, he encounters allies and adversaries, all while trying to stay one step ahead of those who wish to control him..."
)
let tales = Book(
    title: "Tales of the Village",
    image: "quaint_village",
    rating: 4.6,
    description: "A collection of heartwarming stories told by an elderly storyteller in a charming village.",
    story: "In a quaint village where time seems to stand still, children gather around the beloved storyteller, Old Man Timmons, to hear tales of adventure, bravery, and love. Each story is a window into the past, filled with lessons and nostalgia that resonate with the young and old alike..."
)
let mermaid = Book(
    title: "The Mermaid's Kingdom",
    image: "underwater_kingdom",
    rating: 4.9,
    description: "Dive into an underwater world of beauty and danger with a mermaid princess on a quest.",
    story: "Beneath the ocean waves lies a kingdom of unparalleled beauty, where mermaid princess Marina dreams of exploring the world beyond. When an ancient prophecy threatens her home, Marina must venture into unknown waters, forging alliances and facing perils that test her resolve and uncover her true destiny..."
)
let desert = Book(
    title: "Desert Odyssey",
    image: "desert_landscape",
    rating: 4.5,
    description: "A lone camel rider's journey across a vast desert, filled with challenges and self-discovery.",
    story: "The desert is a land of extremes, where only the resilient survive. As the sun sets over the endless dunes, a solitary camel rider, known only as Rahim, reflects on his journey. With each step, he encounters mirages of the past, faces the harsh realities of the present, and seeks the wisdom to navigate the future..."
)
let thief = Book(
    title: "The Thief's Tale",
    image: "medieval_marketplace",
    rating: 4.6,
    description: "A young thief's adventures in a lively medieval marketplace, filled with danger and intrigue.",
    story: "In the bustling marketplace of a medieval town, young Alina survives by her wits and nimble fingers. But when she steals a loaf of bread from the wrong stall, she finds herself embroiled in a plot that goes far beyond petty theft. With the help of unlikely allies, Alina uncovers secrets that could change her life forever..."
)

