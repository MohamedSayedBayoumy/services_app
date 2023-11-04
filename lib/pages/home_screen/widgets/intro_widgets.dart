import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/constants/colors.dart';
import '../../../common/constants/fonts.dart';
import '../../../common/constants/images.dart';

class IntroWidget extends StatefulWidget {
  final Size media;
  const IntroWidget({super.key, required this.media});

  @override
  State<IntroWidget> createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget>
    with TickerProviderStateMixin {
  final scrollController = PageController();

  late AnimationController firstcontroller;

  late Animation<Offset> firstanimation;

  late AnimationController secondController;

  late Animation<Offset> secondAnimation;

  @override
  void initState() {
    super.initState();

    firstcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1400))
      ..forward();

    firstanimation =
        Tween<Offset>(begin: const Offset(-10, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: firstcontroller, curve: Curves.easeInOutQuint));

    secondController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600))
      ..forward();

    secondAnimation =
        Tween<Offset>(begin: const Offset(10, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: firstcontroller, curve: Curves.easeInOutQuint));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: widget.media.height * .02,
          horizontal: widget.media.height * .02),
      width: widget.media.width,
      color: AppColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTransition(
            position: firstanimation,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Images.faceImage,
                        height: widget.media.width * 0.09,
                        width: widget.media.width * 0.09,
                      ),
                      Text(
                        "Hey , Ahmed",
                        style: Fonts.defaultFont.copyWith(
                          fontSize: widget.media.width * .05,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Image.asset(
                        Images.handImage,
                        height: widget.media.width * 0.058,
                        width: widget.media.width * 0.058,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 12),
                    child: Text(
                      "Multi-Services for Your Real Estate Needs",
                      style: Fonts.defaultFont.copyWith(
                        fontSize: widget.media.width * .052,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Explore diverse real estate services for all your needs: property management, construction, insurance and more in one place.",
                      style: Fonts.secondaryFont.copyWith(
                        fontSize: widget.media.width * .038,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SlideTransition(
            position: secondAnimation,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 13),
              child: SizedBox(
                width: widget.media.width,
                height: widget.media.height * .2,
                child: PageView.builder(
                  controller: scrollController,
                  itemCount: 3,
                  itemBuilder: (context, index) => Container(
                    width: widget.media.width,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                        color: const Color(0xfffff5f5),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Multi-Services for Your Real Estate Needs',
                                maxLines: 2,
                                style: Fonts.defaultFont.copyWith(
                                  fontSize: widget.media.width * .042,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    backgroundColor: AppColors.mainColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    "Order",
                                    style: Fonts.defaultFont
                                        .copyWith(color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                        Expanded(child: Image.asset(Images.manImage))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              axisDirection: Axis.horizontal,
              controller: scrollController,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 15.0,
                dotWidth: 15.0,
                expansionFactor: 4.0,
                dotColor: Color(0xffe0e0e0),
                activeDotColor: AppColors.mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
