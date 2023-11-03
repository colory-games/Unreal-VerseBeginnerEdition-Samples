using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_loop := class(creative_device):

    @editable
    var MaxCount : int = 10

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Loop)]")

        var Count : int = 0

        loop:
            Print("Loop count : {Count}")
            set Count += 1
        
            # Countの値がMaxCountの値になったら繰り返し処理を中断する
            if (Count = MaxCount):
                Print("Loop count : End")
                break

        # loopブロック外であるため、以下は1回のみ実行される
        Print("Loop end")    