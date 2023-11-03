using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

detatype_sample_map := class(creative_device):

    # string型のキー、int型の要素を持つマップの定数を定義
    IntMapVar : [string]int = map{"A" => 1, "B" => 3}

    # string型のキー、float型の要素を持つマップの定数を定義
    var FloatMapVar : [string]float = map{"C" => 5.0, "D" => 10.0}

    OnBegin<override>()<suspends> : void =
        Print("[DetaType sample (Map)]")

        # マップの要素に含まれる値をログに出力
        # for式により、要素の数だけループする
        for (Elem : IntMapVar):
            Print("IntMapVar : {Elem}")
        for (Elem : FloatMapVar):
            Print("FloatMapVar: {Elem}")
        
        # マップIntMapVarの要素数をログに出力
        Print("IntMapVar Length : {IntMapVar.Length}")

        # 「if:」のブロック内に記述している理由は、失敗と関係する（後述）
        # 「if:」のブロック内に記述しないと、いずれの記述もビルドエラーになる
        if:
            # マップFloatMapVarのキーが"A"の要素を値参照
            FloatMapVarElem : float = FloatMapVar["A"]

            # マップFloatMapVarのキーが"B"の要素に値代入
            set FloatMapVar["B"] = 20.0

