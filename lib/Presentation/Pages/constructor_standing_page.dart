
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
  late String _year = '2024';
  final TextEditingController _yearcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<ConstructorStandingBloc>().add(ConstructorStandingGet(_year));
  }
  void updateYear(){
    setState(() {
      _year = _yearcontroller.text;
      context.read<ConstructorStandingBloc>().add(ConstructorStandingGet(_year));
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(// Your leading icon
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text('Constructor Standing', style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: screenwidth/2,
              child: SearchBar(hintText: 'Year', 
                leading: IconButton(icon: Icon(Icons.search), color: Colors.white,
                onPressed: () => updateYear(),),
                elevation: WidgetStateProperty.all(0),
                hintStyle: WidgetStateProperty.all(
                  TextStyle(color: Colors.white),
                ),
                textStyle: WidgetStateProperty.all(
                  TextStyle(color: Colors.white)
                ),
                controller: _yearcontroller,
                backgroundColor: WidgetStateProperty.all(Colors.red),
              )
            ),
          ),
          Expanded(
            child: BlocBuilder<ConstructorStandingBloc, ConstructorStandingState>(
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
          ),
        ],
      ),
    );
  }
}
