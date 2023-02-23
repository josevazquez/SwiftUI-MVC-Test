//
//  SwiftUI_MVC_TestApp.swift
//  SwiftUI MVC Test
//
//  Created by Jose Vazquez on 2/22/23.
//

import SwiftUI

@main
struct SwiftUI_MVC_TestApp: App {
    @StateObject var appModel = AppModel()
    
    var body: some Scene {
        WindowGroup {
            BouncerView(appModel: appModel)
        }
    }
}
