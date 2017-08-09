import Foundation

public class Deck: NSObject {
	static public let allSpades: [Card] = Value.allValues.map{Card(color: Color.Spades, value: $0)}
	static public let allDiamonds: [Card] = Value.allValues.map{Card(color: Color.Diamonds, value: $0)}
	static public let allHearts: [Card] = Value.allValues.map{Card(color: Color.Hearts, value: $0)}
	static public let allClubs: [Card] = Value.allValues.map{Card(color: Color.Clubs, value: $0)}
	static public let allCards: [Card] = allSpades + allDiamonds + allHearts + allClubs
}
