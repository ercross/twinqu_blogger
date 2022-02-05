part of '../page.dart';

class CustomImagePicker extends StatefulWidget {
  /// [CustomImagePicker] only allows picking images from the gallery.
  /// Taking images through the camera is reserved solely for the slay queens.
  const CustomImagePicker({Key? key}) : super(key: key);

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  final CreateBlogPostController controller =
      Get.find<CreateBlogPostController>();

  String _path = "";
  late XFile? _pickedFile = XFile(_path);
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final Widget camera = Container(
      height: 33,
      width: 33,
      alignment: Alignment.center,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child:
          const Icon(Icons.camera_alt_outlined, color: kPrimaryColor, size: 16),
    );
    return FormField<String>(
        onSaved: controller.onSavedImagePicker,
        validator: controller.imagePickerValidator,
        builder: (formState) => Column(
              children: [
                InkWell(
                  onTap: () => _fromGallery(formState),
                  child: Container(
                      height: 132,
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: const Color(0xFFEFEFEF),
                      child: Stack(
                        children: [
                          if (_path.isNotEmpty)
                            Image.file(File(_pickedFile!.path),
                                fit: BoxFit.cover,
                                height: 132,
                                width: double.infinity),
                          Align(alignment: Alignment.center, child: camera)
                        ],
                      )),
                ),
                if (formState.hasError)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(formState.errorText ?? "error text not set",
                        style: Get.textTheme.subtitle1!
                            .copyWith(color: Colors.red)),
                  )
              ],
            ));
  }

  /// [didChange] saves new image path into
  /// the FormField state
  void _fromGallery(FormFieldState<String> formState) async {
    final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
        _path = pickedFile.path;
        formState.didChange(_pickedFile!.name);
        formState.validate();
      });
      controller.onImageSelected(_pickedFile!.name, File(_pickedFile!.path));
    }
  }
}
