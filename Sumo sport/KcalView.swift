

import SwiftUI

struct KcalView: View {
    @AppStorage("kkcal") var kkcal = 0
    @State var showSheet = false
    
    @AppStorage("userAge") var userAge = 0
    @AppStorage("userWeight") var userWeight = 0
    
    @State var userAgeString = ""
    @State var userWeightString = ""
    
    @State var lifestyle = 0
    @State var sportgoal = 0
    
    var body: some View {
    
        VStack {
            if kkcal == 0 {
                onboardView
            } else {
                HStack {
                    Text("Recommended daily calories per day:")
                        .withFont(size: 25, weight: .regular)
                        .padding(.trailing, 50)
                    
                    Spacer()
                    
                    Button {
                        showSheet = true
                    } label: {
                        Image("profile.link")
                    }
                }
                
                HStack(alignment: .bottom) {
                    Image("kcal.bg")
                        .overlay {
                            VStack {
                                Text("Calories")
                                    .withFont(size: 22, weight: .medium)
                                Spacer()
                                
                                Text(String(kkcal))
                                    .withFont(size: 23, weight: .thin, color: .black)
                                    .padding(.bottom, 25)
                            }
                        }
                    
                    Image("kcal.bg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay {
                            VStack {
                                Text("Fat")
                                    .withFont(size: 22, weight: .medium)
                                    .padding(.top, 3)
                                
                                Spacer()
                                
                                Text("\(Int(Double(kkcal / 4) * 0.2))gr")
                                    .withFont(size: 23, weight: .thin, color: .black)
                                    .padding(.bottom, 20)
                            }
                        }
                    
                    Image("kcal.bg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay {
                            VStack {
                                Text("Protein")
                                    .withFont(size: 22, weight: .medium)
                                    .padding(.top, 3)
                                Spacer()
                                
                                Text("\(Int(Double(kkcal / 4) * 0.3))gr")
                                    .withFont(size: 23, weight: .thin, color: .black)
                                    .padding(.bottom, 20)
                            }
                        }
                    
                    Image("kcal.bg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay {
                            VStack {
                                Text("Carbs")
                                    .withFont(size: 22, weight: .medium)
                                    .padding(.top, 3)
                                Spacer()
                                
                                Text("\(Int(Double(kkcal / 4) * 0.5))gr")
                                    .withFont(size: 23, weight: .thin, color: .black)
                                    .padding(.bottom, 20)
                            }
                        }
                }
                
                
                Image("kcal.table")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(alignment: .bottom) {
                        HStack {
                            Text("\(userWeight) kg")
                                .withFont(size: 23, weight: .medium)
                            
                            Spacer()
                            
                            Text("\(formattedDateString())")
                                .withFont(size: 23, weight: .regular)
                            
                            Spacer()
                            
                            Text("0%")
                                .withFont(size: 23, weight: .regular)
                        }.padding(.horizontal, 30)
                            .padding(.bottom, 10)
                    }
                
                Spacer()
            }
        }.sheet(isPresented: $showSheet) {
            ProfileViewSS()
                .presentationDetents([.fraction(0.9)])
        }
    }
    
