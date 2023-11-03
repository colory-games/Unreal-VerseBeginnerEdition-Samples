using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

compound_sample_superclass := class(creative_device):
    
    @editable
    SuperVar : int = 0

    SuperFunc1() : void =
        Print("SuperFunc1 super")

    SuperFunc2() : void =
        Print("SuperFunc2 super")

# クラスcompound_sample_superclassを継承した仕掛け
compound_sample_subclass := class(compound_sample_superclass):

    # スーパークラスに定義されたフィールドのオーバーライド
    @editable
    SuperVar<override> : int = 10

    # compound_sample_superclass型のフィールドを定義
    # スーパークラスのcompound_sample_superclassと、
    # サブクラスのcompound_sample_superclasのインスタンス情報を保存可能
    @editable
    SampleDevice : compound_sample_superclass =
        compound_sample_superclass{}

    OnBegin<override>()<suspends> : void =
        Print("[Compound sample (Subclass)]")

        # スーパークラスに定義されたメソッドの呼び出し
        SuperFunc1()
        SuperFunc2()    # オーバーライドした処理が呼び出される
        
        # クラスを特定したメソッドの呼び出し
        # （スーパークラスに定義されたメソッドSuperFunc2の呼び出し）
        (compound_sample_superclass:)SuperFunc2()

        # compound_sample_superclass型変数に保存されているインスタンスに対する、
        # メソッドの呼び出し
        # 変数に保存されているインスタンスがスーパークラスかサブクラスかにより、
        # 呼び出される処理が異なる
        SampleDevice.SuperFunc2()

    # スーパークラスに定義されたメソッドのオーバーライド
    SuperFunc2<override>() : void =
        (super:)SuperFunc2()
        Print("SuperFunc2 child")