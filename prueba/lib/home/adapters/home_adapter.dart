import 'package:flutter/material.dart';
import 'package:prueba/custom_widgets/adapters/base_adapter.dart';
import '../styles/home_styles.dart';

class HomeAdapter extends BaseAdapter {
  HomeAdapter({
    required this.menu,
    required this.points,
    required this.notifications,
    required this.titleText,
    required this.cardWelcome,
    required this.cardEvents,
    required this.cadrEVA,
    required this.alertButton,
    required this.styles,
  });

  final Widget menu;
  final Widget points;
  final Widget notifications;

  final ValueSetter<HomeStyles> styles;

  final Widget titleText;
  final Widget cardWelcome;
  final Widget cardEvents;
  final Widget cadrEVA;

  final Widget alertButton;

  Widget mobileScreen(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white54,
        floatingActionButton: alertButton,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: menu,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    points,
                    const SizedBox(
                      width: 12.0,
                    ),
                    notifications,
                    const SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 26.0,
                      left: 16.0,
                      right: 33.0,
                      top: 25.0,
                    ),
                    child: Flexible(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            titleText,
                          ]),
                    ),
                  ),
                  cardWelcome,
                  const SizedBox(
                    height: 9.0,
                  ),
                  cardEvents,
                  const SizedBox(
                    height: 9.0,
                  ),
                  cadrEVA,
                ]),
          ),
        ),
      ),
    );
  }

  @override
  Widget medium(BuildContext context) {
    print('medium');
    styles(
      HomeStyles(
        reportButtonPadding: 20.0,
        titleStyle: const TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.0,
        ),
      ),
    );
    return mobileScreen(context);
  }

  @override
  Widget small(BuildContext context) {
    print('small');
    styles(
      HomeStyles(
        reportButtonPadding: 20.0,
        titleStyle: const TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.0,
        ),
      ),
    );
    return mobileScreen(context);
  }

  @override
  Widget ultraWide(BuildContext context) {
    print('Ultrawide');
    styles(
      HomeStyles(
        reportButtonPadding: 20.0,
        titleStyle: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.0,
          color: Colors.orange,
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white54,
        body: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: titleText,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 306.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      points,
                      const SizedBox(
                        width: 30.0,
                      ),
                      notifications,
                      const SizedBox(
                        width: 30.0,
                      ),
                      menu,
                      const SizedBox(width: 30.0),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 32, top: 47),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 2 / 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          cardWelcome,
                          cardEvents,
                          cadrEVA,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget wide(BuildContext context) {
    print('wide');
    styles(
      HomeStyles(
          reportButtonPadding: 20.0,
          titleStyle: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.0,
          )),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white54,
        body: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 37.0),
                  child: titleText,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 65.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      points,
                      const SizedBox(
                        width: 30.0,
                      ),
                      notifications,
                      const SizedBox(
                        width: 30.0,
                      ),
                      menu,
                      const SizedBox(width: 30.0),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 37.0,
                right: 32.0,
                top: 50.0,
              ),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                cardWelcome,
                                const SizedBox(
                                  height: 29.0,
                                ),
                                cardEvents,
                                const SizedBox(
                                  height: 29.0,
                                ),
                                cadrEVA,
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
