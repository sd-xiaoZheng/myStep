package org.zaohu.utils.webBugUtils.webMagic;

import org.springframework.stereotype.Component;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.downloader.HttpClientDownloader;
import us.codecraft.webmagic.processor.PageProcessor;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

/**
 *
 * 利用webmagic 网络爬虫 爬取弱智吧的发言标题示例
 * 现在只爬取发问标题，后期把发问人搞上
 */
@Component
public class WebMagicUtils implements PageProcessor {
    //负责解析页面
    /**
     * @param page 发起请求所获取到的数据 （html）
     */
    @Override
    public void process(Page page) {
        //解析返回的数据page，并且把返回的数据结果放到ResultItems中
        //这里因为class包含多个 而且中间有空格所有解决办法： contains(@class, 'threadlist_title') and contains(@class, 'pull_left') and contains(@class, 'j_th_tit')
        //这里]//div[contains(@class, 'threadlist_title') and contains(@class, 'pull_left') and contains(@class, 'j_th_tit')]/a/text()
        // 意思是 查找div的class包含 threadlist_title pull_left j_th_tit的元素中的a标签中的内容
        List<String> all = page.getHtml()
                .xpath("//div[contains(@class, 'threadlist_title') and contains(@class, 'pull_left') and contains(@class, 'j_th_tit')]/a/text()")
                .all();
        // 保存到ResultItems中
        page.putField("questions", all);
    }

    @Override
    public Site getSite() {
        return Site.me().setRetryTimes(3).setSleepTime(1000);
    }

    public static List<String> executeBug(int pages){
        AtomicReference<List<String>> result = new AtomicReference<>(new ArrayList<>());

        Spider spider = Spider.create(new WebMagicUtils())
                .addUrl("https://tieba.baidu.com/f?kw=%E5%BC%B1%E6%99%BA&ie=utf-8&pn="+pages)
                .setDownloader(new HttpClientDownloader()) // 可根据需要配置下载器
                .addPipeline((resultItems, task) -> {
                    // 将爬取的数据放入 AtomicReference
                    result.set(resultItems.get("questions"));
                })
                .thread(5);
        spider.run();
        return result.get();
    }


    public String executeBug4Test(){
        Spider spider = Spider.create(new WebMagicUtils())
                .addUrl("https://tieba.baidu.com/f?kw=%E5%BC%B1%E6%99%BA&ie=utf-8&pn=0")
                .addUrl("https://tieba.baidu.com/f?kw=%E5%BC%B1%E6%99%BA&ie=utf-8&pn=50")
                .addUrl("https://tieba.baidu.com/f?kw=%E5%BC%B1%E6%99%BA&ie=utf-8&pn=100")
                .addUrl("https://tieba.baidu.com/f?kw=%E5%BC%B1%E6%99%BA&ie=utf-8&pn=150")
                .addUrl("https://tieba.baidu.com/f?kw=%E5%BC%B1%E6%99%BA&ie=utf-8&pn=200")
                .addUrl("https://tieba.baidu.com/f?kw=%E5%BC%B1%E6%99%BA&ie=utf-8&pn=250")
                .thread(5);
        spider.run();
        return "执行完成";
    }
}
