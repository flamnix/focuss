// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuss/hosts/service/service_locator.dart';
import 'package:focuss/hosts/hosts.dart';
import 'package:focuss/hosts/io/hosts_reader.dart';
import 'package:switcher_button/switcher_button.dart';

class HostsPage extends StatelessWidget {
  final reader = getIt.get<HostsReader>();
  HostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO import from hosts file
    final backup =
        reader.readFromFile('/Users/strahinja.keselj/Desktop/file.txt');
    return BlocProvider(
      create: (_) => HostsCubit(false, backup),
      child: HostsView(),
    );
  }
}

class HostsView extends StatelessWidget {
  HostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Focuss';
    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_forward_ios_sharp),
              SwitcherButton(
                value: context.select(
                  (HostsCubit cubit) => cubit.state.focusEnabled,
                ),
                offColor: Colors.red,
                onColor: Colors.blue,
                onChange: (value) {
                  context.read<HostsCubit>().toggle(
                        context.read<HostsCubit>().state.records,
                      );
                },
              )
            ],
          ),
        ],
      )),
    );
  }
}