    private var onboardView: some View {
        ScrollView {
            VStack {
                VStack {
                    Text("Age")
                        .withFont(size: 22, weight: .regular)
                        .padding(.horizontal)
                    TextField("Your Age...", text: $userAgeString)
                        .padding(.horizontal)
                        .padding(.vertical, 14)
                        .background {
                            Color.hex("0D0550")
                        }
                        .cornerRadius(12)
                }
                
                VStack {
                    Text("Weight")
                        .withFont(size: 22, weight: .regular)
                        .padding(.horizontal)
                    
                    TextField("Your Weight...", text: $userWeightString)
                        .padding(.horizontal)
                        .padding(.vertical, 14)
                        .background {
                            Color.hex("0D0550")
                        }
                        .cornerRadius(12)
                }
                
                
                
                VStack {
                    Text("Lifestyle")
                        .withFont(size: 26, weight: .light)
                    
                    VStack {
                        Button {
                            lifestyle = 1
                        } label: {
                            Image("kcal.chek.field")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay {
                                    Text("Moderate")
                                        .withFont(size: 22.5, weight: .thin)
                                }
                                .overlay(alignment: .leading) {
                                    Image("kcal.chek.\(lifestyle == 1 ? "on": "off")")
                                        .padding(.leading)
                                }
                        }.frame(width: screen.width * 0.7)
                        
                        Button {
                            lifestyle = 2
                        } label: {
                            Image("kcal.chek.field")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay {
                                    Text("Higth")
                                        .withFont(size: 22.5, weight: .thin)
                                }
                                .overlay(alignment: .leading) {
                                    Image("kcal.chek.\(lifestyle == 2 ? "on": "off")")
                                        .padding(.leading)
                                }
                        }.frame(width: screen.width * 0.7)
                        
                        Button {
                            lifestyle = 3
                        } label: {
                            Image("kcal.chek.field")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay {
                                    Text("Very Low")
                                        .withFont(size: 22.5, weight: .thin)
                                }
                                .overlay(alignment: .leading) {
                                    Image("kcal.chek.\(lifestyle == 3 ? "on": "off")")
                                        .padding(.leading)
                                }
                        }.frame(width: screen.width * 0.7)
                        
                        Button {
                            lifestyle = 4
                        } label: {
                            Image("kcal.chek.field")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay {
                                    Text("Intense")
                                        .withFont(size: 22.5, weight: .thin)
                                }
                                .overlay(alignment: .leading) {
                                    Image("kcal.chek.\(lifestyle == 4 ? "on": "off")")
                                        .padding(.leading)
                                }
                        }.frame(width: screen.width * 0.7)
                    }
                }
                
                VStack {
                    Text("Spoart goal")
                        .withFont(size: 26, weight: .light)
                    
                    Button {
                        sportgoal = 1
                    } label: {
                        Image("kcal.chek.field")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay {
                                Text("Weight again")
                                    .withFont(size: 22.5, weight: .thin)
                            }
                            .overlay(alignment: .leading) {
                                Image("kcal.chek.\(sportgoal == 1 ? "on": "off")")
                                    .padding(.leading)
                            }
                    }.frame(width: screen.width * 0.7)
                        
                    Button {
                        sportgoal = 2
                    } label: {
                        Image("kcal.chek.field")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay {
                                Text("Retention")
                                    .withFont(size: 22.5, weight: .thin)
                            }
                            .overlay(alignment: .leading) {
                                Image("kcal.chek.\(sportgoal == 2 ? "on": "off")")
                                    .padding(.leading)
                            }
                    }.frame(width: screen.width * 0.7)
                    
                    Button {
                        sportgoal = 3
                    } label: {
                        Image("kcal.chek.field")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay {
                                Text("Weight loss")
                                    .withFont(size: 22.5, weight: .thin)
                            }
                            .overlay(alignment: .leading) {
                                Image("kcal.chek.\(sportgoal == 3 ? "on": "off")")
                                    .padding(.leading)
                            }
                    }.frame(width: screen.width * 0.7)
                }
                
                
                Button {
                    guard chekAnswers() else { return }
                    
                    UserDefaults.standard.set(Int(userAgeString) ?? 0, forKey: "userAge")
                    UserDefaults.standard.set(Int(userWeightString) ?? 0, forKey: "userWeight")
                    
                    calculateCalories()
                } label: {
                    Text("Next")
                        .withFont(size: 18, weight: .medium, color: .hex("2E023F"))
                        .padding(.vertical, 11)
                        .padding(.horizontal, 30)
                        .background(Color.hex("FEE600"))
                        .cornerRadius(13.17)
                }.disabled(!chekAnswers())
                    .grayscale(!chekAnswers() ? 1: 0)
                    .padding(.top)
            }
        }
    }
    
    func chekAnswers() -> Bool {
        guard lifestyle != 0 else { return false }
        guard sportgoal != 0 else { return false }
        guard Array(1...99).contains(Int(userAgeString) ?? 0) else { return false }
        guard Array(1...300).contains(Int(userWeightString) ?? 0) else { return false }
        return true
    }
    
    func calculateCalories()  {
        guard let age = Int(userAgeString), let weight = Double(userWeightString) else {
            return
        }
        
        // Базова метаболічна швидкість (BMR)
        let bmr = 66.4730 + (13.7516 * weight) + (5.0033 * 175) - (6.7550 * Double(age))// Приблизна формула для чоловіка з фіксованим зростом 170 см
        
        // Коефіцієнт активності
        let activityMultiplier: Double
        switch lifestyle {
        case 1: activityMultiplier = 1.2 // Moderate
        case 2: activityMultiplier = 1.375 // High
        case 3: activityMultiplier = 1.1 // Very low
        case 4: activityMultiplier = 1.55 // Intense
        default: activityMultiplier = 1.0
        }
        
        // Корекція для спортивної цілі
        let goalMultiplier: Double
        switch sportgoal {
        case 1: goalMultiplier = 1.1 // Набір ваги
        case 2: goalMultiplier = 1.0 // Утримання ваги
        case 3: goalMultiplier = 0.9 // Схуднення
        default: goalMultiplier = 1.0
        }
        
        // Остаточний розрахунок калорій
        let dailyCalories = bmr * activityMultiplier * goalMultiplier
        kkcal = Int(dailyCalories)
    }
    
}

#Preview {
    ContentViewSS(showLoading: false, selectedTab: .profile)
}
