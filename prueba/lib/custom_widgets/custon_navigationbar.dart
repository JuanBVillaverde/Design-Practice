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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: _selectedIndex,
      onTap: (index){
        setState(() {
          _selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio',),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa',),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on), label: 'Precios',),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Lector QR',),
        ],

      ),
    );
  }
}
