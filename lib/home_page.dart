import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/items_widget.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/widgets/social_icon.dart';

import 'widgets/content_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: screenBgGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Responsive(
                mobile: header(true),
                tablet: header(false),
                desktop: header(false)),
            Container(
              color: Colors.white,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        margin: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: const Text(
                          "Projects",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        color: lightGreyColor,
                        child: const Wrap(
                          alignment: WrapAlignment.end,
                          children: [
                            SocialIcon(
                                path: "assets/linkdin.png",
                                url: Constants.linkdinUrl),
                            SizedBox(
                              width: 10,
                            ),
                            SocialIcon(
                                path: "assets/github.png",
                                url: Constants.githubUrl),
                            SizedBox(
                              width: 10,
                            ),
                            SocialIcon(
                                path: "assets/whatsapp.png",
                                url: Constants.whatsappUrl),
                            SizedBox(
                              width: 10,
                            ),
                            SocialIcon(
                                path: "assets/call.png",
                                url: Constants.callUrl),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(50),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Audio Converter",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "In this project used FFMPEG to perform different operations on audio",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Responsive(
                          mobile: ContentWidget(isMobile: true),
                          tablet: ContentWidget(isMobile: false),
                          desktop: ContentWidget(isMobile: false),
                        ),
                      ],
                    ),
                  ),
                  const Responsive(
                    mobile: ItemsWidget(isMobile: true),
                    tablet: ItemsWidget(isMobile: false),
                    desktop: ItemsWidget(isMobile: false),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget header(bool isMobile) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 46),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Column(
                children: [
                  AnimatedTextKit(
                    stopPauseOnTap: false,
                    repeatForever: true,
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'AFAQ AWAN',
                        textStyle: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        colors: textGradient,
                      ),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Mobile Application Developer well versed in Android Native and Flutter',
                        textAlign: TextAlign.center,
                        cursor: "|",
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic),
                        speed: const Duration(milliseconds: 30),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 200),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                  if (isMobile)
                    const SizedBox(
                      height: 50,
                    ),
                ],
              ),
            ),
          ),
          if (!isMobile)
            Image.asset(
              "assets/profile.png",
              width: 250,
              height: 250,
            )
        ],
      ),
    );
  }
}
