//
//  menstrualHormonesView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 3/29/24.
//
//MARK: finish this
import SwiftUI

struct menstrualHormonesView: View {
    @Environment(\.dismiss) private var dismiss
    let menstrualHormonesImageNames = ["menstrualhormones-1", "menstrualhormones-2", "menstrualhormones-3", "menstrualhormones-4"]
    
    var body: some View {
        NavigationStack {
            HStack(alignment:.center) {
                // Button
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundColor(.cprimary)
                    //                        .background {
                    //                            Circle()
                    //                                .fill(.white)
                    //                                .frame(width: 150, height:150)
                    //                        }
                        .padding(.trailing, 75)
                        .padding(.bottom, 20)
                }
                
                // Text - Main Heading
                Text("Menstrual Phase Body Guide")
                    .font(.custom("ArialRoundedMTBold", size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.csecondary)
                    .font(.title) // Larger and bolder for main heading
                    .padding(.init(top: 10, leading: 20, bottom: 20, trailing: 10))
                //TODO: change the font
                
            }
            
            // Scrollable Text Content
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    // Image Grid Section
                    VStack(spacing: 10) {
                        HStack(spacing: 10) { // First row of images
                            ForEach(menstrualHormonesImageNames.prefix(2), id: \.self) { imageName in
                                ZStack(alignment: .center) { // Center content within ZStack
                                    VStack { // Use VStack for vertical centering
                                        Spacer()
                                        Image(imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .clipped()
                                            .overlay( // Add rounded corners or border (optional)
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                            )
                                        Spacer()
                                    }
                                }
                            }
                        }
                        
                        HStack(spacing: 10) { // Second row of images
                            ForEach(menstrualHormonesImageNames.suffix(2), id: \.self) { imageName in
                                ZStack(alignment: .center) { // Center content within ZStack
                                    VStack { // Use VStack for vertical centering
                                        Spacer()
                                        Image(imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .clipped()
                                            .overlay( // Add rounded corners or border (optional)
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                            )
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    
                    Text("Estrogen and progesterone are the two main hormones influencing the menstrual cycle. During the first half of the cycle, **estrogen** takes center stage. It stimulates the growth of the endometrium, preparing the uterus for a potential pregnancy. As ovulation approaches, **progesterone** joins the show, working alongside estrogen to further thicken the endometrium and create a nurturing environment for a fertilized egg.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("If no pregnancy occurs, estrogen and progesterone levels plummet. This dramatic drop acts as the signal for the shedding of the endometrium, leading to menstrual bleeding. This hormonal shift is also linked to the physical and emotional symptoms often experienced during menstruation.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("How Hormones Affect Us:")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("ArialRoundedMTBold", size: 30))
                    
                    Text("**Cramps and Bloating**: The drop in progesterone weakens the uterine muscles, leading to cramping sensations. Estrogen also impacts water retention, contributing to bloating \n\n **Mood Swings and Food Cravings:** The hormonal fluctuations can disrupt brain chemicals like serotonin, influencing mood and causing irritability or anxiety.Additionally, fluctuating blood sugar levels due to hormonal changes can trigger cravings for sugary or high-carbohydrate foods. \n\n **Fatigue and Sleep Disruptions:** The hormonal shifts can affect sleep quality, leading to fatigue and difficulty concentrating.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Understanding how your hormones impact you during menstruation can help you navigate this time more effectively. **Here are some tips**")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("ArialRoundedMTBold", size: 27))
                    
                        Text("**Do:** Choose anti-inflammatory foods rich in omega-3 fatty acids and antioxidants to combat bloating and discomfort. Opt for complex carbohydrates to regulate blood sugar levels, minimizing cravings and mood swings. Prioritize sleep hygiene practices to ensure restful sleep. \n\n **Don't:** Avoid processed foods, fried foods, and excessive salt, which can worsen bloating. Limit caffeine and alcohol, as they can disrupt sleep and exacerbate mood swings. Don't ignore your body's signals for rest and relaxation.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Remember, every woman's experience is unique. Listen to your body and adjust your diet and lifestyle to find what works best for you. Consulting a healthcare professional can provide personalized advice based on your specific needs.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    //FIXME: add works cited for everything
                    
                    //WORKS CITED
                    
                    Section{
                        VStack{
                            Text("If you want to know more, please visit these links: ")
                            
                            Link("View Our Terms of Service",
                                  destination: URL(string: "https://www.example.com/TOS.html")!)
                        }
                    }
                }
            }
        }
        
    }
    
    
}
#Preview {
    menstrualHormonesView()
}
