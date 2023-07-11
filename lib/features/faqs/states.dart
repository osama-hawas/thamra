part of 'bloc.dart';

class FAQsStates {}

class FAQsloadingState extends FAQsStates {}

class FAQssuccessState extends FAQsStates {
  final List<FAQsData> list;

  FAQssuccessState({required this.list});
}

class FAQsfailedState extends FAQsStates {}
