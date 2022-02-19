//
//  ContentView.swift
//  Lab02_Beklemishev
//
//  Created by Admin on 16.02.2022.
//  Copyright © 2022 G483. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var MyText:String = "Press Me"
    @State var SystImage:String = "person"
    
    var body: some View {
        ZStack{
            Image("Image")
                .scaleEffect(1.5)
            VStack{
                Text("SO")
                    .foregroundColor(Color.white)
                    .bold()
                Text("Much")
                    .foregroundColor(Color.white)
                    .border(Color.red, width: 1)
                Text("Pain")
                    .foregroundColor(Color.white)
                    .border(Color.black, width: 2)
                    .cornerRadius(15)
                HStack{
                    Text(MyText)
                        .foregroundColor(Color.red)
                    
                    Button(action: {
                        print("Fool")
                        if self.SystImage == "person"
                        {
                            self.SystImage = "person.3"
                        } else {
                            self.SystImage = "person"
                        }
                    }) {
                        HStack {
                            Image(systemName: SystImage)
                            Text("No Me!")
                        }
                        
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 20)
                    
                }
                
                HStack{
                    ForEach(1..<5) { i in
                            Text("\(i)")
                            .padding(1)
                            .foregroundColor(Color.white)
                    }
                    
                }
                Checkerboard(rows: 8, columns: 8)
                .fill(Color.black)
                .background(Color.white)
                .frame(width: 200, height: 200)
            }
        }
        
    }
}

struct Checkerboard: Shape {
    let rows: Int
    let columns: Int

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)

        
        for row in 0 ..< rows {
            for column in 0 ..< columns {
                if (row + column).isMultiple(of: 2) {
                    // this square should be colored; add a rectangle here
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)

                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
