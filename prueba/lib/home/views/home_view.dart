import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/custom_widgets/custom_appbar.dart';
import 'package:prueba/home/adapters/home_adapter.dart';
import 'package:prueba/home/styles/home_styles.dart';
import 'package:prueba/home/widgets/custom_stack_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeAdapter adapter;
  late HomeStyles _styles = HomeStyles(
    reportButtonPadding: 0,
    titleStyle: const TextStyle(fontSize: 14),
  );

  @override
  void initState() {
    super.initState();

    adapter = HomeAdapter(
      menu: buildMenu(),
      points: buildPoints(),
      notifications: buildNotifications(),
      titleText: buildTitleText(),
      cardWelcome: buildCardWelcome(),
      cardEvents: buildCardEvents(),
      cadrEVA: buildCardEVA(),
      alertButton: buildAlertButton(),
      styles: setStyles,
    );
  }

  void setStyles(HomeStyles styles) {
    print('Styles: ${styles.titleStyle.fontSize}');

    setState(() {
      _styles = styles;
    });
    print('Styles: ${styles.titleStyle.fontSize}');
  }

  Widget buildTitleText() {
    return Expanded(
      child: Text(
        '¡Bienvenido! Conéctate con lo mejor de Cartagena aquí',
        textAlign: TextAlign.start,
        style: _styles.titleStyle,
        softWrap: true,
        overflow: TextOverflow.visible,
      ),
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
            offset: const Offset(
              0,
              0.5,
            ),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {},
        icon: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                'assets/images/menu.png',
              ),
              fit: BoxFit.scaleDown,
            ),
          ),
          width: 45,
          height: 45,
        ),
        tooltip: 'Menu',
      ),
    );
  }

  Widget buildPoints() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(
              0,
              0.5,
            ),
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
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
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
          const SizedBox(
            width: 8.0,
          ),
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
            offset: const Offset(
              0,
              0.5,
            ),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {},
        icon: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bell.png',
              ),
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

  Widget buildCardWelcome() {
    return CustomStackWidget(
      backgroundImage: 'assets/images/cartagena_bg.png',
      subtitle: 'Selecciona las preferencias y planea tu experiencia',
      title: 'Vive Cartagena',
      colorGradient: Colors.deepOrange,
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
      colorGradient: const Color(0xFFD71658),
    );
  }

  Widget buildAlertButton() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFF24E68),
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(
          color: const Color(0xFFFFA7B4),
          width: 3.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 4.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/sos.png',
                width: 18.0,
                height: 18.0,
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

    return adapter.build(context);
  }
}
