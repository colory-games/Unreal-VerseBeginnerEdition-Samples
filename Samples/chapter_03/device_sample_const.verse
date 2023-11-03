using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_const := class(creative_device):

    MyConst1 : float = 1.0     # float型の定数MyConst1を定数値1.0で定義

    MyConst2 : float = 2.0     # float型の定数MyConst2を定数値2.0で定義

    @editable                  # Levelエディタ上で編集可能
    MyConst3 : float = 0.0     # float型の定数MyConst3を定数値0.0で定義

    var MyVar1 : float = 5.0   # float型のフィールドMyVar1を初期値5.0で定義

    <# 【ビルドエラーの例】
        
    MyConst4 := 3.0     # 型は省略できない

    #>

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Const)]")

        # float型のローカル定数MyConstAを定数値4.0で定義
        MyConstA : float = 4.0

        # float型のローカル定数MyConstBを、
        # MyConst1とMyConstAを足した値（5.0）の定数値で定義
        MyConstB : float = MyConst1 + MyConstA
        Print("Out1 : {MyConstB}")

        # ローカル定数MyConstCを定数値20.0で定義
        # ローカル定数であれば型は省略可能（MyConstCは自動的にfloat型と判断される）
        MyConstC := 20.0

        # MyVar1に、MyConst2とMyConst3を足した値を代入
        set MyVar1 =  MyConst2 + MyConst3
        Print("Out2 : {MyVar1}")

        <# 【ビルドエラーの例】
        
        # 定数に対して値は代入できない
        set MyConst1 = 5    
        
        #>