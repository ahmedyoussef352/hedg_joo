abstract class ConfirmDepositState {}

class ConfirmDepositInitial extends ConfirmDepositState {}

class PickedImageState extends ConfirmDepositState {}

class RemoveImageState extends ConfirmDepositState {}

class ConfirmDepositLoading extends ConfirmDepositState {}

class ConfirmDepositSuccess extends ConfirmDepositState {}

class ConfirmDepositFailure extends ConfirmDepositState {
  final String error;

  ConfirmDepositFailure(this.error);
}
