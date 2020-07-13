import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../utils/colors.dart';
import 'home_controller.dart';
import 'widgets/account_info_text/account_info_text_widget.dart';
import 'widgets/card/card_widget.dart';
import 'widgets/card_button/card_button_widget.dart';
import 'widgets/custom_app_bar/custom_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TextTheme textThemes = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Color(0xFF82269E),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            children: <Widget>[
              CustomAppBarWidget(
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
                    size: 150,
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
                ],
              ),
              const SizedBox(height: 30.0),
              CardWidget(
                screenWidth: screenSize.width,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.credit_card,
                          color: Color(0xFF555555),
                        ),
                        const SizedBox(width: 15.0),
                        Text(
                          "Cartão de crédito",
                          style: textThemes.headline6,
                        )
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Text(
                      "FATURA FECHADA",
                      style: textThemes.bodyText1.copyWith(
                        color: Color(0xFFE5615C),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "R\$ ",
                          style: textThemes.headline5,
                          children: [
                            TextSpan(
                              text: "604",
                              style: textThemes.headline5.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            TextSpan(text: ",37", style: textThemes.headline5),
                          ]),
                    ),
                    Text(
                      "VENCIMENTO 10 JUL",
                      style: textThemes.bodyText2,
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        CardButtonWidget(
                          child: Text(
                            "PAGAR",
                            style: textThemes.button.copyWith(
                              color: red,
                            ),
                          ),
                          borderColor: red,
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
                footer: Row(
                  children: <Widget>[
                    Icon(
                      Icons.fastfood,
                      color: Color(0xFF777777),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Text(
                        "Compra mais recente em Casa de Bolos no valor de R\$ 15,00 ontem.",
                        textAlign: TextAlign.justify,
                        style: textThemes.subtitle2,
                      ),
                    ),
                    const SizedBox(width: 30.0),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 18,
                    ),
                  ],
                ),
              )
              // Icon(MaterialCommunityIcons.account_plus_outline),
              // Icon(MaterialCommunityIcons.cellphone),
            ],
          ),
        ),
      ),
    );
  }
}
