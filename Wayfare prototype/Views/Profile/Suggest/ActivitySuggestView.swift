//
//  ActivitySuggestView.swift
//  Wayfare prototype
//
//  Created by Luigi Cirillo on 07/03/23.
//

import SwiftUI

struct ActivitySuggestView: View {
    @State var QueryActivity = " "
    @State var QueryActivityDescription = " "
    @State var check1 : Bool = false
    @State var check : Bool = false
    
    var body: some View {
        
        VStack {
            
            Text("Is Wayfare missing something?")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .padding()
            Text("Thank you for telling us about a new place or activity to list on Wayfare. Your contributions make our community stronger. To get started, tell us a little bit more.")
                .font(.body)
                .padding()
            
            Form {
                
                HStack {
                    Image(systemName: "figure.run.circle.fill")
                        .foregroundColor(.orange)
                    Text("Activity")
                }
                
                Section {
                    TextField("Write here the activity", text: $QueryActivity)
                } header: {
                    Text("What activity?")
                }
                
                Section {
                    TextField("Add here a description of the activity", text: $QueryActivityDescription)
                } header: {
                    Text("How?")
                }
                
                Section {
                    
                    Button {
                        check1 = true
                        if check == false { check=true }
                        else { check=false }
                    } label: {
                        HStack{
                            Text("Select from discovery").foregroundColor(.primary)
                            Spacer()
                            if check == true {
                                Image(systemName: "checkmark")
                                .foregroundColor(.orange).opacity(check1 ? 1 : 0) }
                        }
                    }
                    
                    Button {
                        check1 = true
                        if check == true { check=false }
                        else { check=false }
                    } label: {
                        HStack{
                            Text("Suggest just the activity").foregroundColor(.primary)
                            Spacer()
                            if check == false {
                                Image(systemName: "checkmark")
                                .foregroundColor(.orange).opacity(check1 ? 1 : 0) }
                        }
                    }
                    
                } header: {
                    Text("Where?")
                } footer: {
                    Text ("If you are suggesting a new activity and don’t know where it is practiced, select the latter option")
                        .font(.system(size: 12))
                }
                
            }   .padding()
        }
        
    }
}

struct ActivitySuggestView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySuggestView()
    }
}
