import 'package:flutter/material.dart';
import 'package:portfolio/data_model/items_data_model.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/bottom_hover_widget.dart';

import 'grid_item_widget.dart';

class ItemsWidget extends StatelessWidget {
  final bool isMobile;

  const ItemsWidget({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    List<ItemsDataModel> itemsData = [
      ItemsDataModel(
          "ZoomBooks",
          "assets/zoombooks.webp",
          "This app makes expense organizing and bookkeeping simple and easy.",
          Constants.zoomBooksPlay,
          Constants.zoomBooksApp),
      ItemsDataModel(
          "Syed Zameen",
          "assets/syed_zameen.webp",
          "This App allow users to buy and rent different properties in major areas of Pakistan.",
          Constants.syedZameenPlay,
          Constants.syedZameenApp),
      ItemsDataModel(
          "Tour Guide",
          "assets/tour_guide.webp",
          "In this app tourists can find local people willing to help them discover the most interesting parts",
          Constants.tourGuidePlay,
          Constants.tourGuideApp),
      ItemsDataModel(
          "Devine Care",
          "assets/devine_care.webp",
          "With Divine Care, patients can easily request various types of medical assistance",
          Constants.devineCarePlay,
          Constants.devineCareApp),
      ItemsDataModel(
          "EVV Providersoft",
          "assets/evv.webp",
          "EVV verifies the competence, skills, and adherence to professional standards of EVV therapists",
          Constants.evvVerificationPlay,
          Constants.evvVerificationApp),
      ItemsDataModel(
          "Kosher",
          "assets/kosher.webp",
          "Discover & Verify kosher status of products",
          Constants.kosherPlay,
          Constants.kosherApp),
    ];
    double cellWidth = ((MediaQuery.of(context).size.width - 0) / 2);
    double desiredCellHeight = isMobile ? 200 : 600;
    double childAspectRatio = cellWidth / desiredCellHeight;
    return GridView.builder(
        shrinkWrap: true,
        itemCount: itemsData.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 2,
            childAspectRatio: childAspectRatio),
        itemBuilder: (context, index) {
          return GridItem(
            model: itemsData[index],
            isMobile: isMobile,
          );
        });
  }
}
