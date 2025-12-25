package org.zaohu.modules.article.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import org.zaohu.common.conditionalAssembler.ConditionalAssembler;
import org.zaohu.modules.article.entity.Article;
import org.zaohu.modules.article.entity.vo.ArticleVO;
import org.zaohu.modules.article.mapper.ArticleMapper;
import org.zaohu.modules.article.service.ArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.zaohu.modules.mood.entity.Mood;
import org.zaohu.modules.mood.mapper.MoodMapper;
import org.zaohu.modules.type.entity.Type;
import org.zaohu.modules.type.mapper.TypeMapper;
import org.zaohu.modules.weather.entity.Weather;
import org.zaohu.modules.weather.mapper.WeatherMapper;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 文章表 服务实现类
 * </p>
 *
 * @author tiehanrouqing
 * @since 2025-11-26 16:59:59
 */
@Service
@RequiredArgsConstructor
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {

    private final ArticleMapper articleMapper;
    private final MoodMapper moodMapper;
    private final TypeMapper typeMapper;
    private final WeatherMapper weatherMapper;

    @Override
    public List<Article> getDairy(Article article) {
        //这里要从es中查询 目前先再mysql中查询
        LambdaQueryWrapper<Article> articleLqWrapper = ConditionalAssembler.AssemblyConditions(article);
        List<Article> articles = articleMapper.selectList(articleLqWrapper);
        //TODO 这里先把这几个查出来 后面是否可以直接先提前查出来放入redis，更新时候也一起更新redis？
        HashSet<Integer> moodIds = new HashSet<>();
        HashSet<Integer> typeIds = new HashSet<>();
        HashSet<Integer> weatherIds = new HashSet<>();
        for (Article item : articles) {
            moodIds.add(item.getMoodId());
            typeIds.add(item.getTypeId());
            weatherIds.add(item.getWeatherId());
        }
        List<Mood> moods = moodMapper.selectByIds(moodIds);
        Map<Integer, String> moodMap = moods.stream()
                .collect(Collectors.toMap(
                        Mood::getId,
                        Mood::getName,
                        (oldValue, newValue) -> oldValue
                ));
        List<Type> types = typeMapper.selectByIds(typeIds);
        Map<Integer, String> typeMap = types.stream()
                .collect(Collectors.toMap(
                        Type::getId,
                        Type::getName,
                        (oldValue, newValue) -> oldValue
                ));
        List<Weather> weathers = weatherMapper.selectByIds(weatherIds);
        Map<Integer, String> weathersMap = weathers.stream()
                .collect(Collectors.toMap(
                        Weather::getId,
                        Weather::getLabel,
                        (oldValue, newValue) -> oldValue
                ));
        for (Article item : articles) {
            item.setMoodName(moodMap.get(item.getMoodId()));
            item.setTypeName(typeMap.get(item.getTypeId()));
            item.setWeatherName(weathersMap.get(item.getWeatherId()));
        }
        return articles;
    }

    @Override
    public Long selectCount(Article article) {
        return articleMapper.selectCount(null);
    }

    @Override
    public void addArticle(ArticleVO articleVO) {
        Integer[] tags = articleVO.getTags();
    }
}
