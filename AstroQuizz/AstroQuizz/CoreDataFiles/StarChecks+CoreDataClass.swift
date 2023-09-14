//
//  StarChecks+CoreDataClass.swift
//  AstroQuizz
//
//  Created by YOGANARASIMHA REDDY PEDDIREDDY on 8/23/23.
//
//

import Foundation
import CoreData


public class StarChecks: NSManagedObject {
    static func create(_ world:String,star:Int32,flag:Bool, in context: NSManagedObjectContext) throws {
                    
                    do {
                        let rec = StarChecks(context: context)
                        rec.world=world
                        rec.star=star
                        rec.completedFlag=flag
                        try context.save()
                        print("Record inserted into StarChecks")
                    }catch {
                        throw error
                    }
                }
    static func fetchRecord(for world: String, star: Int32, in context: NSManagedObjectContext) throws -> StarChecks? {
            let fetchRequest: NSFetchRequest<StarChecks> = StarChecks.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "world == %@ AND star == %d", world, star)
            
            do {
                let results = try context.fetch(fetchRequest)
                return results.first
            } catch {
                throw error
            }
        }
    
    static func deleteRecord(for world: String, star: Int32, in context: NSManagedObjectContext) throws {
            let fetchRequest: NSFetchRequest<StarChecks> = StarChecks.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "world == %@ AND star == %d", world, star)
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if let result=results.first{
                    context.delete(result)
                    print("record deleted")
                }else{
                    print("no record found")
                }
                try context.save()
            } catch {
                throw error
            }
        }
    
    static func truncateData(in context: NSManagedObjectContext) throws {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = StarChecks.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
            print("All records in StarChecks truncated")
        } catch {
            throw error
        }
    }
    
}
