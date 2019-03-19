import 'package:event_bus/event_bus.dart';
import 'package:wanma_huitong/common/event/http_error_event.dart';

class Code {
  //网络错误
  static const NETWORK_ERROR = -1;
  //网络超时
  static const NETWORK_TIMEOUT = -2;

  static const SUCCESS = 200;

  static final EventBus eventBus = EventBus();

  static errorHandleFunction(code, message, noTip) {
    if(noTip) {
      return message;
    }
    //发送
    eventBus.fire(HttpErrorEvent(code, message));
    return message;
  }
}