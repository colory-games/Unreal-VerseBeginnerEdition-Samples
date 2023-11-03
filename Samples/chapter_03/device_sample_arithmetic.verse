using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_arithmetic := class(creative_device):

    @editable
    MyVar1 : int = 10

    @editable
    MyVar2 : int = 5

    @editable
    MyVar3 : float = 5.0

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Arithmetic)]")

        # int型の変数MyVarAを定義し、以下の計算値を代入
        # MyVar1 + MyVar2 * 2 + 10 = 10 + 5 * 2 + 10 = 30
        var MyVarA : int = 0
        set MyVarA = MyVar1 + MyVar2 * 2 + 10
        Print("Out1 : {MyVarA}")

        # float型の変数MyVarBを定義し、以下の計算値を代入
        # (MyVar3 + 10.0) / 3.0 - 1.0 = (5.0 + 10.0) / 3.0 - 1.0 = 4.0
        var MyVarB : float = (MyVar3 + 10.0) / 3.0 - 1.0
        Print("Out2 : {MyVarB}")
        
        # MyVarBに対して値1.0を加算
        set MyVarB += 1.0
        Print("Out3 : {MyVarB}")

        <# 【ビルドエラーの例】

        # int型の変数に、int型を割った値は代入できない
        var MyVarC : int = 8 / 2

        #>