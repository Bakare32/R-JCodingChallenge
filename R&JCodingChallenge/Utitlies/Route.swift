//
//  Route.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 10/12/2021.
//

import Foundation

enum Route {
    static let baseUrl = "https://api.football-data.org/"
    
    case pl
    case competitions
    case teamDetails
    

    
    var description: String {
        switch self {
        case .pl:
            return "v2/competitions/PL/teams"
        case .competitions:
            return "v2/competitions"
        case .teamDetails:
            return "v2/teams/57"
        }
    }
}
