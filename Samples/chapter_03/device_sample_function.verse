using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_function := class(creative_device):

    @editable
    MyVar1 : int = 10

    var MyVar2 : int = 0

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Function)]")

        # メソッドMyFunc1を呼び出す
        MyFunc1()

        # 引数Inの値を5として、メソッドMyFunc2を呼び出す
        # 戻り値をフィールドMyVar2に代入
        set MyVar2 = MyFunc2(5)
        Print("Func2 out : {MyVar2}")

        # 引数In1, In2, In3の値をそれぞれMyVar1, 2, 5として、関数MyFunc3を呼び出す
        # 戻り値をローカル定数MyConstAの定数値として代入
        MyConstA : int = MyFunc3(MyVar1, 2, 5)
        Print("Func3 out : {MyConstA}")

        # メソッドMyFunc4を呼び出す
        # （関数内でフィールドMyVar2の値を変更）
        MyFunc4()
        Print("Var : {MyVar2}")

        # MyFunc2(5)とMyFunc2(10)の戻り値を足した値を、
        # ローカル定数MyConstBの定数値として代入
        # 代入値は、MyFunc2(5) + MyFunc2(10) = 10 + 20 = 30
        MyConstB : int = MyFunc2(5) + MyFunc2(10)
        Print("Out1 : {MyConstB}")

        # MyFunc2(5)とMyFunc2(10)の戻り値を足した値を、
        # 定数LocalConstCの定数値として代入
        # 代入値は、MyFunc2(MyFunc2(5)) = MyFunc2(10) = 20
        LocalConstC : int = MyFunc2(MyFunc2(5))
        Print("Out2 : {LocalConstC}")

    # メソッドMyFunc1を定義（引数・戻り値を持たない）
    MyFunc1() : void =
        Print("Func1")

    # メソッドMyFunc2を定義（int型の引数In、int型の戻り値を持つ）
    MyFunc2(In : int) : int =
        Print("Func2")
        var LocalVar : int = In * 2
        return LocalVar

    # メソッドMyFunc3を定義（int型の引数In1・In2・In3、int型の戻り値を持つ）
    MyFunc3(In1 : int, In2 : int, In3 : int) : int =
        Print("Func3")
        return In1 + In2 + In3

    # メソッドMyFunc4を定義（引数・戻り値を持たない）
    MyFunc4() : void =
        Print("Func4")

        # ローカル変数LocalVarに、フィールドMyVar1とMyVar2を足した値（15）を代入
        # フィールドはすべてのメソッドで利用可能
        # ローカル変数は定義したメソッド内でのみ利用可能
        var LocalVar : int = MyVar1 + MyVar2
        Print("Func4 local : {LocalVar}")

        # フィールドMyVar2に、MyVar1とMyVar2を足した値（15）を代入
        set MyVar2 += MyVar1