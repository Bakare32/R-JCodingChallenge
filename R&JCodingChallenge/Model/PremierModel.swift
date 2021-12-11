//
//  PremierModel.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 10/12/2021.
//



//import Foundation
//
//// MARK: - Welcome
//struct Welcome: Codable {
//    let count: Int
////    let filters: Filters
//    let competition: Competition
//    let season: Season
//    let teams: [Team]
//}
//
//// MARK: - Competition
//struct Competition: Codable {
//    let id: Int
//    let area: Area
//    let name: String
//    let code: String?
//    let plan: Plan
//    let lastUpdated: String
//}
////struct Competition: Codable {
////    let id: Int
////    let area: Area
////    let name, code, plan: String
////
////}
//
//// MARK: - Area
//struct Area: Codable {
//    let id: Int
//    let name: Name
//}
//
//enum Name: String, Codable {
//    case england = "England"
//}
//enum Plan: String, Codable {
//    case tierFour = "TIER_FOUR"
//    case tierOne = "TIER_ONE"
//    case tierThree = "TIER_THREE"
//    case tierTwo = "TIER_TWO"
//}
////// MARK: - Filters
////struct Filters: Codable {
////}
//
//// MARK: - Season
//struct Season: Codable {
//    let id: Int
//    let startDate, endDate: String
////    let currentMatchday: Int
////    let winner: JSONNull?
//}
//
//// MARK: - Team
//struct Team: Codable {
//    let id: Int
//    let area: Area
//    let name, shortName, tla: String
//    let crestURL: String
//    let address: String
//    let phone: String
//    let website: String
//    let email: String
//    let founded: Int
//    let clubColors, venue: String
//    let lastUpdated: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, area, name, shortName, tla
//        case crestURL = "crestUrl"
//        case address, phone, website, email, founded, clubColors, venue, lastUpdated
//    }
//}
//
//// MARK: - Encode/decode helpers
//
////class JSONNull: Codable, Hashable {
////
////    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
////        return true
////    }
////
////    public var hashValue: Int {
////        return 0
////    }
////
////    public init() {}
////
////    public required init(from decoder: Decoder) throws {
////        let container = try decoder.singleValueContainer()
////        if !container.decodeNil() {
////            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
////        }
////    }
////
////    public func encode(to encoder: Encoder) throws {
////        var container = encoder.singleValueContainer()
////        try container.encodeNil()
////    }
////}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let count: Int
    let filters: Filters
    let competition: Competition
    let season: Season
    let teams: [Team]
}

// MARK: - Competition
struct Competition: Codable {
    let id: Int
    let area: Area
    let name, code, plan: String
    let lastUpdated: String
}

// MARK: - Area
struct Area: Codable {
    let id: Int
    let name: Name
}

enum Name: String, Codable {
    case england = "England"
}

// MARK: - Filters
struct Filters: Codable {
}

// MARK: - Season
struct Season: Codable {
    let id: Int
    let startDate, endDate: String
    let currentMatchday: Int
    let winner: JSONNull?
}

// MARK: - Team
struct Team: Codable {
    let id: Int
    let area: Area
    let name, shortName, tla: String
    var crestURL: String
    let address: String
    let phone: String?
    let website: String
    let email: String?
    let founded: Int
    let clubColors, venue: String
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case id, area, name, shortName, tla
        case crestURL = "crestUrl"
        case address, phone, website, email, founded, clubColors, venue, lastUpdated
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
