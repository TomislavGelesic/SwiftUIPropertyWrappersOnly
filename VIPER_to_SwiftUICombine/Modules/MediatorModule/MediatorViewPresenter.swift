// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import Foundation

class MediatorViewPresenter {
    func handleEvent(event: MediatorViewEvent, state: MainState) {
        switch event {
        case .goBack:
            state.sheetItem = nil
            state.destination = nil
        case .goToFinalView:
            state.destination = .finalView
        case .dismissSheet:
            state.sheetItem = nil
        }
    }
}
