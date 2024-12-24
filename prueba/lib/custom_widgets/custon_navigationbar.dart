import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeView(),
    MapView(),
    ListaView(),
    QrReaderView(),
  ];

  final List<String> _icons = [
    'assets/images/Inicio.png',
    'assets/images/Mapa.png',
    'assets/images/Precios.png',
    'assets/images/QRIcon.png',
  ];

  final List<String> _selectedIcons = [
    'assets/images/InicioSelected.png',
    'assets/images/MapaSelected.png',
    'assets/images/PreciosSelected.png',
    'assets/images/QRSelected.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        items: List.generate(4, (index) {
          return BottomNavigationBarItem(
            icon: Image.asset(
              _selectedIndex == index ? _selectedIcons[index] : _icons[index],
              width: 50,
              height: 50,
            ),
            label: '',
          );
        }),
      ),
    );
  }
}
