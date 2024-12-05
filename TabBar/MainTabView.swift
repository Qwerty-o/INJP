//
//  MainTabView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 2/4/24.
//

import SwiftUI

struct MainTabView: View {
    
//    @State var currentTab: Tab = .home
//    
//    init() {
//        UITabBar.appearance().isHidden = true     }
//    
//    @Namespace var animation
//    
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem { Label("Home", systemImage: "house")}
                
            InsightsView()
                .tabItem { Label("Insights", systemImage: "star") }

            TrackingView()
                .tabItem { Label("Track", systemImage: "calendar") }

            ProfileView()
                .tabItem { Label("Settings", systemImage: "gearshape") }

    }


    }
    
}

    #Preview {
            MainTabView()
    }
    
    
    
//    enum Tab: String, CaseIterable{
//        case home = "house"
//        case insights = "star"
//        case tracking = "moon"
//        case profile = "gearshape"
//        
//        var Tabname: String {
//            switch self {
//            case .home:
//                return "home"
//            case .insights:
//                return "insights"
//            case .tracking:
//                return "tracking"
//            case .profile:
//                return "profile"
//            }
//        }
//        
//        
//    }
//    
//    
//    
//    
//    extension View {
//        func getSafeArea() -> UIEdgeInsets {
//            guard let screen = UIApplication.shared.connectedScenes.first as?
//                    UIWindowScene else {
//                return .zero
//            }
//            guard let safeArea = screen.windows.first?.safeAreaInsets else{
//                return .zero
//            }
//            return safeArea
//        }
//    }
//    
//    struct MaterialEffect: UIViewRepresentable {
//        var style: UIBlurEffect.Style
//        
//        func makeUIView(context: Context) -> UIVisualEffectView {
//            let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
//            
//            return view
//        }
//        
//        func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
//            
//        }
//        
//    }
//

//        TabView(selection: $currentTab) {
//
//            HomeView()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background()
//                .tag (Tab.home)
//
//            InsightsView()
//                  .frame(maxWidth: .infinity, maxHeight: .infinity)
//                  .background()
//                  .tag (Tab.insights)
//
//            TrackingView()
//                  .frame(maxWidth: .infinity, maxHeight: .infinity)
//                  .background()
//
//                  .tag (Tab.tracking)
//            ProfileView()
//                  .frame(maxWidth: .infinity, maxHeight: .infinity)
//                  .background()
//                  .tag (Tab.profile)
//
//
//        }
//        .overlay(
//            HStack(spacing: 0){
//                ForEach(Tab.allCases, id: \.rawValue) //button for each tab
//                {tab in
//                    TabButton(tab: tab)
//                }
//                .padding(.vertical)
//                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
//                .background(Color("csecondary"))
//            }
//            ,
//            alignment: .bottom
//
//        ) .ignoresSafeArea(.all, edges: .bottom)
//
//    }
//    func TabButton(tab: Tab) -> some View {
//        GeometryReader{ proxy in
//            Button(action: {
//                withAnimation(.spring()) {
//                    currentTab = tab
//                }
//            }, label: {
//                VStack(spacing: 0){
//                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill": tab.rawValue)
//                        .resizable()
//                        .foregroundColor(Color(.white))
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 25, height: 25)
//                        .frame(maxWidth: . infinity)
//                        .background(
//                            ZStack{
//                                if currentTab == tab {
//                                    Color("csecondary")
//                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                                       // .matchedGeometryEffect(id: Tab, in: animation)
//                                    Text(tab.Tabname)
//                                        .foregroundColor(.white)
//                                        .font(.footnote)
//                                        .padding(.top, 60)
//                                }
//                            }
//                        ).contentShape(Rectangle())
//                        .offset(y: currentTab == tab ? -15 : 0)
//                }
//            })
//
    
//}
//        .frame(height: 25)
