import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  bool? isLoading;
  IconData? icon;
  String label;
  Color? backgroundColor;
  Color? textColor;
  Color? borderColor;
  Function? onPress;
  EdgeInsets? padding;
  bool? disabled;
  double? borderRadius;
  EdgeInsets? margin;
  double? fontSize;
  double? height;
  double? width;
  MainAxisAlignment? mainAxisAlignment;
  String? imagePath;
  FontWeight? fontWeight;
  Border? border;
  Color? splashColor;

  Button(
      {Key? key,
      this.icon,
      this.isLoading = false,
      required this.label,
      this.onPress,
      this.backgroundColor,
      this.borderColor,
      this.padding,
      this.disabled,
      this.borderRadius,
      this.margin,
      this.fontSize,
      this.mainAxisAlignment,
      this.textColor,
      this.height,
      this.width,
      this.imagePath,
      this.fontWeight,
      this.border,
      this.splashColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled == null ? 1 : 0.5,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 5),
          ),
          border: border,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: splashColor ?? Colors.white24,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 5),
            ),
            onTap: disabled != null || disabled == true
                ? null
                : onPress == null
                    ? null
                    : () => onPress!(),
            child: Center(
              child: Text(label,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: fontSize ?? 14,
                    letterSpacing: 0.27,
                    color: textColor ?? Colors.white,
                    fontWeight: fontWeight,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
