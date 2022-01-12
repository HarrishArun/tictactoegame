import 'dart:math';
import 'package:tic_tac_toe/change_theme_button.dart';
import 'package:tic_tac_toe/theme.dart';
import 'onboard/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Game_button.dart';
import 'package:tic_tac_toe/custom_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> buttonsList = [];
  var player1;
  var player2;
  var activePlayer;

  int _counter = 0;
  void _winCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1 = [];
    player2 = [];
    activePlayer = 1;

    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.bg = Colors.pink.shade300;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";
        gb.bg = Colors.blue.shade300;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => new CustomDialog(
                  "Game Tied", 'assets/images/tied.png', resetGame));
        } else {
          activePlayer == 2 ? autoPlay() : null;
        }
      }
    });
  }

  void autoPlay() {
    var emptyCells = [];
    var list = new List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = new Random();
    var randIndex = r.nextInt(emptyCells.length - 1);
    var cellID = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p) => p.id == cellID);
    playGame(buttonsList[i]);
  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    // row 2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    // row 3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    // col 1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    // col 2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    // col 3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    //diagonal
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => new CustomDialog(
                "Hurray!You Won", 'assets/images/winner.png', resetGame));
        _winCounter();
      } else {
        showDialog(
            context: context,
            builder: (_) => new CustomDialog(
                "Oops Computer Won", 'assets/images/lost.png', resetGame));
      }
    }

    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: const Text('Tic Tac Toe'),
          backgroundColor: MainColor.secondaryColor,
          elevation: 0,
          actions: [
            ChangeThemeButton(),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => OnBoardingPage(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                icon: Icon(Icons.help)),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/illustration.png',
                height: 200.0,
                scale: 1,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/win.png'),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(45.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 9,
                            mainAxisSpacing: 9),
                    itemCount: buttonsList.length,
                    itemBuilder: (context, i) => SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: ElevatedButton(
                          onPressed: buttonsList[i].enabled
                              ? () => playGame(buttonsList[i])
                              : null,
                          child: Text(
                            buttonsList[i].text,
                            style: TextStyle(
                                color: buttonsList[i].bg, fontSize: 64.0),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  MainColor.secondaryColor),
                              elevation: MaterialStateProperty.all(0))),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50.0,
                color: MainColor.primaryColor,
                child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.replay,
                    ),
                    onPressed: resetGame,
                    label: Text(
                      'Reset',
                      style: TextStyle(fontSize: 15),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MainColor.secondaryColor),
                      elevation: MaterialStateProperty.all(0),
                    )),
              ),
            ],
          ),
        ));
  }
}
