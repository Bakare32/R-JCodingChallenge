//
//  CompetitionModel+CoreDataProperties.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 11/12/2021.
//
//

import Foundation
import CoreData


extension CompetitionModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompetitionModel> {
        return NSFetchRequest<CompetitionModel>(entityName: "CompetitionModel")
    }

    @NSManaged public var country: String?
    @NSManaged public var date: String?
    @NSManaged public var name: String?
    @NSManaged public var compete: LeagueModel?

}

extension CompetitionModel : Identifiable {

}
