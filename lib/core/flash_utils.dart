
import 'package:eco_bite/core/enum_message_type.dart';
import 'package:eco_bite/core/size.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

class FlashUtils {
  static void showCustomFlash({
    required BuildContext context,
    String? message,
    Duration duration = const Duration(seconds: 4),
    bool barrierDismissible = true,
    Color backgroundColor = const Color(0xff16C965),
    FlashController<bool>? controller,
    Curve forwardAnimationCurve = Curves.easeInCirc,
    Curve reverseAnimationCurve = Curves.bounceIn,
    FlashPosition position = FlashPosition.top,
    MessageType? type,
    Widget? icon,
  }) {
    if (MessageType.success == type) {
      backgroundColor = Colors.green;
      message = message ?? "Success!";
      icon = const Icon(Icons.check_circle, color: Colors.white, size: 24);
    } else if (MessageType.info == type) {
      backgroundColor = Colors.blue;
      message = message ?? "Info";
      icon = const Icon(Icons.info, color: Colors.white, size: 24);
    } else if (MessageType.error == type) {
      backgroundColor = Colors.red;
      message = message ?? "Error";
      icon = const Icon(Icons.error, color: Colors.white, size: 24);
    } else if (MessageType.warning == type) {
      backgroundColor = Colors.yellow;
      message = message ?? "Warning";
      icon = const Icon(Icons.warning, color: Colors.white, size: 24);
    }
    context.showFlash<bool>(
      barrierDismissible: barrierDismissible,
      duration: duration,
      builder: (context, controller) => FlashBar(
        useSafeArea: false,
        backgroundColor: backgroundColor,
        controller: controller,
        forwardAnimationCurve: forwardAnimationCurve,
        reverseAnimationCurve: reverseAnimationCurve,
        position: position,
        content: Column(
          children: [
            AppSize.spaceMedium,
            Row(
              children: [
                icon ?? const Icon(Icons.info, color: Colors.white, size: 24),
                AppSize.spaceXSmall,
                Flexible(
                  child: Text(
                    message ?? "",
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
