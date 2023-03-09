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
    @State var showAlert = false
    @State var button = false
    
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
                                //Stars(amount: activityInPlace.stars)
                                /*Image(systemName: activityInPlace.stars > 0 ? "star.fill" : "star")
                                    .padding(.leading, -7)*/
                                    
                            }.padding(.top, 10)
                                .padding(.bottom, 10)
                            
                            HStack{
                                Text(String(location.distance) + " km away • " + String(location.cost))
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 17)
                                
                                Spacer()
                                
                                if button {
                                    FancyButton(width: 160, height: 50) {
                                        Image(systemName: "stop.fill")
                                        Text("Stop sharing")
                                            .font(.headline)
                                            .bold()
                                        
                                    }
                                    .onTapGesture {
                                        showAlert.toggle()
                                        button.toggle()                                    }
                                    .alert(isPresented: $showAlert) {
                                        Alert(title: Text("Let the party begin"),
                                              message: Text("You are now sharing your activity"))
                                       
                                    }
                                    .padding(.trailing, 10)
                                    .padding(.top, -60)
                                    
                                    
                                } else  {
                                    FancyButton(width: 100, height: 50) {
                                        Image(systemName: "figure.run")
                                        Text("Join")
                                            .font(.headline)
                                            .bold()
                                        
                                    }
                                    .onTapGesture {
                                        showAlert.toggle()
                                        button.toggle()
                                    }
                                    .alert(isPresented: $showAlert) {
                                        Alert(title: Text("Stop sharing"),
                                              message: Text("You are no longer sharing your activity"))
                                    }
                                    .padding(.trailing, 10)
                                    .padding(.top, -60)
                                }
                                
                            }
                            
                            Text(activityInPlace.activity.name + " at " + location.name + " " + activityInPlace.actDescription)
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

            }.overlay(VStack{
                Spacer()
                ZStack {
                    LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                        .frame(height: 110)
                    .ignoresSafeArea()
//                    FancyButton(width: 200, height: 60) {
//                        Image(systemName: "star.square.on.square.fill")
//                        Text("Read reviews")
//                            .font(.headline)
//                            .bold()
//                    }
//
//                    .onTapGesture {
//                        isShowingReview.toggle()
//                    }
//                    .sheet(isPresented: $isShowingReview) {
//                        EmptyView()
//                    }
                }
            })
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
    
    struct ActivityInPlaceView_Previews: PreviewProvider {
        static var previews: some View {
            ActivityInPlaceView(activityInPlace: SpecificActivity(activity: Activity(name: "Running", imageName: "running", icon: "figure.run"), stars: 3, actDescription: "descrizione prova"), location: Config.previewData)
        }
    }
}

