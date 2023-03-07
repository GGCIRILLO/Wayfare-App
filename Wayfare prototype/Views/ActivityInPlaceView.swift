//
//  ActivityInPlaceView.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 07/03/23.
//

import SwiftUI

struct ActivityInPlaceView: View {
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @State var isShowingReview = false
    
    var activityInPlace : SpecificActivity
    var location: Location
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                VStack(alignment: .leading) {
                    ScrollView {
                        VStack {
                            Image(location.imageNames[0])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .clipShape(Rectangle())
                        }
                        VStack(alignment: .leading) {
                            
                            Text(activityInPlace.activity.name + " at " +  location.name)
                                .font(.title)
                                .bold()
                                .foregroundColor(.primary)
                            
                            HStack {
                                Stars(amount: activityInPlace.stars)
                                    .padding(.leading, -7)
                            }
                            
                            HStack{
                                Text(String(location.distance) + " • " + String(location.cost))
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 17)
                                
                                Spacer()
                                FancyButton(width: 100, height: 50) {
                                    Image(systemName: "figure.run")
                                    Text("Join")
                                        .font(.headline)
                                        .bold()
                                    
                                }
                                .padding(.trailing, 10)
                                .padding(.top, -50)
                                
                            }
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce iaculis vel justo quis tristique. Aenean consectetur a lectus sit amet semper. Nullam blandit nisl volutpat dolor euismod dictum")
                                .font(.body)
                                .foregroundColor(.primary)
                                .padding(.bottom)
                                .multilineTextAlignment(.leading)
                            
                        }
                        .padding()
                        .padding(.top, 17)
                        ZStack{
                            Image(location.imageNames[1])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 380, height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            Spacer()
                        }
                        
                        
                    }
                    .navigationBarTitle("About", displayMode: .inline)
                    
                    
                }
                .padding(.bottom)
                VStack {
                    Spacer()
                    
                    FancyButton(width: 200, height: 50) {
                        Image(systemName: "star.square.on.square.fill")
                        Text("Read reviews")
                            .font(.headline)
                            .bold()
                            
                    }
                    .onTapGesture {
                        isShowingReview.toggle()
                    }
                    .sheet(isPresented: $isShowingReview) {
                        EmptyView()
                    }
                    
                    LinearGradient(colors: [.black.opacity(0.8), .clear], startPoint: .bottom, endPoint: .top)
                        .frame(height: 20)
                        .ignoresSafeArea()
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
    
    struct ActivityInPlaceView_Previews: PreviewProvider {
        static var previews: some View {
            ActivityInPlaceView(activityInPlace: SpecificActivity(activity: Activity(name: "Running", imageName: "running", icon: "figure.run"), stars: 4), location: Config.previewData)
        }
    }
}
