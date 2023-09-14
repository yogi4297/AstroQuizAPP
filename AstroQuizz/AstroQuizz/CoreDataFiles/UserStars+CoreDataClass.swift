//
//  UserStars+CoreDataClass.swift
//  AstroQuizz
//
//  Created by YOGANARASIMHA REDDY PEDDIREDDY on 8/3/23.
//
//

import Foundation
import CoreData

@objc(UserStars)
public class UserStars: NSManagedObject {
    static func fetchAllRecords(in context: NSManagedObjectContext) throws -> [UserStars] {
            let fetchRequest: NSFetchRequest<UserStars> = UserStars.fetchRequest()
            do {
                let results = try context.fetch(fetchRequest)
                return results
            } catch {
                throw error
            }
        }
    static func create(_ world:String,star:String, in context: NSManagedObjectContext) throws {
                    
                    do {
                        let rec = UserStars(context: context)
                        rec.world=world
                        rec.star=star
                        try context.save()
                        print("Record inserted into UserStars")
                    }catch {
                        throw error
                    }
                }
    static func update(world: String, star: String, in context: NSManagedObjectContext) throws {
            let request = NSFetchRequest<UserStars>(entityName: "UserStars")
            request.predicate = NSPredicate(format: "world == %@", world)

            do {
                let results = try context.fetch(request)
                if let recordToUpdate = results.first {
                    recordToUpdate.star = star
                    try context.save()
                    print("Record updated in UserStars")
                } else {
                    print("unable to update the star Record not found for the given world: \(world)")
                }
            } catch {
                throw error
            }
        }
    static func fetchStar(forWorld world: String, in context: NSManagedObjectContext) throws -> String? {
            let request = NSFetchRequest<UserStars>(entityName: "UserStars")
            request.predicate = NSPredicate(format: "world == %@", world)

            do {
                let results = try context.fetch(request)
                if let record = results.first {
                    return record.star
                } else {
                    print("Record not found for the given world: \(world)")
                    return nil
                }
            } catch {
                throw error
            }
        }
    static func truncateData(in context: NSManagedObjectContext) throws {
            let request = NSFetchRequest<UserStars>(entityName: "UserStars")

            do {
                let results = try context.fetch(request)
                for record in results {
                    context.delete(record)
                }

                try context.save()
                print("All data in UserStars truncated successfully.")
            } catch {
                throw error
            }
        }
}
