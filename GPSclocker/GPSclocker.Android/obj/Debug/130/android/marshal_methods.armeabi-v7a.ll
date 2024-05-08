; ModuleID = 'obj\Debug\130\android\marshal_methods.armeabi-v7a.ll'
source_filename = "obj\Debug\130\android\marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android"


%struct.MonoImage = type opaque

%struct.MonoClass = type opaque

%struct.MarshalMethodsManagedClass = type {
	i32,; uint32_t token
	%struct.MonoClass*; MonoClass* klass
}

%struct.MarshalMethodName = type {
	i64,; uint64_t id
	i8*; char* name
}

%class._JNIEnv = type opaque

%class._jobject = type {
	i8; uint8_t b
}

%class._jclass = type {
	i8; uint8_t b
}

%class._jstring = type {
	i8; uint8_t b
}

%class._jthrowable = type {
	i8; uint8_t b
}

%class._jarray = type {
	i8; uint8_t b
}

%class._jobjectArray = type {
	i8; uint8_t b
}

%class._jbooleanArray = type {
	i8; uint8_t b
}

%class._jbyteArray = type {
	i8; uint8_t b
}

%class._jcharArray = type {
	i8; uint8_t b
}

%class._jshortArray = type {
	i8; uint8_t b
}

%class._jintArray = type {
	i8; uint8_t b
}

%class._jlongArray = type {
	i8; uint8_t b
}

%class._jfloatArray = type {
	i8; uint8_t b
}

%class._jdoubleArray = type {
	i8; uint8_t b
}

