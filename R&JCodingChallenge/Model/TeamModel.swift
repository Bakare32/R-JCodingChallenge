
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
