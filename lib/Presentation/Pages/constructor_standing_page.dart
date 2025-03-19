
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footballapp/Presentation/Blocs/constructor_standing_bloc/constructor_standing_bloc.dart';

import 'common/list_widget.dart';

class ConstructorStandingPage extends StatefulWidget {
  const ConstructorStandingPage({super.key});

  @override
  State<ConstructorStandingPage> createState() => _ConstructorStandingPageState();
}

class _ConstructorStandingPageState extends State<ConstructorStandingPage> {
  final ListWidget _lw = ListWidget();
  @override
  void initState() {
    super.initState();
    context.read<ConstructorStandingBloc>().add(ConstructorStandingGet());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Constructor Standing'),
      ),
      body: BlocBuilder<ConstructorStandingBloc, ConstructorStandingState>(
        builder: (context, state){
          if(state is ConstructorStandingGetLoading){
            return const Center(child: CircularProgressIndicator());
          }
          else if(state is ConstructorStandingGetSuccess){
            var data = state.standing.toList();
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index){
                var info = data[index];
                return _lw.displaystandings(info.position, info.constructor, info.points);
              });
          } 
          else if (state is ConstructorStandingGetFailure) {
            return const Center(child: Text('Failed to load standings.',style: TextStyle(color: Colors.white)));
          }
          return const Center(child: Text("No data Available"));
        }
      ),
    );
  }
}
