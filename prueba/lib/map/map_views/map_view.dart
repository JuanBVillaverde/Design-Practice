import 'package:flutter/material.dart';
import '../../custom_widgets/custom_appbar.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: const Center(

        child: Text('Mapa'),

      ),





    );
  }
}
