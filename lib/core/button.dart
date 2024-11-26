
import 'package:eco_bite/core/size.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Widget? icon;
  final String label;
  final Color color;
  final Color labelColor;
  final Color? borderColor;
  final Function()? onTap;
  final bool hasBorders;
  final double? borderRadius;
  final double? width;
  final TextStyle? style;

  const RoundedButton({
    super.key,
    this.icon,
    this.label = '',
    this.color = Colors.red,
    this.onTap,
    this.labelColor = Colors.white,
    this.hasBorders = false,
    this.borderRadius,
    this.borderColor,
    this.width,
    this.style
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      
      child: InkWell(
        
        onTap: onTap,
        child: Container(
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: hasBorders
                ? Border.all(color: borderColor ?? labelColor)
                : Border.all(
                    color: Colors.transparent,
                  ),
            color: color,
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.red.withOpacity(0.9),
                Colors.red.withOpacity(0.8),
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: AppSize.shortestSide * 0.04),
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon != null
                  ? SizedBox(
                      width: AppSize.iconSizeSmall,
                      height: AppSize.iconSizeSmall,
                      child: FittedBox(
                        child: icon,
                      ),
                    )
                  : const SizedBox.shrink(),
              icon != null ? AppSize.spaceXSmall : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  label,
                  style: style == null? 
                      Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: labelColor, fontWeight: FontWeight.w700):
                      Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: labelColor, fontWeight: FontWeight.w700)

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedButtonWithCustomColor extends StatelessWidget {
  final Widget? icon;
  final String label;
  final Color color;
  final Color labelColor;
  final Color? borderColor;
  final Function()? onTap;
  final bool hasBorders;
  final double? borderRadius;

  const RoundedButtonWithCustomColor({
    super.key,
    this.icon,
    this.label = '',
    this.color = Colors.red,
    this.onTap,
    this.labelColor = Colors.white,
    this.hasBorders = false,
    this.borderRadius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: hasBorders
                ? Border.all(color: borderColor ?? labelColor)
                : Border.all(
                    color: Colors.transparent,
                  ),
            color: color,
          ),
          padding: EdgeInsets.symmetric(vertical: AppSize.shortestSide * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: labelColor, fontWeight: FontWeight.w500,),
              ),
              icon != null ? AppSize.spaceXSmall : const SizedBox.shrink(),
              icon != null
                  ? SizedBox(
                      width: AppSize.iconSizeSmall,
                      height: AppSize.iconSizeSmall,
                      child: FittedBox(
                        child: icon,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
