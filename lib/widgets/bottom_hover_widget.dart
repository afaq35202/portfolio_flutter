import 'package:flutter/material.dart';
import 'package:portfolio/widgets/social_icon.dart';

class BottomHoverWidget extends StatelessWidget {
  final bool isItemHover;
  final bool isAppStore;
  final String playStoreUrl;
  final String? appStoreUrl;

  const BottomHoverWidget(
      {super.key,
      required this.isItemHover,
      required this.isAppStore,
      required this.playStoreUrl,
      this.appStoreUrl});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isItemHover ? 35 : 0,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white30,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 2,
                color: Colors.black26,
              ),
            ],
          ),
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FittedBox(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  SocialIcon(
                    path: "assets/play_store.webp",
                    url: playStoreUrl,
                  ),
                  if (isAppStore)
                    const SizedBox(
                      width: 20,
                    ),
                  if (isAppStore)
                    SocialIcon(
                      path: "assets/app_store.webp",
                      url: appStoreUrl!,
                    ),
                ],
              ),
            ),
          )),
    );
  }
}


