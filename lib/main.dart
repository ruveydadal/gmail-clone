import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmail_clone/app_styles.dart';
import 'package:gmail_clone/custom_tab_indicator.dart';
import 'package:gmail_clone/size_config.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.edit_outlined),
        ),
        backgroundColor: kWhiteColor,
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            color: kBackgroundColor,
            padding: const EdgeInsets.only(top: 52, left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "All Inboxes",
                          style: kJakartaHeading1.copyWith(
                            fontSize:
                                SizeConfig.blockSizeHorizontal! * kHeading1,
                          ),
                        ),
                        Icon(CupertinoIcons.chevron_down,
                            size: SizeConfig.blockSizeHorizontal! * kHeading3)
                      ],
                    ),
                    Text(
                      "Total 2500 Messages, 3 Unread",
                      style: kJakartaBodyMedium.copyWith(
                        color: kParagraphColor,
                        fontSize: SizeConfig.blockSizeHorizontal! * kBody1,
                      ),
                    )
                  ],
                ),
                const CircleAvatar(
                  maxRadius: 26,
                  backgroundColor: kSecondaryColor,
                  foregroundImage: NetworkImage(
                      'https://freepngimg.com/thumb/shrek/24559-1-shrek-photos.png'),
                ),
              ],
            ),
          ),
          Container(
            height: 28,
            color: kBackgroundColor,
          ),
          Container(
            color: kBackgroundColor,
            child: SizedBox(
              height: 98,
              child: ListView.builder(
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 24 : 0,
                        right: index == 10 - 1 ? 24 : 8,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                maxRadius: 36,
                                backgroundColor: kWhiteColor,
                                foregroundImage: NetworkImage(
                                    "https://static.vecteezy.com/system/resources/previews/022/484/503/original/google-lens-icon-logo-symbol-free-png.png"),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: kPrimaryColor),
                                  child: IntrinsicWidth(
                                    child: Text(
                                      "12",
                                      style: kJakartaBodyMedium.copyWith(
                                        color: kWhiteColor,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                kBody2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Google",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kJakartaBodyMedium.copyWith(
                              color: kParagraphColor,
                              fontSize: SizeConfig.blockSizeHorizontal! *
                                  kBody1 /
                                  1.25,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Container(
            height: 48,
            color: kBackgroundColor,
          ),
          Container(
            height: 30,
            transform: Matrix4.translationValues(0, -24, 0),
            decoration: const BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            transform: Matrix4.translationValues(0, -36, 0),
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: DefaultTabController(
                      length: 3,
                      child: TabBar(
                        labelPadding: const EdgeInsets.only(right: 24),
                        indicatorWeight: 8,
                        isScrollable: true,
                        labelColor: kDarkColor,
                        labelStyle: kJakartaBodyBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * kBody1,
                        ),
                        unselectedLabelColor: kDark40Color,
                        indicator: RoundedRectangleTabIndicator(
                            color: kPrimaryColor,
                            weight: 4,
                            width: 24,
                            padding: 12.0),
                        // splashFactory: NoSplash.splashFactory,
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            return states.contains(MaterialState.focused)
                                ? null
                                : Colors.transparent;
                          },
                        ),
                        tabs: const [
                          Tab(
                            text: 'Primary',
                          ),
                          Tab(
                            text: 'Social',
                          ),
                          Tab(
                            text: 'Forums',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 19.5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.more_horiz,
                        color: kDark40Color,
                      ),
                      const SizedBox(width: 24),
                      Text(
                        "Edit",
                        style: kJakartaBodyBold.copyWith(
                          color: kDark40Color,
                          fontSize: SizeConfig.blockSizeHorizontal! * kBody1,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 16),
            transform: Matrix4.translationValues(0, -36, 0),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 116,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: kBackgroundColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        maxRadius: 24,
                        backgroundColor: kPrimaryColor,
                        foregroundImage: NetworkImage(
                            'https://cdn.dribbble.com/users/3618729/screenshots/11435839/media/c6981b53c8df77a4ffe1e5928c81ddb3.jpg'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sara',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kJakartaBodyMedium.copyWith(
                                color: kParagraphColor,
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * kBody1,
                              ),
                            ),
                            Text(
                              'Congralutaions!',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kJakartaHeading4.copyWith(
                                color: kDarkColor,
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * kHeading4,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'You just win the Email client challenge 2022.',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kJakartaBodyMedium.copyWith(
                                color: kParagraphColor,
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * kBody1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      SizedBox(
                        height: 58,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '57m',
                              style: kJakartaBodyBold.copyWith(
                                  color: kDark40Color,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * kBody2),
                            ),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: const BoxDecoration(
                                  color: kSecondaryColor,
                                  shape: BoxShape.circle),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
