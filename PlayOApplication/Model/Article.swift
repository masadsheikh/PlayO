

import Foundation

struct Welcome: Codable {

    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    
    let author: String
    let title: String
    let description: String
    let content: String
    let urlToImage: String
    let url: String
}

