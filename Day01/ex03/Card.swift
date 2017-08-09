import Foundation

public class Card: NSObject {
	var cardColor: Color
	var cardValue: Value
	
	init(color: Color, value: Value) {
		cardColor = color
		cardValue = value
	}
	override public var description: String {
		return ("\(cardValue.rawValue), \(cardColor)")
	}
	override public func isEqual(_ object: Any?) -> Bool {
		if let object = object as? Card {
			if(cardColor == object.cardColor && cardValue == object.cardValue) {
				return (true)
			}
			else {
				return (false)
			}
		}
		else {
			return false
		}
	}
}
