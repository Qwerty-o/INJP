//
//  follicularBodyView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 2/21/24.
//
//MARK: finish this

import SwiftUI

struct follicularBodyView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        let images = [
            "menstrualengthergy-1",
            "menstrualengthergy-2",
            "menstrualengthergy-3",
            "menstrualengthergy-4",
        ]
        
        
        
        ScrollView(.vertical, showsIndicators: true) {
            
            ZStack(alignment: .topLeading) {
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack(alignment: .bottom, spacing: 20) {
                        ForEach (images, id: \.self) { image in
                            Image(image)
                                .resizable ()
                                .scaledToFill()
                        }
                    }
                    .frame(height: 220)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .tabViewStyle(.page)
                }
                .defaultScrollAnchor(.center)
                
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(.trailing, 60)
                        .padding(.bottom, 15)                }
                
            }
            
            //}
            Text("how does the follicular phase affect your body?")
                .fontWeight(.bold)
                          .font(.title)  // Larger and bolder for main heading
                          
                .padding(.top, 10)
                .font(.custom("ArialRoundedMTBold", size: 30))
            
            
            Spacer()
            
            VStack{
                Text("Your period is like a monthly reset button for your body. The first part of this reset, called the follicular phase, happens right after your period starts and lasts until you ovulate (release an egg).")
                    .padding(.bottom, 30)
                    .foregroundColor(.black) // Black text for better contrast

                
                Text("During this time, your body's getting ready for a possible pregnancy, but even if you're not trying to get pregnant, the follicular phase has some cool effects!")
                    .padding(.bottom, 30)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Feeling Supercharged")
                        .font(.title2)  // Slightly larger for subheadings
                                    .fontWeight(.semibold)
                    
                    
                    Text("Ever notice you have more energy in the days after your period? That's thanks to a hormone called estrogen that starts rising during the follicular phase. This extra estrogen makes you feel more awake and focused, kind of like having a built-in energy booster! It might even make you want to try a new sport or activity – go for it!")
                        .padding(.bottom, 30)
                        
                }
                
                VStack {
                    Text("Glowing Skin and Hair:")
                        .font(.subheadline)  // Slightly larger for subheadings
                                    .fontWeight(.semibold)
                    Text("Estrogen is like a friend to your skin and hair too. As its levels rise, it helps your body make more collagen, a protein that keeps your skin plump and bouncy. It also tells your scalp to produce more natural oils, which keeps your hair hydrated and shiny. So, you might notice your skin looking clearer and your hair feeling thicker and stronger during this time.")
                        .padding(.bottom, 30)
                }
                
                VStack {
                    Text("Food Cravings:")
                        .font(.subheadline)  // Slightly larger for subheadings
                                    .fontWeight(.semibold)
                    Text("Estrogen can also make you feel a bit hungrier, especially for carbs like bread, pasta, and sweets. It's your body's way of saying it needs a little extra fuel. But remember, just like a car, your body runs best on a mix of healthy foods. Choose whole grains, fruits, and veggies along with some protein to keep you feeling full and energized.")
                }
                .padding(.bottom, 30)
                
                VStack {
                    
                    Text("Mood Swings (Maybe):")
                        .font(.subheadline)  // Slightly larger for subheadings
                                    .fontWeight(.semibold)
                    Text("Some girls experience mood swings during the follicular phase, feeling happy and outgoing one day and a little grumpy the next. This is because your hormones are changing, and it can affect your mood a bit. But don't worry, these mood swings are usually small and temporary.")
                        .padding(.bottom, 30)
                }
                
                Text("The important thing to remember is that everyone's body is different, and what you experience during the follicular phase might be different from your friends. Pay attention to how you feel during this time and find ways to make the most of your energy levels and healthy hair and skin!")
            }
            .lineSpacing(7)
            .padding()
            .frame(width: 390, alignment: .center)
            
            
            
            
        }
        
        
         .ignoresSafeArea()
    }
    
}


#Preview {
    follicularBodyView()
}
