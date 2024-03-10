void main(List<String> args) {
  var deck = new Deck();
  // deck.shuffle();
  // print(deck);
  print(deck.cardWithSuite('Clubs'));
}

class Deck {
  List<Card> cards = [];

  Deck() {
    var suits = ['Diamond', 'Clubs', 'Spades', 'Hearts'];
    var ranks = [
      'Ace',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine',
      'ten',
      'joker',
      'queen',
      'king'
    ];
    for (var suit in suits) {
      for (var rank in ranks) {
        cards.add(Card(suit, rank));
      }
    }
  }
  shuffle() {
    cards.shuffle();
  }

  cardWithSuite(String suit) {
    return cards.where((element) {
      return element.suit == suit;
    });
  }

  @override
  String toString() {
    return cards.toString();
  }
}

class Card {
  String suit;
  String rank;
  Card(this.suit, this.rank);
  @override
  String toString() {
    return "$rank of $suit";
  }
}
