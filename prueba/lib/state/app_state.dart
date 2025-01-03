import 'package:prueba/list/models/item_card.dart';

class AppState {
  static final AppState _instance = AppState._internal();

  List<ItemCard>? items;

  factory AppState() {
    return _instance;
  }

  AppState._internal();
}
