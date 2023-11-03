using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_variable := class(creative_device):
    
    var MyVar1 : float = 1.0      # float型のフィールドMyVar1を初期値1.0で定義

    var MyVar2 : float = 2.0      # float型のフィールドMyVar2を初期値2.0で定義

    var MyVar3 : int = 5          # int型のフィールドMyVar3を初期値5で定義

    <# 【ビルドエラーの例】

    var MyVar3 : int = 3        # 同じ変数名は付けられない

    var MyVar4 : int            # 初期値は省略できない

    var MyVar5 : float = 3      # 初期値として型が異なる値は設定できない
    
    #>

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Variable)]")

        # float型のローカル変数MyVarAを初期値0.0で定義
        var MyVarA : float = 0.0
        
        # float型のローカル変数MyVarBを、
        # MyVar1とMyVar2を足した値（3.0）の初期値で定義
        var MyVarB : float = MyVar1 + MyVar2

        # MyVarAに、MyVarBと10.0を足した値（13.0）を代入
        set MyVarA =  MyVarB + 10.0

        # MyVarAの値（13.0）をログに出力
        Print("Out1 : {MyVarA}")

        # int型のローカル変数MyVarC,MyVarDを初期値20,3で定義
        var MyVarC : int = 20
        var MyVarD : int = 3

        # MyVar3に、MyVar3とMyVarCを足した値（25）を代入
        set MyVar3 = MyVar3 + MyVarC

        # MyVar3とMyVarDを足した値（28）をログに出力
        Print("Out2 : {MyVar3 + MyVarD}")

        <#> ビルドエラーの例
            MyVarA = MyVarB + 10.0      # 値を代入する場合は「set」を記述する

            set MyVar3 = MyVar2         # 型が異なる値は代入できない