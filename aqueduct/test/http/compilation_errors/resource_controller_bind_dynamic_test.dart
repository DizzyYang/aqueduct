import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
import 'package:runtime/shim.dart';
import "package:test/test.dart";

void main() {
  test("Cannot bind dynamic to header", () {
    try {
      RuntimeContext.current;
      fail('unreachable');
    } on StateError catch (e) {
      expect(e.toString(),
        contains("Bad state: Invalid binding 'x' on 'ErrorDynamic.get1': 'dynamic'"));
    }
  });
}

class ErrorDynamic extends ResourceController {
  @Operation.get()
  Future<Response> get1(@Bind.header("foo") dynamic x) async {
    return Response.ok(null);
  }
}