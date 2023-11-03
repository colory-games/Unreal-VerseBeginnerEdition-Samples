using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_variable_editable := class(creative_device):

    @editable
    var MyVar1 : float = 1.0    # Levelエディタ上で値を編集可能

    var MyVar2 : float = 5.0    # Levelエディタ上では値を編集できない

    @editable
    var MyVar3 : int = 10       # Levelエディタ上で値を編集可能

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Editable variable)]")

        # 各フィールドの値をログに出力
        # MyVar1とMyVar3は、Levelエディタ上で編集した値となる
        Print("MyVar1 : {MyVar1}")
        Print("MyVar2 : {MyVar2}")
        Print("MyVar3 : {MyVar3}")

        # editable属性付きの変数は、属性付きでない変数と同じように値代入・値参照できる
        set MyVar2 = MyVar1 + 1.0
        Print("Out : {MyVar1}")