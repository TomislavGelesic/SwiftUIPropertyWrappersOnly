// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct HomeNavigationLink<DestinationView: View>: View {
    var destinationView: DestinationView
    var navigateBack: () -> ()
    var tag: HomeNavigationItemType
    @ObservedObject var selection: HomeNavigationItem
    
    var body: some View {
        NavigationLink(
            destination: destinationView
                .navigationOverride(actionBack: navigateBack)
                .environmentObject(selection),
            tag: tag,
            selection: $selection.type
        ) { EmptyView() }
    }
}
