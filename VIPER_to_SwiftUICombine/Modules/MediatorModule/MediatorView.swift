// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct MediatorView: View {
    @EnvironmentObject var mainState: MainState
    let presenter: MediatorViewPresenter = .init()
    var body: some View {
        VStack {
            Spacer()
            Text("This is MediatorView, go on..")
            Spacer()
            Button {
                presenter.handleEvent(event: .goToFinalView, state: mainState)
            } label: {
                Text("Go on")
                    .foregroundColor(.green)
                    .fontWeight(.black)
            }
            Spacer()
        }
        .navigationBarTitle("MediatorView", displayMode: .inline)
        .navigationOverride(actionBack: {
            presenter.handleEvent(event: .goBack, state: mainState)
        })
    }
}