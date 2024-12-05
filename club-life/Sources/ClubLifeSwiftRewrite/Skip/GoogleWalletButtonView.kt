package club.life.swift.rewrite

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.runtime.Composable
import com.google.wallet.button.WalletButton
import com.google.android.gms.pay.Pay
import com.google.android.gms.pay.PayClient
import androidx.compose.ui.platform.LocalContext
import android.app.Activity
import android.util.Log
import androidx.compose.animation.core.EaseInOutCubic
import androidx.compose.animation.core.tween
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.SolidColor
import androidx.compose.ui.unit.dp
import ir.ehsannarmani.compose_charts.*
import ir.ehsannarmani.compose_charts.models.AnimationMode
import ir.ehsannarmani.compose_charts.models.DrawStyle
import ir.ehsannarmani.compose_charts.models.*
import androidx.compose.runtime.mutableStateOf

//@Composable
//fun GoogleWalletButtonComposable(
//    token: String,
//    walletClient: PayClient,
//    addToGoogleWalletRequestCode: Int
//) {
//    val context = LocalContext.current
//    val activity = context as? Activity
//
//    WalletButton(onClick = {
//        activity?.let {
//            walletClient.savePasses(token, it, addToGoogleWalletRequestCode)
//        } ?: Log.e("GoogleWalletButton", "Context is not an Activity.")
//    })
//}

//@Composable
//fun visitChart() {
//    LineChart(
//        modifier = Modifier.fillMaxSize().padding(horizontal = 22.dp),
//        data = remember {
//            listOf(
//                Line(
//                    label = "Windows",
//                    values = listOf(28.0, 41.0, 5.0, 10.0, 35.0),
//                    color = SolidColor(Color(0xFF23af92)),
//                    firstGradientFillColor = Color(0xFF2BC0A1).copy(alpha = .5f),
//                    secondGradientFillColor = Color.Transparent,
//                    strokeAnimationSpec = tween(2000, easing = EaseInOutCubic),
//                    gradientAnimationDelay = 1000,
//                    drawStyle = DrawStyle.Stroke(width = 2.dp),
//                )
//            )
//        },
//        animationMode = AnimationMode.Together(delayBuilder = {
//            it * 500L
//        }),
//    )
//}
//
//@Composable
//fun pieChart() {
//    var data by remember {
//        mutableStateOf(
//            listOf(
//                Pie(label = "Android", data = 20.0, color = Color.Red, selectedColor = Color.Green),
//                Pie(label = "Windows", data = 45.0, color = Color.Cyan, selectedColor = Color.Blue),
//                Pie(label = "Linux", data = 35.0, color = Color.Gray, selectedColor = Color.Yellow),
//            )
//        )
//    }
//    PieChart(
//        modifier = Modifier.size(200.dp),
//        data = data,
//        onPieClick = {
//            println("${it.label} Clicked")
//            val pieIndex = data.indexOf(it)
//            data = data.mapIndexed { mapIndex, pie -> pie.copy(selected = pieIndex == mapIndex) }
//        },
//        selectedScale = 1.2f,
//        scaleAnimEnterSpec = spring<Float>(
//            dampingRatio = Spring.DampingRatioMediumBouncy,
//            stiffness = Spring.StiffnessLow
//        ),
//        colorAnimEnterSpec = tween(300),
//        colorAnimExitSpec = tween(300),
//        scaleAnimExitSpec = tween(300),
//        spaceDegreeAnimExitSpec = tween(300),
//        style = Pie.Style.Fill
//    )
//}
//
//private fun ERROR.copy(selected: Boolean) {}
