import 'package:flutter/material.dart';
import 'package:portfolio/widgets/social_icon.dart';

class BottomHoverWidget extends StatelessWidget {
  final bool isItemHover;
  final String playStoreUrl;
  final String appStoreUrl;

  const BottomHoverWidget(
      {super.key,
      required this.isItemHover,
      required this.playStoreUrl,
      required this.appStoreUrl});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isItemHover ? 35 : 0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16)),
            boxShadow: [
              if(isItemHover)const BoxShadow(
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
                  if(playStoreUrl.isNotEmpty)
                  SocialIcon(
                    path: "assets/play_store.webp",
                    url: playStoreUrl,
                    decorateIcon: false,
                  ),
                  if (appStoreUrl.isNotEmpty)
                    const SizedBox(
                      width: 20,
                    ),
                  if (appStoreUrl.isNotEmpty)
                    SocialIcon(
                      path: "assets/app_store.webp",
                      url: appStoreUrl,
                      decorateIcon: false,
                    ),
                ],
              ),
            ),
          )),
    );
  }
}


