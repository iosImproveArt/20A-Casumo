

import SwiftUI

struct QuotesViewSS: View {
    let quotes: [String: String] = [
        "Success is no accident. It is hard work, perseverance, learning, studying, sacrifice, and most of all, love of what you are doing." : "Pelé",
        "Don’t count the days; make the days count." : "Muhammad Ali",
        "You have to expect thinSS of yourself before you can do them." : "Michael Jordan",
        "Champions keep playing until they get it right." : "Billie Jean King",
        "The only way to prove that you’re a good sport is to lose." : "Ernie Banks",
        "Hard work beats talent when talent doesn’t work hard." : "Tim Notke",
        "Winning isn’t everything, but wanting to win is." : "Vince Lombardi",
        "You miss 100% of the shots you don’t take." : "Wayne Gretzky",
        "The harder the struggle, the more glorious the triumph." : "Thomas Paine",
        "Pain is temporary. Quitting lasts forever." : "Lance Armstrong",
        "It’s not whether you get knocked down; it’s whether you get up." : "Vince Lombardi",
        "Do not let what you cannot do interfere with what you can do." : "John Wooden",
        "A champion is someone who gets up when they can’t." : "Jack Dempsey",
        "I’ve failed over and over and over again in my life. And that is why I succeed." : "Michael Jordan",
        "The only limit to our realization of tomorrow will be our doubts of today." : "Franklin D. Roosevelt",
        "Success is not the absence of failure; it’s the persistence through failure." : "Aisha Tyler",
        "Age is no barrier. It’s a limitation you put on your mind." : "Jackie Joyner-Kersee",
        "You have to do something in your life that is honorable and not cowardly if you are to live in peace with yourself." : "Larry Brown",
        "An athlete cannot run with money in his pockets. He must run with hope in his heart and dreams in his head." : "Emil Zatopek",
        "Motivation is what gets you started. Habit is what keeps you going." : "Jim Ryun",
        "Gold medals aren’t really made of gold. They’re made of sweat, determination, and a hard-to-find alloy called guts." : "Dan Gable",
        "If you don’t have confidence, you’ll always find a way not to win." : "Carl Lewis",
        "Some people want it to happen, some wish it would happen, others make it happen." : "Michael Jordan",
        "A trophy carries dust. Memories last forever." : "Mary Lou Retton",
        "Run when you can, walk if you have to, crawl if you must; just never give up." : "Dean Karnazes",
        "When you feel like quitting, think about why you started." : "Unknown",
        "Set your goals high, and don’t stop until you get there." : "Bo Jackson",
        "The difference between the impossible and the possible lies in a person’s determination." : "Tommy Lasorda",
        "Never let your head hang down. Never give up and sit down and grieve. Find another way." : "Satchel Paige",
        "You have to learn the rules of the game. And then you have to play better than anyone else." : "Albert Einstein",
        "Opportunities don’t happen. You create them." : "Chris Grosser",
        "To be the best, you must be able to handle the worst." : "Wilson Kanadi",
        "Don’t stop when you’re tired. Stop when you’re done." : "David Goggins",
        "Discipline is the bridge between goals and accomplishment." : "Jim Rohn",
        "You are never really playing an opponent. You are playing yourself." : "Arthur Ashe",
        "Success is where preparation and opportunity meet." : "Bobby Unser",
        "Never let success get to your head. Never let failure get to your heart." : "Unknown",
        "Strength doesn’t come from what you can do. It comes from overcoming the thinSS you once thought you couldn’t." : "Rikki Rogers",
        "Great thinSS never come from comfort zones." : "Unknown",
        "Believe you can and you’re halfway there." : "Theodore Roosevelt",
        "Winning isn’t everything, but the effort to win is." : "Zig Ziglar"
    ]
    
    @State var timer: Timer?
    @State var selectedQuote: Dictionary<String, String>.Element? = ("", "")
    
      var egetg = "wrgver"
    var eufncergeier = 25242524
    func wrgw() -> Float {
        return 432355
    }
    func wrtwr() {
        print("wrfwrtgwrr3")
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Spacer()
            
            if let selectedQuote = selectedQuote {
                Text("\"\(selectedQuote.key)\"")
                    .withFont(size: 22, weight: .semibold)
                    .padding(.bottom, 40)
                
                Text("- \(selectedQuote.value)")
                    .withFont(size: 16.5, weight: .semibold, color: .hex("FEE600"))
                    .padding(.trailing, 20)
            }
            
            Spacer()
            
            NavigationLink {
                PrivacyViewSS(showLoading: .constant(true), fromMainView: true)
            } label: {
                Text("Privacy Policy")
                    .withFont(size: 18, weight: .light, color: .white)
            }.frame(maxWidth: .infinity)
                .padding(.bottom)
        }.onAppear {
            selectedQuote = quotes.randomElement()!
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { _ in
                withAnimation(.easeInOut(duration: 0.6)) {
                    selectedQuote = nil
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    withAnimation(.easeInOut(duration: 1)) {
                        selectedQuote = quotes.randomElement()!
                    }
                }
            })
        }
        .onDisappear {
            timer?.invalidate()
            timer = nil
        }
    }
}

#Preview {
    ContentViewSS(showLoading: false, selectedTab: .quotes)
}

