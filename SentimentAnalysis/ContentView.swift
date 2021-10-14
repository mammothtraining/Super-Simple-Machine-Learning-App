
import SwiftUI
import NaturalLanguage

struct ContentView: View {
    
    @State private var inputText: String = ""
    
    private var score: String {
        
        return analyzeSentiment(for: inputText)
    }
    
    private let tagger = NLTagger( tagSchemes: [.sentimentScore] )
    
    private func analyzeSentiment(for stringToAnalyze: String) -> String {
        
        tagger.string = stringToAnalyze
        
        let (sentimentScore, _) = tagger.tag(at: stringToAnalyze.startIndex,
                   unit: .paragraph,
                   scheme: .sentimentScore
        )
        
        return sentimentScore?.rawValue ?? ""
        
    }
    
    var body: some View {
        
        VStack {
            
            Text("Sentiment Analyzer")
            
            TextField("Enter text", text: $inputText)
            
            Text(score)
            
        }
        .font(.system(size: 40))
        .multilineTextAlignment(.center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
