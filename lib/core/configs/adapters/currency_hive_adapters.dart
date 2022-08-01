import 'package:hive/hive.dart';

import '../../../models/currency.dart';

class CurrencyHiveAdapter extends TypeAdapter<Currency> {
  @override
  final typeId = 0;

  @override
  Currency read(BinaryReader reader) {
    return Currency(
      name: reader.readString(),
      initials: reader.readString(),
      price: reader.readDouble(),
      iconPath: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Currency obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.initials);
    writer.writeDouble(obj.price);
    writer.writeString(obj.iconPath);
  }
}
