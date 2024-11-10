import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teko_hiring_test/domain/entities/form_entity.dart';
import 'package:teko_hiring_test/domain/entities/product_entity.dart';
import 'package:teko_hiring_test/presentation/components/cache_image.dart';
import 'package:teko_hiring_test/presentation/components/grid_view_custom.dart';
import 'package:teko_hiring_test/presentation/components/input.dart';
import 'package:teko_hiring_test/presentation/components/loading.dart';
import 'package:teko_hiring_test/presentation/di/di.dart';
import 'package:teko_hiring_test/presentation/screen/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teko_hiring_test/shared/extension/ext_num.dart';
import 'package:teko_hiring_test/shared/extension/ext_string.dart';
import 'package:teko_hiring_test/shared/extension/ext_widget.dart';
import 'package:teko_hiring_test/shared/style_text/style_text.dart';

import '../../blocs/image_picker_bloc/image_picker_bloc.dart';
import '../../components/image_picker_page.dart';
import '../../components/label_button.dart';
import '../../components/toast_custom.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = DiConfig().injector.get<HomeBloc>();
  final key = GlobalKey<FormState>();
  final imageBloc = DiConfig().injector.get<ImagePickerBloc>();

  final name = TextEditingController();
  final price = TextEditingController();

  @override
  void initState() {
    bloc.add(HomeLoad());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    imageBloc.close();
    name.dispose();
    price.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: BlocBuilder<HomeBloc, HomeState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is HomeLoaded) {
              return Text(state.label.text);
            }
            return Container();
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: 16.padding,
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: BaseLoading(),
              );
            }
            if (state is HomeLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: key,
                      child: _buildForms(state),
                    ),
                    _buildImagePicker(),
                    16.height,
                    _buildButton(state),
                    16.height,
                    _buildProduct(state),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  ListView _buildForms(HomeLoaded state) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: state.forms.length,
      padding: 0.padding,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final form = state.forms[index];
        if (form.type != FormType.file_upload) {
          return AppInput(
            hintText: '',
            label: form.label,
            required: form.isRequired,
            controller: form.type == FormType.text ? name : price,
            inputFormatters: form.type == FormType.text
                ? [LengthLimitingTextInputFormatter(form.maxLength)]
                : [],
            textInputType: form.type == FormType.number
                ? TextInputType.number
                : TextInputType.text,
            validate: form.type != FormType.number
                ? null
                : (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Vui lòng điền ${form.label.toLowerCase()}';
                    }
                    if (value.removeAllDot() < form.minValue) {
                      return 'Giá sản phẩm phải lớn hơn ${form.minValue.formatCurrency} đ';
                    }
                    if (value.removeAllDot() > form.maxValue) {
                      return 'Giá sản phẩm phải nhỏ hơn ${form.maxValue.formatCurrency} đ';
                    }
                    return null;
                  },
          );
        } else {
          return ColumnLabelButton(
            title: 'Ảnh sản phẩm',
            label: 'Chọn tệp tin (tối đa 5MB)',
            radius: 8.radius,
            backgroundColor: Colors.grey.withOpacity(0.2),
            prefixIcon:
                const Icon(Icons.cloud_upload_outlined, color: Colors.black),
            onPressed: () async {
              final image = await ImagePickerPage().pickCropImage(
                aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
                source: ImageSource.gallery,
              );
              if (image == null) {
                return;
              }
              imageBloc.add(ImagePickerLoad(image));
            },
          );
        }
      },
      separatorBuilder: (context, index) => 16.height,
    );
  }

  TextButton _buildButton(HomeLoaded state) {
    return TextButton(
      onPressed: () {
        if (!key.currentState!.validate()) {
          return;
        }
        XFile? image;
        if (imageBloc.state is ImagePickerLoaded) {
          image = (imageBloc.state as ImagePickerLoaded).image;
        }
        bloc.add(
          HomeAddProduct(
            name.text,
            price.text.removeAllDot().toInt(),
            image?.path,
          ),
        );
        imageBloc.add(ImagePickerClear());
        ToastCustom.show(
          context,
          title: 'Thành công',
          msg: 'Tạo sản phẩm thành công',
          svgIcon: 'assets/svg/success.svg',
          color: Colors.green,
          timeClose: 3.seconds,
        );
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: 8.paddingVer + 24.paddingHor,
        shape: RoundedRectangleBorder(
          borderRadius: 8.radius,
        ),
      ),
      child: Text(
        state.button.text,
        style: StyleApp.bold(
          color: Colors.white,
        ),
      ),
    );
  }

  GridViewCustom _buildProduct(HomeLoaded state) {
    return GridViewCustom(
      itemCount: state.productList.length,
      itemBuilder: (context, index) {
        final product = state.productList[index];
        return _buildItem(product);
      },
      showFull: true,
      crossAxisCount: 2,
      shrinkWrap: true,
      padding: 0.padding,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisExtent: 250,
    );
  }

  Column _buildItem(ProductEntity product) {
    print('product: ${product.name}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product.imageSrc.startsWith('http'))
          BaseCacheImage(url: product.imageSrc).size(height: 200),
        if (!product.imageSrc.startsWith('http'))
          Image.file(File(product.imageSrc)).size(height: 200),
        4.height,
        Text(
          product.name,
          style: StyleApp.bold(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        4.height,
        Text(
          '${product.price.formatCurrency} đ',
          style: StyleApp.normal(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  BlocBuilder<ImagePickerBloc, ImagePickerState> _buildImagePicker() {
    return BlocBuilder<ImagePickerBloc, ImagePickerState>(
      bloc: imageBloc,
      builder: (context, state) {
        if (state is ImagePickerLoading) {
          return const Center(
            child: BaseLoading(),
          );
        }
        if (state is ImagePickerLoaded) {
          return Image.file(File(state.image.path))
              .size(height: 200)
              .padding(16.paddingTop);
        }
        return Container();
      },
    );
  }
}
