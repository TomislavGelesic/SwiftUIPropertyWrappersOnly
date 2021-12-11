// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

class HomeViewRouter {
    
    func makeMediatorView() -> some View {
        MediatorView()
    }
    
    func makeFinalView(model: Entity) -> some View {
        FinalView(presenter: FinalViewPresenter(interactor: Interactor(model: model)))
    }
}
