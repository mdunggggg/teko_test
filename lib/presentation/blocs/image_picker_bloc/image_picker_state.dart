part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerState {}

final class ImagePickerInitial extends ImagePickerState {}

final class ImagePickerLoading extends ImagePickerState {}

final class ImagePickerLoaded extends ImagePickerState {
  final XFile image;

  ImagePickerLoaded(this.image);
}

final class ImagePickerError extends ImagePickerState {
  final String message;

  ImagePickerError(this.message);
}
