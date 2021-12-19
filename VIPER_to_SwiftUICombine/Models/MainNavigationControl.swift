// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

class MainNavigationControl: ObservableObject {
    // Optional => when nil, none NavigationLink is active
    @Published var destination: NavigationDestination?
}
