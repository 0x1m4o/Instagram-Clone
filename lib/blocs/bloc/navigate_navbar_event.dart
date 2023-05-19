// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'navigate_navbar_bloc.dart';

abstract class NavigateNavbarEvent extends Equatable {
  const NavigateNavbarEvent();

  @override
  List<Object> get props => [];
}

class ChangeNavbarEvent extends NavigateNavbarEvent {
  final int newIndex;
  ChangeNavbarEvent({
    required this.newIndex,
  });

  ChangeNavbarEvent copyWith({
    int? newIndex,
  }) {
    return ChangeNavbarEvent(
      newIndex: newIndex ?? this.newIndex,
    );
  }
}
