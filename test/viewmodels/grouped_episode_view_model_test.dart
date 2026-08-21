import 'package:application/core/network/api_result.dart';
import 'package:application/core/network/http_client.dart';
import 'package:application/core/services/platform_launch_service.dart';
import 'package:application/models/grouped_episode_model.dart';
import 'package:application/models/lang_type.dart';
import 'package:application/models/pageable_model.dart';
import 'package:application/models/platform_model.dart';
import 'package:application/models/source_model.dart';
import 'package:application/repositories/grouped_episode_repository.dart';
import 'package:application/viewmodels/grouped_episode_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeGroupedEpisodeRepository extends GroupedEpisodeRepository {
  FakeGroupedEpisodeRepository() : super(const HttpClient());

  @override
  Future<ApiResult<PageableModel<GroupedEpisodeModel>>> getGroupedEpisodes(
    int page,
    int limit, {
    List<LangType>? langTypes,
  }) async {
    return ApiSuccess(PageableModel([], 1, 0, 0));
  }
}

class RecordingLaunchService extends PlatformLaunchService {
  final List<String> launched = [];

  @override
  Future<bool> launch(String rawUrl) async {
    launched.add(rawUrl);

    return true;
  }
}

void main() {
  group('GroupedEpisodeViewModel.onSourcePress', () {
    test('delegates the source URL to the launch service', () async {
      // Given
      final launchService = RecordingLaunchService();
      final viewModel = GroupedEpisodeViewModel(
        FakeGroupedEpisodeRepository(),
        launchService,
      );
      final platform = PlatformModel('Crunchyroll', 'crunchyroll.png');
      final source = SourceModel(
        platform,
        'https://example.com/watch',
        LangType.subtitles,
      );

      // When
      await viewModel.onSourcePress(source);

      // Then
      expect(launchService.launched, ['https://example.com/watch']);
    });
  });
}
