import SwiftUI
import TipKit

@main
struct HeyDay: App {
    
    @State var isShowingOnboardingView = true
    
    
    var body: some Scene {
        WindowGroup {
            
            ZStack {
                
                ContentView()
                
                
                OnboardingView(isShowingOnboardingView: $isShowingOnboardingView)
                    .animation(.easeInOut(duration: 0.8)) { content in
                        content.opacity(isShowingOnboardingView ? 1.0 : 0.0)
                    }
                
            }
            
        }
    }
    
    
    init() {
        do {
            try Tips.resetDatastore()
            try Tips.configure()
        } catch {
            print("Failed to configure TipKit: \(error)")
        }
    }
    
}
