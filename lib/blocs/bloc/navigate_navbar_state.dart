// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'navigate_navbar_bloc.dart';

class NavigateNavbarState extends Equatable {
  final int index;
  NavigateNavbarState({
    required this.index,
  });

  factory NavigateNavbarState.initial() {
    return NavigateNavbarState(index: 0);
  }

  NavigateNavbarState copyWith({
    int? index,
  }) {
    return NavigateNavbarState(
      index: index ?? this.index,
    );
  }

  @override
  List<Object> get props => [index];

  @override
  bool get stringify => true;
}
