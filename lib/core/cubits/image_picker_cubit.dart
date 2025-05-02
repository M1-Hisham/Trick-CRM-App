import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCubit extends Cubit<XFile?> {
  ImagePickerCubit() : super(null);
  XFile? image;

  // @override
  ///close cubit
  // Future<void> close() {
  //   image = null;
  //   return super.close();
  // }

  // ///pick image from gallery
  // Future<void> pickImageFromGallery() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? pickedFile =
  //       await picker.pickImage(source: ImageSource.gallery);
  //   emit(pickedFile);
  // }

  // ///pick image from camera
  // Future<void> pickImageFromCamera() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? pickedFile =
  //       await picker.pickImage(source: ImageSource.camera);
  //   emit(pickedFile);
  // }
}
