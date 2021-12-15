// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

@main
struct VIPER_to_SwiftUICombineApp: App {
    
    @StateObject var mainNavigationControl: MainNavigationControl = .init()
    @StateObject var mainData: MainDataModel = .init()
    @StateObject var mainSheetControl: MainSheetControl = .init()
    
    var body: some Scene {
        WindowGroup {
            IntegratorView {
                HomeView()
                    .environmentObject(mainNavigationControl)
                    .environmentObject(mainSheetControl)
                    .environmentObject(mainData)
            }
        }
    }
}


struct IntegratorView<Content: View>: View {
    var content: () -> Content
    
    var body: some View {
        NavigationView {
            content()
        }
    }
}
