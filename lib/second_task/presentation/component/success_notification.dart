import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/slate_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomNotification {
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void show(
    BuildContext context, {
    required String message,
    String lottiePath = 'assets/icons/checkmark.json',
    Duration duration = const Duration(seconds: 3),
  }) {
    if (_isVisible) {
      dismiss();
    }

    final overlayState = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (context) => NotificationWidget(
        message: message,
        lottiePath: lottiePath,
        duration: duration,
      ),
    );

    overlayState.insert(_overlayEntry!);
    _isVisible = true;
  }

  static void dismiss() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isVisible = false;
  }
}

class NotificationWidget extends StatefulWidget {
  final String message;
  final String lottiePath;
  final Duration duration;

  const NotificationWidget({
    super.key,
    required this.message,
    required this.lottiePath,
    required this.duration,
  });

  @override
  NotificationWidgetState createState() => NotificationWidgetState();
}

class NotificationWidgetState extends State<NotificationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(widget.duration, () {
      if (mounted) {
        _controller.reverse().then((_) {
          CustomNotification.dismiss();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.05,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 32,
                  spreadRadius: 0.1,
                  offset: const Offset(6, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Lottie.asset(
                  widget.lottiePath,
                  width: 40,
                  height: 40,
                  repeat: true,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TypographyStyles.bodyCaptionRegular(
                    widget.message,
                    color: Slate.slate900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
