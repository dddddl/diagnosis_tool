

/// id + length
const  int headSize = 4;

const int idMin = 0;
const int idMax = 0x7FFF;



/// wifi ssid password 消息
const int CMD_WIFI_INFO = 0x00d1;
/// 服务器地址信息
const int CMD_HOST_INFO = 0x00d2;
/// BindToken
const int CMD_BINDTOKEN_INFO = 0x00d3;
/// 时区
const int CMD_TIMEZONE_INFO = 0x00d4;
/// 信道
const int CMD_CHANNEL_INFO = 0x00d5;