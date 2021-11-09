import 'package:focuss/hosts/io/hosts_reader.dart';
import 'package:focuss/hosts/io/hosts_writer.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupDependencyLocator() {
  getIt.registerSingleton<HostsWriter>(HostsWriter());
  getIt.registerSingleton<HostsReader>(HostsReader());
}
