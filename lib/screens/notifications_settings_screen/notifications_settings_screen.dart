import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';

import '../../components/custom_texts.dart';
import 'notifications_settings_cubit.dart';
import 'notifications_settings_state.dart';

class NotificationsSettingsScreen extends StatelessWidget {
  const NotificationsSettingsScreen({super.key});

  static String id = "NotificationsSettingsScreen";

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NotificationsSettingsCubit>(context);
    return BlocBuilder<NotificationsSettingsCubit, NotificationsSettingsState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          title: const BodyMediumText(
            "Notifications Settings",
            weight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BodyMediumText(
                "Notifications",
                weight: FontWeight.bold,
              ).bP25,
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffD5E6FF),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  children: [
                    AppExpansionTile(
                      title: "Push Notifications",
                      children: [
                        const Divider(
                          color: KUnselectedColor,
                        ).bP16,
                        AppSwitch(
                            title: "Order Status Updates",
                            value: cubit.orderStatus,
                            onChanged: (value) {
                              cubit.changeOrderStatus(status: value);
                            }).bP16,
                        AppSwitch(
                            title: "HEDG Updates & announcements",
                            value: cubit.announcementStatus,
                            onChanged: (value) {
                              cubit.changeAnnouncementStatus(status: value);
                            }),
                      ],
                    )
                  ],
                ).p16,
              ).bP25,
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffD5E6FF),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  children: [
                    AppExpansionTile(title: "Email Notifications", children: [
                      const Divider(
                        color: KUnselectedColor,
                      ).bP16,
                      AppSwitch(
                          title: "HEDG Updates & announcements",
                          value: cubit.emailAnnouncementStatus,
                          onChanged: (value) {
                            cubit.changeEmailAnnouncementStatus(status: value);
                          }).bP16,
                      AppSwitch(
                          title: "Invoices",
                          value: cubit.invoiceStatus,
                          onChanged: (value) {
                            cubit.changeInvoiceStatus(status: value);
                          }),
                    ])
                  ],
                ).p16,
              ),
            ],
          ).p25,
        ),
      ),
    );
  }
}
