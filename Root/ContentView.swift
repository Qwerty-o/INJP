//
//  ContentView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabView()
            }
            else {
                 LoginView() //if user isn't signed it then it will go to the login page
            }
        }
    }
}

#Preview {
    ContentView()
}
