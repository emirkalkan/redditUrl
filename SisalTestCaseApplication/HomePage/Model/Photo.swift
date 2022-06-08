// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photo = try? newJSONDecoder().decode(Photo.self, from: jsonData)

import Foundation

// MARK: - Photo
struct Photo: Codable {
    let kind: String
    let data: PhotoData
    let error: Int = 0
}

// MARK: - PhotoData
struct PhotoData: Codable {
    let children: [Child]

    enum CodingKeys: String, CodingKey {
        case children
    }
}

// MARK: - Child
struct Child: Codable {
    let kind: Kind
    let data: ChildData
}

// MARK: - ChildData
struct ChildData: Codable {
    let title: String
    let name: String
    let score: Int
    let thumbnail: String
    let author: String

    enum CodingKeys: String, CodingKey {
        case title, name, thumbnail, score, author
    }
}

enum Kind: String, Codable {
    case t3 = "t3"
}

