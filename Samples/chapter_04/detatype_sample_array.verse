using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }    # 構造体の利用に必要

detatype_sample_array := class(creative_device):

    # int型の要素を持つ配列の定数を定義
    @editable
    IntArrayVar1 : []int = array{}

    # int型の要素を持つ配列のフィールドを定義
    @editable
    var IntArrayVar2 : []int = array{1, 3, 5}

    # vector3型の要素を持つ配列の定数を定義
    @editable
    VectorArrayVar : []vector3 = array{vector3{}, vector3{}}

    OnBegin<override>()<suspends> : void =
        Print("[DetaType sample (Array)]")

        # 配列の要素に含まれる値をログに出力
        # for式により、要素の数だけループする
        for (Elem : IntArrayVar1):
            Print("IntArrayVar1 : {Elem}")
        for (Elem : IntArrayVar2):
            Print("IntArrayVar2 : {Elem}")
        for (Elem : VectorArrayVar):
            Print("VectorArrayVar : {Elem}")

        # 配列IntArrayVar1の要素数をログに出力
        Print("IntArrayVar1 Length : {IntArrayVar1.Length}")

        # 配列IntArrayVarAを定義し、
        # IntArrayVar1の末尾に10,20を追加した配列を代入
        var IntArrayVarA : []int = array{}
        set IntArrayVarA = IntArrayVar1 + array{10, 20}
        for (Elem : IntArrayVarA):
            Print("IntArrayVarA elem : {Elem}")

        # 引数や戻り値の型が配列であるメソッドMyFuncの呼び出し
        ReturnArray : []int = MyFunc(IntArrayVar2, 2)
        for (Elem : ReturnArray):
            Print("ReturnArray : {Elem}")

        # 「if:」のブロック内に記述している理由は、失敗と関係する（後述）
        # 「if:」のブロック内に記述しないと、いずれの記述もビルドエラー
        if:
            # 配列IntArrayVar2の3番目要素を値参照
            IntArrayVar2Elem : int = IntArrayVar2[2]

            # 配列IntArrayVar2の3番目要素に値代入
            set IntArrayVar2[2] = 5

            # 配列に関係する関数RemoveElementの呼び出し
            IntArrayVar1.RemoveElement[2]

    # 引数や戻り値の型が配列であるメソッドMyFuncの定義
    MyFunc(InArray : []int, InInt : int) : []int =
        var LocalArray : []int = array{}
        for(Count := 0..InInt):
            set LocalArray = LocalArray + array{Count}
        return LocalArray
