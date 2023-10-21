import 'package:flutter/material.dart';
import 'package:portfolio/data_model/items_data_model.dart';

import 'bottom_hover_widget.dart';

class ContentWidget extends StatefulWidget {
  final bool isMobile;
  final ItemsDataModel model;

  const ContentWidget({super.key, required this.isMobile,required this.model});

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
        width: widget.isMobile?double.infinity:MediaQuery.of(context).size.width/2,
        height: widget.isMobile?150:200,
        child: Stack(
          children: [
            Material(
              elevation: 10,
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  color: Colors.white,
                  alignment: Alignment.center,
                  child:Image.asset(
                    widget.model.imagePath,
                  )),
            ),
            BottomHoverWidget(
              isItemHover: widget.isMobile?true:isHover,
              isAppStore: widget.model.urlAppStore.isNotEmpty,
              playStoreUrl: widget.model.urlPlayStore,
              appStoreUrl: widget.model.urlAppStore,
            )
          ],
        ),
      ),
    );
  }
}
