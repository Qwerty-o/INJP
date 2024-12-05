//
//  ItsNotJustaPhaseApp.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 1/29/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth// we can have to configure this

@main

 struct ItsNotJustaPhaseApp: App {
    @StateObject var viewModel = AuthViewModel()//only initialized in one place so we're not creating a lot of instances
  //  @StateObject private var manager: DataManager = DataManager()
    @StateObject var user = UserModel(id: "", fullname: "", email: "", password: "", lastPeriodStartDate: "", averageCycleLength:0)
    init() {
        FirebaseApp.configure()
    }
    
    //MARK: - main rendering function
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(user)
           //     .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
