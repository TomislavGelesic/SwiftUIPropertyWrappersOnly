// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct MediatorView: View {
    @EnvironmentObject var navigationItem: HomeNavigationItem
    @EnvironmentObject var model: Entity
    
    var body: some View {
        VStack {
            Spacer()
            Text("This is MediatorView, go on..")
            Spacer()
            Button {
                navigationItem.type = .finalView
            } label: {
                Text("Go on")
                    .foregroundColor(.green)
                    .fontWeight(.black)
            }
            Spacer()
        }
        .navigationBarTitle("MediatorView", displayMode: .inline)
    }
}
