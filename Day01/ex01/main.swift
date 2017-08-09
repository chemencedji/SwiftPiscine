import Foundation

var elem1:Card = Card(color: Color.Diamonts, value: Value.Five)
var elem2:Card = Card(color: Color.Hearts, value: Value.Two)

print(elem1);
print(elem2);
print(elem1.isEqual(elem2))
print(elem1 == elem2)
