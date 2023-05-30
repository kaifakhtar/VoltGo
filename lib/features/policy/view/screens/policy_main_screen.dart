import 'package:HarRidePay/features/policy/bloc/policy_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_html/flutter_html.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({super.key});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  final policyBloc = PolicyBloc();
  @override
  void initState() {
    policyBloc.add(PolicyFetchEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => policyBloc,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: RichText(
                text: const TextSpan(
              text: 'Volt',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'GO',
                  style: TextStyle(
                    color:  Color(0xff00FF0A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
            centerTitle: true,
          ),
          // backgroundColor: Colors.black,
          body: BlocBuilder<PolicyBloc, PolicyState>(
            builder: (context, state) {
              if (state is PolicyLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PolicyLoaded) {
                return loadedPolicyWidget(state.policy);
              } else if (state is PolicyError) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              return const Center(child: Text("Some unexpected error"));
            },
          )),
    );
  }

  Widget loadedPolicyWidget(String policy) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: Html(data: policy),
    ));
  }
}
