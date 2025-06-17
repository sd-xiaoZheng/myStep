package org.zaohu.jobs.schedulJob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.zaohu.jobs.webSocket.WebSocketService;

/**
 * @author Zaohu
 * @since 2024/12/5
 **/
@Component
public class WebSocketScheduling {
    @Autowired
    private WebSocketService webSocketService;

//    @Scheduled
//    public void schedule() {
//
//    }
}
