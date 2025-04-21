import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_card_feat_view.dart';
import 'package:trick_crm_app/features/deals/deal-view/Information/presentation/information_deal_screen.dart';
import '../../../../../../../core/widgets/app_bar.dart';
import '../../../../deals/data/model/deals_model.dart';
import '../../../Attatchments/attachment-view/presentation/attachment_deal_screen.dart';
import '../../../Campaigns/presentation/campaign_deal_screen.dart';
import '../../../Timeline/presentation/deal_timeline_sccreen.dart';
import '../../../notes/notes-view/presentation/screen/notes_deal_screen.dart';

class DealView extends StatelessWidget {
  final int dealId;
  final String dealName;
  final DealsModel dealsModel;
  const DealView({
    super.key,
    required this.dealName,
    required this.dealId,
    required this.dealsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        dealName,
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
                    () => InformationDealScreen(
                      dealId: dealId,
                      dealsModel: dealsModel,
                    ),
                  );
                },
              ),
              appCardFeatView(
                title: 'Timeline',
                icon: 'timeline',
                onTap: () {
                  Get.to(
                    () => DealTimelineSccreen(dealId: dealId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Notes',
                icon: 'notes',
                onTap: () {
                  Get.to(
                    () => NotesDealScreen(dealId: dealId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Attachments',
                icon: 'attachments',
                onTap: () {
                  Get.to(
                    () => AttachmentDealScreen(dealId: dealId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Campaigns',
                icon: 'Campaigns',
                onTap: () {
                  Get.to(
                    () => CampaignDealScreen(dealId: dealId),
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
