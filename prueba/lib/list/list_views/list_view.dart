import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  void initState() {
    super.initState();
    items = loadItems();
  }

  Future<List<ItemCard>> loadItems() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/cards_data.json');
      print(jsonString);
      return ItemCard.fromJsonList(jsonString);
    } catch (e) {
      print('error $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.0,),
          CustomSearchbar(
            controller: searchController,
            onFilterPressed: () {},
            text: '¿Qué producto/servicio quieres buscar?',
          ),
          const SizedBox(height: 8.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Productos destacados',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Expanded(
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
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
          ),
        ],
      ),
    );
  }
}
