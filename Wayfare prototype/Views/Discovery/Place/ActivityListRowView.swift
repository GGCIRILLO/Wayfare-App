//
//  ActivityListRowView.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 03/03/23.
//

import SwiftUI

struct ActivityListRowView: View {
    let accentColor = Color("AccentColor")

    var icon : String
    var subIcon : String
    var mainText : String
    var subText : String
    var body : some View {
        HStack{
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .foregroundColor(.black)
                .padding(8)
                .background(accentColor)
                .clipShape(Circle())
                .frame(width: 30, height: 30)
            VStack(alignment: .leading) {
                Text(mainText)
                    .font(.headline)
                    .bold()
                    .offset(y: -3)
                    .foregroundColor(.primary)
                HStack {
                    Image(systemName: subIcon)
                    Text(subText)
                    
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                .offset(y: 1)
            }
        }
    }
}

struct ActivityListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListRowView(icon: "figure.run", subIcon: "figure.run", mainText: "ciao", subText: "18")
    }
}
