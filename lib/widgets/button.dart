import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  bool? isLoading;
  IconData? icon;
  IconData? rightIcon;
  String label;
  Color? backgroundColor;
  Color? textColor;
  Color? borderColor;
  Function? onPress;
  Function? onLongPress;
  EdgeInsets? padding;
  bool? disabled;
  double? borderRadius;
  EdgeInsets? margin;
  double? fontSize;
  double? height;
  double? width;
  double? rightIconSize;
  MainAxisAlignment? mainAxisAlignment;
  String? imagePath;

  Button(
      {Key? key,
      this.icon,
      this.rightIcon,
      this.isLoading = false,
      required this.label,
      this.onPress,
      this.onLongPress,
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
      this.rightIconSize,
      this.imagePath})
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
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5)),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5)),
            onLongPress: disabled != null || disabled == true
                ? null
                : onLongPress == null
                    ? null
                    : () => onLongPress!(),
            onTap: disabled != null || disabled == true
                ? null
                : onPress == null
                    ? null
                    : () => onPress!(),
            child: Center(
              child: Row(
                mainAxisAlignment:
                    mainAxisAlignment ?? MainAxisAlignment.center,
                children: [
                  if (imagePath != null)
                    Image.asset(
                      'assets/images/$imagePath',
                      height: 40,
                      fit: BoxFit.fill,
                    ),
                  Text(label,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: fontSize ?? 14,
                        letterSpacing: 0.27,
                        color: textColor ?? Colors.white,
                      )),
                  if (rightIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Icon(
                        rightIcon,
                        color: textColor ?? Colors.white,
                        size: rightIconSize,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
