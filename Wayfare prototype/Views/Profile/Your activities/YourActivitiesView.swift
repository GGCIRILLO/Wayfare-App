//
//  YourActivitiesView.swift
//  Wayfare prototype
//
//  Created by Luigi Cirillo on 07/03/23.
//
import SwiftUI

struct YourActivitiesView: View {
    @EnvironmentObject var aaa : Act
    var body: some View {
        NavigationStack {
            VStack {
                Text("Your activity")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 25)
                Text("Edit your favorite activities")
                    .font(.body)
                    .offset(y: 18-3)
                    .padding(.bottom, 35)
                ScrollView {
                    ForEach(Config.allActivities) { activity in
                        OnboardingCardView(
                            activity: activity
                        )
                    }.padding(.top, 5)
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct YourActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        YourActivitiesView()
    }
}
