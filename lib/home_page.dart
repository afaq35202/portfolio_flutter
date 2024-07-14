import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/items_widget.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/widgets/social_icon.dart';


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
                mobile: body(context),
                tablet: body(context),
                desktop: body(context)),
          ],
        ),
      ),
    ));
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        Container(
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
                            textStyle: TextStyle(
                                fontSize: Responsive.isMobile(context) ? 40 : 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            colors: textGradient,
                          ),
                        ],
                        isRepeatingAnimation: true,
                        onTap: () {},
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
                            textStyle: TextStyle(
                                fontSize: Responsive.isMobile(context) ? 15 : 20,
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
                      if (Responsive.isMobile(context))
                        const SizedBox(
                          height: 50,
                        ),
                    ],
                  ),
                ),
              ),
              if (!Responsive.isMobile(context))
                Image.asset(
                  "assets/profile.png",
                  width: 285,
                  height: 260,
                  fit: BoxFit.contain,
                )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 0 : 50),
          child: Column(
            children: [
              Row(
                children: [
                  if (!Responsive.isMobile(context))
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Text(
                        "Projects",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        softWrap: true,
                      ),
                    ),
                  Expanded(
                      child: Container(
                    color: lightGreyColor,
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      children: [
                        SocialIcon(
                          path: "assets/cv.webp",
                          url: Constants.cvUrl,
                          isMobile: Responsive.isMobile(context),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SocialIcon(
                          path: "assets/call.webp",
                          url: Constants.callUrl,
                          isMobile: Responsive.isMobile(context),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SocialIcon(
                            path: "assets/gmail.webp",
                            url: Constants.linkdinUrl,
                            isMobile: Responsive.isMobile(context),
                            isEmail: true),
                        const SizedBox(
                          width: 15,
                        ),
                        SocialIcon(
                          path: "assets/whatsapp.webp",
                          url: Constants.whatsappUrl,
                          isMobile: Responsive.isMobile(context),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SocialIcon(
                          path: "assets/github.webp",
                          url: Constants.githubUrl,
                          isMobile: Responsive.isMobile(context),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SocialIcon(
                          path: "assets/linkdin.webp",
                          url: Constants.linkdinUrl,
                          isMobile: Responsive.isMobile(context),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ))
                ],
              ),
              const ItemsWidget(),
            ],
          ),
        )
      ],
    );
  }
}
