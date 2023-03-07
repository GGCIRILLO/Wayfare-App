//
//  SuggestView.swift
//  Wayfare prototype
//
//  Created by Luigi Cirillo on 07/03/23.
//

import SwiftUI

struct SuggestView: View {
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Text("Is Wayfare missing something?")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding()
                    
                Text("Thank you for telling us about a new place or activity to list on Wayfare. Your contributions make our community stronger. To get started, tell us a little bit more.")
                    .font(.body)
                    .padding()
                
                Form {
                    HStack {
                        Image(systemName: "location.circle.fill")
                            .foregroundColor(.orange)
                        NavigationLink("Place", destination: PlaceSuggestView())
                    }
                    HStack{
                        Image(systemName: "figure.run.circle.fill")
                            .foregroundColor(.orange)
                        NavigationLink("Activity", destination: ActivitySuggestView())
                    }
                    
                }
                
            }
            
        } .padding()
    }
}

struct SuggestView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestView()
    }
}
