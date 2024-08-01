import 'package:flutter_bloc/flutter_bloc.dart';

import 'notifications_settings_state.dart';

class NotificationsSettingsCubit extends Cubit<NotificationsSettingsState> {
  NotificationsSettingsCubit() : super(NotificationsSettingsInitial());
  bool orderStatus = true;
  bool announcementStatus = true;
  bool emailAnnouncementStatus = true;
  bool invoiceStatus = true;

  void changeOrderStatus({required bool status}) {
    orderStatus = status;
    emit(ChangeOrderStatus());
  }

  void changeAnnouncementStatus({required bool status}) {
    announcementStatus = status;
    emit(ChangeAnnouncementStatus());
  }

  void changeEmailAnnouncementStatus({required bool status}) {
    emailAnnouncementStatus = status;
    emit(ChangeEmailAnnouncementStatus());
  }

  void changeInvoiceStatus({required bool status}) {
    invoiceStatus = status;
    emit(ChangeInvoiceStatus());
  }
}
