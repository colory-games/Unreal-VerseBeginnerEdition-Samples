using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# 独自に定義したインターフェース
interface_sample_1 := interface:

    # インターフェース内にメソッドを定義
    MyFunc1(In1 : float, In2 : float) : void

    <# 【ビルドエラーの例】

    # 関数の処理を記述してはいけない
    MyFunc() : void =
        Print("Error")

    #>

# インターフェースを継承したインタフェースを定義
interface_sample_2 := interface(interface_sample_1):

    # インターフェース内にメソッドを定義
    MyFunc2() : void

# 独自に定義したインターフェースを継承した仕掛け
compound_sample_interface := class(creative_device, interface_sample_2):

    OnBegin<override>()<suspends> : void =
        Print("[Compound sample (Interface)]")

        # インターフェースに定義されたメソッドの利用
        MyFunc1(1.0, 2.0)
        MyFunc2()

    # 親のインターフェースに定義されたメソッドのオーバーライド
    # すべてのメソッドをオーバーライドしないと、ビルドエラーになる
    MyFunc1<override>(In1 : float, In2 : float) : void =
        LocalVar : float = In1 + In2
        Print("MyFunc1 : {LocalVar}")

    MyFunc2<override>() : void =
        Print("MyFunc2")