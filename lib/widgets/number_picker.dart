import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberPicker extends StatefulWidget {
  final double minValue, maxValue, initialValue;
  final int divisions;
  final Function(double) onNewValue;
  final Color backgroundColor;
  final bool showCursor;
  final Color cursorColor;
  final Color activeItemTextColor;
  final Color passiveItemsTextColor;
  final String suffix;
  final double selectedFontSize, unselectedFontSize;
  NumberPicker(
      {@required this.minValue,
      @required this.maxValue,
      @required this.divisions,
      @required this.onNewValue,
      this.selectedFontSize = 20.0,
      this.unselectedFontSize = 14.0,
      this.initialValue,
      this.backgroundColor = Colors.white,
      this.showCursor = true,
      this.cursorColor = Colors.red,
      this.activeItemTextColor = Colors.blue,
      this.passiveItemsTextColor = Colors.grey,
      this.suffix})
      : assert(minValue < maxValue),
        assert(initialValue >= minValue && initialValue <= maxValue),
        assert(onNewValue != null);
  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  List<double> valueList = [];
  FixedExtentScrollController _scrollController;
  int curItem;

  int selectedFontSize = 14;
  List<Map> valueMap = [];

  Timer timer;

  void callCallback(double value) {
    if (timer != null) timer.cancel();
    timer = Timer(Duration(seconds: 2), () {
      widget.onNewValue(value);
      print('selected value: ' + value.toString());
    });
  }

  @override
  void initState() {
    super.initState();

    int initialItem = widget.initialValue == null
        ? widget.divisions ~/ 2
        : (widget.initialValue - widget.minValue) ~/
            ((widget.maxValue - widget.minValue) / widget.divisions);

    double divisionLength =
        ((widget.maxValue - widget.minValue) / widget.divisions);
    setScrollController(initialItem);

    for (var i = 0; i <= widget.divisions; i++) {
      i == initialItem
          ? valueMap.add({
              "value": widget.minValue + divisionLength * i,
              "fontSize": widget.selectedFontSize,
              "color": widget.activeItemTextColor,
            })
          : valueMap.add({
              "value": widget.minValue + divisionLength * i,
              "fontSize": widget.unselectedFontSize,
              "color": widget.passiveItemsTextColor,
            });
    }
  }

  setScrollController(int initialItem) {
    _scrollController = FixedExtentScrollController(initialItem: initialItem);
  }

  @override
  Widget build(BuildContext context) {
    // _scrollController.jumpToItem(curItem);
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: Stack(
          children: <Widget>[
            RotatedBox(
              quarterTurns: 3,
              child: ListWheelScrollView(
                  controller: _scrollController,
                  itemExtent: 60,
                  onSelectedItemChanged: (item) {
                    curItem = item;
                    setState(() {
                      int decimalCount = 1;
                      int fac = pow(10, decimalCount);
                      valueMap[item]["value"] =
                          (valueMap[item]["value"] * fac).round() / fac;
                      callCallback(valueMap[item]["value"]);
                      //widget.onChanged(valueMap[item]["value"]);
                      for (var i = 0; i < valueMap.length; i++) {
                        if (i == item) {
                          valueMap[item]["color"] = widget.activeItemTextColor;
                          valueMap[item]["fontSize"] = widget.selectedFontSize;
                          valueMap[item]["hasBorders"] = true;
                        } else {
                          valueMap[i]["color"] = widget.passiveItemsTextColor;
                          valueMap[i]["fontSize"] = widget.unselectedFontSize;
                          valueMap[i]["hasBorders"] = false;
                        }
                      }
                    });
                    setState(() {});
                  },
                  children: valueMap.map((Map curValue) {
                    return ItemWidget(curValue,
                        backgroundColor: widget.backgroundColor,
                        suffix: widget.suffix);
                  }).toList()),
            ),
            Visibility(
              visible: widget.showCursor,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: widget.cursorColor.withOpacity(0.3)),
                  width: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemWidget extends StatefulWidget {
  final Map curItem;
  final Color backgroundColor;
  final String suffix;
  ItemWidget(this.curItem, {this.backgroundColor, this.suffix});

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  List<String> textParts;
  String leftText, rightText;
  @override
  void initState() {
    super.initState();
    int decimalCount = 1;
    int fac = pow(10, decimalCount);

    var mtext = ((widget.curItem["value"] * fac).round() / fac).toString();
    textParts = mtext.split(".");
    leftText = textParts.first;
    rightText = textParts.last;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: RotatedBox(
        quarterTurns: 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "|",
              style: TextStyle(fontSize: 8, color: widget.curItem["color"]),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  leftText,
                  style: TextStyle(
                      fontSize: widget.curItem["fontSize"],
                      color: widget.curItem["color"],
                      fontWeight:
                          rightText == "0" ? FontWeight.w800 : FontWeight.w400),
                ),
                Text(
                  rightText == "0" ? "" : ".",
                  style: TextStyle(
                    fontSize: widget.curItem["fontSize"] - 3,
                    color: widget.curItem["color"],
                  ),
                ),
                Text(
                  rightText == "0" ? "" : rightText,
                  style: TextStyle(
                      fontSize: widget.curItem["fontSize"] - 3,
                      color: widget.curItem["color"]),
                ),
                (widget.suffix == null)
                    ? SizedBox()
                    : Text(
                        widget.suffix,
                        style: TextStyle(
                            fontSize: widget.curItem["fontSize"],
                            color: widget.curItem["color"]),
                      )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "|",
              style: TextStyle(fontSize: 8, color: widget.curItem["color"]),
            ),
          ],
        ),
      ),
    );
  }
}
