import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

/// show warning notification bar
notiWarningWidget(BuildContext context, {String? message}) {
  toastification.show(
    context: context,
    title: Text(
      message ?? '',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    type: ToastificationType.warning,
    autoCloseDuration: const Duration(seconds: 2),
    style: ToastificationStyle.flatColored,
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.all(16),
    showProgressBar: false,
  );
}

/// show success notification bar
notiSuccessWidget(BuildContext context, {String? message}) {
  toastification.show(
    context: context,
    title: Text(
      message ?? '',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    type: ToastificationType.success,
    autoCloseDuration: const Duration(seconds: 2),
    style: ToastificationStyle.flatColored,
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.all(16),
    showProgressBar: false,
  );
}

/// show error notification bar
notiErorWidget(BuildContext context, {String? message}) {
  toastification.show(
    context: context,
    title: Text(
      message ?? '',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    type: ToastificationType.error,
    autoCloseDuration: const Duration(seconds: 2),
    style: ToastificationStyle.flatColored,
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.all(16),
    showProgressBar: false,
  );
}
