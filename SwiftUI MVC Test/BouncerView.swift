//
//  BouncerView.swift
//  Question
//
//  Created by Jose Vazquez on 2/10/23.
//

import SwiftUI
import Combine

struct BouncerView: View {
    
    // MARK: Model -
    @ObservedObject var appModel: AppModel
    
    // MARK: View -
    var body: some View {
        switch appModel.appState {
        case .loginRequired:
            VStack {
                Text("loginRequired v2")
                Button("Fake Login") { appModel.authenticate() }
                .padding(.all)
            }
        case .authenticated(let sessionModel):
            VStack {
                HomeView(sessionModel: sessionModel)
            }
        }
    }
    
}


// MARK: - Preview
#if DEBUG

struct BouncerView_Previews: PreviewProvider {
    static var previews: some View {
        let appModel: AppModel = AppModel()
        BouncerView(appModel: appModel)
    }
}

#endif
