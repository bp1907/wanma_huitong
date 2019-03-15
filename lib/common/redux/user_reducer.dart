import 'package:redux/redux.dart';
import 'package:wanma_huitong/common/model/User.dart';


///redux的combineReducers，通过TypedReducer将UpdateUserAction与reducers关联起来
final userReducer = combineReducers<User>([
  TypedReducer<User,UpdateUserAction>(_updateLoaded),
]);

/// 如果有 UpdateUserAction 发起一个请求时
/// 就会调用到 _updateLoaded
User _updateLoaded(User user, action) {
  user = action.userInfo;
  return user;
}

///定一个 UpdateUserAction ，用于发起 userInfo 的的改变
class UpdateUserAction {
  final User userInfo;
  UpdateUserAction(this.userInfo);
}