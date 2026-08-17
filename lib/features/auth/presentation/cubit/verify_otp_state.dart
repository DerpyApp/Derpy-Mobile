part of 'verify_otp_cubit.dart';

class VerifyOtpState {
  final String otp;
  final int remainingSeconds;
  final bool canResend;
  final bool isVerifying;
  final bool isResending;

  const VerifyOtpState({
    this.otp = '',
    this.remainingSeconds = 60,
    this.canResend = false,
    this.isVerifying = false,
    this.isResending = false,
  });

  VerifyOtpState copyWith({
    String? otp,
    int? remainingSeconds,
    bool? canResend,
    bool? isVerifying,
    bool? isResending,
  }) {
    return VerifyOtpState(
      otp: otp ?? this.otp,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      canResend: canResend ?? this.canResend,
      isVerifying: isVerifying ?? this.isVerifying,
      isResending: isResending ?? this.isResending,
    );
  }
}
