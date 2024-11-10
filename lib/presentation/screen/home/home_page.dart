import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = DiConfig().injector.get<HomeBloc>();
  final key = GlobalKey<FormState>();

  @override
  void initState() {
    bloc.add(HomeLoad());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
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
                    Form(key: key, child: _buildForms(state)),
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
      itemBuilder: (context, index) {
        final form = state.forms[index];
        return AppInput(
          hintText: '',
          label: form.label,
          required: form.isRequired,
        );
      },
      separatorBuilder: (context, index) => 16.height,
    );
  }

  TextButton _buildButton(HomeLoaded state) {
    return TextButton(
      onPressed: () => {
        bloc.add(HomeLoad()),
        if (!key.currentState!.validate()) {},

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
    print('state.productList.length: ${state.productList.length}');
    return GridViewCustom(
      itemCount: state.productList.length,
      itemBuilder: (context, index) {
        final product = state.productList[index];
        return _buildItem(product);
      },
      crossAxisCount: 2,
      shrinkWrap: true,
      padding: 0.padding,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisExtent: 250,
    );
  }

  Column _buildItem(ProductEntity product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseCacheImage(url: product.imageSrc).size(height: 200),
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
          product.price.formatCurrency,
          style: StyleApp.normal(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
