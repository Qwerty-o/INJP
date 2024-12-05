//
//  AuthViewModel.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 1/31/24.
//
import Firebase
import Foundation
import FirebaseAuth
import FirebaseFirestore
//having lall the functionality related to our auhentication and users
//sending information to UI, handles networking for signing it users


@MainActor //so all Ui changes will be published to the main thread
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? //telling us whether or not the user is logged in, will tell app to go login or sign up view
    @Published var currentUser: User? //our user data model

    init(){
        self.userSession = Auth.auth().currentUser //going to check if there is a current user locgged in
        //bc firebase stores use info on local device(cache)
        
        Task {
            await fetchUser() //try to fetch user
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws { //async throws allows us to network in a better way than URL
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser() //if u dont call this then profile will be blank, there is no user. so u HAVE TO FETCH USER bc in profile view it only happens if there is a logged in user. u have to await to call the func, bc u have to sign in first so we can get the uid when they log in

        } catch {
            print("debug: failed to load in with error \(error.localizedDescription)")
        }
    }
    
    /*
     What the createUser func does is:
     1. asyncrous func
     can potentiall throw an error
    
     */
    
    
    func createUser(withEmail email: String, password: String, fullname: String, lastPeriodStartDate: String, averageCycleLength: Int) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)//create a user using the firebase code, we're awaiting that result and will store it
            self.userSession = result.user
            //result.user.uid is the firebase id
            let user = User(id: result.user.uid, fullname: fullname, email: email, password: password, lastPeriodStartDate: lastPeriodStartDate,  averageCycleLength: averageCycleLength) //create our own user object
             let encodedUser = try Firestore.Encoder().encode(user) //then encode the object thru codable protocol
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser) //then upload that date through firestore, this is how we uploaded the user infrmation to firebase(backend)
            await fetchUser()
            /*
             we want to put await fetchuser here because we need to wait for program to fetch user. reaons is bc once we create a user it will create a session, but wse need to fetch the data that we uploaded to firebase so it can properly show on screen.
             */
            
            
        } catch {
            print("DEBUG: failed to create user with error\(error.localizedDescription)") //if anything goes wrong this will print
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut() //signs out user on backend
            self.userSession = nil //wipes out user session and takes us back to login screen
            self.currentUser = nil //wipes out current user data model- so it's not sAVDED
        } catch {
            print("Debug: failed to sign out with error")
        }
    }
    
//    func updateLastPeriodlength(lastPeriodlength: String) async throws {
//        guard var user = currentUser else { return }
//
//        user.lastPeriodlength = lastPeriodlength
//
//        let encodedUser = try Firestore.Encoder().encode(user)
//        try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
//    }
//   
//    
//    func updateAvgPeriodView(avgPeriodlength: String) async throws {
//        guard var user = currentUser else { return }
//
//        user.avgPeriodlength = avgPeriodlength
//
//        let encodedUser = try Firestore.Encoder().encode(user)
//        try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
//    }
//    
//    
//    func updatecycleLength(cycleLength: String) async throws {
//        guard var user = currentUser else { return }
//
//        user.cycleLength = cycleLength
//
//        let encodedUser = try Firestore.Encoder().encode(user)
//        try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
//    }
//    
//    
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async{
        //to fetchuser we need to connect w firebase and get the properties we set up(email, name, etc)
        guard let uid = Auth.auth().currentUser?.uid else { return }

          do {
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            self.currentUser = try? snapshot.data(as: User.self)
          } catch {
            // Handle the error (e.g., print, log, show an alert)
            print("Error fetching user: \(error)")
          }
        }
//        guard let uid = Auth.auth().currentUser?.uid else {return} //gonna get current user UID
//        
//        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else{return} //we're doing guard since we're not doing catch therefore we have to wrap the optional
//        
//        self.currentUser = try? snapshot.data(as:User.self) //setting current user to that
//        /*
//         ERROR KEY:
//         Call can throw, but it is not marked with 'try' and the error is not handled: write try
//         Errors thrown from here are not handled: add ? after try
//         */
//        
//       //this will successfully print back the data, bc we conform to this codable protocol
//        
//        /*codable is basically allow us to get raw json data and map it into our data object
//        encoding is the oppoite of codable, it takes the user objects and encodes it to the json raw format
//        bc u have to only encode json data into firebase */
//        print("Debug: current user is \(String(describing: self.currentUser))")
//        
    }

