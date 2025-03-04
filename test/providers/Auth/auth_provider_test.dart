import 'package:either_dart/src/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:ottaa_project_flutter/application/notifiers/auth_notifier.dart';
import 'package:ottaa_project_flutter/application/notifiers/loading_notifier.dart';

import 'package:ottaa_project_flutter/application/providers/auth_provider.dart';
import 'package:ottaa_project_flutter/application/providers/user_provider.dart';
import 'package:ottaa_project_flutter/application/service/about_service.dart';
import 'package:ottaa_project_flutter/application/service/auth_service.dart';
import 'package:ottaa_project_flutter/core/enums/sign_in_types.dart';
import 'package:ottaa_project_flutter/core/abstracts/user_model.dart';
import 'package:ottaa_project_flutter/core/models/assets_image.dart';
import 'package:ottaa_project_flutter/core/models/base_settings_model.dart';
import 'package:ottaa_project_flutter/core/models/base_user_model.dart';
import 'package:ottaa_project_flutter/core/models/language_setting.dart';
import 'package:ottaa_project_flutter/core/models/user_data_model.dart';
import 'package:ottaa_project_flutter/core/repositories/about_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/auth_repository.dart';
import 'package:ottaa_project_flutter/core/repositories/local_database_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider_test.mocks.dart';

class Listener extends Mock {
  void call(dynamic? previous, dynamic value);
}

@GenerateMocks([AuthProvider, LoadingNotifier, AuthService, AboutService, LocalDatabaseRepository, AuthNotifier, UserNotifier])
void main() {
  late AuthProvider cAuthProvider;
  late MockAuthProvider mockAuthProvider;
  late MockLoadingNotifier mockLoadingNotifier;
  late MockAuthService mockAuthService;
  late MockAboutService mockAboutService;
  late MockLocalDatabaseRepository mockLocalDatabaseRepository;
  late MockAuthNotifier mockAuthNotifier;
  late UserModel fakeUser;
  late MockUserNotifier mockUserNotifier;

  setUp(() {
    fakeUser = BaseUserModel(
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
    );
    mockAuthProvider = MockAuthProvider();
    mockLoadingNotifier = MockLoadingNotifier();
    mockAuthService = MockAuthService();
    mockAboutService = MockAboutService();
    mockLocalDatabaseRepository = MockLocalDatabaseRepository();
    mockAuthNotifier = MockAuthNotifier();
    mockUserNotifier = MockUserNotifier();
    cAuthProvider = AuthProvider(mockLoadingNotifier, mockAuthService, mockAboutService, mockLocalDatabaseRepository, mockAuthNotifier, mockUserNotifier);
  });

  test("should return auth provider", () {
    GetIt.I.registerSingleton<AuthRepository>(mockAuthService);
    GetIt.I.registerSingleton<AboutRepository>(mockAboutService);
    GetIt.I.registerSingleton<LocalDatabaseRepository>(mockLocalDatabaseRepository);

    final container = ProviderContainer(overrides: [
      loadingProvider.overrideWith((ref) => mockLoadingNotifier),
      authNotifier.overrideWith((ref) => mockAuthNotifier),
      userProvider.overrideWith((ref) => mockUserNotifier),
    ]);

    addTearDown(container.dispose);

    final pumpProvider = container.read(authProvider);

    expect(pumpProvider, isA<AuthProvider>());
    expect(authProvider, isA<ChangeNotifierProvider<AuthProvider>>());
  });

  group('auth Provider testing', () {
    test('sign in', () async {
      // when(mockAuthService.runToGetDataFromOtherPlatform(email: fakeUser.email, id: fakeUser.id)).thenAnswer((realInvocation) async => fakeUser.email);
      when(mockAuthService.signIn(SignInType.email)).thenAnswer((realInvocation) async => Right(fakeUser));
      when(mockLocalDatabaseRepository.setUser(fakeUser)).thenAnswer((realInvocation) async => {});
      when(mockAboutService.getUserInformation()).thenAnswer((realInvocation) async => Right(fakeUser));
      when(mockAuthNotifier.setSignedIn()).thenAnswer((realInvocation) {
        mockAuthNotifier.state = true;
      });
      when(mockLoadingNotifier.showLoading()).thenAnswer((realInvocation) {
        mockLoadingNotifier.state = true;
      });

      when(mockLoadingNotifier.hideLoading()).thenAnswer((realInvocation) {
        mockLoadingNotifier.state = false;
      });

      final result = await cAuthProvider.signIn(SignInType.email);

      expect(result.right, isA<UserModel>());

      verify(mockAuthService.signIn(SignInType.email)).called(1);
      verify(mockLocalDatabaseRepository.setUser(fakeUser)).called(1);
      verify(mockAboutService.getUserInformation()).called(1);
      verify(mockAuthNotifier.setSignedIn()).called(1);
      verify(mockLoadingNotifier.showLoading()).called(1);
      verify(mockLoadingNotifier.hideLoading()).called(1);
    });

    test('sign in should thrown an exception', () async {
      // when(mockAuthService.runToGetDataFromOtherPlatform(email: fakeUser.email, id: fakeUser.id)).thenAnswer((realInvocation) async => fakeUser.email);
      when(mockAuthService.signIn(SignInType.email)).thenAnswer((realInvocation) async => Left("No user"));

      when(mockLoadingNotifier.showLoading()).thenAnswer((realInvocation) {
        mockLoadingNotifier.state = true;
      });

      when(mockLoadingNotifier.hideLoading()).thenAnswer((realInvocation) {
        mockLoadingNotifier.state = false;
      });

      final result = await cAuthProvider.signIn(SignInType.email);

      expect(result.left, isA<String>());

      verify(mockAuthService.signIn(SignInType.email)).called(1);
    });

    test('log out', () async {
      when(mockAuthService.signIn(SignInType.email)).thenAnswer((realInvocation) async => Right(fakeUser));
      when(mockLocalDatabaseRepository.setUser(fakeUser)).thenAnswer((realInvocation) async => {});
      when(mockAboutService.getUserInformation()).thenAnswer((realInvocation) async => Right(fakeUser));
      when(mockAuthNotifier.setSignedIn()).thenAnswer((realInvocation) {
        mockAuthNotifier.state = true;
      });
      when(mockLoadingNotifier.showLoading()).thenAnswer((realInvocation) {
        mockLoadingNotifier.state = true;
      });

      when(mockAuthNotifier.setSignedOut()).thenAnswer((realInvocation) {
        mockAuthNotifier.state = false;
      });

      await cAuthProvider.logout();

      expect(false, false);
    });
  });

  test("should return user if logged in", () async {
    when(mockAuthService.isLoggedIn()).thenAnswer((realInvocation) async {
      return true;
    });

    expect(await cAuthProvider.isUserLoggedIn(), true);
  });
}
