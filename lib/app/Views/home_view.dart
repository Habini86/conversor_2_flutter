import 'package:conversor2/app/Controllers/home_controller.dart';
import 'package:flutter/material.dart';
import '../widgets/line_conversion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController fromCoin = TextEditingController();
  final TextEditingController toCoin = TextEditingController();

  final ValueNotifier<String> nameFromCoin = ValueNotifier<String>('');
  final ValueNotifier<String> nameToCoin = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/img.png",
              width: 200,
              height: 200,
            ),
            LineConversion(
              controller: fromCoin,
              coinNameNotifier: nameFromCoin,
            ),
            const SizedBox(
              height: 15,
            ),
            LineConversion(
              controller: toCoin,
              coinNameNotifier: nameToCoin,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                if (nameFromCoin.value.isEmpty || nameToCoin.value.isEmpty) {
                  return;
                }

                if (fromCoin.text.isEmpty || toCoin.text.isEmpty) {
                  return;
                }

                final double value1 = double.parse(fromCoin.text);
                final double value2 = double.parse(toCoin.text);

                double result = HomeController(
                  nameFromCoin: nameFromCoin.value,
                  nameToCoin: nameToCoin.value,
                ).convert(value1, value2);

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Resultado'),
                      content: Text('O valor convertido é: $result'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Converter'),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
