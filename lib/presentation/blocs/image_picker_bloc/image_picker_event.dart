part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerEvent {}

class ImagePickerLoad extends ImagePickerEvent {
  final XFile image;

  ImagePickerLoad(this.image);
}

class ImagePickerClear extends ImagePickerEvent {}
