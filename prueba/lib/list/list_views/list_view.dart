import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba/list/adapters/list_adapter.dart';
import 'package:prueba/list/widgets/custom_card_widget.dart';

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
  late Future<List<ItemCard>> items;
  late ListAdapter adapter;

  @override
  void initState() {
    super.initState();
    items = loadItems();
    adapter = ListAdapter(
      buildMenu(),
      buildPoints(),
      buildNotifications(),
      buildSearchBar(),
      buildTitteText(),
      buildProductList(),
    );
  }

  Widget buildMenu() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.menu,
        color: Colors.black,
      ),
    );
  }

  Widget buildPoints() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          Column(
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
          SizedBox(width: 8.0),
          Icon(
            Icons.emoji_events,
            color: Colors.amber,
            size: 24.0,
          ),
        ],
      ),
    );
  }

  Widget buildNotifications() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.notifications,
        color: Colors.black,
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

  Widget buildProductList() {
    return Expanded(
      child: FutureBuilder<List<ItemCard>>(
        future: items,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No hay datos disponibles.'),
            );
          }
          final List<ItemCard> items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            // padding: const EdgeInsets.symmetric(vertical: 1.0),
            itemBuilder: (context, index) {
              final item = items[index];
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
          );
        },
      ),
    );
  }

  Future<List<ItemCard>> loadItems() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/cards_data.json');
      // print(jsonString);
      return ItemCard.fromJsonList(jsonString);
    } catch (e) {
      print('error $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    print('widht: $width');

    // adapter = HomeAdapter(buildTitleText(), buildCardWelcome(),
    //     buildCardEvents(), buildCardEVA(), buildAlertButton());
    return adapter.build(context);
  }

// @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: const CustomAppbar(),
  //     body: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const SizedBox(height: 8.0,),
  //         CustomSearchbar(
  //           controller: searchController,
  //           onFilterPressed: () {},
  //           text: '¿Qué producto/servicio quieres buscar?',
  //         ),
  //         const SizedBox(height: 8.0),
  //         const Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 16.0),
  //           child: Text(
  //             'Productos destacados',
  //             style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 14.0,
  //
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 4.0),
  //         Expanded(
  //           child: FutureBuilder<List<ItemCard>>(
  //             future: items,
  //             builder: (context, snapshot) {
  //               if (snapshot.connectionState == ConnectionState.waiting) {
  //                 return const Center(
  //                   child: CircularProgressIndicator(),
  //                 );
  //               } else if (snapshot.hasError) {
  //                 return Center(
  //                   child: Text('Error: ${snapshot.error}'),
  //                 );
  //               } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
  //                 return const Center(
  //                   child: Text('No hay datos disponibles.'),
  //                 );
  //               }
  //               final List<ItemCard> items = snapshot.data!;
  //               return ListView.builder(
  //                 itemCount: items.length,
  //                 // padding: const EdgeInsets.symmetric(vertical: 1.0),
  //                 itemBuilder: (context, index) {
  //                   final item = items[index];
  //                   return Padding(
  //                     padding: const EdgeInsets.symmetric(vertical: 1.0),
  //                     child: CustomCardWidget(
  //                       title: item.title,
  //                       category: item.category,
  //                       price: item.price,
  //                       imageUrl: item.imageUrl,
  //                     ),
  //                   );
  //                 },
  //               );
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
