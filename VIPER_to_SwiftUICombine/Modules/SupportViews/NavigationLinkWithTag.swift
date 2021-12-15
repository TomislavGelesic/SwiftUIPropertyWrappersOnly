// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct NavigationLinkWithTag<DestinationView: View>: View {
    var destinationView: DestinationView
    var tag: NavigationDestination
    @ObservedObject var navigationControl: MainNavigationControl
    @ObservedObject var sheetControl: MainSheetControl
    @ObservedObject var data: MainDataModel
    
    #warning("Big Question")
    // If NavigationLink adds view to navigation stack - why do one must put .environmentObject manually?
    // "SwiftUI creates new Evnironment for each view - does the view looks into his env and not in parents one??"
    var body: some View {
        NavigationLink(
            destination: destinationView
                .environmentObject(navigationControl)
                .environmentObject(sheetControl)
                .environmentObject(data),
            tag: tag,
            selection: $navigationControl.destination
        ) { EmptyView() }
    }
}
