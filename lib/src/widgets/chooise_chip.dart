import 'package:flutter/material.dart';

Widget choiceChips() {
    return Expanded(
      child: ListView.builder(
        itemCount: _choices.length,
        itemBuilder: (BuildContext context, int index) {
          return ChoiceChip(
            label: Text(_choices[index]),
            selected: _defaultChoiceIndex == index,
            selectedColor: Colors.green,
            onSelected: (bool selected) {
              setState(() {
                _defaultChoiceIndex = selected ? index : 0;
              });
            },
            backgroundColor: Colors.blue,
            labelStyle: TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }