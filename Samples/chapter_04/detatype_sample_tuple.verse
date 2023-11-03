using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }    # 構造体の利用に必要

detatype_sample_tuple := class(creative_device):

    # int, float型の要素を持つタプルのフィールドを定義
    TupleVar1 : tuple(int, float) = (1, 10.0)

    TupleVar2 : tuple(int, float) = (2, 5.0)

    OnBegin<override>()<suspends> : void =
        Print("[DetaType sample (Tuple)]")

        # タプル型変数TupleVar1, TupleVar2の1, 2番目の要素の値参照
        IntConstA : int = TupleVar1(0) + TupleVar2(0)
        FloatConstA : float = TupleVar1(1) + TupleVar2(1)

        # int, float型の要素を持つタプル型変数TupleVarAを定義し、
        # IntConstA, FloatConstAを代入
        var TupleVarA : tuple(int, float) = (0, 0.0)
        set TupleVarA = (IntConstA, FloatConstA)
        Print("TupleVarA : {TupleVarA(0)}, {TupleVarA(1)}")

        # 引数や戻り値の型がタプルであるメソッドMyFuncの呼び出し
        ReturnTuple :tuple(int, float) = MyFunc(TupleVar1, 10)
        Print("ReturnTuple : {ReturnTuple(0)}, {ReturnTuple(1)}")

        # vector3, float型の要素を持つタプル型変数TupleVarBを定義し、
        # 初期値としてVectorConstB, FloatConstBを代入
        var TupleVarB : tuple(vector3, float) = (vector3{}, 0.0)
        VectorConstB : vector3 = vector3{X:= 1.0, Y := 2.0, Z := 3.0}
        FloatConstB : float = TupleVar1(1) + TupleVar2(1)
        set TupleVarB = (VectorConstB, FloatConstB)

    # 引数や戻り値の型がタプルであるメソッドMyFuncの定義
    MyFunc(In1 : tuple(int, float), In2 : int) : tuple(int, float) =
        var LocalTupleVar : tuple(int, float) = (In1(0) * In2, In1(1))
        return LocalTupleVar

