//
//  ContentView.swift
//  graphui
//
//  Created by Subash on 22/05/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var pickerSelectedItem = 0
    
    var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 125, 175],
        [100, 150, 125, 175, 50],
        [150, 125, 175, 50, 100]
    ]
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Insights")
                    .fontWeight(.heavy)
                    .font(.system(size: 45))
                .foregroundColor(Color("title"))
                
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekly").fontWeight(.semibold).tag(0)
                    Text("Monthly").tag(1)
                    Text("Yearly").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 20)
                
                HStack(spacing: 15) {
                    BarView(height: dataPoints[pickerSelectedItem][0], title: "A")
                    BarView(height: dataPoints[pickerSelectedItem][1], title: "B")
                    BarView(height: dataPoints[pickerSelectedItem][2], title: "C")
                    BarView(height: dataPoints[pickerSelectedItem][3], title: "D")
                    BarView(height: dataPoints[pickerSelectedItem][4], title: "E")
                }.padding(.top, 20)
                    .animation(.default)
            }
        }
    }
}
struct BarView: View {
    var height: CGFloat
    var title: String
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200).foregroundColor(Color(#colorLiteral(red: 0.1778831482, green: 0.3959082961, blue: 0.07615936548, alpha: 1)))
                Capsule().frame(width: 30, height: height).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            }
            Text(title).padding(.top, 10).font(.system(size: 20))
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
