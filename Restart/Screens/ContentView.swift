//
//  ContentView.swift
//  Restart
//
//  Created by Hamza Azhar on 19/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        
        ZStack {
            if self.isOnboardingViewActive {
                OnboardingView()
            }else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
