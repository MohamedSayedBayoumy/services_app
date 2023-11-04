import 'package:flutter/material.dart';

import 'widgets/tab_widget.dart';
import 'controllers/home_bloc.dart';
import 'widgets/intro_widgets.dart';
import '../../common/utils/enum.dart';
import 'widgets/tab_view_widget.dart';
import '../../common/constants/fonts.dart';
import '../../common/constants/colors.dart';
import '../../common/functions/snak_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/services/services_locator.dart';

class HomeScreen extends StatefulWidget {
  final Size media;
  const HomeScreen({super.key, required this.media});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController controller;
  int activeTabIndex = 0;

  AnimationController? animationController;
  Animation<double>? sizeFactor;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1700))
      ..forward();

    sizeFactor = CurvedAnimation(
        parent: animationController!, curve: Curves.fastOutSlowIn);

    controller = TabController(length: 3, vsync: this);

    controller.addListener(() {
      activeTabIndex = controller.index;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          "Home",
          style: Fonts.defaultFont,
        ),
        leading: const Icon(
          Icons.menu_rounded,
          color: Colors.black,
        ),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverToBoxAdapter(
                  child: IntroWidget(
                    media: widget.media,
                  ),
                )),
            SliverToBoxAdapter(
              child: SizeTransition(
                sizeFactor: sizeFactor!,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widget.media.width * .05, vertical: 10),
                  child: Container(
                    height: widget.media.height * .08,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xfff2f2f2))),
                    child: TabBar(
                      controller: controller,
                      labelColor: Colors.white,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      labelStyle: Fonts.defaultFont.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: widget.media.width * .04),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.transparent),
                        color: AppColors.mainColor,
                      ),
                      tabs: [
                        Tab(
                            child: TabWidget(
                          activeTabIndex: activeTabIndex,
                          cureentIndex: 0,
                          name: "Categories",
                        )),
                        Tab(
                          child: Tab(
                            child: TabWidget(
                              activeTabIndex: activeTabIndex,
                              cureentIndex: 1,
                              name: "Services",
                            ),
                          ),
                        ),
                        Tab(
                          child: TabWidget(
                            activeTabIndex: activeTabIndex,
                            cureentIndex: 2,
                            name: "Orders (0)",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 5, horizontal: widget.media.width * .06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories View",
                      style: Fonts.defaultFont.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: widget.media.width * .04),
                    ),
                    Text(
                      "see all",
                      style: Fonts.defaultFont.copyWith(
                          color: AppColors.secondaryColor,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w400,
                          fontSize: widget.media.width * .04),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: BlocProvider(
          create: (context) => sl<HomeBloc>()
            ..add(
              GetRemoteCategoriesEvent(),
            ),
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state.errorMeassge.isNotEmpty || state.errorMeassge != "") {
                Future.delayed(
                  const Duration(milliseconds: 1600),
                  () {
                    snackBar(
                      context,
                      message: state.errorMeassge,
                    );
                  },
                );
              }
            },
            builder: (context, state) {
              switch (state.requestSatuts) {
                case Status.loading:
                  return Padding(
                    padding: EdgeInsets.only(top: widget.media.height * .08),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  );
                case Status.loaded:
                  return SizedBox(
                    height: widget.media.height,
                    child: TabBarView(
                      controller: controller,
                      children: <Widget>[
                        TabViewWidget(
                          media: widget.media,
                          categories: state.listOfCategories,
                        ),
                        TabViewWidget(
                          media: widget.media,
                          categories: state.listOfCategories,
                        ),
                        TabViewWidget(
                          media: widget.media,
                          categories: const [],
                        ),
                      ],
                    ),
                  );

                case Status.failure:
                  return Padding(
                    padding: EdgeInsets.only(top: widget.media.height * .08),
                    child: Center(
                      child: Text(
                        state.errorMeassge.toString(),
                        style: Fonts.defaultFont.copyWith(
                          color: const Color(0xff707070),
                          fontWeight: FontWeight.w400,
                          fontSize: widget.media.width * .05,
                        ),
                      ),
                    ),
                  );

                case Status.failureWithcachedData:
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.listOfCachedData.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: widget.media.width * .04),
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: widget.media.height * .005),
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
                              "${state.listOfCachedData[index]["id"]}. ",
                              style: Fonts.defaultFont,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "${state.listOfCachedData[index]["name"]}. ",
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
            },
          ),
        ),
      ),
    );
  }
}
