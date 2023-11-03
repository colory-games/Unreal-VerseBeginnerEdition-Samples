using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# 独自に定義したクラス
class_sample := class<concrete>:
    
    @editable
    var IntVar : int = 10

    @editable
    var FloatVar : float = 1.0

    MyFunc() : void =
        set IntVar = IntVar * 2
        set FloatVar = FloatVar * 2
        Print("Class Func")

# 独自に定義したクラスを利用した仕掛け
compound_sample_class := class(creative_device):

    # class_sample型のフィールドを定義（初期値なし）
    @editable
    ClassVar1 : class_sample = class_sample{}

    # class_sample型のフィールドを定義（初期値あり）
    @editable
    ClassVar2 : class_sample =
        class_sample{IntVar := 20, FloatVar := 10.0}

    OnBegin<override>()<suspends> : void =
        Print("[Compound sample (Class)]")

        # class_sample変数に保存されているインスタンスが持つ、
        # フィールドへの値代入・値参照
        var LocalVar : class_sample = class_sample{}
        set LocalVar.IntVar = ClassVar1.IntVar + ClassVar2.IntVar
        set LocalVar.FloatVar = ClassVar1.FloatVar + ClassVar2.FloatVar
        Print("LocalVar Int : {LocalVar.IntVar}")
        Print("LocalVar Float : {LocalVar.FloatVar}")

        # class_sample型変数に保存されているインスタンスに対する、
        # メソッドの呼び出し
        ClassVar2.MyFunc()
        Print("ClassVar2 Int: {ClassVar2.IntVar}")
        Print("ClassVar2 Float: {ClassVar2.FloatVar}")