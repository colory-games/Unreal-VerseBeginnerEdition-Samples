using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/UI }    # 列挙型の利用に必要

detatype_sample_enum := class(creative_device):

    # orientation型の定数を定義
    @editable
    OrientVar1 : orientation = orientation.Horizontal

    @editable
    OrientVar2 : orientation = orientation.Horizontal

    # horizontal_alignment型のフィールドを定義
    @editable
    var HorizonVar : horizontal_alignment = horizontal_alignment.Center

    OnBegin<override>()<suspends> : void =
        Print("[DetaType sample (Enum)]")

        # horizontal_alignment型のローカル変数を定義し、HorizonVarの値を代入
        var LocalVar : horizontal_alignment = horizontal_alignment.Center
        set LocalVar = HorizonVar

        # if式を利用し、OrientVar1の値により条件分岐
        if (OrientVar1 = orientation.Horizontal):
            Print("Success1")
        else:
            Print("Failure1")

        # case式を利用し、OrientVar1の値により条件分岐
        case (OrientVar1):
            orientation.Horizontal =>
                Print("Case : Horizontal")
            orientation.Vertical =>
                Print("Case : Horizontal")

        # 引数の型が列挙型であるメソッドMyFuncの呼び出し
        MyFunc(OrientVar1, OrientVar2)

    # 引数の型が列挙型であるメソッドMyFuncの定義
    MyFunc(In1 : orientation, In2 : orientation) : void =
        if (In1 = In2):
            Print("Success2")