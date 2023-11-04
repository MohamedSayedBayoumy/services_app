import 'package:flutter/material.dart';
import 'package:services_app/common/constants/fonts.dart';
import 'package:services_app/common/constants/images.dart';

import '../../../model/models/category_models.dart';

class TabViewWidget extends StatelessWidget {
  final Size media;
  final List<CategoryModel> categories;
  const TabViewWidget({
    super.key,
    required this.media,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (categories.isEmpty) {
        return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SizedBox(
              height: media.height * .04,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.emptyImage,
                        width: media.width * .72,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "No orders found",
                          style: Fonts.defaultFont.copyWith(
                              fontFamily: "bold-font",
                              fontSize: media.width * .06),
                        ),
                      ),
                      Text(
                        "you can place your needed orders to let serve you.",
                        textAlign: TextAlign.center,
                        style: Fonts.defaultFont.copyWith(
                            color: const Color(0xff707070),
                            fontWeight: FontWeight.w400,
                            fontSize: media.width * .05),
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
          itemCount: categories.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10, horizontal: media.width * .04),
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: media.height * .005),
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
                    "${categories[index].id}. ",
                    style: Fonts.defaultFont,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${categories[index].name}. ",
                    style: Fonts.defaultFont.copyWith(
                      fontSize: media.width * .04,
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
