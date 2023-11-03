using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# 独自に定義した列挙型
enum_sample := enum:
    Up
    Down
    Left
    Right

# 独自に定義した列挙型を利用した仕掛け
compound_sample_enum := class(creative_device):
    
    # enum_sample型のフィールドを定義
    @editable
    var EnumVar : enum_sample = enum_sample.Up

    OnBegin<override>()<suspends> : void =
        Print("[Compound sample (Enum)]")

        # case式を利用し、EnumVarの値により条件分岐
        case (EnumVar):
            enum_sample.Up =>
                Print("Case : Up")
            enum_sample.Down =>
                Print("Case : Down")
            enum_sample.Left =>
                Print("Case : Left")
            enum_sample.Right =>
                Print("Case : Right")