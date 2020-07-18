import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ppanda/modules/shared/bottom_picker_base.dart';
import 'package:ppanda/theme/app_colors.dart';
import 'package:ppanda/theme/text_style.dart';

class CustomDatePicker extends FormField<DateTime> {
  // ignore: unused_field
  static const TAG = '[CustomDatePicker] ';

  CustomDatePicker({
    FormFieldSetter<DateTime> onSaved,
    FormFieldValidator<DateTime> validator,
    bool autovalidate = false,
    DateTime initialDateTime,
    DateTime initialBlankDateTime,
    DateTime minimumDate,
    DateTime maximumDate,
    String label,
    Function onDateTimeChanged,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialDateTime,
          autovalidate: autovalidate,
          builder: (FormFieldState<DateTime> state) {
            final ThemeData themeData = Theme.of(state.context);
            final Color enabledColor = themeData.colorScheme.onSurface.withOpacity(0.38);

            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  FocusScope.of(state.context).requestFocus(FocusNode());

                  showCupertinoModalPopup<void>(
                    context: state.context,
                    builder: (BuildContext context) {
                      return BottomPickerBase(
                        onSelect: () {
                          print(TAG + 'onSelect ${state.value}');

                          if (state.value == null) {
                            state.didChange(DateTime.now());
//                        onDateTimeChanged(DateTime.now());
                          }
                          state.save();
                          state.validate();
                        },
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          minimumDate: minimumDate,
                          maximumDate: maximumDate,
                          backgroundColor: Colors.white,
                          initialDateTime: initialDateTime ?? initialBlankDateTime,
                          onDateTimeChanged: (DateTime newDateTime) {
                            print(TAG + 'onDateTimeChanged ${state.value}');
                            state.didChange(newDateTime);
                            state.save();
//                        onDateTimeChanged(dt = newDateTime);
                          },
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(label, style: AppTextStyle.infoListTileTitle),
                        Text(state.value != null ? DateFormat('d MMMM y', 'he').format(state.value) : '', style: AppTextStyle.infoListTileContent),
                        const SizedBox(height: 8.0),
                        Container(height: 1.0, color: state.hasError ? AppColors.red : enabledColor),
                        if (state.hasError)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              state.errorText,
                              style: themeData.textTheme.caption.copyWith(color: themeData.errorColor),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
}
