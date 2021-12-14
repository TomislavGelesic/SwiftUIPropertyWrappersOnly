// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

struct InfoView: View {
    var titleText: String
    var descriptionText: String
    
    var body: some View {
        VStack {
            Text(titleText)
            
            Text(descriptionText)
        }
        .padding()
    }
}
