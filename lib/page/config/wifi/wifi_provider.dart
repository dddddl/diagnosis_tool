part 'wifi_state.freezed.dart';
part 'wifi_state.g.dart';

@freezed
class WifiState with _$WifiState{

    // ssid
    // password

    const factory WifiState({
        required String ssid,
        String? password,
    }) = _WifiState;
    
    factory WifiState.fromJson(Map<String, dynamic> json) => _$WifiStateFromJson(json);
}


final wifiProvider = StateNotifierProvider<WifiStateNotifier, WifiState>((ref) => WifiStateNotifier());


class WifiStateNotifier extends StateNotifier<WifiState> {
    
    
    WifiStateNotifier() : super(WifiState());
    
    


}


