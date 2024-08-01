// ignore_for_file: constant_identifier_names
enum NationalId { front_id, back_id, undefined }

enum VerificationStep {
  // selection_verification_type(1),
  scan_front_id(1),
  verify_front_id(2),
  scan_back_id(3),
  verify_back_id(4),
  analysis_national_id(5),
  capture_face_picture(6),
  verify_captured_face(7),
  capture_face_Right_picture(8),
  verify_captured_face_Right(9),
  capture_face_Left_picture(10),
  verify_captured_face_Left(11),
  view_results(12);

  const VerificationStep(
    this.progress,
  );

  final int progress;

  @override
  String toString() => 'current step ($progress)';
}
enum ALERT_DIALOG { error, success, apply, logout, danger }
