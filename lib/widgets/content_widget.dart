import 'package:flutter/material.dart';
import 'package:portfolio/data_model/items_data_model.dart';
import 'package:portfolio/utils/constants.dart';

import '../utils/responsive.dart';
import 'bottom_hover_widget.dart';

class ContentWidget extends StatefulWidget {
  final ItemsDataModel model;

  const ContentWidget({super.key, required this.model});

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
        width: Responsive.isMobile(context)||Responsive.isTablet(context)
            ? double.infinity
            : MediaQuery.of(context).size.width / 2.5,
        height: Responsive.isMobile(context)||Responsive.isTablet(context) ? 150 : 200,
        child: Stack(
          children: [
            Material(
              elevation: 10,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(16),
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
                  Responsive.isMobile(context) ? true : isHover,
              playStoreUrl: widget.model.urlPlayStore,
              appStoreUrl: widget.model.urlAppStore,
            )
          ],
        ),
      ),
    );
  }
}
