// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct FinalView: View {
    
    @EnvironmentObject var mainNavigationControl: MainNavigationControl
    @EnvironmentObject var mainData: MainDataModel
    let viewModel: FinalViewModel = .init()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Select and head back")
            Spacer()
            buttons()
            Spacer()
            if viewModel.hasData(mainData) {
                Text("You selected: \(viewModel.getSelection(mainData))")
                Button {
                    viewModel.handleEvent(
                        event: .goToHomeView,
                        navigationControl: mainNavigationControl)
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
            viewModel.handleEvent(
                event: .goBack,
                navigationControl: mainNavigationControl
            )
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
            viewModel.handleEvent(
                event: .update(type, on: mainData),
                navigationControl: mainNavigationControl
            )
        } label: {
            Text("Select \(type.rawValue).")
        }
        .padding()
    }
}

