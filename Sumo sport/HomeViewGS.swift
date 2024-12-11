


import SwiftUI

struct HomeViewSS: View {
    @AppStorage("secondsWaste") var secondsWaste = 0
    @AppStorage("wasTrained") var wasTrained = false
    
    @AppStorage("favourite") var favourite = ""
    
    var egetg = "wrgver"
    var eufncergeier = 25242524
    func wrgw() -> Float {
        return 432355
    }
    func wrtwr() {
        print("wrfwrtgwrr3")
    }
    
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    NavigationLink {
                        TrainingViewSS(sportType: .cricket)
                    } label: {
                        Image("cricket.label")
                            .overlay {
                                Image("block.label")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(wasTrained ? 1: 0)
                            }
                    }.disabled(wasTrained)
                    
                    NavigationLink {
                        TrainingViewSS(sportType: .football)
                    } label: {
                        Image("football.label")
                            .overlay {
                                Image("block.label")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(wasTrained ? 1: 0)
                            }
                    }.disabled(wasTrained)
                    
                    NavigationLink {
                        TrainingViewSS(sportType: .basketball)
                    } label: {
                        Image("basketball.label")
                            .overlay {
                                Image("block.label")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(wasTrained ? 1: 0)
                            }
                    }.disabled(wasTrained)
                    
                    NavigationLink {
                        TrainingViewSS(sportType: .volleyball)
                    } label: {
                        Image("volleyball.label")
                            .overlay {
                                Image("block.label")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(wasTrained ? 1: 0)
                            }
                    }.disabled(wasTrained)
                    
                    NavigationLink {
                        TrainingViewSS(sportType: .rugby)
                    } label: {
                        Image("rugby.label")
                            .overlay {
                                Image("block.label")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(wasTrained ? 1: 0)
                            }
                    }.disabled(wasTrained)
                }.padding(.horizontal, 8)

            }.padding(.horizontal, -12)
                .padding(.top)
                .scrollIndicators(.hidden)
            
            NavigationLink {
                TrainingViewSS(sportType: SportTypes(rawValue: favourite) ?? .basketball )
            } label: {
                Image("favourite.workout")
            }.padding(.vertical)
                .disabled(favourite == "")
                .grayscale(favourite == "" ? 1 : 0)
            
            ScrollView {
                statsView
                    .padding(.top, isSE ? 12: 30)
                    .padding(.bottom)
            }.gradientTopAndBottom()
                .scrollIndicators(.hidden)
                .padding(.top, -15)
            Spacer()
            
        }
    }
    
    private var statsView: some View {
        VStack(spacing: isSE ? 12: 20) {
            VStack {
                Image("workouts.label")
                Image("homefield.label")
                    .overlay {
                        Text(wasTrained ? "1": "0")
                            .withFont(size: 22.66, weight: .regular)
                    }
            }
            
            VStack {
                Image("workouttime.label")
                Image("homefield.label")
                    .overlay {
                        Text("\(secondsWaste / 60) min")
                            .withFont(size: 22.66, weight: .regular)
                    }
            }
            
            VStack {
                Image("lastworkout.label")
                Image("homefield.label")
                    .overlay {
                        Text(wasTrained ? formattedDateString(): "-")
                            .withFont(size: 22.66, weight: .regular)
                    }
            }
            
            VStack {
                Image("rating.label")
                Image("homefield.label")
                    .overlay {
                        Text(wasTrained ? "987/1000": "-/1000")
                            .withFont(size: 22.66, weight: .regular)
                    }
            }
        }
    }
}

#Preview {
    ContentViewSS(showLoading: false, selectedTab: .home)
}


enum Sports: String {
    case cricket = "Cricket"
    case football = "Football"
    case volleyball = "Volleyball"
    case basketball = "Basketball"
    case rugby = "Rugby"
    case fitness = "Fitness"
    case yoga = "Yoga"
    case pilates = "Pilates"
    case stretch = "Stretch"
}
