//
//  LeagueModel+CoreDataProperties.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 10/12/2021.
//
//

import Foundation
import CoreData


extension LeagueModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LeagueModel> {
        return NSFetchRequest<LeagueModel>(entityName: "LeagueModel")
    }

    @NSManaged public var imageUrl: String?

}

extension LeagueModel : Identifiable {

}
