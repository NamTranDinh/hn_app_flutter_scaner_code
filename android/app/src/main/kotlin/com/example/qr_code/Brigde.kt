import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.net.Uri
import com.neil.master_scanner_app.MainActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class BridgeChanel() {

    fun share(ctx: Context, uri: String?) {
        try {
            if(uri!=null){
                val intent = Intent(Intent.ACTION_SEND, Uri.parse(uri))

                (ctx as MainActivity).startActivity(/* intent = */ Intent.createChooser(
                    intent,
                    "Share your QR"
                )
                )
            }
        }catch (e){
            //notifi error
        }
    }
    fun copy(ctx: Context,data:String?){
        val clip = ctx.getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
        clip.setPrimaryClip(ClipData.newPlainText("data",data))
    }
    fun call(ctx: Context,call:MethodCall,result:MethodChannel.Result){
        when(call.method){
            copy->{
                copy(ctx,call.argument(copy))
            }
            share->{
                share(ctx,call.argument(share))
            }
        }
    }
    companion object {
        const val chanel = "BRIDGE"
        const val share = "SHARE"
        const val copy = "COPY"

    }

}