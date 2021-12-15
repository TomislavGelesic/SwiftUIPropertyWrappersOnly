// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

class MainNavigationControl: ObservableObject {
    // Optional, when nil - show home/main/master/init view - none NavigationLink is active
    @Published var destination: NavigationDestination?
}


#warning("Generic NavigationControl.")
// One could create multiple navigationControlls for multiple navigation stacks in feature
// Enum 'destination'is generic part - could be a bit complex part of impl, for this is support code.

// class NavigatiControl<Destination: (Enumerable?!)>: ObservableObject {
//     @Published var destination: (Enumerable?!)?
// }
