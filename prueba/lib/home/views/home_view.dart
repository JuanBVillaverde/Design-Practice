import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/custom_widgets/custom_appbar.dart';
import 'package:prueba/home/widgets/custom_stack_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '¡Bienvenido! Conectate con lo\nmejor de Cartagena aqui',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.0),
            ),
          ),
          const SizedBox(height: 4.0),
          CustomStackWidget(
            backgroundImage: 'assets/images/cartagena_bg.png',
            subtitle: 'Selecciona las preferencias y planea tu experiencia',
            title: 'Vive Cartagena',
            colorGradient: Colors.orange,
          ),
          // SizedBox(width: 16.0),
          CustomStackWidget(
            backgroundImage: 'assets/images/events_bg.png',
            subtitle:
                'Vibra con Cartagena, consulta aqui el calendario y escoge el tuyo',
            title: 'Eventos',
            colorGradient: Colors.blue,
          ),
          // SizedBox(width: 16.0),
          CustomStackWidget(
            backgroundImage: 'assets/images/EVA.png',
            subtitle: 'Preguntale a Eva los recomendados de hoy',
            title: 'Chatea con EVA',
            colorGradient: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}
