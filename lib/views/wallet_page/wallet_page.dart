import 'package:crypto_currency/repositories/account_repository.dart';
import 'package:crypto_currency/repositories/currency_format_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/position.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int index = 0;
  double amountWallet = 0;
  double balance = 0;

  late AccountRepository account;

  String chartLabel = '';
  double chartValue = 0;
  List<Position> wallet = [];

  @override
  Widget build(BuildContext context) {
    account = Provider.of<AccountRepository>(context);
    balance = account.balance;

    setTotalWallet();

    return Container(
      color: Color(0xffCDD2DE),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 48, bottom: 8),
                child: Text(
                  'Walltet Amount',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Text(
                CurrencyFormatRepository.format.format(amountWallet),
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1.5,
                ),
              ),
              loadChart(),
            ],
          ),
        ),
      ),
    );
  }

  setTotalWallet() {
    final walletList = account.wallet;
    setState(() {
      amountWallet = account.balance;
      for (var position in walletList) {
        amountWallet += position.currency.price * position.amount;
      }
    });
  }

  setChartData(int index) {
    if (index < 0) return;
    if (index == wallet.length) {
      chartLabel = 'Balance';
      chartValue = account.balance;
    } else {
      chartLabel = wallet[index].currency.name;
      chartValue = wallet[index].currency.price * wallet[index].amount;
    }
  }

  loadWallet() {
    setChartData(index);
    wallet = account.wallet;
    final listLength = wallet.length + 1;

    return List.generate(listLength, (i) {
      final isTouched = i == index;
      final isBalance = i == listLength - 1;
      final fontSize = isTouched ? 18.0 : 14.0;
      final radius = isTouched ? 60.0 : 50.0;
      final color = isTouched ? Color(0xff68D69D) : Color(0xff68D69D).withOpacity(0.5);

      double percentage = 0;
      if (!isBalance) {
        percentage = wallet[i].currency.price * wallet[i].amount / amountWallet;
      } else {
        percentage = (account.balance > 0) ? account.balance / amountWallet : 0;
      }
      percentage *= 100;

      return PieChartSectionData(
        color: color,
        value: percentage,
        title: '${percentage.toStringAsFixed(0)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      );
    });
  }

  loadChart() {
    return (account.balance <= 0)
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 5,
                    centerSpaceRadius: 120,
                    sections: loadWallet(),
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                            index = -1;
                            return;
                          }
                          index = pieTouchResponse.touchedSection!.touchedSectionIndex;
                          setChartData(index);
                        });
                      },
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    chartLabel,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff68D69D),
                    ),
                  ),
                  Text(
                    CurrencyFormatRepository.format.format(chartValue),
                    style: TextStyle(fontSize: 28),
                  )
                ],
              ),
            ],
          );
  }
}
