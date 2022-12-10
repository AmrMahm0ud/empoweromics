import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final double minRange, maxRange;
  double sliderValue;
  final String title;
  final Function(int) onChange;

  SliderWidget(
      {Key? key,
      required this.maxRange,
      required this.minRange,
      required this.sliderValue,
      required this.title,
      required this.onChange})
      : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 16),
            ),
            Text(" ${widget.sliderValue.toInt()}"),
          ],
        ),
        Slider(
          value: widget.sliderValue,
          onChanged: (value) {
            widget.onChange(value.toInt());
            setState(() => widget.sliderValue = value);
          },
          min: widget.minRange,
          max: widget.maxRange,
        )
      ],
    );
  }
}
