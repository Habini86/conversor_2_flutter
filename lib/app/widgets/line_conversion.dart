import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LineConversion extends StatelessWidget {
  const LineConversion(
      {super.key, required this.controller, required this.coinNameNotifier});

  final TextEditingController controller;
  final ValueNotifier<String> coinNameNotifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: DropdownButtonFormField(
            items: const [
              DropdownMenuItem(
                value: "Real",
                child: Text('R\$'),
              ),
              DropdownMenuItem(
                value: "Dolar",
                child: Text('US\$'),
              ),
            ],
            onChanged: (value) {
              coinNameNotifier.value = value.toString();
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 2,
          child: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              TextInputFormatter.withFunction(
                (oldValue, newValue) {
                  String newText =
                      newValue.text.replaceFirst(RegExp(r'^0'), '');
                  return newValue.copyWith(
                    text: newText,
                    selection: TextSelection.collapsed(offset: newText.length),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
