import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prueba/custom_widgets/adapters/base_adapter.dart';

import '../../home/views/home_view.dart';
import '../../list/list_views/list_view.dart';
import '../../qr_reader/qr_reader_views/qr_reader_view.dart';
import '../../map/map_views/map_view.dart';
import '../models/navigation_item.dart';

class NavigationbarAdapter extends BaseAdapter {
  NavigationbarAdapter(this.onItemSelected, this.items, this.selectedIndex);

  final int selectedIndex;

  final ValueChanged<int> onItemSelected;

  final List<NavigationItem> items;

  // get isSelected => null;

  Widget small_medium() {
    return BottomNavigationBar(

      currentIndex: selectedIndex,
      onTap: onItemSelected,
      type: BottomNavigationBarType.fixed,

      items: items.map((item) {
        final isSelected = items.indexOf(item) == selectedIndex;
        print(
            'Item: ${item.label}, isSelected: $isSelected, label: ${item.label}');
        return BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 34, top: 15, bottom: 31),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  isSelected ? item.selectedIcon : item.icon,
                  width: isSelected ? 50 : 40,
                  height: isSelected ? 50 : 40,
                ),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: TextStyle(
                    color: isSelected ? Colors.deepOrange : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          label: '',
        );
      }).toList(),
    );
  }

  @override
  Widget medium(BuildContext context) {
    return small_medium();
  }

  @override
  Widget small(BuildContext context) {
    return small_medium();
  }

  @override
  Widget ultraWide(BuildContext context) {
    // final double iconSize = MediaQuery.of(context).size.width > 1200 ? 80 : 60;

    return Row(
      children: [
        Container(
          width: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Padding(
              //   padding: EdgeInsets.only(left:47.0) ,
              //   child:
                  Expanded(
                    child:NavigationRail(
                      selectedIndex: selectedIndex,
                      onDestinationSelected: onItemSelected,
                      labelType: NavigationRailLabelType.none,
                      groupAlignment: -1.0,
                      backgroundColor: Colors.transparent,
                      indicatorColor: Colors.transparent,

                      destinations: items
                          .map((item) {
                        final isSelected = selectedIndex == items.indexOf(item);
                        return NavigationRailDestination(
                          icon: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  isSelected ? item.selectedIcon : item.icon,
                                  width: 20,
                                  height: 19,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  item.label,
                                  style: TextStyle(
                                    color: isSelected ? Colors.orange : Colors.grey,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          label: const SizedBox.shrink(),
                        );
                      })
                          .toList(),

                      selectedIconTheme: IconThemeData(color: Colors.transparent),
                      selectedLabelTextStyle: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelTextStyle: TextStyle(
                        color: Colors.grey,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
              // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(200, 80),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Icon(
                                Icons.flag_outlined,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Denunciar',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),


            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget wide(BuildContext context) {
    // final double iconSize = MediaQuery.of(context).size.width > 1200 ? 48 : 32;

    return Row(
      children: [
        Container(
          width: 120,
          child: Column(
            children: [
              Expanded(
                child: NavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: onItemSelected,
                  labelType: NavigationRailLabelType.none,
                  groupAlignment: -1.0,
                  indicatorColor: Colors.transparent,
                  destinations: items.map((item) {
                    final isSelected = selectedIndex == items.indexOf(item);
                    return NavigationRailDestination(
                      icon:
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child:
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              isSelected ? item.selectedIcon : item.icon,
                              width: isSelected ? 22 : 20,
                              height: isSelected ? 21 : 19,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.label,
                              style: TextStyle(
                                color:
                                    isSelected ? Colors.deepOrange : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      label: SizedBox.shrink(),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                          child: Icon(
                            Icons.flag_outlined,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Denunciar',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
