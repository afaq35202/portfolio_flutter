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
                mobile: body(CheckDevice.isMobile, context),
                tablet: body(CheckDevice.isTablet, context),
                desktop: body(CheckDevice.isDesktop, context)),
          ],
        ),
      ),
    ));
  }

  Widget body(CheckDevice device, BuildContext context) {
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
                                fontSize: device==CheckDevice.isMobile ? 40 : 50,
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
                                fontSize: device==CheckDevice.isMobile ? 15 : 20,
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
                      if (device==CheckDevice.isMobile)
                        const SizedBox(
                          height: 50,
                        ),
                    ],
                  ),
                ),
              ),
              if (device!=CheckDevice.isMobile)
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
          margin: EdgeInsets.symmetric(horizontal: device==CheckDevice.isMobile ? 0 : 50),
          child: Column(
            children: [
              Row(
                children: [
                  if (device!=CheckDevice.isMobile)
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
                          isMobile: device==CheckDevice.isMobile,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SocialIcon(
                          path: "assets/call.webp",
                          url: Constants.callUrl,
                          isMobile: device==CheckDevice.isMobile,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SocialIcon(
                            path: "assets/gmail.webp",
                            url: Constants.linkdinUrl,
                            isMobile: device==CheckDevice.isMobile,
                            isEmail: true),
                        const SizedBox(
                          width: 15,
                        ),
                        SocialIcon(
                          path: "assets/whatsapp.webp",
                          url: Constants.whatsappUrl,
                          isMobile: device==CheckDevice.isMobile,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SocialIcon(
                          path: "assets/github.webp",
                          url: Constants.githubUrl,
                          isMobile: device==CheckDevice.isMobile,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SocialIcon(
                          path: "assets/linkdin.webp",
                          url: Constants.linkdinUrl,
                          isMobile: device==CheckDevice.isMobile,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ))
                ],
              ),
              const Responsive(
                mobile: ItemsWidget(
                  checkDevice: CheckDevice.isMobile,
                ),
                tablet: ItemsWidget(
                  checkDevice: CheckDevice.isTablet,
                ),
                desktop: ItemsWidget(
                  checkDevice: CheckDevice.isDesktop,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
