using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }    # 構造体の利用に必要

detatype_sample_struct := class(creative_device):

    @editable
    VectorVar1 : vector3 = vector3{}          # vector3型のフィールドを定義

    @editable
    VectorVar2 : vector3 = vector3{X:=1.0, Y:=1.0, Z:=1.0}

    @editable
    RotationVar : rotation = rotation{}       # rotation型のフィールドを定義

    @editable
    TransformVar : transform = transform{}    # transform型のフィールドを定義

    OnBegin<override>()<suspends> : void =
        Print("[DetaType sample (Struct)]")

        # 各変数の値をログに出力
        Print("VectorVar1 : {VectorVar1}")
        Print("VectorVar2 : {VectorVar2}")
        Print("RotationVar : {RotationVar}")

        # vector3型の変数が持つフィールドX, Y, Zへの値代入・値参照
        var VectorVarA : vector3 = vector3{}
        set VectorVarA.X = VectorVar2.X * 2.0
        set VectorVarA.Y = VectorVar2.Y * 2.0
        set VectorVarA.Z = 0.0
        Print("VectorVarA : {VectorVarA}")

        # vector3型に関係する関数Distance, Lengthの呼び出し
        V12Distance : float = Distance(VectorVar1, VectorVar2)
        V1Length : float = VectorVar1.Length()

        # rotator型に関係する関数MakeRotation, RotateVectorの呼び出し
        var RotVector : vector3 = vector3{X:=0.0, Y:=1.0, Z:=0.0}
        V2Rotation : rotation =
            MakeRotation(VectorVar2, RadiansToDegrees(30.0))
        set RotVector = V2Rotation.RotateVector(RotVector)
        Print("RotVector : {RotVector}")

        # 引数や戻り値の型が構造体であるメソッドMyFuncの呼び出し
        ReturnVector : vector3 =
            MyFunc(VectorVar1, VectorVar2, RotationVar)
        Print("ReturnVector : {ReturnVector}")

        # transform型の変数が持つフィールドへの値代入・値参照
        var TransformVarA : transform = transform{}
        set TransformVarA.Scale = TransformVar.Scale + VectorVar2
        set TransformVarA.Rotation = RotationVar.RotateBy(V2Rotation)
        set TransformVarA.Translation = VectorVar1 + VectorVar2
        Print("TransformVar (Scale) : {TransformVarA.Scale}")
        Print("TransformVar (Rotation) : {TransformVarA.Rotation}")
        Print("TransformVar (Translation) : {TransformVarA.Translation}")

    # 引数や戻り値の型が構造体であるメソッドMyFuncの定義
    MyFunc(A : vector3, B : vector3, C : rotation) : vector3 =
        LocalVar : vector3 = A + B * 2.0
        return C.RotateVector(LocalVar)
