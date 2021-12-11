// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct FinalView: View {
    
    @EnvironmentObject var navigation: HomeNavigation
    @ObservedObject var presenter: FinalViewPresenter
    
    var body: some View {
        VStack {
            Spacer()
            Text("Select and head back")
            Spacer()
            buttons()
            Spacer()
            
            if !presenter.interactor.model.ints.isEmpty {
                Text("You selected: \(presenter.getSelection())")
                Button {
                    navigation.destination = .none
                } label: {
                    Text("Head back")
                        .foregroundColor(.green)
                        .fontWeight(.black)
                }
            }
            Spacer()
        }
        .navigationBarTitle("FinalView!", displayMode: .inline)
    }
    
    func buttons() -> some View {
        VStack {
            createButton(type: .none)
            createButton(type: .one)
            createButton(type: .two)
            createButton(type: .three)
        }
    }
    
    func createButton(type: OptionType) -> some View {
        Button {
            presenter.select(type)
        } label: {
            Text("Select \(type.rawValue).")
        }
        .padding()
    }
}

