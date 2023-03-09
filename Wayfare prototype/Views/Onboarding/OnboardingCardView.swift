//
//  OnboardingCardView.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 03/03/23.
//

import SwiftUI

import SwiftUI

struct OnboardingCardView: View {
    
    let activity : Activity
    let height : CGFloat = 170;
    @EnvironmentObject var aaa : Act
    @State var selected = false;
    
    var body : some View {
        ZStack(alignment: .bottomLeading) {
            
            Image(activity.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: height)
                .contentShape(Rectangle())
                .overlay(Color.black.opacity(selected ? 0.5 : 0.3))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.accentColor, lineWidth: selected ? 6 : 0))
            Text(activity.name.uppercased())
                .font(.system(size: 36))
                .fontWeight(.bold)
                .padding()
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .padding(.bottom, 10)
        .foregroundColor(.white)
        .onTapGesture {
            selected.toggle()
            if aaa.selectedActivities.contains(activity) {
                aaa.selectedActivities.remove(at: aaa.selectedActivities.firstIndex(of: activity) ?? -1)
            } else {
                aaa.selectedActivities.append(activity)
            }
            print(aaa.selectedActivities.count)
        }
        .onAppear {
            self.selected = aaa.selectedActivities.contains(activity)
        }
        .animation(Animation.default.speed(2))
    }
}

//struct OnboardingCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingCardView(activity:  Activity(name: "Running", imageName: "running", icon: "figure.run"),
//                           activityList: .constant([]))
//    }
//}
