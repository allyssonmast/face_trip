import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class OpenCameraUseCase {
  final ImagePicker _picker;

  OpenCameraUseCase(this._picker);

  Future<String?> call() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return pickedFile.path;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
