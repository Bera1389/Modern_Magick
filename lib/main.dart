import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

enum CardType {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  eleven,
  twelve,
  thirteen,
  fourteen,
  fifteen,
  sixteen,
  seventeen,
  eighteen,
  nineteen,
  twenty,
  twenty_one,
}

class PlayingCard {
  CardType cardType;
  bool faceUp;
  bool opened;
  PlayingCard({
    @required this.cardType,
    this.faceUp = false,
    this.opened = false,
  });
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<PlayingCard> cardList = List<PlayingCard>(21);

  @override
  void initState() {
    super.initState();
    _initialiseGame();
  }

  void _initialiseGame() {
    List<PlayingCard> allCards = [];
    CardType.values.forEach((type) {
      allCards.add(PlayingCard(
        cardType: type,
        faceUp: Random().nextBool(),
      ));
    });

    for (int i = 0; i < 7; i++) {
      int randomNumber = Random().nextInt(allCards.length);
      PlayingCard card = allCards[randomNumber];
      allCards.removeAt(randomNumber);
      cardList[i] = card;
    }
  }

  cardFunction(int kk) => cardList[kk].faceUp
      ? Image.asset(
          'assets/images/tarot_${cardList[kk].cardType.toString().split('.').last}.jpg')
      : RotatedBox(
          quarterTurns: 10,
          child: Image.asset(
              'assets/images/tarot_${cardList[kk].cardType.toString().split('.').last}.jpg'),
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeva Tarot'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: cardFunction(0),
                  width: 80,
                  height: 120,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: cardFunction(1),
                  width: 80,
                  height: 120,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: cardFunction(2),
                  width: 80,
                  height: 120,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: cardFunction(3),
                  width: 80,
                  height: 120,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: cardFunction(4),
                  width: 80,
                  height: 120,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: cardFunction(5),
                  width: 80,
                  height: 120,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: cardFunction(6),
                  width: 80,
                  height: 120,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          RaisedButton(
            child: Text('Bera'),
            onPressed: () {
              print(cardList[0].cardType.toString().split('.').last);
            },
          )
        ],
      ),
    );
  }
}
