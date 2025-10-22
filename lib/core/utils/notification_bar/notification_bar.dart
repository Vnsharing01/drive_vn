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
    autoCloseDuration: const Duration(milliseconds: 1500),
    style: ToastificationStyle.flatColored,
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.all(16),
    showProgressBar: false,
    closeButtonShowType: CloseButtonShowType.none,
    callbacks: ToastificationCallbacks(
      onDismissed: (value) => toastification.dismiss,
    ),
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
    autoCloseDuration: const Duration(milliseconds: 1200),
    style: ToastificationStyle.flatColored,
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.all(16),
    showProgressBar: false,
    callbacks: ToastificationCallbacks(
      onDismissed: (value) => toastification.dismiss,
    ),
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
    autoCloseDuration: const Duration(milliseconds: 1200),
    style: ToastificationStyle.flatColored,
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.all(16),
    showProgressBar: false,
    callbacks: ToastificationCallbacks(
      onDismissed: (value) => toastification.dismiss,
    ),
  );
}
