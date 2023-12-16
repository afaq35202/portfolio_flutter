import 'package:flutter/material.dart';
import 'package:portfolio/data_model/items_data_model.dart';
import 'package:portfolio/utils/constants.dart';

import 'bottom_hover_widget.dart';

class ContentWidget extends StatefulWidget {
  final CheckDevice device;
  final ItemsDataModel model;

  const ContentWidget({super.key, required this.device, required this.model});

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (val) {
        isHover = val;
        setState(() {});
      },
      child: SizedBox(
        width: widget.device == CheckDevice.isMobile||widget.device==CheckDevice.isTablet
            ? double.infinity
            : MediaQuery.of(context).size.width / 2.5,
        height: widget.device == CheckDevice.isMobile||widget.device==CheckDevice.isTablet ? 150 : 200,
        child: Stack(
          children: [
            Material(
              elevation: 10,
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Image.asset(
                    widget.model.imagePath,
                  )),
            ),
            BottomHoverWidget(
              isItemHover:
                  widget.device == CheckDevice.isMobile ? true : isHover,
              playStoreUrl: widget.model.urlPlayStore,
              appStoreUrl: widget.model.urlAppStore,
            )
          ],
        ),
      ),
    );
  }
}
