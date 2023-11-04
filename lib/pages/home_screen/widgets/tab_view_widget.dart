import 'package:flutter/material.dart';
import 'package:services_app/common/constants/fonts.dart';
import 'package:services_app/common/constants/images.dart';

import '../../../model/models/category_models.dart';

class TabViewWidget extends StatefulWidget {
  final Size media;
  final List<CategoryModel> categories;
  const TabViewWidget({
    super.key,
    required this.media,
    required this.categories,
  });

  @override
  State<TabViewWidget> createState() => _TabViewWidgetState();
}

class _TabViewWidgetState extends State<TabViewWidget> {
  final String cacheImage = Images.emptyImage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Precache the asset image
    precacheImage(AssetImage(cacheImage), context);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (widget.categories.isEmpty) {
        return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SizedBox(
              height: widget.media.height * .04,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        cacheImage,
                        width: widget.media.width * .72,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "No orders found",
                          style: Fonts.defaultFont.copyWith(
                              fontFamily: "bold-font",
                              fontSize: widget.media.width * .06),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widget.media.width * .15, vertical: 5),
                        child: Text(
                          "you can place your needed orders to let serve you.",
                          textAlign: TextAlign.center,
                          style: Fonts.defaultFont.copyWith(
                              color: const Color(0xff707070),
                              fontWeight: FontWeight.w400,
                              fontSize: widget.media.width * .05),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
      } else {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.categories.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10, horizontal: widget.media.width * .04),
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: widget.media.height * .005),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xfff9f9f9),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(children: [
                  Text(
                    "${widget.categories[index].id}. ",
                    style: Fonts.defaultFont,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${widget.categories[index].name}. ",
                    style: Fonts.defaultFont.copyWith(
                      fontSize: widget.media.width * .04,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_rounded,
                        size: 20,
                        color: Color(0xff8c8c8c),
                      )),
                ])),
          ),
        );
      }
    });
  }
}
