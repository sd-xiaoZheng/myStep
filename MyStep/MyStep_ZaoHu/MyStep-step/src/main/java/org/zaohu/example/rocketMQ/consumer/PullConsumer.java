package org.zaohu.example.rocketMQ.consumer;

import org.apache.rocketmq.client.consumer.DefaultMQPullConsumer;
import org.apache.rocketmq.client.consumer.PullResult;
import org.apache.rocketmq.client.consumer.store.ReadOffsetType;
import org.apache.rocketmq.client.exception.MQBrokerException;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.common.message.MessageQueue;
import org.apache.rocketmq.remoting.exception.RemotingException;

import java.util.HashSet;
import java.util.Set;

/**
 * 拉模式消费者 (老，该方法已经有了替代，但是还能用)
 */
public class PullConsumer {
    public static void main(String[] args) throws MQClientException {
        DefaultMQPullConsumer PullConsumer = new DefaultMQPullConsumer("pullConsumer");//指定分组
        PullConsumer.setNamesrvAddr("localhost:9876");//告诉他地址
        Set<String> topics = new HashSet<>();

        //指定从哪个topics拉取进行消费
        topics.add("Example");
        topics.add("TopicTest");
        PullConsumer.setRegisterTopics(topics);//去哪几个topic中去拉取

        PullConsumer.start();
        while (true) {//循环一直去拉取
            PullConsumer.getRegisterTopics().forEach(topic -> {
                try {
                    Set<MessageQueue> messageQueues = PullConsumer.fetchSubscribeMessageQueues(topic);
                    messageQueues.forEach(l -> {
                        try {
                            long offset = PullConsumer.getOffsetStore().readOffset(l, ReadOffsetType.READ_FROM_MEMORY);
                            if (offset < 0) {
                                offset = PullConsumer.getOffsetStore().readOffset(l, ReadOffsetType.READ_FROM_STORE);
                            }
                            if (offset < 0) {
                                offset = PullConsumer.maxOffset(l);
                            }
                            if (offset < 0) {
                                offset = 0;//非法偏移量兜底
                            }

                            //去单个messageQueue中去拉取消息，
                            // 第一个参数指定消息队列
                            // 第二个是过滤，这里*不做处理全接受
                            // 第三个是偏移量，在接受消息后需要对偏移量进行维护
                            //      - 拉取消息就要知道这个Queue消费到了哪个节点也就是偏移量 获取偏移量有三种方式，
                            //          - ReadOffsetType.READ_FROM_MEMORY 从内存获取
                            //          - ReadOffsetType.READ_FROM_STORE 从队列获取
                            //          - ReadOffsetType.MEMORY_FIRST_THEN_STORE 先内存再队列获取
                            //          - PullConsumer.maxOffset(l); 获取最大的
                            // 第四个是最大拉取个数
                            PullResult pullResult = PullConsumer.pull(l, "*", offset, 32);
                            System.out.println("消息循环拉去成功" + pullResult);
                            switch (pullResult.getPullStatus()) {
                                case FOUND:
                                    System.out.println("发现了消息");
                                    pullResult.getMsgFoundList().forEach(k -> {
                                        System.out.println("找到了没有消费的消息，并且在此消费掉" + k);
                                    });
                                    //维护偏移量
                                    PullConsumer.updateConsumeOffset(l, pullResult.getNextBeginOffset());
                                    break;
                                case NO_NEW_MSG:
                                    System.out.println("没有消息");
                                    break;
                                case NO_MATCHED_MSG:
                                    System.out.println("没有匹配的消息");
                                    break;
                                case OFFSET_ILLEGAL:
                                    System.out.println("非法的偏移量");
                                    break;
                                default:
                                    break;
                            }
                        } catch (MQClientException e) {
                            throw new RuntimeException(e);
                        } catch (MQBrokerException e) {
                            throw new RuntimeException(e);
                        } catch (RemotingException e) {
                            throw new RuntimeException(e);
                        } catch (InterruptedException e) {
                            throw new RuntimeException(e);
                        }
                    });
                } catch (MQClientException e) {
                    throw new RuntimeException(e);
                }
            });
        }
    }
}
