class Error {
  Error._();

  er(int key, String field, int so) {
    String str = '';
    switch (key) {
      case 401:
        str = '$field không được rỗng !!!';
        break;
      case 402:
        str = '$field không đúng định dạng !!!';
        break;
      case 403:
        str = '$field đã tồn tại !!!';
        break;
      case 405:
        str = 'Xác nhận Mật Khẩu không đúng !!!';
        break;
      case 406:
        str = '$field chứa ít nhất $so kí tự !!!';
        break;
      default:
        str = 'No Response';
        break;
    }
    return str;
  }
}
