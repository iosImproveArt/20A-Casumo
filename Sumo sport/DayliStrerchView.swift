//
//  DayliStrerchView.swift
//  Sumo sport
//
//  Created by Improve on 11.12.2024.
//

import SwiftUI

struct DayliStrerchView: View {
    @AppStorage("wasTrained") var wasTrained = false
    
    var body: some View {
        VStack {
            Image("stretch.start")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                NavigationLink {
                    TrainingViewSS(sportType: .stretch)
                } label: {
                    Text("Start")
                        .withFont(size: 18, weight: .medium, color: .hex("2E023F"))
                        .padding(.vertical, 11)
                        .padding(.horizontal, 30)
                        .background(Color.hex("FEE600"))
                        .cornerRadius(13.17)
                }.grayscale(wasTrained ? 1: 0)
                    .disabled(wasTrained)
                
                if wasTrained {
                    Text("Come back tomorrow")
                        .withFont(size: 15, weight: .bold)
                }
            }
        }
    }
}

#Preview {
    ContentViewSS(showLoading: false, selectedTab: .stretch)
}
