// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct InfoView: View {
    
    var selection: SelectionType
    var ints: [Int]
    
    var body: some View {
        VStack {
            Text("Selection \(selection == .none ? "is: _?_?_" : "was: \(selection.rawValue)")")
            
            Text(intsToString() ?? "")
        }
        .padding()
    }
    
    func intsToString() -> String? {
        if ints.isEmpty {
            return nil
        }
        let intStrings = ints.map { String($0) }
        var result: String = .init()
        result.append("Ints are: [ ")
        for string in intStrings {
            result.append(contentsOf: "\(string) ")
        }
        result.append("]")
        return result
    }
}
