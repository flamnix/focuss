import 'dart:convert';
import 'dart:io';

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:focuss/data/model/host_record.dart';

class HostsReader {
  late FileSystem fileSystem;

  HostsReader() {
    fileSystem = const LocalFileSystem();
  }

  List<HostRecord> readFromFile(String path) {
    final records = <HostRecord>[];

    final file = this.fileSystem.file(path);

    if (!file.existsSync()) {
      // TODO dodaj error neki lep
      throw Error();
    }

    final fileContents = file.readAsLinesSync(encoding: utf8);
    for (var i = 0; i < fileContents.length; i++) {
      final line = fileContents[i];
      if (line.startsWith('#')) {
        records.add(CommentHostRecord(contents: line));
      }

      final rawLine = line.split(RegExp('\s+'));

      if (rawLine.length < 2) {
        // TODO lepa greska
        // throw Error();
        break;
      }

      final source = rawLine[0].trim();
      final target = rawLine[1].trim();

      records.add(SourceTargetHostRecord(source: source, target: target));
    }

    return records;
  }
}
