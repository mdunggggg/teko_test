import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teko_hiring_test/presentation/components/loading.dart';
import 'package:teko_hiring_test/presentation/screen/home/components/product_item.dart';
import 'package:teko_hiring_test/shared/extension/ext_num.dart';
import 'package:teko_hiring_test/shared/extension/ext_scroll.dart';
import 'package:teko_hiring_test/shared/extension/ext_widget.dart';

import '../../di/di.dart';
import 'bloc/product_list_page_bloc.dart';

@RoutePage()
class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  final bloc = DiConfig().injector.get<ProductListPageBloc>();
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.onMore(() {
      bloc.add(ListProductLoadMore());
    });
    bloc.add(ListProductLoad());
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Container(
        padding: 16.padding,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              _buildList()
            ],
          ),
        ),
      ),
    );
  }

  _buildList() {
    return BlocBuilder<ProductListPageBloc, ProductListPageState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is ListProductLoading) {
          return const Center(child: BaseLoading());
        } else if (state is ListProductLoaded) {
          return Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ProductItem(product: product);
                },
                separatorBuilder: (context, index) => 16.height,
              ),
              if (state is ListProductLoadingMore)
                const BaseLoading().padding(0.padding),
            ],
          );
        } else if (state is ListProductFailure) {
          return Center(
            child: Text(state.message),
          );
        }
        return const SizedBox();
      },
    );
  }
}
