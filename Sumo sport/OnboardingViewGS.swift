

import SwiftUI

struct OnboardingViewSS: View {
    @AppStorage("showOnboarding") var showOnboarding = true
    @State private var selected = 1
    
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
            Spacer()
            
            Image("onboard \(selected)")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            
            HStack(spacing: 1) {
                ForEach(Array(1...5), id: \.self) { index in
                    RoundedRectangle(cornerRadius: .infinity)
                        .frame(width: 35, height: 5)
                        .foregroundColor(index == selected ? .hex("FEE600"): .white)
                }
            }.padding(.bottom)
        }.background(2)
            .onTapGesture {
                if selected < 5 {
                    withAnimation {
                        selected += 1
                    }
                } else {
                    showOnboarding = false
                }
            }
            .opacity(showOnboarding ? 1: 0)
            .animation(.easeInOut, value: showOnboarding)
    }
}

#Preview {
    OnboardingViewSS()
}
