//
//  LeagueViewModel.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 10/12/2021.
//

import Foundation
import UIKit

class LeagueViewModel: ObservableObject {
    var league: String = ""
    var country: String = ""
    var date: String = ""
    
    init(with model: CompetitionModel) {
        league = model.name ?? ""
        country = model.country ?? ""
        date = model.date ?? ""
    }
}



