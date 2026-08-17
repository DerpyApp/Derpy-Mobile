import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit() : super(const VerifyOtpState());

  Timer? _timer;

  void setOtp(String otp) {
    emit(state.copyWith(otp: otp));
  }

  void startTimer() {
    _timer?.cancel();

    emit(state.copyWith(remainingSeconds: 60, canResend: false));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds > 0) {
        emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
      } else {
        emit(state.copyWith(canResend: true));
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    startTimer();
  }

  void resendOtp() {
    startTimer();
  }

  void setVerifying(bool isVerifying) {
    emit(state.copyWith(isVerifying: isVerifying));
  }

  void setResending(bool isResending) {
    emit(state.copyWith(isResending: isResending));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
