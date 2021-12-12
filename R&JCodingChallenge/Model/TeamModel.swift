// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//import Foundation
//
//// MARK: - Welcome
//struct Welco: Codable {
//    let id: Int
//    let area: Ar
//    let activeCompetitions: [ActiveCompetiti]
//    let name, shortName, tla: String
//    let crestURL: String
//    let address, phone: String
//    let website: String
//    let email: String
//    let founded: Int
//    let clubColors, venue: String
//    let squad: [Squad]
//    let lastUpdated: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, area, activeCompetitions, name, shortName, tla
//        case crestURL = "crestUrl"
//        case address, phone, website, email, founded, clubColors, venue, squad, lastUpdated
//    }
//}
//
//// MARK: - ActiveCompetition
//struct ActiveCompetiti: Codable {
//    let id: Int
//    let area: Ar
//    let name, code, plan: String
//    let lastUpdated: String
//}
//
//// MARK: - Area
//struct Ar: Codable {
//    let id: Int
//    let name: String
//}
//
//// MARK: - Squad
//struct Squad: Codable {
//    let id: Int
//    let name: String
//    let position: Position?
//    let dateOfBirth: String
//    let countryOfBirth, nationality: String?
//    let shirtNumber: Int?
//    let role: Role?
//}
//
//enum Position: String, Codable {
//    case attacker = "Attacker"
//    case defender = "Defender"
//    case goalkeeper = "Goalkeeper"
//    case midfielder = "Midfielder"
//}
//
//enum Role: String, Codable {
//    case player = "PLAYER"
//}
//
import Foundation

// MARK: - APIResponse
struct APIResponse: Codable {
    let name, shortName, tla: String
    let crestURL: String
    let address, phone: String
    let website: String
    let email: String
    let founded: Int
    let clubColors, venue: String
    let squad: [Squad]

    enum CodingKeys: String, CodingKey {
        case name, shortName, tla
        case crestURL = "crestUrl"
        case address, phone, website, email, founded, clubColors, venue, squad
    }
}

// MARK: - Squad
struct Squad: Codable {
    let id: Int
    let name, position: String
    let dateOfBirth: String
    let countryOfBirth, nationality, role: String
}