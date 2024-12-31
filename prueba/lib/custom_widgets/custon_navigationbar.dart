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
  // int _selectedIndex = 0;
  int currentIndex = 0;
  final List<Widget> screens = [
    HomeView(),
    MapView(),
    ListaView(),
    QrReaderView(),
  ];

  final List<NavigationItem> navigationItems = [
    NavigationItem(
        'assets/images/Inicio.png', 'assets/images/InicioSelected.png', '', 'assets/images/InicioH.png', 'assets/images/InicioSelectedH.png' ),
    NavigationItem(
        'assets/images/Mapa.png', 'assets/images/MapaSelected.png', '', 'assets/images/mapaH.png', 'assets/images/mapaH.png'),
    NavigationItem(
        'assets/images/Precios.png', 'assets/images/PReciosSelected.png', '', 'assets/images/PreciosH.png', 'assets/images/PreciosSelectedH.png'),
    NavigationItem(
        'assets/images/QRIcon.png', 'assets/images/QRSelected.png', '', 'assets/images/QRH.png', 'assets/images/QRH.png'),
  ];

  late NavigationbarAdapter adapter;

  // final List<String> icons = [
  //   'assets/images/Inicio.png',
  //   'assets/images/Mapa.png',
  //   'assets/images/Precios.png',
  //   'assets/images/QRIcon.png',
  // ];
  //
  // final List<String> selectedIcons = [
  //   'assets/images/InicioSelected.png',
  //   'assets/images/MapaSelected.png',
  //   'assets/images/PreciosSelected.png',
  //   'assets/images/QRSelected.png',
  // ];



  void onItemChanged(int index) {
    setState(() {
      currentIndex = index;
    });

  }

  @override
  void initState() {
    super.initState();
    adapter =
        NavigationbarAdapter(onItemChanged, navigationItems, currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final navigationBar = adapter.build(context);

    return Scaffold(
      body: Row(children: [
        if (adapter.isWideScreen(context)) navigationBar,
        Expanded(child: screens[currentIndex]),
      ]),
      bottomNavigationBar: adapter.isWideScreen(context) ? null : navigationBar,
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: IndexedStack(
  //       index: selectedIndex,
  //       children: screens,
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       currentIndex: selectedIndex,
  //       onTap: (index) {
  //         setState(() {
  //           selectedIndex = index;
  //         });
  //       },
  //       type: BottomNavigationBarType.fixed,
  //       // selectedItemColor: Colors.orange,
  //       // unselectedItemColor: Colors.black,
  //       backgroundColor: Colors.white,
  //       items: List.generate(4, (index) {
  //         return BottomNavigationBarItem(
  //           icon: Image.asset(
  //             selectedIndex == index ? selectedIcons[index] : icons[index],
  //             width: 50,
  //             height: 50,
  //           ),
  //           label: '',
  //         );
  //       }),
  //     ),
  //   );
  // }
}
