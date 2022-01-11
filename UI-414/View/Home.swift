//
//  Home.swift
//  UI-414
//
//  Created by nyannyan0328 on 2022/01/06.
//

import SwiftUI

struct Home: View {
    @State var barColor : Color = .init(white: 0)
    @State var barTitleColor : Color = .primary

    var body: some View {
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                VStack(spacing:30){
                    
                    
                    Text("Navigation Bar Color")
                        .font(.caption.bold())
                        .frame(maxWidth:.infinity,alignment: .leading)
                    
                    
                    
                    Picker(selection: $barColor) {
                        Text("Clear")
                            .tag(Color.clear)
                        
                        Text("Purple")
                            .tag(Color.purple)
                        
                        Text("Red")
                            .tag(Color.red)
                        
                        
                        Text("Orange")
                            .tag(Color.orange)
                        
                        
                        Text("Cyan")
                            .tag(Color.cyan)
                        
                    } label: {
                        
                        
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                    
                    
                    
                    Text("Navigation Bar Text Color")
                        .font(.caption.bold())
                        .frame(maxWidth:.infinity,alignment: .leading)
                    
                    Picker(selection: $barTitleColor) {
                        
                        Text("Primary")
                            .tag(Color.primary)
                        
                        Text("White")
                            .tag(Color.white)
                        
                        Text("Blue")
                            .tag(Color.blue)
                        
                        
                        Text("Gray")
                            .tag(Color.gray)
                        
                        
                        Text("Green")
                            .tag(Color.green)
                        
                        
                        
                    } label: {
                        
                        
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                    
                    
                    
                    Group{
                        customNVLink(image: "p1") {
                            
                            Text("P1")
                                .navigationTitle("p1")
                            
                        }
                        
                        customNVLink(image: "p2") {
                            
                            Text("P2")
                                .navigationTitle("p2")
                            
                        }
                        
                        
                        customNVLink(image: "p3") {
                            
                            Text("P3")
                                .navigationTitle("p3")
                            
                        }
                        
                        
                        customNVLink(image: "p4") {
                            
                            Text("P4")
                                .navigationTitle("p5")
                            
                        }
                        
                        
                        customNVLink(image: "p6") {
                            
                            Text("P6")
                                .navigationTitle("p6")
                            
                        }
                        
                        
                        customNVLink(image: "p7") {
                            
                            Text("P7")
                                .navigationTitle("p7")
                            
                        }
                        
                        
                        customNVLink(image: "p8") {
                            
                            Text("P8")
                                .navigationTitle("p8")
                            
                        }
                        
                        customNVLink(image: "p9") {
                            
                            Text("P9")
                                .navigationTitle("p9")
                            
                        }
                        
                        customNVLink(image: "p10") {
                            
                            Text("P10")
                                .navigationTitle("p10")
                            
                        }
                     
                        
                        Group{
                            
                            customNVLink(image: "p11") {
                                
                                Text("P11")
                                    .navigationTitle("p11")
                                
                            }
                            customNVLink(image: "p11") {
                                
                                Text("P11")
                                    .navigationTitle("p11")
                                
                            }
                        }
                     
                        
                        
                    }
                    
                   
                    
                    
                    
                    
                }
                .padding()
                .toolbar {
                    
                    Button("Rest"){
                        
                        
                        
                        barColor = .init(white: 0)
                        barTitleColor = .primary
                        
                        resetNavBar()
                        
                        
                        
                    }
                }
                
                
            }
            .navigationTitle("Navigation View")
            .onChange(of: barColor) { newValue in
                if barColor == Color.init(white: 0){return}
                    
                    setNavBarColor(color: barColor)
                    
                    barTitleColor = .primary
                    
                    
                
                
                
                
                
            }
            .onChange(of: barTitleColor) { newValue in
                
                
                setNavBarTilteColor(color: barTitleColor)
                
                
                
            }
            
            
        }
    }
    @ViewBuilder
    func customNVLink<Content : View>(image : String,@ViewBuilder detail : @escaping()->Content)-> some View{
        
        NavigationLink {
            detail()
        } label: {
            
            
            VStack{
                
                GeometryReader{proxy in
                    
                    
                    let size = proxy.size
                    
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .cornerRadius(10)
                      
                }
                .frame(height:180)
                
            }
        }

        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
