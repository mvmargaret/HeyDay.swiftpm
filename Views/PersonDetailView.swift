//
//  SwiftUIView.swift
//  
//
//  Created by Margarita Mayer on 18/02/24.
//

import SwiftUI

struct PersonDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let person: Person
    
    var body: some View {
        
        NavigationStack {
            
            let paragraphs = person.description.split(separator: "\n").map { String($0)}
            
            ScrollView {
                
                VStack {
                    
                    Image(person.photo)
                        .resizable()
                        .aspectRatio(1.0 / 1.0, contentMode: .fill)
                        .containerRelativeFrame(.horizontal) { size, axis in
                            size * 0.5
                        }
                        .clipShape(Circle())
                        .padding()
                    
                    Text(person.name)
                        .bold()
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    
                    Text(person.yearsOfLife)
                        .bold()
                        .font(.title2)
                        .padding(.bottom)
                    
                    //                Text(person.description)
                    //                    .multilineTextAlignment(.leading)
                    //                    .lineSpacing(5)
                    
                    VStack(alignment: .leading) {
                        
                        ForEach(paragraphs, id: \.self) { paragraph in
                            Text("\(paragraph)")
                                .lineSpacing(5)
                                .padding(.bottom, 15)
                                .font(.title2)
                            
                        }
                    }
                    
                }
                .padding(.all, 50)
                .padding(.top, -50)
                
            }
            .toolbar {
                Button("Close", role: .cancel) {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .foregroundStyle(.white)
                .bold()
            }
        }
        
    }
        
}

#Preview {
    let persons: [Person] = Bundle.main.decode("women.json")
    return PersonDetailView(person: persons[0])
}
