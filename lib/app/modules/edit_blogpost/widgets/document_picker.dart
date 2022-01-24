part of '../page.dart';

class CustomImagePicker extends StatefulWidget {
  

  /// [CustomImagePicker] only allows picking images from the gallery.
  /// Taking images through the camera is reserved solely for the slay queens.
  const CustomImagePicker({Key? key}): super(key: key);

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  String _path = "";
  late XFile? _pickedFile = XFile(_path);
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final Widget choosePhotoPrompt =
        Container(
          height: 33,
          width: 33,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white
          ),
          child: const  Icon(Icons.camera_alt_outlined, color: kPrimaryColor, size: 16),
        );
    return GestureDetector(
      onTap: () => _fromGallery(),
      child: Container(
          height: 132,
          width: double.infinity,
          alignment: Alignment.center,
          color: const Color(0xFFEFEFEF),
          child: _path.isEmpty 
                      ? choosePhotoPrompt
                      : Image.file(File(_pickedFile!.path),
                          fit: BoxFit.fill,
                          height: 132,
                          width: double.infinity)),
    );
  }

 

  void _fromGallery() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await pickedFile.readAsBytes();
      _pickedFile = pickedFile;
      _path = pickedFile.path;
    }
  }
}
