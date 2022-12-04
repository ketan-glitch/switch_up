library switch_up;

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class SwitchUp<T> extends StatefulWidget {
  const SwitchUp({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.value,
    this.enabled = true,
    this.radius = 8.0,
    this.elevation = 10,
    this.curves = Curves.linear,
    this.height = 30.0,
    this.gradient,

    /// const LinearGradient(
    ///   begin: Alignment.topLeft,
    ///   end: Alignment.bottomRight,
    ///   colors: [
    ///     Color(0xFF941F37),
    ///     Color(0xFF590012),
    ///   ],
    /// )

    this.color,
    this.backgroundColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.animationDuration = const Duration(milliseconds: 200),
  })  : assert(
          color == null || gradient == null,
          'Cannot provide both a color and a gradient\n',
        ),
        assert(
          items.length < 2,
          'Please provide at least 2 items\n',
        ),
        super(key: key);

  /// List of Items<T>
  final List<T> items;

  /// onChanged(T value)
  ///
  /// will return selected item on tap.
  final Function(T value) onChanged;

  /// Decides if Switch is enabled or not
  final bool enabled;

  /// Animation Curve
  final Curve curves;

  /// Radius for the switch
  final double? radius;

  /// Elevation for the selected switch item
  final double elevation;

  /// Height for Switch
  final double height;

  /// Gradient for selected Switch Item.
  final Gradient? gradient;

  /// Color for Selected Switch Item
  final Color? color;

  /// backgroundColor for Switch
  final Color? backgroundColor;

  /// selectedTextColor for Switch
  final Color? selectedTextColor;

  /// unselectedTextColor for Switch
  final Color? unselectedTextColor;

  ///
  /// animationDuration for Switch
  ///
  /// default is set to `const Duration(milliseconds: 200);`
  final Duration animationDuration;

  /// Type for Switch
  final T value;

  @override
  State<SwitchUp<T>> createState() => _SwitchUpState<T>();
}

class _SwitchUpState<T> extends State<SwitchUp<T>> {
  T? _selectedItem1;
  AlignmentGeometry _alignment = const Alignment(-1, 0);

  @override
  void initState() {
    super.initState();

    ///
    /// Setting the default value
    ///
    Timer.run(() {
      setState(() {
        try {
          double x = -1;
          double res = 2 / (widget.items.length - 1);
          _selectedItem1 = widget.value;
          log('${widget.items.indexOf(_selectedItem1 as T)}');
          x += (res * widget.items.indexOf(_selectedItem1 as T));
          _alignment = Alignment(x, 0);
        } catch (e) {
          log('---- ${e.toString()} ----', name: "ERROR AT initState()");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        return Container(
          width: size.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? const Color(0XFFF1F1F1),
            borderRadius: BorderRadius.circular(widget.radius ?? 8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment: _alignment,
                  curve: widget.curves,
                  duration: widget.animationDuration,
                  child: Material(
                    elevation: widget.elevation,
                    borderRadius: BorderRadius.circular(widget.radius ?? 8),
                    child: Container(
                      height: widget.height,
                      width: (constraints.maxWidth) / widget.items.length,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(widget.radius ?? 8),
                        color: (widget.color == null && widget.gradient == null)
                            ? Theme.of(context).primaryColor
                            : widget.color,
                        gradient: widget.gradient,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    for (int i = 0; i < widget.items.length; i++)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            ///
                            /// Setting the tapped value
                            ///
                            if (widget.enabled) {
                              double x = -1;
                              double res = 2 / (widget.items.length - 1);
                              x += (res * i);
                              _selectedItem1 = widget.items[i];
                              try {
                                widget.onChanged((widget.items[i]));
                              } catch (e) {
                                log('---- ${e.toString()} ----',
                                    name: "ERROR AT build()");
                              }
                              _alignment = Alignment(x, 0);
                              setState(() {});
                            }
                          },
                          child: Container(
                            height: widget.height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                widget.items[i].toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      color: _selectedItem1 == widget.items[i]
                                          ? Colors.white
                                          : null,
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
