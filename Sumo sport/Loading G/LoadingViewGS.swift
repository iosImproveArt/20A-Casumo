//
//  LoadingView.swift
//  Sg western star
//
//  Created by Uniqit on 16.07.2024.
//
import SwiftUI

struct LoadingViewSS: View {
    @AppStorage("firstInApp") var firstInApp = true
    var jnir = 235
    @Binding var showView: Bool
    @State var rotation: CGFloat = 0
    
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
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                
                Image("loading 2")
                    .rotationEffect(.degrees(rotation))
                    .animation(.linear, value: rotation)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 0.004, repeats: true) { timer in
                            guard showView else { timer.invalidate(); return }
                            
                            rotation += 1
                        }
                    }
               
                
                Text("Loading...")
                    .withFont(size: 30, weight: .medium)
                    .padding(.bottom, 30)
                
                Spacer()
            }.background(2)
            
            PrivacyViewSS(showLoading: $showView)
                .opacity(firstInApp ? 1: 0)
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    if !firstInApp {
                        showView = false
                    }
                }
            }
        }
    }
    
}


#Preview {
    LoadingViewSS(showView: .constant(true))
}

