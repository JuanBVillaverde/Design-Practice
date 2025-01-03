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

  Widget small_medium() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      items: items.map((item) {
        final isSelected = items.indexOf(item) == selectedIndex;
        print('Item: ${item.label}, isSelected: $isSelected');
        return BottomNavigationBarItem(
            icon: Image.asset(
              isSelected ? item.selectedIcon : item.icon,
              width: isSelected ? 60 : 50,
              height: isSelected ? 60 : 50,
            ),
            label: item.label);
      }).toList(),
      // }=> BottomNavigationBarItem(
      //     icon: Image.asset(
      //       selectedIndex == items.indexOf(item)
      //           ? item.selectedIcon
      //           : item.icon,
      //       width: 50,
      //       height: 50,
      //     ),
      //     label: item.label,
      //   )
      // })
      //     .toList(),
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

              Expanded(
                child: NavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: onItemSelected,
                  labelType: NavigationRailLabelType.none,
                  groupAlignment: -1.0,
                  destinations: items
                      .map((item) => NavigationRailDestination(
                    icon:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[ Image.asset(
                        selectedIndex == items.indexOf(item)
                            ? item.horizontalSelectecIcon
                            : item.horizontalIcon,
                        width: 60,
                        height: 50,
                        fit: BoxFit.fill,
                      ),],
                    ),
                    label: Text(item.label),
                  ))
                      .toList(),
                  // minWidth: 60,
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
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
    final double iconSize = MediaQuery.of(context).size.width > 1200 ? 48 : 32;

    return Row(
    children: [
      Column(
        children: [

          Expanded(
            child: NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: onItemSelected,
              labelType: NavigationRailLabelType.none,
              groupAlignment: -1.0,
              destinations: items
                  .map((item) => NavigationRailDestination(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      selectedIndex == items.indexOf(item)
                          ? item.selectedIcon
                          : item.icon,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
                label: Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: selectedIndex == items.indexOf(item)
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ))
                  .toList(),
              minWidth: 60,
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
    ],
    );
  }
}
