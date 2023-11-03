using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

device_sample_case := class(creative_device):

    @editable
    MyVar : int = 0

    OnBegin<override>()<suspends> : void =
        Print("[Device sample (Case)]")

        var MyLocalVar : int = 0

        case (MyVar):
            0 =>
                # MyVarの値が0の場合に実行される
                set MyLocalVar = 1
                Print("Case 0")
            1 =>
                # MyVarの値が1の場合に実行される
                set MyLocalVar = 2
                Print("Case 1")
            _ =>
                # 上の条件をいずれも満たさない場合に実行される
                set MyLocalVar = 3
                Print("Case default")
        # caseブロック外であるため、以下は必ず実行される
        Print("Case end : {MyLocalVar}")

        <# 【ビルドエラーの例】

        # デフォルトケースは省略できない
        case (MyVar):
            0 =>
                Print("Case 0")
            1 =>
                Print("Case 1")
                
        # ケースに変数は設定できない
        case (MyVar):
            MyLocalVar =>   
                Print("Case 0")
            _ =>
                Print("Case 1")

        #>