//
//  HomeViewController.swift
//  Question
//
//  Created by Jose Vazquez on 2/16/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var sessionModel: SessionModel
        
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        Text("Home View")
                        Text("permission: \(sessionModel.token())")
                    }
                    Section {
                        ForEach(sessionModel.mockAPIcall(), id: \.self) {
                            NavigationLink("\($0)", value: $0)
                        }
                    }
                    Section {
                        Button("Log out") {
                            sessionModel.logOut()
                        }
                    }
                }
            }
            .navigationDestination(for: String.self, destination: { value in
                DetailView(sessionModel: sessionModel, title: value)
            })
        }
    }
    
}


// MARK: - Preview
#if DEBUG

struct SessionModelHolder: View {
    @StateObject var sessionModel: SessionModel
    
    init() {
        let sessionModel = SessionModel(authentication: Authentication(token: "Granted!"),
                                      logoutAction: { print("log out!") })
        _sessionModel = .init(wrappedValue: sessionModel)
    }
    
    var body: some View {
        HomeView(sessionModel: sessionModel)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        SessionModelHolder()
    }
}

#endif
