//
//  ProfileView.swift
//  ChatRestaurant
//
//  Created by Gbenga Abayomi on 21/04/2023.
//

import SwiftUI


struct ProfileView: View {

    @AppStorage("UserName") var userName = "Username"
    @AppStorage("Twitter") var twitterHandle = "twitterHandle"
    @AppStorage("Email") var eMailAdress = "user@domain.com"
    @AppStorage("Location") var location = "Location"
    @StateObject var userSettings = UserSettings()
    @State private var updateUserIsPresented = false

    var body: some View {
        NavigationView{
        List{
            VStack(alignment:.center){
                Button {
                    updateUserIsPresented = true

                } label: {
                    Image(systemName:"person.circle.fill")
                          .font(.system(size: 50))
                }
            }.popover(isPresented: $updateUserIsPresented) {
               UpdateUserView()
            }
            .frame(maxWidth:.infinity, maxHeight:50,alignment:.center)

            HStack {
                Text("Name:")
                Spacer()
                Text("\(userName)")
            }
            HStack {
                Text("Twitter:")
                Spacer()
                Text("@\(twitterHandle)")
            }
            HStack {
                Text("E-Mail:")
                Spacer()
                Text("\(eMailAdress)")
            }
            HStack {
                Text("Location")
                Spacer()
                Text(("\(location)"))
            }

        }.navigationBarTitle("Profile")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                VStack {
                    Text("(Tap the icon at the top to update your information)").font(.footnote)
                }
            }
        }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
