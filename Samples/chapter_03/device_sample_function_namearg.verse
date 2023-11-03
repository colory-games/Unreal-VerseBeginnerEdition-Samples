using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_function_namearg := class(creative_device):

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Function with name argument)]")

        # 引数In1,In2の値をそれぞれ10,5として、関数MyFunc1を呼び出し、
        # 戻り値を定数LocalConstAの定数値として代入
        LocalConstA : int = MyFunc1(?In1 := 10, ?In2 := 5)
        Print("Out1 : {LocalConstA}")

        # 上と同じ値を定数LocalConstBの定数値として代入
        # 名前付き引数は順番を入れ替え可能
        LocalConstB : int = MyFunc1(?In2 := 5, ?In1 := 10)
        Print("Out2 : {LocalConstB}")

        # 引数In1,In2,In3の値をそれぞれ4,5,10として、関数MyFunc2を呼び出し、
        # 戻り値を定数LocalConstCの定数値として代入
        LocalConstC : int = MyFunc2(4, ?In2 := 5, ?In3 := 10)
        Print("Out3 : {LocalConstC}")

    # 関数MyFunc1を定義（int型の名前付き引数In1・In2、int型の戻り値を持つ）
    MyFunc1(?In1 : int, ?In2 : int) : int =
        Print("Func1")
        return In1 - In2
 
    # 関数MyFunc2を定義（int型の引数In1、名前付き引数In2・In3、int型の戻り値を持つ）
    MyFunc2(In1 : int, ?In2 : int, ?In3 : int) : int =
        Print("Func2")
        return In1 + In2 + In3