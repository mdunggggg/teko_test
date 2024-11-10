import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerInitial()) {
    on<ImagePickerLoad>(_onLoad);
    on<ImagePickerClear>(_onClear);
  }

  void _onLoad(ImagePickerLoad event, Emitter<ImagePickerState> emit) {
    emit(ImagePickerLoading());
    emit(ImagePickerLoaded(event.image));
  }

  void _onClear(ImagePickerClear event, Emitter<ImagePickerState> emit) {
    emit(ImagePickerInitial());
  }
}
