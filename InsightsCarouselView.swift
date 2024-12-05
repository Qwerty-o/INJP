//
//  InsightsCarouselView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 3/27/24.
//

import SwiftUI


/*
 this page is an abstraction for the carousel views for the insights page
 */


struct InsightsCarouselView: View {
    
    var images = [
        "menstrualengthergy-1",
        "menstrualengthergy-2",
        "menstrualengthergy-3",
        "menstrualengthergy-4",
        ]
    
    //, showsIndicators: true
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach (images, id: \.self) { image in
                    Image(image)
                        .resizable ()
                        .scaledToFill()
                }
            }
            .tabViewStyle(.page)
        }
    }
}

#Preview {
    InsightsCarouselView()
}
