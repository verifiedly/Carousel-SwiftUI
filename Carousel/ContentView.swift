//
//  ContentView.swift
//  Carousel
//
//  Created by Samuel Ailemen on 4/1/22.
//

import SwiftUI

struct ContentView: View {
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        let x = proxy.frame(in: .global).minX
        let diff = abs(x)
        if diff < 100 {
            scale = 1 + (100 - diff) / 500
        }
        return scale
    }
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false){
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 50) {
                        ForEach(0..<10) { num in
                            GeometryReader { proxy in
                                NavigationLink(
                                    destination: Image("003"),
                                    label: {
                                        VStack {                       let scale = getScale(proxy: proxy)
                                            Image("003")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 150)
                                                .clipped()
                                                .cornerRadius(10)
                                                .shadow(radius: 6)
                                                .scaleEffect(CGSize(width: scale, height: scale))
                                            Text("Custom card title \(num+1)")
                                                .padding(.top)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.black)
                                        }
                                    }
                                )
                            }
                            .frame(width: 120, height: 310)
                        }
                    }.padding(32)
                }
                VStack(spacing: 30) {
                    ForEach(0..<5) { num in
                        Image("002")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 350, height: 200)
                            .cornerRadius(10)
                            .shadow(radius: 6)
                            
                    }
                }.padding(.top)
            }.navigationTitle("Card Carousel")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
