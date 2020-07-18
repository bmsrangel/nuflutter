import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ScrollController bottomMenuScroll$ = ScrollController();
  List<Map<String, dynamic>> bottomCardElements = [
    {
      "icon": MaterialCommunityIcons.account_plus_outline,
      "text": "Indicar amigos",
    },
    {
      "icon": MaterialCommunityIcons.cellphone,
      "text": "Recarga de celular",
    },
    {
      "icon": Icons.attach_money,
      "text": "Dividir valor",
    },
    {
      "icon": Icons.people_outline,
      "text": "Doação",
    },
    {
      "icon": MaterialCommunityIcons.bank_transfer_out,
      "text": "Empréstimos",
    },
    {
      "icon": MaterialCommunityIcons.bank_transfer_in,
      "text": "Depositar",
    },
    {
      "icon": MaterialCommunityIcons.bank_transfer,
      "text": "Transferir",
    },
    {
      "icon": MaterialCommunityIcons.tune_vertical,
      "text": "Ajustar limite",
    },
    {
      "icon": MaterialCommunityIcons.help_circle_outline,
      "text": "Me ajuda",
    },
    {
      "icon": MaterialCommunityIcons.barcode,
      "text": "Pagar",
    },
    {
      "icon": MaterialCommunityIcons.lock_open_outline,
      "text": "Bloquear cartão",
    },
    {
      "icon": MaterialCommunityIcons.credit_card_multiple_outline,
      "text": "Cartão virtual",
    },
    {
      "icon": MaterialCommunityIcons.sort_descending,
      "text": "Organizar atalhos",
    },
  ];

  List<Map<String, dynamic>> appBarMenuItems = [
    {
      "icon": MaterialCommunityIcons.help_circle_outline,
      "title": "Me ajuda",
    },
    {
      "icon": MaterialCommunityIcons.account,
      "title": "Perfil",
      "subtitle": "Nome de preferência, telefone, email"
    },
    {
      "icon": MaterialCommunityIcons.account_edit,
      "title": "Configurar conta",
    },
    {
      "icon": MaterialCommunityIcons.credit_card_outline,
      "title": "Configurar cartão",
    },
    {
      "icon": MaterialCommunityIcons.warehouse,
      "title": "Pedir conta PJ",
    },
    {
      "icon": MaterialCommunityIcons.cellphone,
      "title": "Configurações do dispositivo",
    },
  ];

  @observable
  bool isExpanded = false;

  @action
  void setIsExpanded(bool value) {
    this.isExpanded = value;
  }
}
