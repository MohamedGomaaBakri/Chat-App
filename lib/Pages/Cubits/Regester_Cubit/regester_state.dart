part of 'regester_cubit.dart';

@immutable
sealed class RegesterState {}

final class RegesterInitial extends RegesterState {}

final class RegesterLoading extends RegesterState {}

final class RegesterSuccess extends RegesterState {}

// ignore: must_be_immutable
final class RegesterFailure extends RegesterState {
  String errormsg;
  RegesterFailure({required this.errormsg});
}
