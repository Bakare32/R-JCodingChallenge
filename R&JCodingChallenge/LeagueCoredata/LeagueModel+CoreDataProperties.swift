//
//  LeagueModel+CoreDataProperties.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 11/12/2021.
//
//

import Foundation
import CoreData


extension LeagueModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LeagueModel> {
        return NSFetchRequest<LeagueModel>(entityName: "LeagueModel")
    }

    @NSManaged public var imageUrl: String?
    @NSManaged public var league: NSSet?

}

// MARK: Generated accessors for league
extension LeagueModel {

    @objc(addLeagueObject:)
    @NSManaged public func addToLeague(_ value: CompetitionModel)

    @objc(removeLeagueObject:)
    @NSManaged public func removeFromLeague(_ value: CompetitionModel)

    @objc(addLeague:)
    @NSManaged public func addToLeague(_ values: NSSet)

    @objc(removeLeague:)
    @NSManaged public func removeFromLeague(_ values: NSSet)

}

extension LeagueModel : Identifiable {

}
