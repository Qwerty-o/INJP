//
//  TrackingView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 3/8/24.
//
import SwiftUI

struct TrackingView: View {
    let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    let totalDays = Array(1...30) // Example for a month with 30 days
    @State private var highlightedDays = Set<Int>()

    var body: some View {
        VStack{
                            Text("Please track your period here")
                                .padding(.bottom, 50)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(.bold)
                                .font(.custom("ArialRoundedMTBold", size: 30))
            // Weekday headers
            HStack {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                }
            }
            // Days grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(totalDays, id: \.self) { day in
                    Text("\(day)")
                        .frame(width: 40, height: 40)
                        .background(highlightedDays.contains(day) ? Color.blue : Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .onTapGesture {
                            toggleDay(day)
                        }
                }
            }
        }
        .padding()
    }

    private func toggleDay(_ day: Int) {
        if highlightedDays.contains(day) {
            highlightedDays.remove(day)
        } else {
            highlightedDays.insert(day)
        }
    }
}

#Preview {
    TrackingView()
}
