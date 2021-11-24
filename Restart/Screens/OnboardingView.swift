//
//  OnboardingView.swift
//  Restart
//
//  Created by Hamza Azhar on 19/10/2021.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var title: String = "Share."
    
    
    var body: some View {
        
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                Spacer()
                //MARK: - Header
                VStack(spacing: 0) {
                    Text(self.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                    
                    Text("""
                         It's not how much we give but how much love we put into giving
                         """)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding(.horizontal, 10)
                }
                .opacity(self.isAnimating ? 1 : 0)
                .offset(y: self.isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: self.isAnimating)
                
                
                //MARK: - Center
                ZStack() {
                    ZStack() {
                        ZStack {
                            ZStack {
                                Circle()
                                    .stroke(.white.opacity(0.2), lineWidth: 40)
                                    .frame(width: 260, height: 260, alignment: .center)
                                Circle()
                                    .stroke(.white.opacity(0.2), lineWidth: 80)
                                    .frame(width: 260, height: 260, alignment: .center)
                            }
                            .blur(radius: self.isAnimating ? 0 : 10)
                            .opacity(self.isAnimating ? 1 : 0)
                            .scaleEffect(isAnimating ? 1 : 0.5)
                            .animation(.easeOut(duration: 1), value: self.isAnimating)
                        }
                        .offset(x: self.imageOffset.width * -1)
                        .blur(radius: abs(self.imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: self.imageOffset)
                        
                        Image("character-1")
                            .resizable()
                            .scaledToFit()
                            .opacity(self.isAnimating ? 1 : 0)
                            .offset(x:  self.imageOffset.width * 1.2, y: 0)
                            .rotationEffect(.degrees(Double(self.imageOffset.width / 20)))
                            .animation(.easeOut(duration: 1), value: self.isAnimating)
                            .gesture(
                                DragGesture()
                                    .onChanged({ gesture in
                                        if abs(self.imageOffset.width) <= 150 {
                                            withAnimation(.linear(duration: 0.25)){
                                                self.title = "Give."
                                            }
                                            self.imageOffset = gesture.translation
                                        }
                                    })
                                
                                    .onEnded({ _ in
                                        self.imageOffset = .zero
                                        withAnimation(.linear(duration: 0.25)){
                                            self.title = "Share."
                                        }
                                    })
                            )//:gesture
                            .animation(.easeOut(duration: 0.6), value: self.imageOffset)
                    }//:ZSTACK
                    .overlay(
                        Image(systemName: "arrow.left.and.right.circle")
                            .font(.system(size: 44, weight: .ultraLight))
                            .foregroundColor(.white)
                            .offset(y: 20)
                        , alignment: .bottom
                    
                    
                    )
                }//:ZSTACK
                Spacer()
                
                //MARK: - Footer
                ZStack() {
                    //PARTS OF THE CUSTOM BUTTON
                    //1.BACKGROUND(STATIC)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    //2.CALLTOACTION(STATIC)
                    
                    Text("Get Started")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(.title3, design: .rounded))
                        .offset(x: 20)
                    
                    //3.CAPSULE(DYNAMIC WIDTH)
                    HStack() {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    
                    //4.CIRCLE (DRAGGABLE)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(Color.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .frame(width: 80, height: 80, alignment: .center)
                        .foregroundColor(.white)
                        .offset(x: buttonOffset)
                        .gesture (
                            DragGesture()
                                .onChanged { gesture in
                                    //It will only run when the button will be dragged to right
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded({ _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnBoardingViewActive = false
                                            playSound(sound: "chimeup", type: "mp3")
                                        } else {
                                            buttonOffset = 0
                                        }
                                    }
                                })
                        )
                        Spacer()
                    }//:HStack
                }//:ZStack
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(self.isAnimating ? 1 : 0)
                .offset(y: self.isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: self.isAnimating)
                
            }//:VSTACK
        }//:ZStack
        .onAppear {
            self.isAnimating = true
        }
        .preferredColorScheme(.dark)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
