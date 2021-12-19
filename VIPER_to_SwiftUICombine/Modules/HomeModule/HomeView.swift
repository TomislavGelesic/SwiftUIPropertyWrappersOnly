// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var mainNavigationControl: MainNavigationControl
    @EnvironmentObject var mainData: MainDataModel
    @EnvironmentObject var mainSheetControl: MainSheetControl
    let viewModel: HomeViewModel = .init()
    
    var body: some View {
        VStack {
            Spacer()
            InfoView(
                titleText: viewModel.createInfoViewTitleText(from: mainData),
                descriptionText: viewModel.createInfoViewDescriptionText(from: mainData)
            )
            Spacer()
            createButtons()
            Spacer()
        }
        .navigationBarTitle("HomeView!", displayMode: .inline)
        
        // ADD SheetControl on parent View
        .sheet(
            item: $mainSheetControl.sheetItem,
            onDismiss: {
                viewModel.handleEvent(
                    event: .dismissSheet(mainSheetControl.sheetItem),
                    navigationControl: mainNavigationControl,
                    sheetControl: mainSheetControl
                )
            },
            content: { sheetItem in
                VStack {
                    Text(sheetItem.id.rawValue)
                }
            }
        )
        
        // ADD NavigationLinks on parent View
        .hiddenBackgroundView(
            ZStack {
                NavigationLinkWithTag(
                    destinationView: MediatorView(),
                    tag: .mediatorView,
                    navigationControl: mainNavigationControl,
                    sheetControl: mainSheetControl,
                    data: mainData)
                
                NavigationLinkWithTag(
                    destinationView: FinalView(),
                    tag: .finalView,
                    navigationControl: mainNavigationControl,
                    sheetControl: mainSheetControl,
                    data: mainData)
            }
        )
    }
    
    
    func createButtons() -> some View {
        VStack {
            
            Button {
                viewModel.handleEvent(
                    event: .goToMediatorView,
                    navigationControl: mainNavigationControl,
                    sheetControl: mainSheetControl
                )
            } label: {
                createButtonLabel("MediatorView")
            }
            
            Button {
                viewModel.handleEvent(
                    event: .goToMediatorViewFirstSheet,
                    navigationControl: mainNavigationControl,
                    sheetControl: mainSheetControl
                )
            } label: {
                createButtonLabel("MediatorView (FirstSheet)")
            }
            
            Button {
                viewModel.handleEvent(
                    event: .goToMediatorViewSecondSheet,
                    navigationControl: mainNavigationControl,
                    sheetControl: mainSheetControl
                )
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
