part of 'schedule_cubit.dart';

sealed class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

final class ScheduleInitial extends ScheduleState {}

final class ScheduleLoadingState extends ScheduleState {}

final class ScheduleFailureState extends ScheduleState {
  final String errMessage;

  const ScheduleFailureState(this.errMessage);
}

final class ScheduleSuccessState extends ScheduleState {
  final ScheduleModel scheduleModel;

  const ScheduleSuccessState(this.scheduleModel);
}
