package org.zaohu.example.rocketMQ.producer;

import org.apache.rocketmq.client.exception.MQBrokerException;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.DefaultMQProducer;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.common.message.Message;
import org.apache.rocketmq.remoting.exception.RemotingException;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 批量消息
 * 一批消息最大大小不能超过4M，源码注释不能超过1M 建议保证在1M左右（性能最佳）
 * 相同的Topic 不同的个Topic不能批量发送
 * 批量不能发送延迟和事务消息
 *
 * @author Zaohu
 * @since 2024/11/29
 **/
public class BatchProducer {
    public static void main(String[] args) throws MQBrokerException, RemotingException, InterruptedException, MQClientException {
        DefaultMQProducer syncProducer = new DefaultMQProducer("BatchProducer");
        syncProducer.setNamesrvAddr("127.0.0.1:9876");
        syncProducer.start();
        List<Message> messages = new ArrayList<>();

        for (int i = 0; i < 100000; i++) {
            Message message = new Message("Example", "Tags", (i + "_BatchProducer").getBytes(StandardCharsets.UTF_8));
            messages.add(message);
        }
        ListSplitter listSplitter = new ListSplitter(messages);
        int count = 0;
        while (listSplitter.hasNext()) {
            SendResult sendResult = syncProducer.send(listSplitter.next());
            System.out.println(count++ +"消息发送成功" + sendResult);

        }

        syncProducer.shutdown();
    }

}

class ListSplitter implements Iterator<List<Message>> {
    private static final int SIZE_LIMIT = 1000 * 40;//分割间隔1M 发送大小
    private final List<Message> messages;//待发送消息列表
    private int currentIndex;//当前切割尾位置 游标

    ListSplitter(List<Message> messages) {
        this.messages = messages;
    }

    @Override
    public boolean hasNext() {
        //这里是什么情况下还有吓一条消息，这里配置的是 当前切割位置<待发送消息列表大小
        return currentIndex < messages.size();
    }

    @Override
    public List<Message> next() {
        //切割肯定有两个下标
        //这里是切割尾下标
        int nextIndex = currentIndex;
        int totalSize = 0;//消息一共有多大

        //计算totalSize大小
        for (; nextIndex < messages.size(); nextIndex++) {
            Message message = messages.get(nextIndex);
            int messageSize = message.getBody().length + message.getTopic().length();
            Map<String, String> properties = message.getProperties();//这里计算message中每个属性的大小
            Iterator<Map.Entry<String, String>> iterator = properties.entrySet().iterator();
            while (iterator.hasNext()) {
                messageSize += iterator.next().getKey().length() + iterator.next().getValue().length();//关键
            }
            messageSize += 20;//估计值
            if (messageSize > SIZE_LIMIT) {
                if (nextIndex - currentIndex == 0) {//第一次发送就超出了限制,直接跳过这条消息继续扫描
                    nextIndex++;
                }
                break;
            }
            //如果当前发送列表已经超出了限制，暂停添加消息
            if (messageSize + totalSize > SIZE_LIMIT) {
                break;
            }else {
                totalSize += messageSize;
            }
        }
        List<Message> messages = this.messages.subList(currentIndex, nextIndex);
        currentIndex=nextIndex;
        return messages;
    }
}
