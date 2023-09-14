//
//  StarChecks+CoreDataProperties.swift
//  AstroQuizz
//
//  Created by YOGANARASIMHA REDDY PEDDIREDDY on 8/23/23.
//
//

import Foundation
import CoreData


extension StarChecks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StarChecks> {
        return NSFetchRequest<StarChecks>(entityName: "StarChecks")
    }

    @NSManaged public var world: String?
    @NSManaged public var star: Int32
    @NSManaged public var completedFlag: Bool

}

extension StarChecks : Identifiable {

}
