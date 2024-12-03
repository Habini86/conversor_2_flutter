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
                enable: true),
            const SizedBox(
              height: 15,
            ),
            LineConversion(
              controller: toCoin,
              coinNameNotifier: nameToCoin,
              enable: false, // Bloqueia a escrita no campo
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                if (nameFromCoin.value.isEmpty || nameToCoin.value.isEmpty) {
                  return;
                }

                if (fromCoin.text.isEmpty) {
                  return;
                }

                final double value1 = double.parse(fromCoin.text);

                double result = HomeController(
                  nameFromCoin: nameFromCoin.value,
                  nameToCoin: nameToCoin.value,
                ).convert(value1);

                // Atualiza o valor do controlador toCoin
                toCoin.text = result.toStringAsFixed(2);
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
