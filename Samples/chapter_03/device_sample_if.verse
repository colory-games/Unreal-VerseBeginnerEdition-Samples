using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_if := class(creative_device):

    @editable
    MyVar1 : int = 1

    @editable
    MyVar2 : int = 2
    
    OnBegin<override>()<suspends> : void =
        Print("[Device sample (If)]")

        if (MyVar1 < MyVar2):
            # MyVar1の値がMyVar2の値より小さい場合に実行される
            var TempVar : int = MyVar1 + MyVar2
            Print("If1 success : {TempVar}")

        # if式のブロック外であるため、以下は必ず実行される
        Print("If1 end")    

        if (MyVar1 > 0 or MyVar2 < 10):
            # MyVar1の値が0より大きい、またはMyVar2の値が10より小さい場合に実行される
            var TempVar : int = MyVar1 - MyVar2 
            Print("If2 success : {TempVar}")

        if ((MyVar1 > 5 and MyVar2 > 5) or MyVar2 < 10 ):
            # 「MyVar1の値が5より大きく、かつMyVar2の値が5より大きい」を満たす、
            # または「MyVar2の値が10より小さい」を満たす場合に実行される
            Print("If3 success3")

        var MyLocalVar : int = 0

        if (MyVar1 + MyVar2 = 0):
            # MyVar1 + MyVar2の値が0と等しい場合に実行される
            set MyLocalVar = MyVar1 + MyVar2 
            Print("If4 success")
            
            # ifブロック内にif式を記述することも可能
            if (MyVar1 >= 10):
                # MyVar1の値が10以上の場合に実行される
                Print("If5 success")
            else:
                # 「MyVar1 >= 10」の条件を満たさない場合に実行される
                Print("If5 failure")
        else:
            # 「MyVar1 + MyVar2 = 0」の条件を満たさない場合に実行される
            set MyLocalVar = MyVar1 - MyVar2 
            Print("If4 failure")
            
        Print("If4 : {MyLocalVar}")

        if (not MyVar1 < 0):
            # 「MyVar1の値が0より小さい」を満たさない場合（失敗の場合）に実行される
            Print("If6 success1")
        else if (MyVar2 < 0):
            # 上の条件を満たさない、かつMyVar2の値が0より小さい場合に実行される
            Print("If6 success2")
        else if (MyVar2 < 10):
            # 上の条件をいずれも満たさない、かつMyVar2の値が10より小さい場合に実行される
            Print("If6 success3")
        else:
            Print("If6 failure")