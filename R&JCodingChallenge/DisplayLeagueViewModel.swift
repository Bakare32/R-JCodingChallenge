//
//  DisplayLeagueViewModel.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 11/12/2021.
//

import Foundation
import UIKit

class DisplayLeagueViewModel: ObservableObject {
   
    var imageURL: String = ""
    
    init(with model: LeagueModel) {
        imageURL = model.imageUrl ?? ""
    }
}
