import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';

import 'bottom_hover_widget.dart';

class ContentWidget extends StatefulWidget {
  final bool isMobile;

  const ContentWidget({super.key, required this.isMobile});

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: widget.isMobile ? 0 : 100),
      child: InkWell(
        onTap: () {},
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        child: Stack(
          children: [
            Center(
              child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: widget.isMobile
                          ? MediaQuery.of(context).size.width / 3
                          : MediaQuery.of(context).size.width / 5,
                      child: Image.asset(
                        "assets/audio_converter/image$index.webp",
                        fit: BoxFit.fill,
                      ),
                    );
                  }),
            ),
            BottomHoverWidget(isItemHover: isHover,isAppStore: false,playStoreUrl: Constants.videoToMp3Play,),
          ],
        ),
      ),
    );
  }
}
