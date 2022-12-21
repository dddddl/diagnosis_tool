class MqttEntity<T> {
  String cmd;
  String subcmd;
  String uuid;
  T data;

  MqttEntity(this.cmd, this.subcmd, this.uuid, this.data);
}
