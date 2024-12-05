//
//  lutealHormonesView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 3/31/24.
//
//MARK: finish this

import SwiftUI

struct lutealHormonesView: View {
    @Environment(\.dismiss) private var dismiss
    let lutealHormonesImageNames = ["lutealhormones-1", "lutealhormones-2", "lutealhormones-3", "lutealhormones-4"]
    
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
                Text("Luteal Phase Hormones Guide")
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
                            ForEach(lutealHormonesImageNames.prefix(2), id: \.self) { imageName in
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
                            ForEach(lutealHormonesImageNames.suffix(2), id: \.self) { imageName in
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
                    
                    Text("The luteal phase, lasting roughly 14 days after ovulation, is a hormonal rollercoaster leading up to either pregnancy or menstruation. Understanding the key players in this hormonal orchestra can help you navigate the physical and emotional changes you might experience during this time.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Progesterone")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("ArialRoundedMTBold", size: 30))
                    
                    Text("Following ovulation, the empty follicle transforms into the corpus luteum, the star of the luteal phase. This temporary gland produces a surge of progesterone, the hormone responsible for preparing the endometrium for a potential pregnancy. Progesterone stimulates the thickening of the uterine lining, creating a rich and nurturing environment for a fertilized egg to implant. This thickening can sometimes manifest as mild cramping or a feeling of heaviness in the lower abdomen. ")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("While progesterone takes the lead, estrogen remains on the scene. However, its levels decline gradually compared to progesterone's rise. This hormonal shift can contribute to some of the emotional and physical changes experienced during the luteal phase. Additionally, other hormones, like prolactin, may increase, further impacting your body.")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("How hormones affect us?")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("ArialRoundedMTBold", size: 30))
                    
                        Text("**Physical Changes:** The rise in progesterone can lead to breast tenderness and swelling as it prepares breasts for milk production. Fluid retention caused by hormonal fluctuations can also contribute to bloating. \n\n**Mood Swings and Food Cravings:** The interplay of progesterone and estrogen can lead to fluctuations in brain chemicals like serotonin, influencing mood and causing irritability, anxiety, or feelings of sadness (PMS symptoms). Additionally, blood sugar variations due to hormonal changes can trigger cravings for sugary or high-carbohydrate foods. \n\n**Fatigue and Sleep Disruptions:** The hormonal shifts can affect sleep quality, leading to fatigue and difficulty concentrating.:")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("GillSans", size: 20))
                    
                    Text("Here are some tips: ")
                        .lineSpacing(10)
                        .padding(10)
                        .font(.custom("ArialRoundedMTBold", size: 30))
                    
                        Text("**Do:** Choose anti-inflammatory foods rich in omega-3 fatty acids and antioxidants to combat bloating and discomfort. Opt for complex carbohydrates like whole grains or legumes for sustained energy, minimizing cravings and mood swings. Prioritize sleep hygiene practices to ensure restful sleep. \n\n **Don't:** Avoid processed foods, fried foods, and excessive salt, which can worsen bloating. Limit caffeine and alcohol, as they can disrupt sleep and exacerbate mood swings. Don't ignore your body's signals for rest and relaxation.")
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
    lutealHormonesView()
}
