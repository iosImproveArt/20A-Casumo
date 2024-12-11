

import SwiftUI

struct TrainingViewSS: View {
    @StateObject var vm: TrainViewModel
    @Environment(\.dismiss) var dismiss
    
    init(sportType: SportTypes) {
        _vm = StateObject(wrappedValue: TrainViewModel(sportType: sportType))
    }
    
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
            topBar
            
            Spacer()
            
            if vm.status == .start {
                Image("\(vm.sportType).start")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image("\(vm.sportType) \(vm.selectedExs)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Spacer()
            
            Button {
                if vm.status == .start {
                    vm.startTrain()
                } else if vm.selectedExs >= 5 && vm.status == .inProgres {
                    vm.finishTrain()
                } else {
                    vm.selectedExs += 1
                }
            } label: {
                Text(vm.status == .start ? "Start": "Next")
                    .withFont(size: 18, weight: .medium, color: .hex("2E023F"))
                    .padding(.vertical, 11)
                    .padding(.horizontal, 30)
                    .background(Color.hex("FEE600"))
                    .cornerRadius(13.17)
            }
        }.background(3)
            .overlay {
                if vm.status == .finish {
                    finishView
                }
            }
    }
    
    private var topBar: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                HStack {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 22)
                    Text("Back")
                        .withFont(size: 20, weight: .light)
                }.foregroundStyle(.white)
            }
            
            Spacer()
            
            if vm.status == .inProgres {
                Text("\(vm.selectedExs)/5")
                .withFont(size: 19.5, weight: .semibold, color: .hex("FEE600"))
                .transition(.move(edge: .trailing))
            } else if vm.status == .start {
                Button {
                    withAnimation {
                        vm.favourite = vm.sportType.rawValue
                    }
                } label: {
                    Image("favourite.button")
                        .renderingMode(.template)
                        .foregroundStyle(vm.favourite == vm.sportType.rawValue ? .pink : .white)
                }
            }
        }.animation(.easeInOut, value: vm.status)
    }
    
    private var finishView: some View {
        VStack(spacing: 25) {
            Spacer()
            
            Text("The workout\nis complete!")
                .withFont(size: 40, weight: .semibold, color: .hex("FEE600"))
                .padding(.vertical)
            
            HStack {
                Image("rating.label 1")
                Spacer()
                
                RoundedRectangle(cornerRadius: 11)
                    .foregroundColor(.hex("FF8800"))
                    .overlay {
                        RoundedRectangle(cornerRadius: 11)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.hex("FEE600"))
                    }
                    .frame(width: 100, height: 40)
                    .overlay {
                        Text("987/1000")
                            .withFont(size: 19.34, weight: .regular)
                    }
            }
            
            HStack {
                Image("time.label")
                Spacer()
                
                RoundedRectangle(cornerRadius: 11)
                    .foregroundColor(.hex("FF8800"))
                    .overlay {
                        RoundedRectangle(cornerRadius: 11)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.hex("FEE600"))
                    }
                    .frame(width: 100, height: 40)
                    .overlay {
                        Text("\(vm.seconds) sec")
                            .withFont(size: 19.34, weight: .regular)
                    }
            }
            
            HStack {
                Image("rate.label")
                Spacer()
                
                RoundedRectangle(cornerRadius: 11)
                    .foregroundColor(.hex("FF8800"))
                    .overlay {
                        RoundedRectangle(cornerRadius: 11)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.hex("FEE600"))
                    }
                    .frame(width: 100, height: 40)
                    .overlay {
                        Text("\(vm.rate)/10")
                            .withFont(size: 19.34, weight: .regular)
                    }
            }
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Text("Complete the workout")
                    .withFont(size: 18, weight: .medium, color: .hex("2E023F"))
                    .padding(.vertical, 11)
                    .padding(.horizontal, 30)
                    .background(Color.hex("FEE600"))
                    .cornerRadius(13.17)
            }
            .padding(.bottom)
        }.background(2)
    }
}

#Preview {
    TrainingViewSS(sportType: .basketball)
}

class TrainViewModel: ObservableObject {
    @AppStorage("secondsWaste") var secondsWaste = 0
    @AppStorage("wasTrained") var wasTrained = false
    @AppStorage("favourite") var favourite = ""
    
    enum ViewTypes {
        case start
        case inProgres
        case finish
    }
    
    let rate: Int
    let sportType: SportTypes
    
    @Published var status: ViewTypes = .start
    @Published var seconds = 0
    @Published var selectedExs = 1
    
    init(sportType: SportTypes) {
        self.sportType = sportType
        rate = Int.random(in: 1...10)
        
        if sportType == .stretch {
            startTrain()
        }
    }
    
    func startTrain() {
        status = .inProgres
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            guard status == .inProgres else { timer.invalidate(); return }
            
            seconds += 1
        }
    }
    
    func finishTrain() {
        withAnimation {
            status = .finish
        }
        
        secondsWaste += seconds
        wasTrained = true
    }
}


enum SportTypes: String {
    case cricket = "cricket"
    case football = "football"
    case volleyball = "volleyball"
    case basketball = "basketball"
    case rugby = "rugby"
    case stretch = "stretch"
}
