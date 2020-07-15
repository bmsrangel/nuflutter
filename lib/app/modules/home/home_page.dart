import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../utils/colors.dart' as colors;
import 'home_controller.dart';
import 'widgets/account_info_text/account_info_text_widget.dart';
import 'widgets/bottom_card/bottom_card_widget.dart';
import 'widgets/card/card_widget.dart';
import 'widgets/card_button/card_button_widget.dart';
import 'widgets/card_footer/card_footer_widget.dart';
import 'widgets/card_title/card_title_widget.dart';
import 'widgets/credit_card_value/credit_card_value_widget.dart';
import 'widgets/custom_app_bar/custom_app_bar_widget.dart';
import 'widgets/app_bar_menu_tile/app_bar_menu_tile_widget.dart';
import 'widgets/expansible_bottom_menu/expansible_bottom_menu_widget.dart';

const Duration _kExpand = Duration(milliseconds: 300);

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  //use 'controller' variable to access controller

  AnimationController _animation$;

  @override
  void initState() {
    this._animation$ = AnimationController(
      vsync: this,
      duration: _kExpand,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TextTheme textThemes = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Color(0xFF82269E),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20.0),
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomAppBarWidget(
                  onExpansionChanged: this.controller.setIsExpanded,
                  controller: this._animation$,
                  screenSize: screenSize,
                  userFirstName: "Bruno",
                  textStyle: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: <Widget>[
                    QrImage(
                      data: "260\n0001\n2860476-5",
                      version: QrVersions.auto,
                      size: 120,
                      foregroundColor: Colors.white,
                    ),
                    AccountInfoTextWidget(
                      regularText: "Banco",
                      boldText: "260 - Nu Pagamentos S.A.",
                      textStyle: textThemes.caption,
                    ),
                    const SizedBox(height: 8.0),
                    AccountInfoTextWidget(
                      regularText: "Agência",
                      boldText: "0001",
                      textStyle: textThemes.caption,
                    ),
                    const SizedBox(height: 8.0),
                    AccountInfoTextWidget(
                      regularText: "Conta",
                      boldText: "1234567-8",
                      textStyle: textThemes.caption,
                    ),
                    const SizedBox(height: 10.0),
                    Divider(color: colors.lightPurple),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: this.controller.appBarMenuItems.length,
                      separatorBuilder: (_, index) =>
                          Divider(color: Colors.white),
                      itemBuilder: (_, index) => AppBarMenuTileWidget(
                        trailingIcon: this.controller.appBarMenuItems[index]
                            ["icon"],
                        title: this.controller.appBarMenuItems[index]["title"],
                        subtitle: this.controller.appBarMenuItems[index]
                            ["subtitle"],
                        subtitleColor: colors.lightPurple,
                      ),
                    ),
                    Divider(color: colors.lightPurple),
                    const SizedBox(height: 10.0),
                    OutlineButton(
                      onPressed: () {},
                      child: Container(
                        width: screenSize.width,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text("SAIR DA CONTA"),
                      ),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      borderSide: BorderSide(
                        color: colors.lightPurple,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: <Widget>[
                        CardWidget(
                          title: CardTitleWidget(
                            textStyle: textThemes.headline6,
                            leadingIcon: Icons.credit_card,
                            text: "Cartão de crédito",
                          ),
                          onPressed: () {},
                          screenWidth: screenSize.width,
                          body: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "FATURA FECHADA",
                                    style: textThemes.bodyText1.copyWith(
                                      color: Color(0xFFE5615C),
                                    ),
                                  ),
                                  CreditCardValueWidget(
                                    creditCardValue: "604,37",
                                    textStyle: textThemes.headline5,
                                  ),
                                  Text(
                                    "VENCIMENTO 10 JUL",
                                    style: textThemes.bodyText2,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  CardButtonWidget(
                                    child: Text(
                                      "PAGAR",
                                      style: textThemes.button.copyWith(
                                        color: colors.red,
                                      ),
                                    ),
                                    borderColor: colors.red,
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 10.0),
                                  CardButtonWidget(
                                    child: Text(
                                      "PARCELAR",
                                      style: textThemes.button,
                                    ),
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 10.0),
                                  LimitedBox(
                                    maxWidth: 50,
                                    child: CardButtonWidget(
                                      child: Icon(Icons.more_horiz),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          footer: CardFooterWidget(
                            textStyle: textThemes.subtitle2,
                            leadingIcon: Icons.fastfood,
                            text:
                                "Compra mais recente em Casa de Bolos no valor de R\$ 15,00 ontem.",
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        CardWidget(
                          screenWidth: screenSize.width,
                          onPressed: () {},
                          title: CardTitleWidget(
                            leadingIcon: Icons.monetization_on,
                            text: "Conta",
                            textStyle: textThemes.headline6,
                          ),
                          body: Text(
                            "R\$ 123.456,78",
                            style: textThemes.headline5.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          footer: CardFooterWidget(
                            leadingIcon: Icons.attach_money,
                            text:
                                "Transferência de R\$ 479,00 feita para John Doe em 06 JUL.",
                            textStyle: textThemes.subtitle2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Observer(
                builder: (_) {
                  return ExpansibleBottomMenuWidget(
                    isExpanded: this.controller.isExpanded,
                    controller: this._animation$,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      color: colors.nuPurple,
                      height: 140,
                      child: ListView.separated(
                        controller: this.controller.bottomMenuScroll$,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        separatorBuilder: (_, index) =>
                            const SizedBox(width: 8.0),
                        itemCount: this.controller.bottomCardElements.length,
                        itemBuilder: (_, index) => BottomCardWidget(
                          cardColor: colors.cardPurple,
                          cardIcon: this.controller.bottomCardElements[index]
                              ["icon"],
                          cardText: this.controller.bottomCardElements[index]
                              ["text"],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
