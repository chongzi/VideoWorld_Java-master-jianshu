package com.lxw.videoworld.service;


import com.lxw.videoworld.utils.JpushUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;

/**
 * 评论 与反馈  websocket  通信
 */
@ServerEndpoint("/feedback")
public class WebSocketController {
//    JPUSH_APPKEY : "0fe4400f45bc53ce6a2c704a", //JPush上注册的包名对应的appkey.
//    JPUSH_CHANNEL: "COMMON_CHANNEL", //用户渠道统计的渠道名称

    public Logger logger = LoggerFactory.getLogger(this.getClass());

    public static Session session;


    @OnOpen
    public void open(Session session) {

        this.session = session;

        logger.debug("-------------open-------------------");
    }

    @OnClose
    public void close() {
        logger.debug("-------------close-------------------");
    }


    @OnMessage
    public void message(Session session, String msg) {


        logger.debug("-------------message-------------------" + msg);

        if (session != null) {
            try {
                session.getBasicRemote().sendText("收到啦，下次有消息我通知你");
                JpushUtil.sendPush("服务器收到你的请求");
            } catch (IOException e) {


                logger.warn("=======发送消息失败=========");
                e.printStackTrace();
            }
        }


    }


    @OnError
    public void error(Session session, Throwable error) {
        logger.debug("-------------error-------------------");
    }


}
