//
//  SwiftUIView.swift
//  
//
//  Created by Margarita Mayer on 22/02/24.
//

import SwiftUI

struct OnboardingView: View {
   
    @Binding var isShowingOnboardingView: Bool
//    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                
                VStack {
                    Text("""
                         Welcome to HeyDay! This app shows stories of women overcoming gender discrimination in their professions over the past two centuries.

                         Now it's hard to believe, but not long ago, at the turn of the 20th century, women faced numerous restrictions, even in accessing education. Despite these challenges, many women rose to fame in their respective fields.

                         Let's explore the inspiring stories of talented women!
                         """)
                    .padding(.all, 30)
                    .font(.system(size: 28))
                    .lineSpacing(5)
                    
                
                    
                    HStack {
                        
                        Button("Start") {
                            isShowingOnboardingView = false
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle(radius: 10))
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 28))
                        .tint(Color.mint)
                        .controlSize(.extraLarge)
                        .padding(.bottom, 30)
                    }
                    
                    
                    
                }
                .frame(width: geometry.size.width * 0.6)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.thickMaterial)
                }
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(.thinMaterial)
            
           
        }
    }
}

//#Preview {
//    OnboardingView(isShowingOnboardingView: .constant(true))
//}
