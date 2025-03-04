// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ottaa_project_flutter/application/service/service.dart';
import 'package:ottaa_project_flutter/core/abstracts/basic_search.dart';
import 'package:ottaa_project_flutter/core/enums/user_types.dart';
import 'package:ottaa_project_flutter/core/models/assets_image.dart';
import 'package:ottaa_project_flutter/core/models/base_settings_model.dart';
import 'package:ottaa_project_flutter/core/models/base_user_model.dart';
import 'package:ottaa_project_flutter/core/models/group_model.dart';
import 'package:ottaa_project_flutter/core/models/language_setting.dart';
import 'package:ottaa_project_flutter/core/models/user_data_model.dart';
import 'package:ottaa_project_flutter/core/repositories/repositories.dart';

import 'groups_service_test.mocks.dart';

@GenerateMocks([
  AuthRepository,
  RemoteStorageRepository,
  ServerRepository,
])
Future<void> main() async {
  late MockAuthRepository mockAuthRepository;
  late MockRemoteStorageRepository mockRemoteStorageRepository;
  late MockServerRepository mockServerRepository;

  late GroupsService groupsService;

  const String fakeGroups = """
  [
     {
      "freq": 0,
      "id": "--PHmDIFeKHvulVxNtBgk",
      "relations": [],
      "resource": {"asset": "", "network": "https://firebasestorage.googleapis.com/v0/b/ottaaproject-flutter.appspot.com/o/Archivos%20Paises%2Ficonos%2Fdescripcion.webp?alt=media&token=4dbde8ba-f144-4a12-90f6-013bf68d912d"},
      "text": "ADJETIVOS"
    },
    {
      "freq": 0,
      "id": "--PHmDIFeKHvulVxNtBgk1",
      "relations": [],
      "resource": {"asset": "", "network": "https://firebasestorage.googleapis.com/v0/b/ottaaproject-flutter.appspot.com/o/Archivos%20Paises%2Ficonos%2Fdescripcion.webp?alt=media&token=4dbde8ba-f144-4a12-90f6-013bf68d912d"},
      "text": "ADJETIVOS1"
    }
  ]
  """;

  BaseUserModel fakeUser = BaseUserModel(
    id: "0",
    settings: BaseSettingsModel(
      data: UserData(
        avatar: AssetsImage(asset: "test", network: "https://test.com"),
        birthDate: DateTime(0),
        genderPref: "n/a",
        lastConnection: DateTime(0),
        name: "John",
        lastName: "Doe",
      ),
      language: LanguageSetting.empty(),
    ),
    email: "test@mail.com",
    type: UserType.caregiver,
  );

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockRemoteStorageRepository = MockRemoteStorageRepository();
    mockServerRepository = MockServerRepository();

    groupsService = GroupsService(
      mockAuthRepository,
      mockRemoteStorageRepository,
      mockServerRepository,
    );
  });

  test("Should return all groups", () async {
    when(mockAuthRepository.getCurrentUser()).thenAnswer((realInvocation) async => Right(fakeUser));

    when(mockRemoteStorageRepository.readRemoteFile(
      path: "groups",
      fileName: 'assets/grupos.json',
    )).thenAnswer((realInvocation) async => fakeGroups);

    final result = await groupsService.getAllGroups();

    expect(result.length, 2);
  });

  test("Should return empty list", () async {
    when(mockAuthRepository.getCurrentUser()).thenAnswer((realInvocation) async => Right(fakeUser));

    when(mockRemoteStorageRepository.readRemoteFile(
      path: "groups",
      fileName: 'assets/grupos.json',
    )).thenAnswer((realInvocation) async => "[]");

    final result = await groupsService.getAllGroups();

    expect(result.length, 0);
  });

  test("Should throw an exception on get groups", () async {
    expect(
        () => groupsService.getGroups(MockSearch(
              asset: "",
              file: "",
              language: "",
              remote: "",
            )),
        throwsA(isA<UnimplementedError>()));
  });

  group("Upload groups", () {
    test("should upload groups", () async {
      List<dynamic> fakeGroupsDb = [];

      when(mockAuthRepository.getCurrentUser()).thenAnswer((realInvocation) async => Right(fakeUser));

      when(mockServerRepository.uploadGroups(any, any, data: anyNamed("data"))).thenAnswer((realInvocation) async {
        fakeGroupsDb.addAll(realInvocation.namedArguments[#data]);

        return const Right(null);
      });
      final List<Group> fakeGroupsjson = json.decode(fakeGroups).map<Group>((e) => Group.fromMap(e)).toList();

      await groupsService.uploadGroups(fakeGroupsjson, "", "es_AR");

      expect(fakeGroupsDb, hasLength(fakeGroupsjson.length));
    });

    test("should not upload groups", () async {
      List<dynamic> fakeGroupsDb = [];

      when(mockAuthRepository.getCurrentUser()).thenAnswer((realInvocation) async => Left("No user left"));

      final List<Group> fakeGroupsjson = json.decode(fakeGroups).map<Group>((e) => Group.fromMap(e)).toList();

      await groupsService.uploadGroups(fakeGroupsjson, "", "es_AR");

      expect(fakeGroupsDb, hasLength(0));
    });
  });

  group("Update groups", () {
    test("should update groups", () async {
      List<Group> originalDb = json.decode(fakeGroups).map<Group>((e) => Group.fromMap(e)).toList();
      List<Group> fakeGroupsDb = json.decode(fakeGroups).map<Group>((e) => Group.fromMap(e)).toList();

      when(mockAuthRepository.getCurrentUser()).thenAnswer((realInvocation) async => Right(fakeUser));

      when(mockServerRepository.updateGroup(any, any, any, data: anyNamed("data"))).thenAnswer((realInvocation) async {
        int index = realInvocation.positionalArguments[2];
        final data = realInvocation.namedArguments[#data];

        fakeGroupsDb[index] = Group.fromMap(data);

        return Right(null);
      });

      await groupsService.updateGroups(fakeGroupsDb.first.copyWith(text: "test"), "", "es_AR", 0);

      expect(fakeGroupsDb.first == originalDb.first, equals(false));
    });

    test("should not update group", () async {
      List<Group> originalDb = json.decode(fakeGroups).map<Group>((e) => Group.fromMap(e)).toList();
      List<Group> fakeGroupsDb = json.decode(fakeGroups).map<Group>((e) => Group.fromMap(e)).toList();

      when(mockAuthRepository.getCurrentUser()).thenAnswer((realInvocation) async => Left("No user left"));

      await groupsService.updateGroups(fakeGroupsDb.first.copyWith(text: "test"), "", "es_AR", 0);

      expect(fakeGroupsDb, equals(originalDb));
    });
  });


  test("get default groups should thrown unimplementd error", () async {
    expect(() => groupsService.getDefaultGroups(), throwsA(isA<UnimplementedError>()));
  });
}

class MockSearch extends BasicSearch {
  @override
  final String asset;

  @override
  // TODO: implement file
  final String file;

  @override
  // TODO: implement language
  final String language;

  @override
  // TODO: implement remote
  final String remote;
  MockSearch({
    required this.asset,
    required this.file,
    required this.language,
    required this.remote,
  });
}
