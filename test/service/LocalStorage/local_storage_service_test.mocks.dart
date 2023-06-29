// Mocks generated by Mockito 5.4.0 from annotations
// in ottaa_project_flutter/test/service/LocalStorage/local_storage_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:typed_data' as _i7;
import 'dart:ui' as _i2;

import 'package:flutter/src/services/asset_bundle.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart'
    as _i4;
import 'package:path_provider_platform_interface/src/enums.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeImmutableBuffer_0 extends _i1.SmartFake
    implements _i2.ImmutableBuffer {
  _FakeImmutableBuffer_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFuture_1<T> extends _i1.SmartFake implements _i3.Future<T> {
  _FakeFuture_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PathProviderPlatform].
///
/// See the documentation for Mockito's code generation for more information.
class MockPathProviderPlatform extends _i1.Mock
    implements _i4.PathProviderPlatform {
  MockPathProviderPlatform() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<String?> getTemporaryPath() => (super.noSuchMethod(
        Invocation.method(
          #getTemporaryPath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);
  @override
  _i3.Future<String?> getApplicationSupportPath() => (super.noSuchMethod(
        Invocation.method(
          #getApplicationSupportPath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);
  @override
  _i3.Future<String?> getLibraryPath() => (super.noSuchMethod(
        Invocation.method(
          #getLibraryPath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);
  @override
  _i3.Future<String?> getApplicationDocumentsPath() => (super.noSuchMethod(
        Invocation.method(
          #getApplicationDocumentsPath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);
  @override
  _i3.Future<String?> getExternalStoragePath() => (super.noSuchMethod(
        Invocation.method(
          #getExternalStoragePath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);
  @override
  _i3.Future<List<String>?> getExternalCachePaths() => (super.noSuchMethod(
        Invocation.method(
          #getExternalCachePaths,
          [],
        ),
        returnValue: _i3.Future<List<String>?>.value(),
      ) as _i3.Future<List<String>?>);
  @override
  _i3.Future<List<String>?> getExternalStoragePaths(
          {_i5.StorageDirectory? type}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getExternalStoragePaths,
          [],
          {#type: type},
        ),
        returnValue: _i3.Future<List<String>?>.value(),
      ) as _i3.Future<List<String>?>);
  @override
  _i3.Future<String?> getDownloadsPath() => (super.noSuchMethod(
        Invocation.method(
          #getDownloadsPath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);
}

/// A class which mocks [AssetBundle].
///
/// See the documentation for Mockito's code generation for more information.
class MockAssetBundle extends _i1.Mock implements _i6.AssetBundle {
  MockAssetBundle() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i7.ByteData> load(String? key) => (super.noSuchMethod(
        Invocation.method(
          #load,
          [key],
        ),
        returnValue: _i3.Future<_i7.ByteData>.value(_i7.ByteData(0)),
      ) as _i3.Future<_i7.ByteData>);
  @override
  _i3.Future<_i2.ImmutableBuffer> loadBuffer(String? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadBuffer,
          [key],
        ),
        returnValue:
            _i3.Future<_i2.ImmutableBuffer>.value(_FakeImmutableBuffer_0(
          this,
          Invocation.method(
            #loadBuffer,
            [key],
          ),
        )),
      ) as _i3.Future<_i2.ImmutableBuffer>);
  @override
  _i3.Future<String> loadString(
    String? key, {
    bool? cache = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadString,
          [key],
          {#cache: cache},
        ),
        returnValue: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
  @override
  _i3.Future<T> loadStructuredData<T>(
    String? key,
    _i3.Future<T> Function(String)? parser,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadStructuredData,
          [
            key,
            parser,
          ],
        ),
        returnValue: _FakeFuture_1<T>(
          this,
          Invocation.method(
            #loadStructuredData,
            [
              key,
              parser,
            ],
          ),
        ),
      ) as _i3.Future<T>);
  @override
  void evict(String? key) => super.noSuchMethod(
        Invocation.method(
          #evict,
          [key],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void clear() => super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValueForMissingStub: null,
      );
}