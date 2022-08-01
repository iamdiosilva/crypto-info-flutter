import 'package:crypto_currency/repositories/account_repository.dart';
import 'package:crypto_currency/repositories/currency_format_repository.dart';
import 'package:crypto_currency/views/_general_components/general_header_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final account = context.watch<AccountRepository>();

    return Container(
      color: Color(0xffCDD2DE),
      child: Column(
        children: [
          GeneralHeaderComponent(title: 'Account'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 3,
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(2, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffCDD2DE),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text(
                          'Saldo',
                        ),
                        subtitle: Text(
                          CurrencyFormatRepository.format.format(account.balance),
                          style: TextStyle(fontSize: 25, color: Color(0xff20253D)),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => _updateBalance(),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _updateBalance() async {
    final form = GlobalKey<FormState>();
    final value = TextEditingController();
    final account = context.read<AccountRepository>();

    value.text = account.balance.toString();

    AlertDialog dialog = AlertDialog(
      title: Text('Update balance'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
      content: Form(
        key: form,
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color(0xff20253D), width: 2.5),
            ),
            labelText: 'Valor',
            labelStyle: TextStyle(color: Color(0xff20253D)),
            prefixIcon: Icon(
              Icons.monetization_on_outlined,
              color: Color(0xff20253D),
            ),
          ),
          controller: value,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))],
          validator: (value) {
            if (value!.isEmpty) return 'Set the balance value';
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(color: Color(0xff20253D)),
          ),
        ),
        TextButton(
          onPressed: () {
            if (form.currentState!.validate()) {
              account.setSaldo(double.parse(value.text));
              Navigator.pop(context);
            }
          },
          child: Text('Apply', style: TextStyle(color: Color(0xff20253D))),
        ),
      ],
    );

    showDialog(context: context, builder: (context) => dialog);
  }
}
