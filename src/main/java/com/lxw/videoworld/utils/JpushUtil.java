package com.lxw.videoworld.utils;


import cn.jiguang.common.ClientConfig;
import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jpush.api.JPushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.audience.AudienceTarget;

public class JpushUtil {


    private static String APP_KEY = "62130099d75fabd759db6baf";
    private static String MASTER_SECRET = "cc047a6c6fc2ec1aa3c43a68";

//    public static String APP_KEY = "5ea65acf72f09d1fa4664a00";
//    public static String MASTER_SECRET = "cb2fe7bb39be10f2be500ab1";

    /**
     * //    JPUSH_APPKEY : "0fe4400f45bc53ce6a2c704a", //JPush上注册的包名对应的appkey.
     * //    JPUSH_CHANNEL: "COMMON_CHANNEL", //用户渠道统计的渠道名称
     */

    public static void sendPush(String... alias) {

        JPushClient client = new JPushClient(MASTER_SECRET, APP_KEY,null, ClientConfig.getInstance());

        PushPayload payload = buildPushObject_all_all_alert();

        try {
            PushResult result = client.sendPush(payload);
            System.out.println("Got result - " + result);


        } catch (APIConnectionException e) {
            // Connection error, should retry later
            System.out.println("Connection error, should retry later");

        } catch (APIRequestException e) {
            System.out.println("Should review the error, and fix the request");
            System.out.println("HTTP Status: " + e.getStatus());
            System.out.println("Error Code: " + e.getErrorCode());
            System.out.println("Error Message: " + e.getErrorMessage());
        }


    }
    public static PushPayload buildPushObject_all_all_alert() {
        return PushPayload.alertAll("hello-world");
    }

    public static PushPayload buildPushObject_ios_audienceMore_messageWithExtras() {
        return PushPayload.newBuilder()
                .setPlatform(Platform.android_ios())
                .setAudience(Audience.newBuilder()
                        .addAudienceTarget(AudienceTarget.tag("tag1", "tag2"))
                        .addAudienceTarget(AudienceTarget.alias("alias1", "alias2"))
                        .build())
                .setMessage(Message.newBuilder()
                        .setMsgContent("hello world")
                        .addExtra("from", "JPush")
                        .build())
                .build();
    }


}
