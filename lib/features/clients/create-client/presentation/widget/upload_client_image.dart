import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trick_crm_app/core/widgets/app_upload_image.dart';

import '../../../../../core/cubits/image_picker_cubit.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';

class UploadClientImage extends StatefulWidget {
  final Function(XFile?) fun;
  const UploadClientImage({super.key, required this.fun});

  @override
  State<UploadClientImage> createState() => _UploadClientImageState();
}

class _UploadClientImageState extends State<UploadClientImage> {
  @override
  void dispose() {
    GetIt.I<ImagePickerCubit>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Image",
        style: R.textStyles.font17PrimaryW600,
      ),
      spacingV(13),
      Row(
        children: [
          AppUploadImage(
            onImageSelected: widget.fun,
          ),
          spacingH(14),
          const Text("Accept images: JPG, PNG,\nJPG2000, GIF,...")
        ],
      ),
    ]);
  }
}
