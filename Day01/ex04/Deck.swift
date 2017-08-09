import Foundation

public class Deck: NSObject {
	static var cards: [Card] = []
	static var discards: [Card] = []
	static var outs: [Card] = []

	static public let allSpades: [Card] = Value.allValues.map{Card(color: Color.Spades, value: $0)}
	static public let allDiamonds: [Card] = Value.allValues.map{Card(color: Color.Diamonds, value: $0)}
	static public let allHearts: [Card] = Value.allValues.map{Card(color: Color.Hearts, value: $0)}
	static public let allClubs: [Card] = Value.allValues.map{Card(color: Color.Clubs, value: $0)}
	static public let allCards: [Card] = allSpades + allDiamonds + allHearts + allClubs
	
	init(a :Bool){
		Deck.cards = Deck.allCards
		if a == false {
			Deck.cards.shuffle()
			}
		}
	override public var description: String {
		return (Deck.cards.description)
		}
	static public func drow() {
		Deck.outs.append(Deck.cards.removeFirst())
		}
	static public func fold (c: Card) {
		if Deck.outs.contains(c) {
			Deck.discards.append(Deck.outs.remove(at: Deck.outs.index(of: c)!))
		}
	}
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
