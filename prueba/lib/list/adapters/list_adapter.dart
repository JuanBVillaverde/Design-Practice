import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/custom_widgets/adapters/base_adapter.dart';

class ListAdapter extends BaseAdapter {
  ListAdapter(this.menu, this.points, this.notifications, this.searchBar,
      this.titleText, this.productList);

  final Widget menu;
  final Widget points;
  final Widget notifications;

  final Widget searchBar;

  final Widget titleText;

  final Widget productList;

  @override
  Widget medium(BuildContext context) {
    print('medium');
    return Scaffold(
      // floatingActionButton: alertButton,
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
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: titleText,
        ),
        const SizedBox(height: 4.0),
        productList,
      ]),
    );
  }

  @override
  Widget small(BuildContext context) {
    print('small');
    return Scaffold(
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
                  SizedBox(
                    width: 2.0,
                  ),
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
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: titleText,
        ),
        const SizedBox(height: 4.0),
        productList,
      ]),
    );
  }

  @override
  Widget ultraWide(BuildContext context) {
    print('Ultrawide');
    return Scaffold(
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
                  SizedBox(
                    width: 2.0,
                  ),
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
            const SizedBox(
              height: 8.0,
            ),
            searchBar,
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: titleText,
            ),
            const SizedBox(height: 4.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 2 / 1,
                children: [
                  productList,
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
                  SizedBox(
                    width: 2.0,
                  ),
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
            const SizedBox(
              height: 8.0,
            ),
            searchBar,
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: titleText,
            ),
            const SizedBox(height: 4.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 2 / 1,
                children: [
                  productList,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
