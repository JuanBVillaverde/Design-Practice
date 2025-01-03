import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/custom_widgets/adapters/base_adapter.dart';
import 'package:prueba/list/models/item_card.dart';

import '../widgets/custom_card_widget.dart';

class ListAdapter extends BaseAdapter {
  ListAdapter(this.menu, this.points, this.notifications, this.searchBar,
      this.titleText, this.items);

  final Widget menu;
  final Widget points;
  final Widget notifications;

  final Widget searchBar;

  final Widget titleText;

  final List<ItemCard>? items;

  Widget mobileScreen() {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  points,
                  SizedBox(width: 12.0,),
                  notifications,
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 8.0,
        ),
        searchBar,
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: titleText,
        ),
        const SizedBox(height: 4.0),
        Expanded(
          child: ListView.builder(
            itemCount: items!.length,
            // padding: const EdgeInsets.symmetric(vertical: 1.0),
            itemBuilder: (context, index) {
              final item = items![index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                child: CustomCardWidget(
                  title: item.title,
                  category: item.category,
                  price: item.price,
                  imageUrl: item.imageUrl,
                ),
              );
            },
          ),
        )
      ]),
    );
  }

  @override
  Widget medium(BuildContext context) {
    print('medium');
    return mobileScreen();
  }

  @override
  Widget small(BuildContext context) {
    print('small');
    return mobileScreen();
  }

  @override
  Widget ultraWide(BuildContext context) {
    print('Ultrawide');
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.of(context).size.height;

    final aspectRatio = (screenWidth / 3) / (screenHeight * 0.85);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white54,
          body: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(child: searchBar),
                  const SizedBox(width: 30.0),
                  Column(
                    children: [
                      Row(
                        children: [
                          points,
                          const SizedBox(width: 30.0),
                          notifications,
                          const SizedBox(width: 30.0),
                          menu,
                          const SizedBox(width: 30.0),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 50.0,
                      mainAxisSpacing: 50.0,
                      childAspectRatio: aspectRatio,
                    ),
                    // padding: const EdgeInsets.(8.0),
                    itemCount: items!.length,
                    // padding: const EdgeInsets.symmetric(vertical: 1.0),
                    itemBuilder: (context, index) {
                      final item = items![index];

                      return CustomCardWidget(
                        title: item.title,
                        category: item.category,
                        price: item.price,
                        imageUrl: item.imageUrl,
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }

  @override
  Widget wide(BuildContext context) {
    print('wide');
    return Scaffold(
        backgroundColor: Colors.white54,
        body: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(child: searchBar),
                const SizedBox(width: 30.0),
                Column(
                  children: [
                    Row(
                      children: [
                        points,
                        const SizedBox(width: 30.0),
                        notifications,
                        const SizedBox(width: 30.0),
                        menu,
                        const SizedBox(width: 30.0),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: titleText,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 4 / 1,
                    ),
                    itemCount: items!.length,
                    // padding: const EdgeInsets.symmetric(vertical: 1.0),
                    itemBuilder: (context, index) {
                      final item = items![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: CustomCardWidget(
                          title: item.title,
                          category: item.category,
                          price: item.price,
                          imageUrl: item.imageUrl,
                        ),
                      );
                    },
                  )),
            ),
          ],
        ));
  }
}
