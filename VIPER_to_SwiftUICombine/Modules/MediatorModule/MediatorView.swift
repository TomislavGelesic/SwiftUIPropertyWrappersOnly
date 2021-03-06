// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct MediatorView: View {
    @EnvironmentObject var mainNavigationControl: MainNavigationControl
    @EnvironmentObject var mainSheetControl: MainSheetControl
    let viewModel: MediatorViewModel = .init()
    
    var body: some View {
        VStack {
            Spacer()
            Text("This is MediatorView, go on..")
            Spacer()
            Button {
                viewModel.handleEvent(
                    event: .goToFinalView,
                    navigationControl: mainNavigationControl,
                    sheetControl: mainSheetControl
                )
            } label: {
                Text("Go on")
                    .foregroundColor(.green)
                    .fontWeight(.black)
            }
            Spacer()
        }
        .navigationBarTitle("MediatorView", displayMode: .inline)
        .navigationOverride(actionBack: {
            viewModel.handleEvent(
                event: .goBack,
                navigationControl: mainNavigationControl,
                sheetControl: mainSheetControl
            )
        })
    }
}
