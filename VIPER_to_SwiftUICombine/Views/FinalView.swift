// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct FinalView: View {
    
    @EnvironmentObject var navigationItem: HomeNavigationItem
    @ObservedObject var presenter: FinalViewPresenter
    
    var body: some View {
        VStack {
            Spacer()
            Text("Select and head back")
            Spacer()
            createButton(type: .none)
            createButton(type: .one)
            createButton(type: .two)
            createButton(type: .three)
            Spacer()
        }
        .navigationBarTitle("FinalView!", displayMode: .inline)
    }
    
    func createButton(type: SelectionType) -> some View {
        Button {
            presenter.select(type)
            navigationItem.type = .none
        } label: {
            Text("Select \(type.rawValue).")
        }
        .padding()
    }
}
        
