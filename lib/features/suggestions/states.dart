class SuggestionStates {}

class SuggestionLoadingState extends SuggestionStates {}

class SuggestionSuccessState extends SuggestionStates {
  final String msg ;

  SuggestionSuccessState({required this.msg});
}

class SuggestionFailedState extends SuggestionStates {
  final String msg ;

  SuggestionFailedState({required this.msg});

}
