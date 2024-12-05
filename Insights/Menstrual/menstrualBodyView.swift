//
//  menstrualBodyView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 3/29/24.
//
//FIXME: see why its not scrolling
import SwiftUI

struct menstrualBodyView: View {
    @Environment(\.dismiss) private var dismiss
    let menstrualBodyImageNames = ["lutealfood-1", "lutealfood-2", "lutealfood-3", "lutealfood-4"]
    
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
                            ForEach(menstrualBodyImageNames.prefix(2), id: \.self) { imageName in
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
                            ForEach(menstrualBodyImageNames.suffix(2), id: \.self) { imageName in
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
                    
                    Text("Menstruation, a natural part of the female reproductive cycle, involves a complex interplay between hormones and physical changes. Here's a breakdown of what happens in the body during this time.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Physical Symptoms")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("ArialRoundedMTBold", size: 30))
                    
                    Text("The most noticeable physical symptom is vaginal bleeding. This occurs as the lining of the uterus (endometrium), which thickens in preparation for a potential pregnancy, sheds if no fertilization takes place. The bleeding can last anywhere from 2-7 days and vary in heaviness. ")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Many women experience cramps during menstruation. These cramps are caused by uterine contractions as it sheds its lining. The pain can range from mild discomfort to severe cramping, often felt in the lower abdomen and radiating to the lower back. \n\n Other common physical symptoms include bloating, caused by hormonal fluctuations leading to fluid retention. Breasts may also feel tender or swollen due to these hormonal changes. Headaches and fatigue are frequent occurrences as well, linked to the shifting hormonal balance.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Mental Symptoms")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("ArialRoundedMTBold", size: 30))
                    
                        Text("The hormonal changes associated with menstruation can also impact mental well-being. Mood swings are a prevalent symptom, with some women experiencing irritability, anxiety, or feelings of sadness. This is often referred to as Premenstrual Syndrome (PMS). \n\n Food cravings, particularly for sugary or salty foods, can arise due to hormonal shifts and fluctuations in blood sugar levels. Difficulty concentrating and sleep disturbances are also common complaints during menstruation. These can manifest as trouble falling asleep, staying asleep, or experiencing restless sleep.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Every person experiences menstruation differently. Listen to your body and adjust your diet and lifestyle as needed. Consult a healthcare professional or registered dietitian for personalized guidance.")
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
    menstrualBodyView()
}
