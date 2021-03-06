// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import Foundation

enum HomeViewEvent {
    case goToMediatorView
    case goToMediatorViewSecondSheet
    case goToMediatorViewFirstSheet
    case dismissSheet(NavigationSheetItem?)
}
