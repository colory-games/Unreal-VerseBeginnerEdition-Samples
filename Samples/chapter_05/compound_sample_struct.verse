using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }

# 独自に定義した構造体
struct_sample_1 := struct<concrete><computes>:

    @editable
    FloatVar : float = 0.0

    @editable
    IntVar : int = 0

    @editable
    VectorVar : vector3 = vector3{}

    NonEditableVar : float = 0.0

    <# 【ビルドエラーの例】

    # varを記述してはいけない
    var IntVar1 : int = 2

    # 関数は定義できない
    MyFunc() : void =
        Print("Func")

    #>

# 独自に定義した構造体（concrete, computes指定子を付けていない）
struct_sample_2 := struct:
    
    @editable
    FloatVar : float = 0.0

# 独自に定義した構造体を利用した仕掛け
compound_sample_struct := class(creative_device):

    # struct_sample_1型のフィールドを定義（初期値なし）
    @editable
    var StructVar1 : struct_sample_1 = struct_sample_1{}

    # struct_sample_1型のフィールドを定義（初期値あり）
    @editable
    var StructVar2 : struct_sample_1 =
       struct_sample_1{FloatVar := 10.0, IntVar := 10,
                       VectorVar := vector3{X := 1.0, Y := 2.0, Z := 3.0},
                       NonEditableVar := 1.0}

    var StructVar3 : struct_sample_2 = struct_sample_2{}

    <# 【ビルドエラーの例】

    # concrete指定子を付与していない構造体型変数に対しては、editable属性を付けられない
    @editable
    var StructVar4 : struct_sample_2 = struct_sample_2{}

    #>

    OnBegin<override>()<suspends> : void =
        Print("[Compound sample (Struct)]")

        # struct_sample_1型の変数が持つフィールドへの値代入・値参照
        var LocalStructVar : struct_sample_1 = struct_sample_1{}
        set LocalStructVar.FloatVar =
            StructVar1.FloatVar + StructVar2.FloatVar
        set LocalStructVar.IntVar =
            StructVar1.IntVar + StructVar2.IntVar
        set LocalStructVar.VectorVar =
            StructVar1.VectorVar + StructVar2.VectorVar
        Print("LocalStructVar Float : {LocalStructVar.FloatVar}")
        Print("LocalStructVar Int : {LocalStructVar.IntVar}")
        Print("LocalStructVar Vector : {LocalStructVar.VectorVar}")

        <# 【ビルドエラーの例】

        # computes指定子を付与していない構造体型変数のフィールドには、値を代入できない
        set StructVar3.FloatVar = 1.0

        #>