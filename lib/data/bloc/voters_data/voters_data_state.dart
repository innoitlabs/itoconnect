part of 'voters_data_cubit.dart';

class VotersDataState extends Equatable {
  final bool isLoading;
  final List<VoterDataModel> votersData;

  const VotersDataState({
    required this.isLoading,
    required this.votersData,
  });

  @override
  List<Object> get props => [
        isLoading,
        votersData,
      ];

  VotersDataState copyWith({
    bool? isLoading,
    List<VoterDataModel>? votersData,
  }) =>
      VotersDataState(
        isLoading: isLoading ?? this.isLoading,
        votersData: votersData ?? this.votersData,
      );

  factory VotersDataState.initial() =>
      const VotersDataState(isLoading: false, votersData: []);
}
