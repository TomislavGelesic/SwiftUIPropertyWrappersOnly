// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

@main
struct VIPER_to_SwiftUICombineApp: App {
    
    @StateObject var mainState: MainState = .init()
    @StateObject var mainData: MainDataModel = .init()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .environmentObject(mainState)
                    .environmentObject(mainData)
            }
        }
    }
}