; assembly_image_cache
@assembly_image_cache = local_unnamed_addr global [0 x %struct.MonoImage*] zeroinitializer, align 4
; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = local_unnamed_addr constant [290 x i32] [
	i32 32687329, ; 0: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 85
	i32 34715100, ; 1: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 121
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 7
	i32 57263871, ; 3: Xamarin.Forms.Core.dll => 0x369c6ff => 112
	i32 57967248, ; 4: Xamarin.Android.Support.VersionedParcelable.dll => 0x3748290 => 50
	i32 101534019, ; 5: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 101
	i32 102832730, ; 6: Plugin.SimpleAudioPlayer => 0x6211a5a => 9
	i32 120558881, ; 7: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 101
	i32 134690465, ; 8: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 129
	i32 160529393, ; 9: Xamarin.Android.Arch.Core.Common => 0x9917bf1 => 20
	i32 165246403, ; 10: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 62
	i32 166922606, ; 11: Xamarin.Android.Support.Compat.dll => 0x9f3096e => 31
	i32 182336117, ; 12: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 103
	i32 201930040, ; 13: Xamarin.Android.Arch.Core.Runtime => 0xc093538 => 21
	i32 209399409, ; 14: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 60
	i32 212497893, ; 15: Xamarin.Forms.Maps.Android => 0xcaa75e5 => 115
	i32 230216969, ; 16: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 79
	i32 232815796, ; 17: System.Web.Services => 0xde07cb4 => 142
	i32 261689757, ; 18: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 65
	i32 278686392, ; 19: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 83
	i32 280482487, ; 20: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 77
	i32 318968648, ; 21: Xamarin.AndroidX.Activity.dll => 0x13031348 => 52
	i32 319314094, ; 22: Xamarin.Forms.Maps => 0x130858ae => 116
	i32 321597661, ; 23: System.Numerics => 0x132b30dd => 15
	i32 342366114, ; 24: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 81
	i32 388313361, ; 25: Xamarin.Android.Support.Animated.Vector.Drawable => 0x17253111 => 27
	i32 389971796, ; 26: Xamarin.Android.Support.Core.UI => 0x173e7f54 => 33
	i32 441335492, ; 27: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 64
	i32 442521989, ; 28: Xamarin.Essentials => 0x1a605985 => 111
	i32 450948140, ; 29: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 76
	i32 465846621, ; 30: mscorlib => 0x1bc4415d => 6
	i32 469710990, ; 31: System.dll => 0x1bff388e => 13
	i32 476646585, ; 32: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 77
	i32 486930444, ; 33: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 89
	i32 501000162, ; 34: Prism.dll => 0x1ddca7e2 => 10
	i32 514659665, ; 35: Xamarin.Android.Support.Compat => 0x1ead1551 => 31
	i32 524864063, ; 36: Xamarin.Android.Support.Print => 0x1f48ca3f => 43
	i32 526420162, ; 37: System.Transactions.dll => 0x1f6088c2 => 136
	i32 527452488, ; 38: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 129
	i32 571524804, ; 39: Xamarin.Android.Support.v7.RecyclerView => 0x2210c6c4 => 48
	i32 605376203, ; 40: System.IO.Compression.FileSystem => 0x24154ecb => 140
	i32 627609679, ; 41: Xamarin.AndroidX.CustomView => 0x2568904f => 70
	i32 639843206, ; 42: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 75
	i32 663517072, ; 43: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 108
	i32 666292255, ; 44: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 57
	i32 690569205, ; 45: System.Xml.Linq.dll => 0x29293ff5 => 19
	i32 691348768, ; 46: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 131
	i32 692692150, ; 47: Xamarin.Android.Support.Annotations => 0x2949a4b6 => 28
	i32 700284507, ; 48: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 126
	i32 720511267, ; 49: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 130
	i32 775507847, ; 50: System.IO.Compression => 0x2e394f87 => 139
	i32 801787702, ; 51: Xamarin.Android.Support.Interpolator => 0x2fca4f36 => 40
	i32 809851609, ; 52: System.Drawing.Common.dll => 0x30455ad9 => 138
	i32 843511501, ; 53: Xamarin.AndroidX.Print => 0x3246f6cd => 96
	i32 916714535, ; 54: Xamarin.Android.Support.Print.dll => 0x36a3f427 => 43
	i32 928116545, ; 55: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 121
	i32 955402788, ; 56: Newtonsoft.Json => 0x38f24a24 => 7
	i32 956575887, ; 57: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 130
	i32 967690846, ; 58: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 81
	i32 974778368, ; 59: FormsViewGroup.dll => 0x3a19f000 => 2
	i32 987342438, ; 60: Xamarin.Android.Arch.Lifecycle.LiveData.dll => 0x3ad9a666 => 24
	i32 996170219, ; 61: Plugin.SimpleAudioPlayer.Abstractions => 0x3b6059eb => 8
	i32 998210770, ; 62: GPSclocker.Android.dll => 0x3b7f7cd2 => 0
	i32 1012816738, ; 63: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 100
	i32 1035644815, ; 64: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 56
	i32 1042160112, ; 65: Xamarin.Forms.Platform.dll => 0x3e1e19f0 => 118
	i32 1052210849, ; 66: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 86
	i32 1084122840, ; 67: Xamarin.Kotlin.StdLib => 0x409e66d8 => 128
	i32 1098167829, ; 68: Xamarin.Android.Arch.Lifecycle.ViewModel => 0x4174b615 => 26
	i32 1098259244, ; 69: System => 0x41761b2c => 13
	i32 1175144683, ; 70: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 106
	i32 1178241025, ; 71: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 93
	i32 1204270330, ; 72: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 57
	i32 1264511973, ; 73: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 102
	i32 1267360935, ; 74: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 107
	i32 1275534314, ; 75: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 131
	i32 1292763917, ; 76: Xamarin.Android.Support.CursorAdapter.dll => 0x4d0e030d => 35
	i32 1293217323, ; 77: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 72
	i32 1297413738, ; 78: Xamarin.Android.Arch.Lifecycle.LiveData.Core => 0x4d54f66a => 23
	i32 1354490624, ; 79: Xamarin.Forms.GoogleMaps.dll => 0x50bbe300 => 114
	i32 1364015309, ; 80: System.IO => 0x514d38cd => 143
	i32 1365406463, ; 81: System.ServiceModel.Internals.dll => 0x516272ff => 133
	i32 1371845985, ; 82: Xamarin.Forms.GoogleMaps.Android => 0x51c4b561 => 113
	i32 1376866003, ; 83: Xamarin.AndroidX.SavedState => 0x52114ed3 => 100
	i32 1395857551, ; 84: Xamarin.AndroidX.Media.dll => 0x5333188f => 90
	i32 1406073936, ; 85: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 66
	i32 1445445088, ; 86: Xamarin.Android.Support.Fragment => 0x5627bde0 => 39
	i32 1460219004, ; 87: Xamarin.Forms.Xaml => 0x57092c7c => 119
	i32 1462112819, ; 88: System.IO.Compression.dll => 0x57261233 => 139
	i32 1469204771, ; 89: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 55
	i32 1530663695, ; 90: Xamarin.Forms.Maps.dll => 0x5b3c130f => 116
	i32 1574652163, ; 91: Xamarin.Android.Support.Core.Utils.dll => 0x5ddb4903 => 34
	i32 1582372066, ; 92: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 71
	i32 1587447679, ; 93: Xamarin.Android.Arch.Core.Common.dll => 0x5e9e877f => 20
	i32 1592978981, ; 94: System.Runtime.Serialization.dll => 0x5ef2ee25 => 1
	i32 1622152042, ; 95: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 88
	i32 1624863272, ; 96: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 110
	i32 1626988262, ; 97: Plugin.SimpleAudioPlayer.Abstractions.dll => 0x60f9dee6 => 8
	i32 1635184631, ; 98: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 75
	i32 1636350590, ; 99: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 69
	i32 1639515021, ; 100: System.Net.Http.dll => 0x61b9038d => 14
	i32 1657153582, ; 101: System.Runtime => 0x62c6282e => 17
	i32 1658241508, ; 102: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 104
	i32 1658251792, ; 103: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 120
	i32 1662014763, ; 104: Xamarin.Android.Support.Vector.Drawable => 0x6310552b => 49
	i32 1670060433, ; 105: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 65
	i32 1698840827, ; 106: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 127
	i32 1729485958, ; 107: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 61
	i32 1766324549, ; 108: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 103
	i32 1776026572, ; 109: System.Core.dll => 0x69dc03cc => 12
	i32 1788241197, ; 110: Xamarin.AndroidX.Fragment => 0x6a96652d => 76
	i32 1808609942, ; 111: Xamarin.AndroidX.Loader => 0x6bcd3296 => 88
	i32 1813058853, ; 112: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 128
	i32 1813201214, ; 113: Xamarin.Google.Android.Material => 0x6c13413e => 120
	i32 1818569960, ; 114: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 94
	i32 1849271627, ; 115: Prism.Forms.dll => 0x6e39a54b => 11
	i32 1866717392, ; 116: Xamarin.Android.Support.Interpolator.dll => 0x6f43d8d0 => 40
	i32 1867746548, ; 117: Xamarin.Essentials.dll => 0x6f538cf4 => 111
	i32 1877418711, ; 118: Xamarin.Android.Support.v7.RecyclerView.dll => 0x6fe722d7 => 48
	i32 1878053835, ; 119: Xamarin.Forms.Xaml.dll => 0x6ff0d3cb => 119
	i32 1881862856, ; 120: Xamarin.Forms.Maps.Android.dll => 0x702af2c8 => 115
	i32 1885316902, ; 121: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 58
	i32 1908813208, ; 122: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 123
	i32 1916660109, ; 123: Xamarin.Android.Arch.Lifecycle.ViewModel.dll => 0x723de98d => 26
	i32 1919157823, ; 124: Xamarin.AndroidX.MultiDex.dll => 0x7264063f => 91
	i32 1983156543, ; 125: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 127
	i32 2019465201, ; 126: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 86
	i32 2037417872, ; 127: Xamarin.Android.Support.ViewPager => 0x79708790 => 51
	i32 2044222327, ; 128: Xamarin.Android.Support.Loader => 0x79d85b77 => 41
	i32 2055257422, ; 129: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 82
	i32 2066202781, ; 130: Prism => 0x7b27c09d => 10
	i32 2079903147, ; 131: System.Runtime.dll => 0x7bf8cdab => 17
	i32 2090596640, ; 132: System.Numerics.Vectors => 0x7c9bf920 => 16
	i32 2097448633, ; 133: Xamarin.AndroidX.Legacy.Support.Core.UI => 0x7d0486b9 => 78
	i32 2126786730, ; 134: Xamarin.Forms.Platform.Android => 0x7ec430aa => 117
	i32 2129483829, ; 135: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 122
	i32 2139458754, ; 136: Xamarin.Android.Support.DrawerLayout => 0x7f858cc2 => 38
	i32 2166116741, ; 137: Xamarin.Android.Support.Core.Utils => 0x811c5185 => 34
	i32 2196165013, ; 138: Xamarin.Android.Support.VersionedParcelable => 0x82e6d195 => 50
	i32 2201107256, ; 139: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 132
	i32 2201231467, ; 140: System.Net.Http => 0x8334206b => 14
	i32 2217644978, ; 141: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 106
	i32 2244775296, ; 142: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 89
	i32 2256548716, ; 143: Xamarin.AndroidX.MultiDex => 0x8680336c => 91
	i32 2261435625, ; 144: Xamarin.AndroidX.Legacy.Support.V4.dll => 0x86cac4e9 => 80
	i32 2279755925, ; 145: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 98
	i32 2287417322, ; 146: Plugin.SimpleAudioPlayer.dll => 0x885737ea => 9
	i32 2315684594, ; 147: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 53
	i32 2330457430, ; 148: Xamarin.Android.Support.Core.UI.dll => 0x8ae7f556 => 33
	i32 2330986192, ; 149: Xamarin.Android.Support.SlidingPaneLayout.dll => 0x8af006d0 => 44
	i32 2373288475, ; 150: Xamarin.Android.Support.Fragment.dll => 0x8d75821b => 39
	i32 2403452196, ; 151: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 74
	i32 2409053734, ; 152: Xamarin.AndroidX.Preference.dll => 0x8f973e26 => 95
	i32 2412377539, ; 153: GPSclocker => 0x8fc9f5c3 => 3
	i32 2440966767, ; 154: Xamarin.Android.Support.Loader.dll => 0x917e326f => 41
	i32 2445024337, ; 155: Xamarin.Forms.GoogleMaps.Android.dll => 0x91bc1c51 => 113
	i32 2465532216, ; 156: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 64
	i32 2471841756, ; 157: netstandard.dll => 0x93554fdc => 134
	i32 2475788418, ; 158: Java.Interop.dll => 0x93918882 => 4
	i32 2487632829, ; 159: Xamarin.Android.Support.DocumentFile => 0x944643bd => 37
	i32 2501346920, ; 160: System.Data.DataSetExtensions => 0x95178668 => 137
	i32 2505896520, ; 161: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 85
	i32 2581819634, ; 162: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 107
	i32 2605712449, ; 163: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 132
	i32 2620871830, ; 164: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 69
	i32 2624644809, ; 165: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 73
	i32 2633051222, ; 166: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 83
	i32 2693849962, ; 167: System.IO.dll => 0xa090e36a => 143
	i32 2698266930, ; 168: Xamarin.Android.Arch.Lifecycle.LiveData => 0xa0d44932 => 24
	i32 2701096212, ; 169: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 104
	i32 2710008178, ; 170: GPSclocker.Android => 0xa1877172 => 0
	i32 2732626843, ; 171: Xamarin.AndroidX.Activity => 0xa2e0939b => 52
	i32 2737747696, ; 172: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 55
	i32 2751899777, ; 173: Xamarin.Android.Support.Collections => 0xa406a881 => 30
	i32 2766581644, ; 174: Xamarin.Forms.Core => 0xa4e6af8c => 112
	i32 2770495804, ; 175: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 126
	i32 2778768386, ; 176: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 109
	i32 2779977773, ; 177: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 99
	i32 2788639665, ; 178: Xamarin.Android.Support.LocalBroadcastManager => 0xa63743b1 => 42
	i32 2788775637, ; 179: Xamarin.Android.Support.SwipeRefreshLayout.dll => 0xa63956d5 => 45
	i32 2810250172, ; 180: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 66
	i32 2819470561, ; 181: System.Xml.dll => 0xa80db4e1 => 18
	i32 2821294376, ; 182: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 99
	i32 2847418871, ; 183: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 122
	i32 2853208004, ; 184: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 109
	i32 2855708567, ; 185: Xamarin.AndroidX.Transition => 0xaa36a797 => 105
	i32 2876493027, ; 186: Xamarin.Android.Support.SwipeRefreshLayout => 0xab73cce3 => 45
	i32 2893257763, ; 187: Xamarin.Android.Arch.Core.Runtime.dll => 0xac739c23 => 21
	i32 2903344695, ; 188: System.ComponentModel.Composition => 0xad0d8637 => 141
	i32 2905242038, ; 189: mscorlib.dll => 0xad2a79b6 => 6
	i32 2916838712, ; 190: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 110
	i32 2919462931, ; 191: System.Numerics.Vectors.dll => 0xae037813 => 16
	i32 2921128767, ; 192: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 54
	i32 2921692953, ; 193: Xamarin.Android.Support.CustomView.dll => 0xae257f19 => 36
	i32 2922925221, ; 194: Xamarin.Android.Support.Vector.Drawable.dll => 0xae384ca5 => 49
	i32 2978675010, ; 195: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 72
	i32 2996846495, ; 196: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 84
	i32 3016983068, ; 197: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 102
	i32 3017076677, ; 198: Xamarin.GooglePlayServices.Maps => 0xb3d4efc5 => 124
	i32 3024354802, ; 199: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 79
	i32 3044182254, ; 200: FormsViewGroup => 0xb57288ee => 2
	i32 3056250942, ; 201: Xamarin.Android.Support.AsyncLayoutInflater.dll => 0xb62ab03e => 29
	i32 3057625584, ; 202: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 92
	i32 3058099980, ; 203: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 125
	i32 3068715062, ; 204: Xamarin.Android.Arch.Lifecycle.Common => 0xb6e8e036 => 22
	i32 3111772706, ; 205: System.Runtime.Serialization => 0xb979e222 => 1
	i32 3204380047, ; 206: System.Data.dll => 0xbefef58f => 135
	i32 3204912593, ; 207: Xamarin.Android.Support.AsyncLayoutInflater => 0xbf0715d1 => 29
	i32 3211777861, ; 208: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 71
	i32 3230466174, ; 209: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 123
	i32 3233339011, ; 210: Xamarin.Android.Arch.Lifecycle.LiveData.Core.dll => 0xc0b8d683 => 23
	i32 3247949154, ; 211: Mono.Security => 0xc197c562 => 144
	i32 3258312781, ; 212: Xamarin.AndroidX.CardView => 0xc235e84d => 61
	i32 3267021929, ; 213: Xamarin.AndroidX.AsyncLayoutInflater => 0xc2bacc69 => 59
	i32 3296380511, ; 214: Xamarin.Android.Support.Collections.dll => 0xc47ac65f => 30
	i32 3317135071, ; 215: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 70
	i32 3317144872, ; 216: System.Data => 0xc5b79d28 => 135
	i32 3321585405, ; 217: Xamarin.Android.Support.DocumentFile.dll => 0xc5fb5efd => 37
	i32 3340431453, ; 218: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 58
	i32 3345895724, ; 219: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 97
	i32 3346324047, ; 220: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 93
	i32 3352662376, ; 221: Xamarin.Android.Support.CoordinaterLayout => 0xc7d59168 => 32
	i32 3353484488, ; 222: Xamarin.AndroidX.Legacy.Support.Core.UI.dll => 0xc7e21cc8 => 78
	i32 3357663996, ; 223: Xamarin.Android.Support.CursorAdapter => 0xc821e2fc => 35
	i32 3362522851, ; 224: Xamarin.AndroidX.Core => 0xc86c06e3 => 68
	i32 3366347497, ; 225: Java.Interop => 0xc8a662e9 => 4
	i32 3374999561, ; 226: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 98
	i32 3404865022, ; 227: System.ServiceModel.Internals => 0xcaf21dfe => 133
	i32 3429136800, ; 228: System.Xml => 0xcc6479a0 => 18
	i32 3430777524, ; 229: netstandard => 0xcc7d82b4 => 134
	i32 3439690031, ; 230: Xamarin.Android.Support.Annotations.dll => 0xcd05812f => 28
	i32 3441283291, ; 231: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 73
	i32 3459516321, ; 232: Xamarin.Forms.GoogleMaps => 0xce3407a1 => 114
	i32 3476120550, ; 233: Mono.Android => 0xcf3163e6 => 5
	i32 3486566296, ; 234: System.Transactions => 0xcfd0c798 => 136
	i32 3493954962, ; 235: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 63
	i32 3498942916, ; 236: Xamarin.Android.Support.v7.CardView.dll => 0xd08da1c4 => 47
	i32 3501239056, ; 237: Xamarin.AndroidX.AsyncLayoutInflater.dll => 0xd0b0ab10 => 59
	i32 3509114376, ; 238: System.Xml.Linq => 0xd128d608 => 19
	i32 3536029504, ; 239: Xamarin.Forms.Platform.Android.dll => 0xd2c38740 => 117
	i32 3547625832, ; 240: Xamarin.Android.Support.SlidingPaneLayout => 0xd3747968 => 44
	i32 3567349600, ; 241: System.ComponentModel.Composition.dll => 0xd4a16f60 => 141
	i32 3618140916, ; 242: Xamarin.AndroidX.Preference => 0xd7a872f4 => 95
	i32 3627220390, ; 243: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 96
	i32 3632359727, ; 244: Xamarin.Forms.Platform => 0xd881692f => 118
	i32 3633644679, ; 245: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 54
	i32 3641597786, ; 246: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 82
	i32 3664423555, ; 247: Xamarin.Android.Support.ViewPager.dll => 0xda6aaa83 => 51
	i32 3672681054, ; 248: Mono.Android.dll => 0xdae8aa5e => 5
	i32 3676310014, ; 249: System.Web.Services.dll => 0xdb2009fe => 142
	i32 3678221644, ; 250: Xamarin.Android.Support.v7.AppCompat => 0xdb3d354c => 46
	i32 3681174138, ; 251: Xamarin.Android.Arch.Lifecycle.Common.dll => 0xdb6a427a => 22
	i32 3682565725, ; 252: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 60
	i32 3684561358, ; 253: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 63
	i32 3689375977, ; 254: System.Drawing.Common => 0xdbe768e9 => 138
	i32 3706696989, ; 255: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 67
	i32 3714038699, ; 256: Xamarin.Android.Support.LocalBroadcastManager.dll => 0xdd5fbbab => 42
	i32 3718463572, ; 257: Xamarin.Android.Support.Animated.Vector.Drawable.dll => 0xdda34054 => 27
	i32 3718780102, ; 258: Xamarin.AndroidX.Annotation => 0xdda814c6 => 53
	i32 3724971120, ; 259: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 92
	i32 3758932259, ; 260: Xamarin.AndroidX.Legacy.Support.V4 => 0xe00cc123 => 80
	i32 3776062606, ; 261: Xamarin.Android.Support.DrawerLayout.dll => 0xe112248e => 38
	i32 3786282454, ; 262: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 62
	i32 3822602673, ; 263: Xamarin.AndroidX.Media => 0xe3d849b1 => 90
	i32 3829621856, ; 264: System.Numerics.dll => 0xe4436460 => 15
	i32 3832731800, ; 265: Xamarin.Android.Support.CoordinaterLayout.dll => 0xe472d898 => 32
	i32 3862817207, ; 266: Xamarin.Android.Arch.Lifecycle.Runtime.dll => 0xe63de9b7 => 25
	i32 3874897629, ; 267: Xamarin.Android.Arch.Lifecycle.Runtime => 0xe6f63edd => 25
	i32 3883175360, ; 268: Xamarin.Android.Support.v7.AppCompat.dll => 0xe7748dc0 => 46
	i32 3885922214, ; 269: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 105
	i32 3888767677, ; 270: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 97
	i32 3896760992, ; 271: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 68
	i32 3920810846, ; 272: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 140
	i32 3921031405, ; 273: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 108
	i32 3931092270, ; 274: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 94
	i32 3945713374, ; 275: System.Data.DataSetExtensions.dll => 0xeb2ecede => 137
	i32 3955647286, ; 276: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 56
	i32 3959773229, ; 277: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 84
	i32 3970018735, ; 278: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 125
	i32 4063435586, ; 279: Xamarin.Android.Support.CustomView => 0xf2331b42 => 36
	i32 4085261167, ; 280: Prism.Forms => 0xf380236f => 11
	i32 4101593132, ; 281: Xamarin.AndroidX.Emoji2 => 0xf479582c => 74
	i32 4105002889, ; 282: Mono.Security.dll => 0xf4ad5f89 => 144
	i32 4151237749, ; 283: System.Core => 0xf76edc75 => 12
	i32 4182413190, ; 284: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 87
	i32 4219003402, ; 285: Xamarin.Android.Support.v7.CardView => 0xfb78e20a => 47
	i32 4256097574, ; 286: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 67
	i32 4260708538, ; 287: GPSclocker.dll => 0xfdf540ba => 3
	i32 4278134329, ; 288: Xamarin.GooglePlayServices.Maps.dll => 0xfeff2639 => 124
	i32 4292120959 ; 289: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 87
], align 4
@assembly_image_cache_indices = local_unnamed_addr constant [290 x i32] [
	i32 85, i32 121, i32 7, i32 112, i32 50, i32 101, i32 9, i32 101, ; 0..7
	i32 129, i32 20, i32 62, i32 31, i32 103, i32 21, i32 60, i32 115, ; 8..15
	i32 79, i32 142, i32 65, i32 83, i32 77, i32 52, i32 116, i32 15, ; 16..23
	i32 81, i32 27, i32 33, i32 64, i32 111, i32 76, i32 6, i32 13, ; 24..31
	i32 77, i32 89, i32 10, i32 31, i32 43, i32 136, i32 129, i32 48, ; 32..39
	i32 140, i32 70, i32 75, i32 108, i32 57, i32 19, i32 131, i32 28, ; 40..47
	i32 126, i32 130, i32 139, i32 40, i32 138, i32 96, i32 43, i32 121, ; 48..55
	i32 7, i32 130, i32 81, i32 2, i32 24, i32 8, i32 0, i32 100, ; 56..63
	i32 56, i32 118, i32 86, i32 128, i32 26, i32 13, i32 106, i32 93, ; 64..71
	i32 57, i32 102, i32 107, i32 131, i32 35, i32 72, i32 23, i32 114, ; 72..79
	i32 143, i32 133, i32 113, i32 100, i32 90, i32 66, i32 39, i32 119, ; 80..87
	i32 139, i32 55, i32 116, i32 34, i32 71, i32 20, i32 1, i32 88, ; 88..95
	i32 110, i32 8, i32 75, i32 69, i32 14, i32 17, i32 104, i32 120, ; 96..103
	i32 49, i32 65, i32 127, i32 61, i32 103, i32 12, i32 76, i32 88, ; 104..111
	i32 128, i32 120, i32 94, i32 11, i32 40, i32 111, i32 48, i32 119, ; 112..119
	i32 115, i32 58, i32 123, i32 26, i32 91, i32 127, i32 86, i32 51, ; 120..127
	i32 41, i32 82, i32 10, i32 17, i32 16, i32 78, i32 117, i32 122, ; 128..135
	i32 38, i32 34, i32 50, i32 132, i32 14, i32 106, i32 89, i32 91, ; 136..143
	i32 80, i32 98, i32 9, i32 53, i32 33, i32 44, i32 39, i32 74, ; 144..151
	i32 95, i32 3, i32 41, i32 113, i32 64, i32 134, i32 4, i32 37, ; 152..159
	i32 137, i32 85, i32 107, i32 132, i32 69, i32 73, i32 83, i32 143, ; 160..167
	i32 24, i32 104, i32 0, i32 52, i32 55, i32 30, i32 112, i32 126, ; 168..175
	i32 109, i32 99, i32 42, i32 45, i32 66, i32 18, i32 99, i32 122, ; 176..183
	i32 109, i32 105, i32 45, i32 21, i32 141, i32 6, i32 110, i32 16, ; 184..191
	i32 54, i32 36, i32 49, i32 72, i32 84, i32 102, i32 124, i32 79, ; 192..199
	i32 2, i32 29, i32 92, i32 125, i32 22, i32 1, i32 135, i32 29, ; 200..207
	i32 71, i32 123, i32 23, i32 144, i32 61, i32 59, i32 30, i32 70, ; 208..215
	i32 135, i32 37, i32 58, i32 97, i32 93, i32 32, i32 78, i32 35, ; 216..223
	i32 68, i32 4, i32 98, i32 133, i32 18, i32 134, i32 28, i32 73, ; 224..231
	i32 114, i32 5, i32 136, i32 63, i32 47, i32 59, i32 19, i32 117, ; 232..239
	i32 44, i32 141, i32 95, i32 96, i32 118, i32 54, i32 82, i32 51, ; 240..247
	i32 5, i32 142, i32 46, i32 22, i32 60, i32 63, i32 138, i32 67, ; 248..255
	i32 42, i32 27, i32 53, i32 92, i32 80, i32 38, i32 62, i32 90, ; 256..263
	i32 15, i32 32, i32 25, i32 25, i32 46, i32 105, i32 97, i32 68, ; 264..271
	i32 140, i32 108, i32 94, i32 137, i32 56, i32 84, i32 125, i32 36, ; 272..279
	i32 11, i32 74, i32 144, i32 12, i32 87, i32 47, i32 67, i32 3, ; 280..287
	i32 124, i32 87 ; 288..289
], align 4

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 4; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 4

; Function attributes: "frame-pointer"="all" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn writeonly
define void @xamarin_app_init (void (i32, i32, i32, i8**)* %fn) local_unnamed_addr #0
{
	store void (i32, i32, i32, i8**)* %fn, void (i32, i32, i32, i8**)** @get_function_pointer, align 4
	ret void
}

; Names of classes in which marshal methods reside
@mm_class_names = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 4
@__MarshalMethodName_name.0 = internal constant [1 x i8] c"\00", align 1

; mm_method_names
@mm_method_names = local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	; 0
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		i8* getelementptr inbounds ([1 x i8], [1 x i8]* @__MarshalMethodName_name.0, i32 0, i32 0); name
	}
], align 8; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="all" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="all" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"min_enum_size", i32 4}
!3 = !{!"Xamarin.Android remotes/origin/d17-5 @ a8a26c7b003e2524cc98acb2c2ffc2ddea0f6692"}
!llvm.linker.options = !{}
