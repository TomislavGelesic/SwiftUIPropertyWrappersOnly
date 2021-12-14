// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct NavigationLinkWithTag<DestinationView: View>: View {
    var destinationView: DestinationView
    var tag: NavigationDestination
    @ObservedObject var state: MainState
    @ObservedObject var data: MainDataModel
    
    var body: some View {
        NavigationLink(
            destination: destinationView
                .environmentObject(state)
                .environmentObject(data),
            tag: tag,
            selection: $state.destination
        ) { EmptyView() }
    }
}
