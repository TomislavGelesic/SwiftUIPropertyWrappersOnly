// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import Foundation

struct NavigationSheetItem: Identifiable {
    var id: NavigationSheetItemType
}


enum NavigationSheetItemType: String {
    
    case mediatorSheetFirst, mediatorSheetSecond
}
