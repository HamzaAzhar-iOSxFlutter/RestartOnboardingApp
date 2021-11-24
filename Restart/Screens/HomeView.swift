//
//  HomeView.swift
//  Restart
//
//  Created by Hamza Azhar on 19/10/2021.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                
                Spacer()
                ZStack {
                    ZStack {
                        Circle()
                            .stroke(.gray.opacity(0.2), lineWidth: 80)
                            .frame(width: 260, height: 260, alignment: .center)
                        Circle()
                            .stroke(.gray.opacity(0.2), lineWidth: 40)
                            .frame(width: 260, height: 260, alignment: .center)
                        Image("character-2")
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }//:ZStack
                }//:ZStack
                
                Text("""
                     The time that leads to mastery is dependent on the intensity of our focus
                     """)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.system(size: 21, weight: .light, design: .rounded))
                
                Spacer()
                Button {
                    isOnboardingViewActive = true
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            }//:VStack
        }//:ZStack
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
