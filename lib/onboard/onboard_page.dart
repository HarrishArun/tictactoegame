import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:tic_tac_toe/home_page.dart';
import 'package:tic_tac_toe/theme.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Welcome!',
              body: 'Let\'s Explore Tic Tac Toe Game',
              image: buildImage('assets/images/welcome.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Let\'s Take a look at Rules \n Rule-1 ',
              body:
                  'The game is played on a grid that\'s 3 squares by 3 squares.\n The first player to get 3 of thier marks in a row is the winner.',
              image: buildImage('assets/images/steps.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Rule-2 ',
              body:
                  'You are X,the computer is O.\n Players take turns putting their marks in empty squares.',
              image: buildImage('assets/images/step2.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Rule-3 ',
              body:
                  'The first player to get 3 of their marks in a row (up, down, across, or diagonally) is the winner.',
              footer: OutlinedButton(
                child: Text('Lets!Play',
                    style: TextStyle(color: MainColor.secondaryColor)),
                onPressed: () => goToHome(context),
              ),
              image: buildImage('assets/images/award.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: const Text(
            'Done',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Skip'),
          onSkip: () => goToHome(context),
          next: Icon(Icons.arrow_forward),
          color: MainColor.secondaryColor,
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Colors.white,
          skipFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: MainColor.secondaryColor,
        activeColor: MainColor.secondaryColor,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(fontSize: 20, color: Colors.black),
        descriptionPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
