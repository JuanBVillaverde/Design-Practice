

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prueba/custom_widgets/adapters/base_adapter.dart';

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
      type: BottomNavigationBarType.fixed,
      items: items.map((item) {
        final isSelected = items.indexOf(item) == selectedIndex;
        print(
            'Item: ${item.label}, isSelected: $isSelected, label: ${item.label}');
        return BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(
              right: 30.0,
              left: 34,
              top: 15,
              bottom: 31,
            ),
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
                    color: isSelected ? const Color(0xFFDE5419) : Colors.black,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: NavigationRail(
                  minWidth: 200,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: onItemSelected,
                  labelType: NavigationRailLabelType.none,
                  groupAlignment: -1.0,
                  backgroundColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  destinations: items.map((item) {
                    final isSelected = selectedIndex == items.indexOf(item);
                    return NavigationRailDestination(
                      icon: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 12.0,
                          left: 20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Image.asset(
                                isSelected ? item.selectedIcon : item.icon,
                                width: 20,
                                height: 19,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: Text(
                                item.label,
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color(0xFFDE5419)
                                      : Colors.black,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                                overflow: TextOverflow.visible,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      label: const SizedBox.shrink(),
                    );
                  }).toList(),
                  selectedIconTheme: const IconThemeData(
                    color: Colors.transparent,
                  ),
                  selectedLabelTextStyle: const TextStyle(
                    color: Color(0xFFDE5419),
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelTextStyle: const TextStyle(
                    color: Colors.black,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD71658),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(
                        200,
                        80,
                      ),
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
                          child: Image.asset(
                            'assets/images/flag.png',
                            width: 12.0,
                            height: 17.0,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
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
    return Row(
      children: [
        SizedBox(
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
                      icon: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 32,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              isSelected ? item.selectedIcon : item.icon,
                              width: isSelected ? 22 : 20,
                              height: isSelected ? 21 : 19,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              item.label,
                              style: TextStyle(
                                color: isSelected
                                    ? const Color(0xFFDE5419)
                                    : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      label: const SizedBox.shrink(),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD71658),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                  ),
                  child: SizedBox(
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
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: Image.asset(
                            'assets/images/flag.png',
                            width: 12.0,
                            height: 17.0,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const Text(
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
