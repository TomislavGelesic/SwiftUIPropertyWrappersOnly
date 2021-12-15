// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import Foundation

class MediatorViewModel {
    func handleEvent(event: MediatorViewEvent, navigationControl: MainNavigationControl, sheetControl: MainSheetControl) {
        switch event {
        case .goBack:
            sheetControl.sheetItem = nil
            navigationControl.destination = nil
        case .goToFinalView:
            navigationControl.destination = .finalView
        case .dismissSheet:
            sheetControl.sheetItem = nil
        }
    }
}
