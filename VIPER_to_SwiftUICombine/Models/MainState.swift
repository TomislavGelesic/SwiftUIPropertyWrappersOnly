// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

// Naming should be expanded on additional NavigationStacks.
class MainState: ObservableObject {
    
    @Published var destination: NavigationDestination?
    @Published var sheetItem: NavigationSheetItem?
}
