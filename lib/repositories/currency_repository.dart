import 'package:crypto_currency/core/components/app_icons.dart';
import 'package:flutter/material.dart';

import '../models/currency.dart';

class CurrencyRepository {
  static List<Currency> currenciesList = [
    Currency(
      name: 'Auroracoin',
      initials: 'AUR',
      price: 0.3841,
      iconPath: AppIcons.auroracoin,
    ),
    Currency(
      name: 'Dash',
      initials: 'DASH',
      price: 265.43,
      iconPath: AppIcons.dash,
    ),
    Currency(
      name: 'Bitcoin',
      initials: 'BTC',
      price: 123834.00,
      iconPath: AppIcons.bitcoin,
    ),
    Currency(
      name: 'Devcoin3',
      initials: 'DVC',
      price: 0.0001263,
      iconPath: AppIcons.devcoin,
    ),
    Currency(
      name: 'Dogecoin',
      initials: 'DOGE',
      price: 0.3735,
      iconPath: AppIcons.dogecoin,
    ),
    Currency(
      name: 'Ethereum',
      initials: 'ETH',
      price: 8705.62,
      iconPath: AppIcons.ethereumPurple,
    ),
    Currency(
      name: 'Flash',
      initials: 'FLASH',
      price: 0.0024,
      iconPath: AppIcons.flash,
    ),
    Currency(
      name: 'Lisk',
      initials: 'LSK',
      price: 6.17,
      iconPath: AppIcons.lisk,
    ),
    Currency(
      name: 'Litecoin',
      initials: 'LTC',
      price: 316.30,
      iconPath: AppIcons.litecoin,
    ),
    Currency(
      name: 'Monero',
      initials: 'XMR',
      price: 824.09,
      iconPath: AppIcons.monero,
    ),
    Currency(
      name: 'Namecoin',
      initials: 'NMC',
      price: 6.44,
      iconPath: AppIcons.namecoin,
    ),
    Currency(
      name: 'Nxt',
      initials: 'NXT',
      price: 0.01825,
      iconPath: AppIcons.nxt,
    ),
    Currency(
      name: 'Peercoin',
      initials: 'PPC',
      price: 1.77,
      iconPath: AppIcons.peercoin,
    ),
    Currency(
      name: 'Primecoin',
      initials: 'XPM',
      price: 0.1673,
      iconPath: AppIcons.primecoin,
    ),
    Currency(
      name: 'Ripple',
      initials: 'XRP',
      price: 2.010,
      iconPath: AppIcons.ripple,
    ),
    Currency(
      name: 'Steem',
      initials: 'STEEM',
      price: 1.32,
      iconPath: AppIcons.steem,
    ),
    Currency(
      name: 'Tether',
      initials: 'USDT',
      price: 5.50,
      iconPath: AppIcons.tether,
    ),
    Currency(
      name: 'Zcash',
      initials: 'ZEC',
      price: 325.16,
      iconPath: AppIcons.zcash,
    ),
  ];
}
