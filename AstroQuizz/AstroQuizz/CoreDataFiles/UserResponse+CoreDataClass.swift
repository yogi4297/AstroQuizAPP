//
//  UserResponse+CoreDataClass.swift
//  AstroQuizz
//
//  Created by YOGANARASIMHA REDDY PEDDIREDDY on 8/3/23.
//
//

import Foundation
import CoreData


public class UserResponse: NSManagedObject {
    static func fetchAllRecords(in context: NSManagedObjectContext) throws -> [UserResponse] {
            let fetchRequest: NSFetchRequest<UserResponse> = UserResponse.fetchRequest()
            do {
                let results = try context.fetch(fetchRequest)
                return results
            } catch {
                throw error
            }
        }
    static func create(_ world:String,star:Int32,question:Int32,response:Int32, in context: NSManagedObjectContext) throws {
                    
                    do {
                        let rec = UserResponse(context: context)
                        rec.world=world
                        rec.star=star
                        rec.question=question
                        rec.userAnswer=response
                        try context.save()
                        print("Record inserted into UserResponse")
                    }catch {
                        throw error
                    }

                }
    
    static func updateResponse(for world: String, star: Int32,question:Int32, with newResponse: Int32, in context: NSManagedObjectContext) throws {
        let fetchRequest: NSFetchRequest<UserResponse> = UserResponse.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "world == %@ AND star == %d AND question == %d", world, star,question)
        do {
            let results = try context.fetch(fetchRequest)
            
            if let existingResponse = results.first {
                existingResponse.userAnswer = newResponse
                
                try context.save()
                print("Response updated for world: \(world), star: \(star)")
            } else {
                print("No UserResponse found for world: \(world), star: \(star)")
            }
        } catch {
            throw error
        }
    }
    
    static func fetchResponse(for world: String, star: Int32, question: Int32, in context: NSManagedObjectContext) throws -> UserResponse? {
            let fetchRequest: NSFetchRequest<UserResponse> = UserResponse.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "world == %@ AND star == %d AND question == %d", world, star, question)
            do {
                let results = try context.fetch(fetchRequest)
                return results.first // If found, returns the first UserResponse matching the predicate
            } catch {
                throw error
            }
        }
    
    static func fetchResponses(for world: String, star: Int32, in context: NSManagedObjectContext) throws -> [UserResponse] {
            let fetchRequest: NSFetchRequest<UserResponse> = UserResponse.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "world == %@ AND star == %d", world, star)
            do {
                let results = try context.fetch(fetchRequest)
                return results // If found, returns the first UserResponse matching the predicate
            } catch {
                throw error
            }
        }
//    static func fetchQuestions(for world: String, star: Int32, in context: NSManagedObjectContext) throws -> [UserResponse]? {
//            let fetchRequest: NSFetchRequest<UserResponse> = UserResponse.fetchRequest()
//            fetchRequest.predicate = NSPredicate(format: "world == %@ AND star == %d AND question == %d", world, star)
//            do {
//                let results = try context.fetch(fetchRequest)
//                return results // If found, returns the first UserResponse matching the predicate
//            } catch {
//                throw error
//            }
//        }

    static func truncateData(in context: NSManagedObjectContext) throws {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = UserResponse.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
            print("All records in UserResponse truncated")
        } catch {
            throw error
        }
    }
    
    static func deleteRecord(for world: String, star: Int32, question: Int32, in context: NSManagedObjectContext) throws {
        let fetchRequest: NSFetchRequest<UserResponse> = UserResponse.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "world == %@ AND star == %d AND question == %d", world, star, question)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let recordToDelete = results.first {
                context.delete(recordToDelete)
                try context.save()
                print("Record deleted for world: \(world), star: \(star), question: \(question)")
            } else {
                print("No UserResponse found for deletion - world: \(world), star: \(star), question: \(question)")
            }
        } catch {
            throw error
        }
    }


    
}
