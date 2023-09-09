part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class ChangeTopic extends HomeEvent{
  final int topicIndex;

  const ChangeTopic({required this.topicIndex});
  @override
  // TODO: implement props
  List<Object?> get props => [topicIndex];

}