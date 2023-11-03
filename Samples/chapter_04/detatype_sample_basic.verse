using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

detatype_sample_basic := class(creative_device):

    @editable
    var FloatVar : float = 2.0           # float型のフィールドを定義

    @editable
    var IntVar : int = 10                # int型のフィールドを定義

    @editable
    var LogicVar : logic = true          # logic型のフィールドを定義

    var CharVar : char = 'b'             # char型のフィールドを定義

    @editable
    var StringVar : string = "Hello!"    # string型のフィールドを定義

    OnBegin<override>()<suspends> : void =
        Print("[DetaType sample (Basic)]")

        # 各フィールドの値をログに出力
        Print("FloatVar1 : {FloatVar}")
        Print("IntVar1 : {IntVar}")
        Print("char1 : {CharVar}")
        Print("string1 : {StringVar}")
        
        # ローカル変数を定義
        set FloatVar = FloatVar + 2.0
        set IntVar = IntVar + 5
        set LogicVar = false
        set CharVar = 'c'
        set StringVar = StringVar + "World!"
        Print("FloatVar2 : {FloatVar}")
        Print("IntVar2 : {IntVar}")
        Print("char2 : {CharVar}")
        Print("string2 : {StringVar}")

        # 文字列の操作
        StringInt  : string = ToString(IntVar)
        StringFloat  : string = ToString(FloatVar)
        StringOut : string = StringInt + " & " + StringFloat
        Print("Out : {StringOut}")