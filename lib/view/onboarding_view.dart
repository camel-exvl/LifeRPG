import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:liferpg/view/home_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeView()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'res/icons/status.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 240]) {
    return Image.asset(assetName, width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0, height: 2);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      // pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Theme.of(context).colorScheme.surface,
      allowImplicitScrolling: true,
      // autoScrollDuration: 3000,
      // infiniteAutoScroll: true,
      // globalHeader: Align(
      //   alignment: Alignment.topRight,
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 16, right: 16),
      //       child: _buildImage('status.png', 100),
      //     ),
      //   ),
      // ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\'s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: AppLocalizations.of(context)!.taskManagementHabitBuilding,
          bodyWidget: Text(
            AppLocalizations.of(context)!
                .taskManagementHabitBuildingDescription,
            textAlign: TextAlign.left,
            style: bodyStyle,
          ),
          image: _buildImage('res/icons/deadline.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: AppLocalizations.of(context)!.rewardsSystem,
          bodyWidget: Text(
            AppLocalizations.of(context)!.rewardsSystemDescription,
            textAlign: TextAlign.left,
            style: bodyStyle,
          ),
          image: _buildImage('res/icons/habit_type.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: AppLocalizations.of(context)!.achievementsAttributes,
          bodyWidget: Text(
            AppLocalizations.of(context)!.achievementsAttributesDescription,
            textAlign: TextAlign.left,
            style: bodyStyle,
          ),
          image: _buildImage('res/icons/brave.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: AppLocalizations.of(context)!.shopInventoryChallengeSystem,
          bodyWidget: Text(
            AppLocalizations.of(context)!
                .shopInventoryChallengeSystemDescription,
            textAlign: TextAlign.left,
            style: bodyStyle,
          ),
          image: _buildImage('res/icons/challenge.png'),
          decoration: pageDecoration,
          // image: _buildFullscreenImage(),
          // decoration: pageDecoration.copyWith(
          //   contentMargin: const EdgeInsets.symmetric(horizontal: 16),
          //   fullScreen: true,
          //   bodyFlex: 2,
          //   imageFlex: 3,
          //   safeArea: 100,
          // ),
        ),
        //   PageViewModel(
        //     title: "Another title page",
        //     body: "Another beautiful body text for this example onboarding",
        //     image: _buildImage('status.png'),
        //     footer: ElevatedButton(
        //       onPressed: () {
        //         introKey.currentState?.animateScroll(0);
        //       },
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.lightBlue,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(8.0),
        //         ),
        //       ),
        //       child: const Text(
        //         'FooButton',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     ),
        //     decoration: pageDecoration.copyWith(
        //       bodyFlex: 6,
        //       imageFlex: 6,
        //       safeArea: 80,
        //     ),
        //   ),
        //   PageViewModel(
        //     title: "Title of last page - reversed",
        //     bodyWidget: const Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text("Click on ", style: bodyStyle),
        //         Icon(Icons.edit),
        //         Text(" to edit a post", style: bodyStyle),
        //       ],
        //     ),
        //     decoration: pageDecoration.copyWith(
        //       bodyFlex: 2,
        //       imageFlex: 4,
        //       bodyAlignment: Alignment.bottomCenter,
        //       imageAlignment: Alignment.topCenter,
        //     ),
        //     image: _buildImage('status.png'),
        //     reverse: true,
        //   ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: Text(AppLocalizations.of(context)!.skip,
          style: const TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: Text(AppLocalizations.of(context)!.done,
          style: const TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: const Color(0xFFBDBDBD),
        activeColor: Theme.of(context).colorScheme.primary,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        // color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
