package org.zaohu.example.rocketMQ.impl;

import org.apache.commons.lang3.StringUtils;
import org.apache.rocketmq.client.producer.LocalTransactionState;
import org.apache.rocketmq.client.producer.TransactionListener;
import org.apache.rocketmq.common.message.Message;
import org.apache.rocketmq.common.message.MessageExt;

/**
 * 本地事务监听器
 * @author Zaohu
 * @since 2024/11/30
 **/
public class TransactionListenerImpl implements TransactionListener {
    @Override
    public LocalTransactionState executeLocalTransaction(Message message, Object o) {
        //本地方法执行

        String tags = message.getTags();
        if (StringUtils.contains( "TagA", tags )) {
            return LocalTransactionState.COMMIT_MESSAGE;
        }
        if (StringUtils.contains( "TagB", tags )) {
            return LocalTransactionState.ROLLBACK_MESSAGE;
        }else {
            return LocalTransactionState.UNKNOW;
        }
    }

    @Override
    public LocalTransactionState checkLocalTransaction(MessageExt messageExt) {
        //本地方法回查

        String tags = messageExt.getTags();
        if (StringUtils.contains( "TagC", tags )) {
            return LocalTransactionState.COMMIT_MESSAGE;
        }
        if (StringUtils.contains( "TagD", tags )) {
            return LocalTransactionState.ROLLBACK_MESSAGE;
        }else {
            return LocalTransactionState.UNKNOW;
        }
    }
}
