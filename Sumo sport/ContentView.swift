
import SwiftUI

struct ContentViewSS: View {
    @AppStorage("wasTrained") var wasTrained = false
    @State var showLoading = true
    @State var selectedTab: Tabs = .home
    
      var egetg = "wrgver"
    var eufncergeier = 25242524
    func wrgw() -> Float {
        return 432355
    }
    func wrtwr() {
        print("wrfwrtgwrr3")
    }
    
    var body: some View {
        ZStack {
            
            NavigationView {
                ZStack(alignment: .bottom) {
                    VStack {
                        topBar
                        
                        Group {
                            switch selectedTab {
                            case .home:
                                HomeViewSS()
                            case .profile:
                                KcalView()
                            case .quotes:
                                QuotesViewSS()
                            case .stretch:
                                DayliStrerchView()
                            }
                        }
                        
                        tapBar
                            
                    }.background(2)
                        .ignoresSafeArea(.keyboard)
                   
                }
            }
            
            OnboardingViewSS()
            
            LoadingViewSS(showView: $showLoading)
                .opacity(showLoading ? 1: 0)
                .onChange(of: showLoading) { newValue in
                    AppDelegate.orientationLock = .portrait
                }
        }
    }
    
    private var topBar: some View {
        HStack {
            Text(wasTrained ? "Training rate: 3/10": "Training rate: -/10")
                .withFont(size: 14.2, weight: .light)
                .frame(width: 130)

            Spacer()
            
            Text(formattedDateString())
                .withFont(size: 14.2, weight: .light)
        }
    }
    private var tapBar: some View {
        HStack {
            Button {
                withAnimation {
                    selectedTab = .home
                }
            } label: {
                ZStack {
                    if selectedTab == .home {
                        Circle()
                            .foregroundColor(.white)
                            .frame(height: 57)
                            .transition(.scale)
                    } else {
                        Circle()
                            .foregroundColor(.white)
                            .frame(height: 57)
                            .opacity(0)
                    }
                    
                    Image("tab 1")
                        .renderingMode(.template)
                        .offset(y: 3)
                        .foregroundColor(selectedTab == .home ? .hex("0D0550"): .white)
                }
            }
            
            Spacer()
            
            Button {
                withAnimation {
                    selectedTab = .profile
                }
            } label: {
                ZStack {
                    if selectedTab == .profile {
                        Circle()
                            .foregroundColor(.white)
                            .frame(height: 57)
                            .transition(.scale)
                    } else {
                        Circle()
                            .foregroundColor(.white)
                            .frame(height: 57)
                            .opacity(0)
                    }
                    
                    Image("tab 2")
                        .renderingMode(.template)
                        .offset(y: 3)
                        .foregroundColor(selectedTab == .profile ? .hex("0D0550"): .white)
                    
                }
            }
            
            Spacer()
            
            Button {
                withAnimation {
                    selectedTab = .quotes
                }
            } label: {
                ZStack {
                    if selectedTab == .quotes {
                        Circle()
                            .foregroundColor(.white)
                            .frame(height: 57)
                            .transition(.scale)
                    } else {
                        Circle()
                            .foregroundColor(.white)
                            .frame(height: 57)
                            .opacity(0)
                    }
                    
                    Image("tab 3")
                        .renderingMode(.template)
                        .offset(y: 3)
                        .foregroundColor(selectedTab == .quotes ? .hex("0D0550"): .white)
                    
                }
            }
            
            Spacer()
            
            Button {
                withAnimation {
                    selectedTab = .stretch
                }
            } label: {
                ZStack {
                    if selectedTab == .stretch {
                        Circle()
                            .foregroundColor(.white)
                            .frame(height: 57)
                            .transition(.scale)
                    } else {
                        Circle()
                            .foregroundColor(.white)
                            .frame(height: 57)
                            .opacity(0)
                    }
                    
                    Image("tab 4")
                        .renderingMode(.template)
                        .offset(y: 3)
                        .foregroundColor(selectedTab == .stretch ? .hex("0D0550"): .white)
                }
            }
        }
        .padding(6)
        .padding(.horizontal, 20)
        .background(Color.hex("0D0550"))
        .cornerRadius(55)
        .padding(.bottom)
    }
}

#Preview {
    ContentViewSS(showLoading: false)
}


enum Tabs {
    case home
    case profile
    case quotes
    case stretch
}

func formattedDateString() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    let dateString = dateFormatter.string(from: Date())
    return dateString
}

