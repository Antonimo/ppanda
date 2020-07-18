import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppanda/theme/app_colors.dart';
import 'package:ppanda/theme/text_style.dart';

class BottomPickerBase extends StatelessWidget {
  static const double _kPickerSheetHeight = 216.0;
  static const double _kPickerActionsHeight = 44.0;

//  static const double _kPickerItemHeight = 32.0;

  final Widget child;
  final Function onSelect;
  final String pickerTitle;

  const BottomPickerBase({
    Key key,
    @required this.child,
    this.pickerTitle = '',
    this.onSelect,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _kPickerActionsHeight + _kPickerSheetHeight,
      child: Column(
        children: <Widget>[
          Container(
            height: _kPickerActionsHeight,
            decoration: BoxDecoration(
              color: Color(0xFFE1E0E0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -0.5),
                  blurRadius: 0,
                  spreadRadius: 0,
                  color: Color(0xFFFAFAF8),
                ),
              ],
            ),
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  pickerTitle,
                  style: AppTextStyle.pickerTitle,
                ),
                FlatButton(
                  color: AppColors.primary[900],
                  onPressed: () {
                    if (onSelect != null) {
                      onSelect();
                    }
                    Navigator.pop(context);
                  },
                  child: Text('בחר', style: TextStyle(color: AppColors.white)),
                )
              ],
            ),
          ),
          Container(
            height: _kPickerSheetHeight,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 22.0,
              ),
              child: GestureDetector(
                // Blocks taps from propagating to the modal sheet and popping.
                onTap: () {},
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
