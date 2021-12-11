// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

class VIPERtoSwiftUIRouter {
    
    static func makeMediatorView() -> some View {
        MediatorView()
    }
    
    static func makeFinalView(model: Entity) -> some View {
        FinalView(presenter: FinalViewPresenter(interactor: Interactor(model: model)))
    }
}
