using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_for := class(creative_device):

    @editable
    var MyVar1 : int = 5

    @editable
    MyVar2 : int = 10

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (For)]")

        var MyLocalVar : int = 0
        for (Count := 0..10):
            # Countの値を順に0から10まで繰り返し実行される（合計11回実行）
            set MyLocalVar += Count
            Print("For1 count : {Count}, {MyLocalVar}")

        # forブロック外であるため、以下は1回のみ実行される
        Print("For1 end")    

        for (Count := 0..20; Count >= MyVar1):
            # Countの値を順に0から20まで繰り返し実行される（合計21回実行）、
            # ただし、「Countの値がMyVarの値以上」を満たす場合しか実行されない
            Print("For2 count : {Count}")
        
        for (Count := 0..10; MyVar1 >= MyVar2; MyVar2 > 0):
            # Countの値を順に0から10まで繰り返し実行される（合計11回実行）、
            # ただし、「MyVar1の値がMyVar2の値以上」を満たす、
            # かつ「MyVar2の値が0よりも大きい」を満たす場合しか実行されない
            set MyVar1 += 1
            Print("For3 count : {Count}")