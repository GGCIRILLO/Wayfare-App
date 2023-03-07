//
//  EditProfileView.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 03/03/23.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var mail: String = ""
    @State var oldpassword: String = ""
    @State var newpassword: String = ""
    var body: some View {
        NavigationStack {
            VStack{
                Form {
                    TextField("Your e-mail", text: $mail)
                    TextField("Old password", text: $oldpassword)
                    TextField("New password", text: $newpassword)
                    
                }
            }
            .navigationBarTitle("Profile", displayMode: .inline)
            .navigationBarItems(
                trailing: Button("Save"){
                dismiss()
            }
                    .disabled(mail.isEmpty || oldpassword.isEmpty || newpassword.isEmpty)
            )
        }
        
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
