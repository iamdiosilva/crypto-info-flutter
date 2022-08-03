class Currency {
  String baseId;
  String iconPath;
  String name;
  String initials;
  double price;
  DateTime timestamp;
  /*double changeHour;
  double changeDay;
  double changeWeek;
  double changeMonth;
  double changeYear;
  double changeAmountPeriod;*/

  Currency({
    required this.baseId,
    required this.iconPath,
    required this.name,
    required this.initials,
    required this.price,
    required this.timestamp,
    /*required this.changeHour,
    required this.changeDay,
    required this.changeWeek,
    required this.changeMonth,
    required this.changeYear,
    required this.changeAmountPeriod,*/
  });
}
