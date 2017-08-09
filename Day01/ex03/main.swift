import Foundation

var testCards = Deck.allCards

testCards.shuffle()

for elem in testCards
{
	print(elem)
}
