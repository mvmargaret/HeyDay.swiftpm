
import SwiftUI
import TipKit


struct ContentView: View {
    
    @State private var imageNumber: Double = 1
    @State private var selectedPerson: Person?
    @State private var selectedPerson2: Person?
//    @State private var isHovering = false
    
    let persons: [Person] = Bundle.main.decode("women.json")
    let periods = ["Early 19th Century", "Late 19th Century", "Early 20th Century", "Late 20th Century"]
    
    let sliderTip = SliderTip()
    let personTip = PersonTip()
    
    var body: some View {
        NavigationStack {

            ZStack {
                GeometryReader { geometry in
                    Image("tree\(imageNumber.formatted())")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                    
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Spacer()
                        
                        HStack {
                            TipView(personTip, arrowEdge: .bottom)
                                .frame(width: geometry.size.width * 0.14)
                                .padding(.leading)
                                    
                            Spacer()
                        }
                        
                       
                            
                            ScrollView(.horizontal) {
                                
                                HStack {
                                    Spacer()
                                    ForEach(0..<Int(imageNumber/1.5), id: \.self) { index in
                                        Button {
                                            selectedPerson = persons[index]
                                            personTip.invalidate(reason: .actionPerformed)
                                            
                                        } label: {
                                            VStack {
                                                
                                                Image(persons[index].photo)
                                                    .resizable()
                                                    .clipShape(Circle())
                                                    .frame(width: geometry.size.width * 0.05, height: geometry.size.width * 0.05)
                                                //                                                    .frame(width: 60, height: 60, alignment: .center)
                                                //                                                    .onHover(perform: { hovering in
                                                //                                                        selectedPerson2 = persons[index]
                                                //                                                        Task {
                                                //                                                            if hovering {
                                                //                                                                try? await Task.sleep(for: .seconds(1))
                                                //
                                                //                                                                isHovering = hovering
                                                //                                                            } else {
                                                //                                                                Task {
                                                //                                                                    try? await Task.sleep(for: .seconds(3))
                                                //                                                                    isHovering = false
                                                //                                                                }
                                                //                                                            }
                                                //                                                        }
                                                //                                                    })
                                                //
                                                
                                                
                                                
                                                //                                            Text(persons[index].id)
                                                //                                                  .bold()
                                                //                                                  .font(.system(size: 20))
                                                //                                                  .foregroundStyle(.white)
                                                
                                                
                                            }
                                            .frame(width: geometry.size.width * 0.05)
                                            .onAppear {
                                                PersonTip.SliderMoved.sendDonation()
                                            }
                                            
                                            //                                        .popover(isPresented: $isHovering) {
                                            //
                                            //                                            Text(selectedPerson2?.name ?? "")
                                            //                                        }
                                            
                                            
                                        }
                                        .buttonStyle(.bordered)
                                        .buttonBorderShape(.roundedRectangle(radius: 10))
                                        .controlSize(.large)
                                       
                                       
                                        
                                        
                                    }
                                    .onDisappear {
                                        personTip.invalidate(reason: .actionPerformed)
                                    }
                                   
                                }
                                
                                
                            }
                          
                            
                        
                        
                       
                        
                       
                        ZStack {
                            
                            Slider(value: $imageNumber, in: 1...21, step: 1)
                                .containerRelativeFrame(.vertical, count: 15, span: 1, spacing: 0)
                                .accentColor(.green)
                                .frame(width: geometry.size.width)
                                .onChange(of: imageNumber) {
                                    sliderTip.invalidate(reason: .actionPerformed)
                                }
                                

                            
                            HStack {
                                TipView(sliderTip, arrowEdge: .leading)
                                    .frame(width: geometry.size.width * 0.2)
                                    .padding(.leading, 35)
                                
                                Spacer()
                            }
                        }
                           
                        
                        
                        HStack {
                            
                            ForEach(periods, id: \.self) { year in
                                Spacer()
                                Text(year)
                                    .bold()
                                    .font(.title)
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.center)
                                   
                                
                                Spacer()
                            }
                           
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.bottom, 30)
                       
                        
                        
                    }
                    .frame(width: geometry.size.width)
                    .onAppear {
                        SliderTip.ContentViewDidOpen.sendDonation()
                    }
                    
                }
                
            }
            .ignoresSafeArea()
            .sheet(item: $selectedPerson) { person in
                    PersonDetailView(person: person)
                }
            
            
        }
       
    }
    
}



