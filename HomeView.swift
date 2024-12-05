//
//  HomeView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 2/4/24.
//

import SwiftUI
import Foundation
import UIKit

struct HomeView: View {
    @State private var lastPeriodStartDate: String = "2024-05-08" // Example date string, fetch this from your user data
    
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var user: UserModel
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var weekStore = WeekStore()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    
    var body: some View {
        VStack{
            
            if let user = viewModel.currentUser {
                Section {
                    let firstName = user.fullname.split(separator: " ").first ?? "Unknown"
                    Text("Hello, \(firstName)!")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 30)
                        .padding(.leading, 20)
                    
                    
                    
                    
                }
            }
            
            
            ZStack {
                ForEach(weekStore.allWeeks) { week in
                    VStack{
                        HStack {
                            ForEach(0..<7) { index in
                                VStack(spacing: 20) {
                                    Text(weekStore.dateToString(date: week.date[index], format: "E"))
                                        .font(.system(size:14))
                                        .fontWeight(.semibold)
                                        .frame(maxWidth:.infinity)
                                    
                                    Text(weekStore.dateToString(date: week.date[index], format: "d"))
                                        .font(.system(size:14))
                                        .frame(maxWidth:.infinity)
                                    
                                    if weekStore.isToday(date: week.date[index]) {  // Check for current day
                                        Circle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 5, height: 5)
                                            .offset(x: 0, y: 5) // Optional: Adjust circle position
                                    }
                                }
                                .disabled(true)
                                //                                .onTapGesture {
                                //                                    // Updating Current Day
                                //                                    weekStore.currentDate = week.date[index]
                                //                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .background(
                            Rectangle()
                                .fill(.usual)
                        )
                    }
                    .offset(x: myXOffset(week.id), y: 0)
                    .zIndex(1.0 - abs(distance(week.id)) * 0.1)
                    .padding(.horizontal, 20)
                }
            }
            .frame(maxHeight:.infinity , alignment : .top)
            .padding(.top, 20)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        draggingItem = snappedItem + value.translation.width / 400
                    }
                    .onEnded { value in
                        withAnimation {
                            if value.predictedEndTranslation.width > 0 {
                                draggingItem = snappedItem + 1
                            } else {
                                draggingItem = snappedItem - 1
                            }
                            snappedItem = draggingItem
                            
                            weekStore.update(index: Int(snappedItem))
                        }
                    }
            )
            
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ZStack {
                        Rectangle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(Color("#D2B48C"))
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading){
                            Image(systemName: "moon.stars.fill")
                                .padding(.bottom, 30)
                                .imageScale(.large)
                            Text("current cycle")
                                .font(.footnote)
                            
                            
                            Text("Day \(dayOfCycle(from: user.lastPeriodStartDate))")
                                .padding(.trailing, 60)
                                .font(.title3)
                                .fontWeight(.bold)
                            
                        }
                        
                        
                        
                        
                        Rectangle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(Color("#C4A484"))
                        
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading){
                            Image(systemName: "moon.stars.fill")
                                .padding(.bottom, 30)
                                .imageScale(.large)
                            Text("Period")
                                .font(.footnote)
                            
                            
                            Text("No")
                                .padding(.trailing, 60)
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        
                        Rectangle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(Color("#C19A6B"))
                            .cornerRadius(10)
                        VStack(alignment: .leading){
                            Image(systemName: "moon.stars.fill")
                                .padding(.bottom, 30)
                                .imageScale(.large)
                            Text("Phase")
                                .font(.footnote)
                            
                            
                            Text("Follicular")
                                .padding(.trailing, 60)
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        
                        Rectangle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(Color("#966919"))
                            .cornerRadius(10)
                        VStack(alignment: .leading){
                            Image(systemName: "moon.stars.fill")
                                .padding(.bottom, 30)
                                .imageScale(.large)
                            Text("chance of pregnancy")
                                .font(.footnote)
                            
                            
                            Text("low")
                                .padding(.trailing, 60)
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                    }
                }
            }
            Spacer()
        }
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(weekStore.allWeeks.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(weekStore.allWeeks.count) * distance(item)
        return sin(angle) * 200
    }
    func dayOfCycle(from startDateString: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Adjust this format to match the format of your date string
        guard let startDate = dateFormatter.date(from: startDateString) else {
            print("Error: Invalid date format")
            return 0 // Return 0 or handle error appropriately
        }
        
        let calendar = Calendar.current
        let today = Date()
        let components = calendar.dateComponents([.day], from: startDate, to: today)
        return (components.day ?? 0) + 1 // Adding 1 to make the count start from 1
    }
    
}
    
    extension Color {
        init(hex: String) {
            let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
            let rgbValue = UInt32(hex, radix: 16)
            let r = Double((rgbValue! & 0xFF0000) >> 16) / 255
            let g = Double((rgbValue! & 0x00FF00) >> 8) / 255
            let b = Double(rgbValue! & 0x0000FF) / 255
            self.init(red: r, green: g, blue: b)
        }
    }

#Preview {
    HomeView()
}
