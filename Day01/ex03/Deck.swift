import Foundation

public class Deck: NSObject {
	static public let allSpades: [Card] = Value.allValues.map{Card(color: Color.Spades, value: $0)}
	static public let allDiamonds: [Card] = Value.allValues.map{Card(color: Color.Diamonds, value: $0)}
	static public let allHearts: [Card] = Value.allValues.map{Card(color: Color.Hearts, value: $0)}
	static public let allClubs: [Card] = Value.allValues.map{Card(color: Color.Clubs, value: $0)}
	static public let allCards: [Card] = allSpades + allDiamonds + allHearts + allClubs
}

extension Array {
	mutating func shuffle() {
		var index = 0
		for j in  0..<self.count {
			index = Int(arc4random_uniform(UInt32(self.count)))
			if j != index {
				swap(&self[j], &self[index])
				}
				}
				}
}
