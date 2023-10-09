import 'package:flutter/material.dart';
import 'package:portfolio/data_model/items_data_model.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/bottom_hover_widget.dart';

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
    double desiredCellHeight = isMobile?400:600;
    double childAspectRatio = cellWidth / desiredCellHeight;
    return GridView.builder(
        shrinkWrap: true,
        itemCount: itemsData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 1 : 2,
          childAspectRatio: childAspectRatio
        ),
        itemBuilder: (context, index) {
          return GridItem(
            model: itemsData[index],
            isMobile: isMobile,
          );
        });
  }
}

class GridItem extends StatefulWidget {
  final ItemsDataModel model;
  final bool isMobile;

  const GridItem({super.key, required this.model,required this.isMobile});

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isItemHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            widget.model.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: widget.isMobile?20:30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            onHover: (val) {
              isItemHover = val;
              setState(() {});
              print("here is hover");
            },
            child: SizedBox(
              width: double.infinity,
              height: widget.isMobile?150:200,
              child: Stack(
                children: [
                  Material(
                    elevation: 10,
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: widget.model.title == "EVV Providersoft"
                            ? FittedBox(
                              child: Container(
                                  padding: const EdgeInsets.all(30),
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle),
                                  child: Image.asset(
                                    widget.model.imagePath,
                                    width: 120,
                                    height: 120,
                                  ),
                                ),
                            )
                            : FittedBox(
                              child: Image.asset(
                                  widget.model.imagePath,
                                ),
                            )),
                  ),
                  BottomHoverWidget(
                    isItemHover: isItemHover,
                    isAppStore: true,
                    playStoreUrl: widget.model.urlPlayStore,
                    appStoreUrl: widget.model.urlAppStore,
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            child: Text(
              widget.model.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
