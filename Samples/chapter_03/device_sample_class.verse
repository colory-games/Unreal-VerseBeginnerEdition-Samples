using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# クラス名がdevice_sample_classの仕掛けを定義
# スーパークラスはcreative_deviceを指定する
device_sample_class := class(creative_device):

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Class)]")