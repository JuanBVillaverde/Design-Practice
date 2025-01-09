import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/custom_widgets/adapters/navigationbar_adapter.dart';
import 'package:prueba/custom_widgets/models/navigation_item.dart';
import 'package:prueba/home/views/home_view.dart';
import 'package:prueba/map/map_views/map_view.dart';
import 'package:prueba/qr_reader/qr_reader_views/qr_reader_view.dart';

import '../list/list_views/list_view.dart';

class CustonNavigationbar extends StatefulWidget {
  const CustonNavigationbar({super.key});

  @override
  State<CustonNavigationbar> createState() => _CustonNavigationbarState();
}

class _CustonNavigationbarState extends State<CustonNavigationbar> {
  int currentIndex = 0;
  final List<Widget> screens = [
    HomeView(),
    MapView(),
    ListaView(),
    QrReaderView(),
  ];

  final List<NavigationItem> navigationItems = [
    NavigationItem(
      'assets/images/home.png',
      'assets/images/homeSelected.png',
      'Inicio',
    ),
    NavigationItem(
      'assets/images/map.png',
      'assets/images/mapSelected.png',
      'Mapa',
    ),
    NavigationItem(
      'assets/images/prices.png',
      'assets/images/pricesSelected.png',
      'Precios',
    ),
    NavigationItem(
      'assets/images/QRIcon.png',
      'assets/images/QRSelected.png',
      'Lector QR',
    ),
  ];

  late NavigationbarAdapter adapter;

  void onItemChanged(int index) {
    setState(() {
      currentIndex = index;
      print('Current index: $currentIndex');
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final navigationBar = NavigationbarAdapter(
      onItemChanged,
      navigationItems,
      currentIndex,
    ).build(context);

    return Scaffold(
      body: Row(children: [
        if (NavigationbarAdapter(
          onItemChanged,
          navigationItems,
          currentIndex,
        ).isWideScreen(context))
          navigationBar,
        Expanded(
          child: screens[currentIndex],
        ),
      ]),
      bottomNavigationBar: NavigationbarAdapter(
        onItemChanged,
        navigationItems,
        currentIndex,
      ).isWideScreen(context)
          ? null
          : navigationBar,
    );
  }
}
