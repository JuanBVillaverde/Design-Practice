import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prueba/custom_widgets/adapters/base_adapter.dart';
import 'package:prueba/custom_widgets/custom_appbar.dart';

class HomeAdapter extends BaseAdapter {
  HomeAdapter(
      this.menu,
      this.points,
      this.notifications,
      this.titleText,
      this.cardWelcome,
      this.cardEvents,
      this.cadrEVA,
      // this.navbar,
      this.alertButton,
      // this.appBar,
      {required});

  final Widget menu;
  final Widget points;
  final Widget notifications;

  // final Widget appBar;

  final Widget titleText;
  final Widget cardWelcome;
  final Widget cardEvents;
  final Widget cadrEVA;

  // final Widget navbar;
  final Widget alertButton;

  @override
  Widget medium(BuildContext context) {
    print('medium');
    return Scaffold(
      floatingActionButton: alertButton,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // leading: menu,
      // title: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     const Spacer(),
      //     Container(
      //       padding:
      //           const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      //       decoration: BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.circular(20),
      //       ),
      //       child: Row(
      //         children: [
      //           points,
      //           notifications,
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      // ),
      body: Row(
        children: [
          Container(
            color: Colors.deepOrange,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                menu,
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    // color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      points,
                      SizedBox(width: 2.0,),
                      notifications,
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.sizeOf(context).width * 0.05),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleText,
                            ]),
                      ),
                      cardWelcome,
                      SizedBox(
                        height: 4.0,
                      ),
                      cardEvents,
                      SizedBox(
                        height: 4.0,
                      ),
                      cadrEVA,
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget small(BuildContext context) {
    print('small');
    return Scaffold(
      floatingActionButton: alertButton,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        leading: menu,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  points,
  SizedBox(width: 2.0,),
                  notifications,
                ],
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.05),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                titleText,
              ]),
            ),
            cardWelcome,
            SizedBox(
              height: 4.0,
            ),
            cardEvents,
            SizedBox(
              height: 4.0,
            ),
            cadrEVA,
          ]),
        ),
      ),
    );
  }

  @override
  Widget ultraWide(BuildContext context) {
    print('Ultrawide');
    return Scaffold(
      floatingActionButton: alertButton,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        leading: menu,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  points,
  SizedBox(width: 2.0,),
                  notifications,
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        // titleText,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText,
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 2 / 1,
                children: [
                  cardWelcome,
                  cardEvents,
                  cadrEVA,
                ],
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
    return Scaffold(
      floatingActionButton: alertButton,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        leading: menu,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  points,
  SizedBox(width: 2.0,),
                  notifications,
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        // titleText,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText,
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 2 / 1,
                children: [
                  cardWelcome,
                  cardEvents,
                  cadrEVA,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
