// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct FinalView: View {
    
    @EnvironmentObject var mainState: MainState
    @EnvironmentObject var mainData: MainDataModel
    let presenter: FinalViewPresenter = .init()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Select and head back")
            Spacer()
            buttons()
            Spacer()
            if presenter.hasData(mainData) {
                Text("You selected: \(presenter.getSelection(mainData))")
                Button {
                    presenter.handleEvent(event: .goToHomeView, state: mainState)
                } label: {
                    Text("Head back")
                        .foregroundColor(.green)
                        .fontWeight(.black)
                }
            }
            Spacer()
        }
        .navigationBarTitle("FinalView!", displayMode: .inline)
        .navigationOverride(actionBack: {
            presenter.handleEvent(event: .goBack, state: mainState)
        })
    }
    
    func buttons() -> some View {
        VStack {
            createButton(type: .none)
            createButton(type: .one)
            createButton(type: .two)
            createButton(type: .three)
        }
    }
    
    func createButton(type: IntSelectionOption) -> some View {
        Button {
            presenter.handleEvent(event: .select(type, mainData), state: mainState)
        } label: {
            Text("Select \(type.rawValue).")
        }
        .padding()
    }
}
