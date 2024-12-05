////
////  DataManager.swift
////  ItsNotJustaPhase
////
////  Created by Sejal Ghanate on 2/12/24.
////
//
//import Foundation
//import CoreData
//
/////main data manager
//class DataManager: NSObject, ObservableObject {
//    
//    //adds the core data container with the model name
//    let container:NSPersistentContainer = NSPersistentContainer(name: "Model")
//    
//    
//    override init() {
//        super.init()
//        container.loadPersistentStores{desc, error in
//            if let error = error {
//                print("Failed to load the data \(error.localizedDescription)")
//            }
//        }
//        
//    }
////    func save(context: NSManagedObjectContext) {
//        do {
//            try context.save()
//            print("Data saved successfully. WUHU!!!")
//        } catch {
//            // Handle errors in our database
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//    }
//    
//    func fetchActivities() -> [Activity] {
//        let fetchRequest = NSFetchRequest<Activity>(entityName: "Activity") // Adjust entity name if needed
//        do {
//            return try container.viewContext.fetch(fetchRequest)
//        } catch {
//            print("Error fetching activities: \(error)")
//            return []
//        }
//    }
//    
//    // 2. Fetching Phases (assuming all phase entities inherit a common base entity)
//    
//    func fetchPhases() -> [BasePhase] {
//        let fetchRequest = NSFetchRequest<BasePhase>(entityName: "BasePhase") // Creates a fetch request specifically targeting the "basePhase" entity. This means it will fetch all objects of that entity and its subclasses (since they inherit from it).
//        
//        
//        /* do-catch block: Wraps the fetch in error handling to gracefully handle potential issues.
//         If an error occurs, it prints the error message and returns an empty array to prevent app crashes. */
//        
//        do {
//            return try container.viewContext.fetch(fetchRequest) //The result is an array of basePhase objects, which will include instances of both the base entity and any child entities.
//        } catch {
//            print("Error fetching phases: \(error)")
//            return []
//        }
//    }
//    
//    // 3. Fetching Moods
//    func fetchMoods(predicate: NSPredicate? = nil) -> [Mood] {
//        let fetchRequest = NSFetchRequest<Mood>(entityName: "Mood") // Adjust entity name if needed
//        do {
//            return try container.viewContext.fetch(fetchRequest)
//        } catch {
//            print("Error fetching moods: \(error)")
//            return []
//        }
//    }
//    
//    // 4. Fetching Notes
//    func fetchNotes() -> [Notes] {
//        let fetchRequest = NSFetchRequest<Notes>(entityName: "Notes") // Adjust entity name if needed
//        do {
//            return try container.viewContext.fetch(fetchRequest)
//        } catch {
//            print("Error fetching notes: \(error)")
//            return []
//        }
//    }
//    
//    // 5. Fetching Predictions
//    func fetchPredictions() -> [Prediction] {
//        let fetchRequest = NSFetchRequest<Prediction>(entityName: "Prediction") // Adjust entity name if needed
//        do {
//            return try container.viewContext.fetch(fetchRequest)
//        } catch {
//            print("Error fetching predictions: \(error)")
//            return []
//        }
//    }
//    
//    // 6. Fetching Symptoms
//    func fetchSymptoms() -> [Symptoms] {
//        let fetchRequest = NSFetchRequest<Symptoms>(entityName: "Symptoms") // Adjust entity name if needed
//        do {
//            return try container.viewContext.fetch(fetchRequest)
//        } catch {
//            print("Error fetching symptoms: \(error)")
//            return []
//        }
//    }
//    
//    // 1. Creating an Activity
//    func createActivity(name: String, date: Date) -> Activity {
//        let activity = Activity(context: container.viewContext)
//        activity.name = name
//        activity.date = date
//        // ... Set other attributes as needed
//        return activity
//    }
//    
//    // 2. Creating a Phase (assuming all phase entities inherit a common base entity)
//    func createPhase(type: String, startDate: Date) -> BasePhase {
//        let phase = BasePhase(context: container.viewContext)
//        phase.type = type
//        phase.startDate = startDate
//        // ... Set other attributes as needed
//        return phase
//    }
//    
//    // 3. Creating a Mood
//    func createMood(emotion: MoodEnum, date: Date) {
//        let moodEntity = Mood(context: container.viewContext)
//        moodEntity.date = date
//        moodEntity.emotion = emotion.rawValue
//        
//        switch emotion {
//        case .happy, .sad, .anxious:
//            moodEntity.emotion = emotion.rawValue
//            
//        }
//        
//        
//        
//        // 4. Creating a Note
//        func createNote(content: String, date: Date) -> Notes {
//            let note = Notes(context: container.viewContext)
//            note.content = content
//            note.date = date
//            // ... Set other attributes as needed
//            return note
//        }
//        
//        // 5. Creating a Prediction
//        func createPrediction(predictedPhase: PhaseType, date: Date) -> Prediction {
//            let prediction = Prediction(context: container.viewContext)
//            prediction.predictedPhase = predictedPhase.rawValue
//            prediction.date = date
//            // ... Set other attributes as needed
//            return prediction
//        }
//        
//        // 6. Creating a Symptom
//        func createSymptom(name: String, date: Date) -> Symptoms {
//            let symptom = Symptoms(context: container.viewContext)
//            symptom.name = name
//            symptom.date = date
//            // ... Set other attributes as needed
//            return symptom
//        }
//        
//        
//        
//    }
//    
//    /*
//     any of your SwiftUI views that requires data from Code Data.
//     
//     this is the code:
//     struct ListContentView: View {
//     
//     @EnvironmentObject var manager: DataManager
//     @Environment(\.managedObjectContext) private var viewContext
//     @FetchRequest(sortDescriptors: []) private var todoItems: FetchedResults<Todo>
//     ...
//     }
//     
//     */
//    
//}
