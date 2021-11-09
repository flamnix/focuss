import 'package:flutter/cupertino.dart';
import 'package:focuss/data/model/host_record.dart';

class Hosts {
  final bool focusEnabled;
  final List<HostRecord> backup;
  final List<HostRecord> records;

  const Hosts({
    required this.focusEnabled,
    required this.backup,
    required this.records,
  });

  // Hosts copyWith({
  //   final bool focusEnabled;
  //   final List<HostRecord> backup;
  //   final List<HostRecord> records;
  // }) {
  //   return Hosts(
  //     focusEnabled: focusEnabled ?? this.focusEnabled,
  //   );
  // }
}
