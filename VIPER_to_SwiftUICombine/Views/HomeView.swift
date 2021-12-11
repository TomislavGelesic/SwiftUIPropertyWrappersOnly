// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct HomeView: View {
    // Access [Entity] in every view rom environment.
    @EnvironmentObject var model: Entity
    // Create [Presenter] upon creating [View]
    @ObservedObject var presenter: HomeViewPresenter
    // Custom instance for handling navigation flow
    @StateObject var navigationItem: HomeNavigationItem = .init()
    // Create [Router] upon creating [View]
    let router = HomeViewRouter()
    
    var body: some View {
        ZStack { // random View element (Does it matter when using ScrollView? Do EmptyViews tamper with UI layout?)
            addNavigationViews() // add all navigation UI
            
            VStack { // add all content UI
                Spacer()
                InfoView(selection: presenter.selection, ints: presenter.ints)
                Spacer()
                
                Button {
                    navigationItem.type = .mediatorView
                } label: {
                    Text("Select")
                        .foregroundColor(.green)
                        .fontWeight(.black)
                }
                
                Spacer()
            }
        }
        .navigationBarTitle("HomeView!", displayMode: .inline)
    }
    
    func addNavigationViews() -> some View {
        ZStack { // random View element (Does it matter when using ScrollView? Do EmptyViews tamper with UI layout?)
            
            HomeNavigationLink( // custom NavigationLink
                destinationView: router.makeMediatorView(),
                navigateBack: { navigationItem.type = nil },
                tag: .mediatorView,
                selection: navigationItem
            )
            
            HomeNavigationLink( // custom NavigationLink
                destinationView: router.makeFinalView(model: model),
                navigateBack: { navigationItem.type = .mediatorView},
                tag: .finalView,
                selection: navigationItem
            )
        }
    }
}
