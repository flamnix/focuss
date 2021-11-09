// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:focuss/app/app.dart';
import 'package:focuss/bootstrap.dart';

import 'hosts/service/service_locator.dart';

void main() {
  setupDependencyLocator();
  bootstrap(() {
    return const App();
  });
}
