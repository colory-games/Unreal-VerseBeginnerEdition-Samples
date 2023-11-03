using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# 独自に定義したモジュール
module_sample_1 := module:
    
    # モジュール内に関数を定義
    Module1Func1<public>() : void=
        Print("Module1 Func1")

    # public指定子を付けていない関数
    Module1Func2() : void=
        Print("Module1 Func2")

    # モジュール内に定数を定義
    IntConst1<public> : int = 5

    # public指定子を付けていない定数
    IntConst2 : int = 10

module_sample_2 := module:
    
    Module2Func1<public>():void=
        Print("Module2 Func1")

# モジュールmodule_sample_2に定義された関数を利用
using { module_sample_2 }

# 独自に定義したモジュールを利用した仕掛け
compound_sample_module := class(creative_device):

    OnBegin<override>()<suspends> : void =
        Print("[Compound sample (Module)]")

        # モジュールmodule_sample_1に定義された関数・定数の利用
        module_sample_1.Module1Func1()
        var LocalVarA : int = module_sample_1.IntConst1

        # モジュールmodule_sample_2に定義された関数の利用
        Module2Func1()
        module_sample_2.Module2Func1()    # どちらの記述でも同じ処理

        <# 【ビルドエラーの例】
        
        # using式によりモジュールを利用できるようにしていない場合は、
        # 関数や定数などを利用するときにモジュールの指定が必要
        Module1Func1()
        var LocalVarB : int = IntConst1

        # public指定子を付けていない関数や定数などは利用できない
        module_sample_1.Module1Func2()
        var LocalVarC : int = module_sample_1.IntConst2

        #>