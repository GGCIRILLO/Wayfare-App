//
//  FilterView.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 01/03/23.
//

import SwiftUI
import MapKit

struct FilterView: View {
    
    var filterActivity : Activity
    
    @State var pressed = false
    @Binding var selectedActivity : Activity?
    let accentColor = Color("AccentColor")
    
    var body: some View {
        Button {
            pressed.toggle()
            if pressed {
                selectedActivity = filterActivity
            } else {
                selectedActivity = nil
            }
            
            
        } label: {
            if pressed {
                Text(filterActivity.name)
                    .foregroundColor(.black)
                        .padding([.leading, .trailing])
                        .padding([.bottom, .top], 10.0)
                        .background(accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                Text(filterActivity.name)
                    .foregroundColor(.primary)
                        .padding([.leading, .trailing])
                        .padding([.bottom, .top], 10.0)
                        .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            
        }
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView(filterActivity: Config.allActivities.first!)
//    }
//}
