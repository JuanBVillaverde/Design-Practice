import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/custom_appbar.dart';

class QrReaderView extends StatefulWidget {
  const QrReaderView({super.key});

  @override
  State<QrReaderView> createState() => _QrReaderViewState();
}

class _QrReaderViewState extends State<QrReaderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              const Text(
                'Escanea el \ncodigo QR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'y descubre toda la informacion\nsobre este sitio.\n¡Tu proxima aventura comienza aqui!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Image.asset(
                'assets/images/QR.png',
                width: 167.0,
                height: 167.0,
              ),
              const SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
                child: const Text(
                  'Escanear codigo QR',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
