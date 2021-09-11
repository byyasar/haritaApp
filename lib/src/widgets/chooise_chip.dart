import 'package:flutter/material.dart';
import 'package:haritaapp/src/models/soru.dart';

class ChoiceChipsWidget extends StatelessWidget {
  final List<Soru>? choices;
  final String? label;
  final int defaultChoiceIndex = 0;
  final bool? selected;
  final ValueChanged<bool>? onSelected;

  const ChoiceChipsWidget(
      {Key? key,
      @required this.choices,
      this.label,
      this.onSelected,
      @required this.selected})
      : assert(choices != null, selected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Soru> _choices = choices!;
    print(_choices.length);
    // ignore: unused_local_variable
    int _defaultChoiceIndex = defaultChoiceIndex;
    return ListView.builder(
      itemCount: _choices.length,
      itemBuilder: (BuildContext context, int index) {
        return ChoiceChip(
          label: Text(_choices[index].label),
          selected: selected ?? false,
          selectedColor: Colors.blue,
          onSelected: onSelected,
          backgroundColor: Colors.blue,
          labelStyle: TextStyle(color: Colors.white),
        );
      },
    );
  }
}
