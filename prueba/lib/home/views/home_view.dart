import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/custom_widgets/custom_appbar.dart';
import 'package:prueba/home/adapters/home_adapter.dart';
import 'package:prueba/home/widgets/custom_stack_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeAdapter adapter;

  @override
  void initState() {
    super.initState();

    adapter = HomeAdapter(
        buildMenu(),
        buildPoints(),
        buildNotifications(),
        buildTitleText(),
        buildCardWelcome(),
        buildCardEvents(),
        buildCardEVA(),
        buildAlertButton());
  }

  Widget buildMenu() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 2),
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
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 2),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
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
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 2),
              blurRadius: 1,
              spreadRadius: 1,
            )
          ]),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all (Colors.white),
        // ),
      ),
    );
  }

  Widget buildTitleText() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        '¡Bienvenido! Conéctate con\nlo mejor de Cartagena aquí',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.0,
        ),
      ),
    );
  }

  Widget buildCardWelcome() {
    return CustomStackWidget(
      backgroundImage: 'assets/images/cartagena_bg.png',
      subtitle: 'Selecciona las preferencias y planea tu experiencia',
      title: 'Vive Cartagena',
      colorGradient: Colors.orange,
    );
  }

  Widget buildCardEvents() {
    return CustomStackWidget(
      backgroundImage: 'assets/images/events_bg.png',
      subtitle:
          'Vibra con Cartagena, consulta aqui el calendario y escoge el tuyo',
      title: 'Eventos',
      colorGradient: Colors.blue,
    );
  }

  Widget buildCardEVA() {
    return CustomStackWidget(
      backgroundImage: 'assets/images/EVA.png',
      subtitle: 'Preguntale a Eva los recomendados de hoy',
      title: 'Chatea con EVA',
      colorGradient: Colors.redAccent,
    );
  }

  Widget buildAlertButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_alert,
                color: Colors.white,
              ),
            ),
            const Text(
              'SOS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
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
  //   double width = MediaQuery.sizeOf(context).width;
  //
  //   String layout = 'Small';
  //   if (width >= 1200) {
  //     layout = 'UltraWide';
  //   } else if (width >= 1024) {
  //     layout = 'Wide';
  //   } else if (width >= 768) {
  //     layout = 'Medium';
  //   }
  //
  //   return Scaffold(
  //     appBar: AppBar(title: Text('Responsive Test')),
  //     body: Center(child: Text('Layout: $layout')),
  //   );
  // }

//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: IconButton(
//         onPressed: () {},
//         icon: Icon(Icons.add_alert),
//       ),
//       appBar: const CustomAppbar(),
//       body: SizedBox(
//         width: MediaQuery.sizeOf(context).width,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: MediaQuery.sizeOf(context).width * 0.05),
//                 child: const Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '¡Bienvenido! Conectate con lo\nmejor de Cartagena aqui',
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 0.0),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 4.0),
//               CustomStackWidget(
//                 backgroundImage: 'assets/images/cartagena_bg.png',
//                 subtitle: 'Selecciona las preferencias y planea tu experiencia',
//                 title: 'Vive Cartagena',
//                 colorGradient: Colors.orange,
//               ),
//               // SizedBox(width: 16.0),
//               CustomStackWidget(
//                 backgroundImage: 'assets/images/events_bg.png',
//                 subtitle:
//                     'Vibra con Cartagena, consulta aqui el calendario y escoge el tuyo',
//                 title: 'Eventos',
//                 colorGradient: Colors.blue,
//               ),
//               // SizedBox(width: 16.0),
//               CustomStackWidget(
//                 backgroundImage: 'assets/images/EVA.png',
//                 subtitle: 'Preguntale a Eva los recomendados de hoy',
//                 title: 'Chatea con EVA',
//                 colorGradient: Colors.redAccent,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
}
