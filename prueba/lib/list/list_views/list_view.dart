import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba/list/adapters/list_adapter.dart';
import 'package:prueba/list/widgets/custom_card_widget.dart';
import 'package:prueba/state/app_state.dart';

import '../../custom_widgets/custom_appbar.dart';
import '../../custom_widgets/custom_searchbar.dart';
import '../models/item_card.dart';

class ListaView extends StatefulWidget {
  const ListaView({super.key});

  @override
  State<ListaView> createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  final searchController = TextEditingController();
  List<ItemCard>? items;
  late ListAdapter adapter;

  @override
  void initState() {
    super.initState();

    adapter = ListAdapter(
      buildMenu(),
      buildPoints(),
      buildNotifications(),
      buildSearchBar(),
      buildTitteText(),
      AppState().items,
    );
  }

  Widget buildMenu() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 0.5),
              blurRadius: 1,
              spreadRadius: 1,
            )
          ]),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }

  Widget buildPoints() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 0.5),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Puntos',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
              SizedBox(height: 4.0),
              Text(
                '500',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(width: 8.0),
          Image.asset(
            'assets/images/cup.png',
            height: 24.0,
            width: 24.0,
          ),
        ],
      ),
    );
  }

  Widget buildNotifications() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 0.5),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {
        },
        icon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/bell.png'),
              fit: BoxFit.scaleDown,
            ),
          ),
          width: 45,
          height: 45,
        ),
        tooltip: 'Notificaciones',
      ),
    );
  }

  Widget buildSearchBar() {
    return CustomSearchbar(
      controller: searchController,
      onFilterPressed: () {},
      text: '¿Qué producto/servicio quieres buscar?',
    );
  }

  Widget buildTitteText() {
    return Text(
      'Productos destacados',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
      ),
    );
  }

  Future<List<ItemCard>> loadItems() async {
    final String response =
        await rootBundle.loadString('assets/data/cards_data.json');
    final List<dynamic> data = jsonDecode(response);
    return data.map((json) => ItemCard.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    print('widht: $width');

    return adapter.build(context);
  }
}
