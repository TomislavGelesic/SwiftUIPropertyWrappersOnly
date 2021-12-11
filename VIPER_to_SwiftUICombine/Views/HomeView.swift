// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct HomeView: View {
    // Access [Entity] in every view environment.
    @EnvironmentObject var model: Entity
    // Create [Presenter] upon creating [View]
    @ObservedObject var presenter: HomeViewPresenter
    // Custom instance for handling navigation flow
    @StateObject var navigation: HomeNavigation = .init()
    
    var body: some View {
        ZStack { // random View element (Does it matter when using ScrollView? Do EmptyViews tamper with UI layout?)
            addNavigationLinks() // add all navigation UI
            
            VStack { // add all content UI
                Spacer()
                InfoView(selection: presenter.option, ints: presenter.ints)
                Spacer()
                
                Button {
                    navigation.destination = .mediatorView
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
    
    func addNavigationLinks() -> some View {
        ZStack { // random View element (Does it matter when using ScrollView? Do EmptyViews tamper with UI layout?)
            
            HomeNavigationLink( // custom NavigationLink
                destinationView: VIPERtoSwiftUIRouter.makeMediatorView(),
                navigateBack: { navigation.destination = nil },
                tag: .mediatorView,
                selection: navigation
            )
            
            HomeNavigationLink( // custom NavigationLink
                destinationView: VIPERtoSwiftUIRouter.makeFinalView(model: model),
                navigateBack: { navigation.destination = .mediatorView},
                tag: .finalView,
                selection: navigation
            )
        }
    }
}
