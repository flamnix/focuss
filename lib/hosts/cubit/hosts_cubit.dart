// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc/bloc.dart';
import 'package:focuss/data/model/host_record.dart';
import 'package:focuss/data/model/hosts_model.dart';
import 'package:focuss/hosts/io/hosts_writer.dart';
import 'package:focuss/hosts/service/service_locator.dart';

class HostsCubit extends Cubit<Hosts> {
  final hostsWriter = getIt.get<HostsWriter>();
  HostsCubit(bool focusEnabled, List<HostRecord> backup)
      : super(
          Hosts(
            focusEnabled: focusEnabled,
            backup: backup,
            records: backup,
          ),
        );

  void toggle(List<HostRecord> records) => emit(
        Hosts(
          focusEnabled: !state.focusEnabled,
          backup: state.backup,
          records: records,
        ),
      );

  @override
  void onChange(Change<Hosts> change) {
    // writer.writeToFile(change.currentState.records,
    //     '/Users/strahinja.keselj/Desktop/file.txt');

    super.onChange(change);
  }
}
