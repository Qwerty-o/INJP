//
//  lutealBodyView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 3/31/24.
//
//MARK: finish this

import SwiftUI

struct lutealBodyView: View {
    @Environment(\.dismiss) private var dismiss
    let lutealBodyImageNames = ["lutealbody-1", "lutealbody-2", "lutealbody-3", "lutealbody-4"]
    
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
                            ForEach(lutealBodyImageNames.prefix(2), id: \.self) { imageName in
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
                            ForEach(lutealBodyImageNames.suffix(2), id: \.self) { imageName in
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
                    
                    Text("The luteal phase, lasting roughly 14 days after ovulation, is the final act in the menstrual cycle play. During this phase, the body undergoes a series of physical and hormonal changes in preparation for a potential pregnancy. If pregnancy doesn't occur, the stage is set for menstruation to begin.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Physical Symptoms")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("ArialRoundedMTBold", size: 30))
                    
                    Text("Following ovulation, the empty follicle left behind transforms into the corpus luteum, a temporary gland. The corpus luteum produces progesterone, the hormone that plays a starring role in this phase. Progesterone acts on the endometrium, thickening its lining and preparing it to nourish a fertilized egg. This thickening can sometimes manifest as mild abdominal cramping or a feeling of heaviness in the lower abdomen ")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Other physical changes you might experience include breast tenderness and swelling. This is due to the combined effects of progesterone and estrogen, which can make breasts feel sore or lumpy. Additionally, some women experience bloating during the luteal phase, caused by hormonal fluctuations and fluid retention.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Emotional Symptoms")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("ArialRoundedMTBold", size: 30))
                    
                        Text("The hormonal shifts during the luteal phase can also have a significant impact on mood and emotions. Many women experience a phenomenon known as Premenstrual Syndrome (PMS) during this time. PMS symptoms can vary from person to person but may include:")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("**Mood swings:** Fluctuations in estrogen and progesterone can lead to irritability, anxiety, or feelings of sadness. \n **Changes in appetite:** Food cravings, particularly for sugary or salty foods, can arise due to hormonal changes and blood sugar level variations. \n **Difficulty concentrating:** Hormonal fluctuations can impact focus and cognitive function, making it harder to concentrate or complete tasks. \n **Sleep disturbances:** Difficulty falling asleep, staying asleep, or experiencing restless sleep are common occurrences for some women during the luteal phase.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    //WORKS CITED

                    Section{
                        VStack{
                            Text("If you want to know more, please visit these links: ")
                                .lineSpacing(10)
                                .padding(10)
                                .font(.custom("ArialRoundedMTBold", size: 20))
                                .fontWeight(.heavy)
                                .multilineTextAlignment(.center)

                            
                            Link("- Better Healthy: Menstrual Cycle  \n\n",
                                  destination: URL(string: "https://www.betterhealth.vic.gov.au/health/conditionsandtreatments/menstrual-cycle")!)
                            
                            Link("- About periods | The Royal Women's Hospital \n",
                                  destination: URL(string: "https://www.thewomens.org.au/health-information/periods/periods-overview/about-periods")!)
                            
                            Link(" - Menstrual cramps - Symptoms & causes - Mayo Clinic \n",
                                  destination: URL(string: "https://www.mayoclinic.org/diseases-conditions/menstrual-cramps/symptoms-causes/syc-20374938")!)
                            
                            Link(" - Menstrual Pain Facts & Stats | Haleon HealthPartner \n",
                                  destination: URL(string: "https://www.haleonhealthpartner.com/en-us/pain-relief/conditions/menstrual-pain/facts-stats/")!)
                            
                            Link(
                                " - HOW TO REDUCE BLOATING DURING PERIODS - Dr Omar Gailani \n",
                                  destination: URL(string:
                                                    "https://www.omargailani.com.au/blog/how-to-reduce-bloating-during-periods-13625/")!)
                            
                            Link(
                                " - Menstrual Migraines (Hormone Headaches) - Cleveland Clini \n",
                                  destination: URL(string:
                                                    "https://my.clevelandclinic.org/health/diseases/8260-menstrual-migraines-hormone-headaches")!)
                            Link(
                                " - The Menstrual Cycle and Mental Health - American Psychiatric Association \n",
                                  destination: URL(string:
                                                    "https://www.psychiatry.org/news-room/apa-blogs/the-menstrual-cycle-and-mental-health-concerns")!)
                            Link(
                                " - Menstrual Related Mood Disorders - UNC School of Medicine \n",
                                  destination: URL(string:
                                                    "https://www.med.unc.edu/psych/wmd/resources/mood-disorders/menstrually-related/")!)
                            Link(
                                " - Premenstrual syndrome (PMS) - Better Health Channel \n",
                                  destination: URL(string:
                                                    "https://www.betterhealth.vic.gov.au/health/conditionsandtreatments/premenstrual-syndrome-pms")!)
                            Link(
                                " - Food cravings: Causes and how to reduce and replace cravings - Medical News Today \n",
                                  destination: URL(string:
                                                    "https://www.medicalnewstoday.com/articles/318441")!)
                        }
                    }
                    
                    
                }
            }
        }
        
    }
    
    
}
#Preview {
    lutealBodyView()
}
