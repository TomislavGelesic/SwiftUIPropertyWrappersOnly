// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var mainState: MainState
    @EnvironmentObject var mainData: MainDataModel
    let presenter: HomeViewPresenter = .init()
    
    var body: some View {
        VStack {
            Spacer()
            InfoView(
                titleText: presenter.createInfoViewTitleText(from: mainData),
                descriptionText: presenter.createInfoViewDescriptionText(from: mainData)
            )
            Spacer()
            createButtons()
            Spacer()
        }
        .navigationBarTitle("HomeView!", displayMode: .inline)
        .sheet(
            item: $mainState.sheetItem,
            onDismiss: {
                presenter.handleEvent(event: .dismissSheet(mainState.sheetItem), state: mainState)
            },
            content: { sheetItem in
                VStack {
                    Text(sheetItem.id.rawValue)
                }
            }
        )
        .hiddenNavigationLink(
            NavigationLinkWithTag(
                destinationView: MediatorView(),
                tag: .mediatorView,
                state: mainState,
                data: mainData)
        )
        .hiddenNavigationLink(
            NavigationLinkWithTag(
                destinationView: FinalView(),
                tag: .finalView,
                state: mainState,
                data: mainData)
        )
    }
    
    
    func createButtons() -> some View {
        VStack {
            
            Button {
                presenter.handleEvent(event: .goToMediatorView, state: mainState)
            } label: {
                createButtonLabel("MediatorView")
            }
            
            Button {
                presenter.handleEvent(event: .goToMediatorViewFirstSheet, state: mainState)
            } label: {
                createButtonLabel("MediatorView (FirstSheet)")
            }
            
            Button {
                presenter.handleEvent(event: .goToMediatorViewSecondSheet, state: mainState)
            } label: {
                createButtonLabel("MediatorView (SecondSheet)")
            }
        }
    }
    
    func createButtonLabel(_ text: String = "") -> some View {
        Text(text)
            .foregroundColor(.green)
            .fontWeight(.black)
            .padding()
    }
}
