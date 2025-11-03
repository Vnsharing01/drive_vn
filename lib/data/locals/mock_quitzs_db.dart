import 'package:drivevn/data/models/answers_model.dart';
import 'package:drivevn/data/models/question_model.dart';

final List<QuestionModel> questions = [
  QuestionModel(
    id: '1',
    question: 'Biển báo này có ý nghĩa gì?',
    answers: [
      AnswersModel(id: 1, questionId: 1, answer: 'Biển cấm người đi bộ'),
      AnswersModel(id: 2, questionId: 1, answer: 'Biển cấm xe thô sơ'),
      AnswersModel(id: 3, questionId: 1, answer: 'Biển cấm xe gắn máy'),
      AnswersModel(id: 4, questionId: 1, answer: 'Biển cấm ô tô'),
    ],
    correctAnswerIndex: 4,
  ),
  QuestionModel(
    id: '2',
    question: 'Khi gặp biển báo “Cấm rẽ trái”, người lái xe phải làm gì?',
    answers: [
      AnswersModel(id: 1, questionId: 2, answer: 'Không được rẽ trái'),
      AnswersModel(
          id: 2, questionId: 2, answer: 'Được phép rẽ trái nếu đường vắng'),
      AnswersModel(id: 3, questionId: 2, answer: 'Chỉ được đi thẳng'),
      AnswersModel(id: 4, questionId: 2, answer: 'Chỉ được quay đầu xe'),
    ],
    correctAnswerIndex: 3,
  ),
  // ---- Mock thêm ----
  QuestionModel(
    id: '3',
    question:
        'Biển báo có hình tam giác viền đỏ, nền vàng, bên trong có hình người đi bộ thể hiện điều gì?',
    answers: [
      AnswersModel(id: 1, questionId: 3, answer: 'Cấm người đi bộ qua đường'),
      AnswersModel(id: 2, questionId: 3, answer: 'Khu vực trường học'),
      AnswersModel(id: 3, questionId: 3, answer: 'Chú ý người đi bộ'),
      AnswersModel(id: 4, questionId: 3, answer: 'Nơi dành cho người đi bộ'),
    ],
    correctAnswerIndex: 3,
  ),
  QuestionModel(
    id: '4',
    question:
        'Khi đèn tín hiệu giao thông chuyển sang màu vàng, người điều khiển phương tiện phải làm gì?',
    answers: [
      AnswersModel(
          id: 1, questionId: 4, answer: 'Nhanh chóng vượt qua nút giao'),
      AnswersModel(
          id: 2,
          questionId: 4,
          answer: 'Dừng lại trước vạch dừng, trừ khi đã đi quá'),
      AnswersModel(
          id: 3, questionId: 4, answer: 'Bấm còi cảnh báo và tiếp tục đi'),
      AnswersModel(id: 4, questionId: 4, answer: 'Rẽ phải để tránh dừng xe'),
    ],
    correctAnswerIndex: 2,
  ),
  QuestionModel(
    id: '5',
    question:
        'Khi muốn chuyển làn đường, người lái xe phải thực hiện như thế nào?',
    answers: [
      AnswersModel(
          id: 1,
          questionId: 5,
          answer: 'Bật tín hiệu và chuyển làn ngay lập tức'),
      AnswersModel(
          id: 2,
          questionId: 5,
          answer: 'Quan sát, bật tín hiệu và chuyển làn an toàn'),
      AnswersModel(
          id: 3, questionId: 5, answer: 'Chỉ cần quan sát gương chiếu hậu'),
      AnswersModel(
          id: 4, questionId: 5, answer: 'Giảm tốc độ và dừng lại giữa hai làn'),
    ],
    correctAnswerIndex: 2,
  ),
  QuestionModel(
    id: '6',
    question:
        'Trên đường có nhiều làn, người lái xe ô tô con nên đi ở làn nào?',
    answers: [
      AnswersModel(
          id: 1,
          questionId: 6,
          answer: 'Làn bên phải để nhường đường cho xe khác vượt'),
      AnswersModel(id: 2, questionId: 6, answer: 'Làn bên trái cho xe tải'),
      AnswersModel(
          id: 3, questionId: 6, answer: 'Đi bất kỳ làn nào miễn tiện lợi'),
      AnswersModel(
          id: 4, questionId: 6, answer: 'Đi giữa hai làn để dễ chuyển hướng'),
    ],
    correctAnswerIndex: 1,
  ),
];
