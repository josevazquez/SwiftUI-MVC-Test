//
//  DetailView.swift
//  Question
//
//  Created by Jose Vazquez on 2/16/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var sessionModel: SessionModel
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
            Text("permission: \(sessionModel.token())")
            Button("Log out") {
                sessionModel.logOut()
            }
            .padding(.all)
        }
    }
}


// MARK: - Preview
#if DEBUG

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sessionModel: SessionModel = {
            SessionModel(authentication: Authentication(token: "Granted!"),
                        logoutAction: { print("logout") })
        }()

        DetailView(sessionModel: sessionModel, title: "Some Title")
    }
}

#endif
