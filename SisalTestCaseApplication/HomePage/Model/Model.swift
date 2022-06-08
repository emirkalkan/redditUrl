////
////  Model.swift
////  SisalTestCaseApplication
////
////  Created by Emir Kalkan on 8.06.2022.
////
//
//import Foundation
//
//struct Model: Decodable {
//    let data : Children?
//    enum CodingKeys: String, CodingKey {
//        case data = "data"
//    }
//}
//
//struct Children: Decodable {
//    let data: [Child]?
//    enum CodingKeys: String, CodingKey {
//        case data = "data"
//    }
//}
//
////MARK - there is MORE than author and full name, we are just doing this for ease of parsing.
//struct Child: Decodable {
//    let author : String?
//    let authorFullname : String?
//    enum CodingKeys: String, CodingKey {
//        case author = "author"
//        case authorFullname = "author_fullname"
//    }
//     init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        author = try values.decodeIfPresent(String.self, forKey: .author)
//        authorFullname = try values.decodeIfPresent(String.self, forKey: .authorFullname)
//     }
//}
