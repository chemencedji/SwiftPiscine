import Foundation

var test = Deck(a: false)

print(test)

Deck.drow()
Deck.drow()
print("\n")
for i in Deck.outs{
	    print("outs[i] = \(i)")
}
print("\n")
Deck.fold(c: Deck.outs[0])

for i in Deck.discards{
	    print("discards[i] = \(i)")
}
print("\n")
for i in Deck.outs{
	    print("outs[i] = \(i)")
}
print("\n")
for i in Deck.cards{
	  print(i)
}
