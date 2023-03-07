//
//  ContentView.swift
//  testfoundation
//
//  Created by Giancarlo Brandi on 01/03/23.
//

import SwiftUI

struct OnboardingView: View {
    @State var selectedActivities : [Activity] = []
    @State private var vergogna : String? = "";
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.opacity(1).ignoresSafeArea()
                VStack {
                    Text("Welcome")
                        .font(.system(size:53))
                        .fontWeight(.bold)
                        .padding(.top, 25)
                    Text("Choose at least one activity you like")
                        .font(.system(size: 19))
                        .bold()
                        .offset(y: 18-3)
                        .padding(.bottom, 35)
                    ScrollView {
                        ForEach(Config.allActivities) { activity in
                            OnboardingCardView(
                                activity: activity,
                                activityList: $selectedActivities
                            )
                        }.padding(.top, 5)
                    }
                }.foregroundColor(.white)
                VStack {
                    Spacer()
                    ZStack {
                        LinearGradient(colors: [.black.opacity(0.8), .clear], startPoint: .bottom, endPoint: .top)
                            .frame(height: 100)
                        FancyButton(width: 130, height: 60) {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Done")
                        }.offset(y: -10)
                            .disabled(selectedActivities.count < 1)
                            .onTapGesture {
                                if(selectedActivities.count > 0) {
                                    vergogna = "Map"
                                }
                            }
                            .background(NavigationLink(
                                tag: "Map",
                                selection: $vergogna,
                                destination: {
                                    ContentView()
                                },
                                label: {
                                    EmptyView()
                                }
                            ))
                    }.foregroundColor(.white)
                }.ignoresSafeArea()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
