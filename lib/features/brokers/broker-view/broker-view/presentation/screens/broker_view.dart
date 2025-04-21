import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_card_feat_view.dart';
import 'package:trick_crm_app/features/brokers/broker-view/Information/presentation/information_broker_screen.dart';
import '../../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../Attatchments/attachment-view/presentation/attachment_broker_screen.dart';
import '../../../Broker-Clients/presentation/broker_clients_screen.dart';
import '../../../Broker-Deals/presentation/broker_deals_screen.dart';
import '../../../Timeline/presentation/broker_timeline_sccreen.dart';
import '../../../notes/notes-view/presentation/screen/notes_broker_screen.dart';

class BrokerView extends StatelessWidget {
  final int brokerId;
  final String brokerName;
  const BrokerView({
    super.key,
    required this.brokerName,
    required this.brokerId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        brokerName,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Show Cards
              appCardFeatView(
                title: 'Information',
                icon: 'information',
                onTap: () {
                  Get.to(
                    () => InformationBrokerScreen(brokerId: brokerId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Timeline',
                icon: 'timeline',
                onTap: () {
                  Get.to(
                    () => BrokerTimelineSccreen(brokerId: brokerId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Notes',
                icon: 'notes',
                onTap: () {
                  Get.to(
                    () => NotesBrokerScreen(brokerId: brokerId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Broker Clients',
                buildIcon: SvgPicture.asset(
                  R.icons.iconsMenu['Clients']!,
                  width: 42.w,
                  height: 42.h,
                ),
                onTap: () {
                  Get.to(
                    () => BrokerClientsScreen(brokerId: brokerId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Broker Deals',
                buildIcon: SvgPicture.asset(
                  R.icons.iconsMenu['Deals']!,
                  width: 42.w,
                  height: 42.h,
                ),
                onTap: () {
                  Get.to(
                    () => BrokerDealsScreen(brokerId: brokerId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Attachments',
                icon: 'attachments',
                onTap: () {
                  Get.to(
                    () => AttachmentBrokerScreen(brokerId: brokerId),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
