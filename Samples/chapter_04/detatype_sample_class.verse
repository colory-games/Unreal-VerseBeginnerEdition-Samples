using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

detatype_sample_class_target := class(creative_device):

    @editable
    FloatVar : float = 10.0

    var IntVar : int = 0

    MyFunc(In : int) : int =
        Print("Target IntVar : {IntVar}")
        return IntVar + In

detatype_sample_class := class(creative_device):

    # item_spawner_device型のフィールドを定義
    @editable
    ItemSpawner : item_spawner_device =
        item_spawner_device{}

    # detatype_sample_class_target型のフィールドを定義
    @editable
    TargetDevice : detatype_sample_class_target =
        detatype_sample_class_target{}

    OnBegin<override>()<suspends> : void =
        Print("[DetaType sample (Class)]")

        # 変数ItemSpawnerに保存されているインスタンスに対する、
        # メソッドの呼び出し
        ItemSpawner.SpawnItem()

        # 変数TargetDeviceに保存されているインスタンスが持つ、
        # フィールドへの値代入・値参照
        LocalVarA : float = TargetDevice.FloatVar
        Print("Target FloatVar : {LocalVarA}")
        set TargetDevice.IntVar = 30

        # 変数TargetDeviceに保存されているインスタンスに対する、
        # メソッドの呼び出し
        LocalVarB : int = TargetDevice.MyFunc(20)
        Print("Target Func Return : {LocalVarB}")
        