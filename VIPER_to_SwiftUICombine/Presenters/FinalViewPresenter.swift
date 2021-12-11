// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

class FinalViewPresenter: ObservableObject {
    
    var interactor: Interactor
    
    public init(interactor: Interactor) {
        self.interactor = interactor
    }
    
    func select(_ selection: SelectionType) {
        interactor.select(selection)
    }
}
