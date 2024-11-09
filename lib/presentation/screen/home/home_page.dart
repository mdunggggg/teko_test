import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:teko_hiring_test/presentation/components/input.dart';
import 'package:teko_hiring_test/presentation/components/loading.dart';
import 'package:teko_hiring_test/presentation/di/di.dart';
import 'package:teko_hiring_test/presentation/screen/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teko_hiring_test/shared/extension/ext_num.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final bloc = DiConfig().injector.get<HomeBloc>();


  @override
  void initState() {
    bloc.add(HomeLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding: 16.padding,
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(
                child: BaseLoading(),
              );
            }
            if (state is HomeLoaded) {
              return Column(
                children: [
                  _buildForms(state),
                  16.height,
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  _buildForms(HomeLoaded state) {
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


}
