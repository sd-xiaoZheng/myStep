package org.zaohu.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.zaohu.utils.entity.Point;
import org.zaohu.utils.text.StringUtils;

import java.math.BigDecimal;
import java.util.Objects;

/**
 * 经纬度相关方法
 */
public class DistanceUtils {

    /**
     * 判断坐标是不是在给定经纬度内
     * 路段
     *
     * @param lon    点的经度
     * @param lat    点的纬度
     * @param lnglat 给定多边形坐标点集合
     * @return boolean
     */
    public static boolean insideLine(Double lon, Double lat, String lnglat, Double rangeMeter) {
        boolean inside = false;

        if (StringUtils.isNotEmpty(lnglat)) {
            JSONArray array = JSONArray.parseArray(lnglat);
            if (array.size() > 0) {
                String area = "";
                for (int j = 0; j < array.size(); j++) {
                    JSONObject json = JSON.parseObject(array.get(j).toString());
                    area += j > 0 ? ";" : "";
                    area += json.getString("lng") + "," + json.getString("lat");
                }
                double distance = DistanceUtils.getDistance(lon, lat, area);
                rangeMeter = Objects.nonNull(rangeMeter) ? 20d : rangeMeter;
                inside = distance < rangeMeter;
            }
        }
        return inside;
    }

    /**
     * 判断坐标是不是在给定多边形内
     * 路段
     *
     * @param lon    点的经度
     * @param lat    点的纬度
     * @param lnglat 给定多边形坐标点集合
     * @return boolean
     */
    public static boolean insideLine(Double lon, Double lat, String lnglat) {
        return insideLine(lon, lat, lnglat, 20d);
    }

    /**
     * 判断坐标是不是在给定多边形内
     * 多边形
     *
     * @param lon    点的经度
     * @param lat    点的纬度
     * @param lnglat 给定多边形坐标点集合
     * @return boolean
     */
    public static boolean insidePolygon(Double lon, Double lat, String lnglat) {
        boolean inside = false;
        if (StringUtils.isNotEmpty(lnglat)) {
            JSONArray array = JSONArray.parseArray(lnglat);
            if (array.size() > 0) {
                String area = "";
                for (int j = 0; j < array.size(); j++) {
                    JSONObject json = JSON.parseObject(array.get(j).toString());
                    area += j > 0 ? ";" : "";
                    area += json.getString("lng") + "," + json.getString("lat");
                }
                inside = DistanceUtils.isPtInPoly(lon, lat, area);
            }
        }
        return inside;
    }

    /**
     * 判断坐标是不是在给定多边形内
     * 矩形
     *
     * @param lon    点的经度
     * @param lat    点的纬度
     * @param lnglat 给定多边形坐标点集合
     * @return boolean
     */
    public static boolean insideRectangle(Double lon, Double lat, String lnglat) {
        boolean inside = false;
        if (StringUtils.isNotEmpty(lnglat)) {
            JSONObject jsonObject = JSON.parseObject(lnglat);
            JSONArray array = new JSONArray();
            JSONObject Lq = jsonObject.getJSONObject("Lq");
            JSONObject kq = jsonObject.getJSONObject("kq");
            JSONObject a = new JSONObject();
            a.put("lng", Lq.getDouble("lng"));
            a.put("lat", kq.getDouble("lat"));
            JSONObject b = new JSONObject();
            b.put("lng", kq.getDouble("lng"));
            b.put("lat", Lq.getDouble("lat"));
            array.add(Lq);
            array.add(a);
            array.add(kq);
            array.add(b);
            if (array.size() > 0) {
                String area = "";
                for (int j = 0; j < array.size(); j++) {
                    JSONObject json = JSON.parseObject(array.get(j).toString());
                    area += j > 0 ? ";" : "";
                    area += json.getString("lng") + "," + json.getString("lat");
                }
                inside = DistanceUtils.isPtInPoly(lon, lat, area);
            }
        }
        return inside;
    }

    /**
     * 判断坐标是不是在给定多边形内
     * 圆
     *
     * @param lon    点的经度
     * @param lat    点的纬度
     * @param radius 圆的半径
     * @return boolean
     */
    public static boolean insideCircle(Double lon, Double lat, Double radiusLon, Double radiusLat, Double radius) {
        boolean inside = false;
        if (Objects.nonNull(lat) && Objects.nonNull(lon) && Objects.nonNull(radius)) {
            Long distance = DistanceUtils.measureDistance(radiusLon, radiusLat, lon, lat);
            if (Objects.nonNull(distance)) {
                inside = distance < radius;
            }
        }
        return inside;
    }

    /**
     * 判断点是否在范围内
     *
     * @param ALon
     * @param ALat
     * @param area
     * @return
     */
    public static boolean isPtInPoly(double ALon, double ALat, String area) {
        String[] location = area.trim().split(";");
        Point[] ps = new Point[location.length];
        for (int i = 0; i < location.length; i++) {
            Point aPoints = new Point();
            String[] alocation = location[i].split(",");
            aPoints.setX(new BigDecimal(alocation[0]).doubleValue());
            aPoints.setY(new BigDecimal(alocation[1]).doubleValue());
            ps[i] = aPoints;
        }

        int iSum, iCount, iIndex;
        double dLon1 = 0, dLon2 = 0, dLat1 = 0, dLat2 = 0, dLon;
        if (ps.length < 3) {
            return false;
        }
        iSum = 0;
        iCount = ps.length;
        for (iIndex = 0; iIndex < iCount; iIndex++) {
            if (iIndex == iCount - 1) {
                dLon1 = ps[iIndex].getX();
                dLat1 = ps[iIndex].getY();
                dLon2 = ps[0].getX();
                dLat2 = ps[0].getY();
            } else {
                dLon1 = ps[iIndex].getX();
                dLat1 = ps[iIndex].getY();
                dLon2 = ps[iIndex + 1].getX();
                dLat2 = ps[iIndex + 1].getY();
            }
            // 以下语句判断A点是否在边的两端点的水平平行线之间，在则可能有交点，开始判断交点是否在左射线上
            if (((ALat >= dLat1) && (ALat < dLat2)) || ((ALat >= dLat2) && (ALat < dLat1))) {
                if (Math.abs(dLat1 - dLat2) > 0) {
                    //得到 A点向左射线与边的交点的x坐标：
                    dLon = dLon1 - ((dLon1 - dLon2) * (dLat1 - ALat)) / (dLat1 - dLat2);
                    // 如果交点在A点左侧（说明是做射线与 边的交点），则射线与边的全部交点数加一：
                    if (dLon < ALon) {
                        iSum++;
                    }
                }
            }
        }
        if ((iSum % 2) != 0) {
            return true;
        }
        return false;
    }

    /**
     * 判断点距离最近范围边距离
     *
     * @param ALon
     * @param ALat
     * @param area
     * @return
     */
    public static double getDistance(double ALon, double ALat, String area) {
//        Boolean isPtInPolyIn = isPtInPoly(ALon, ALat, area);
//        if (isPtInPolyIn) {
//            return 0.0;
//        } else {
        String[] location = area.trim().split(";");
        Point[] ps = new Point[location.length];
        //注意 最后一个点会和第一个点相同,所以不再进行比较 这里用length-1
        for (int i = 0; i < location.length; i++) {
            Point aPoints = new Point();
            String[] alocation = location[i].split(",");
            aPoints.setX(new BigDecimal(alocation[0]).doubleValue());
            aPoints.setY(new BigDecimal(alocation[1]).doubleValue());
            ps[i] = aPoints;
            System.out.println("围栏第" + (i + 1) + "个点的坐标为{经度X=" + ps[i].getX() + ",纬度Y=" + ps[i].getY());
        }

        Point localPoint = new Point(ALon, ALat);
        System.out.println("车的当前坐标为 经度X=" + localPoint.getX() + ",纬度Y=" + localPoint.getY());
        /*
         * . sqrt((x-x)^2 +(y-y)^2)
         * 计算围栏哪个点 到 车车位置最短
         */
        Point minPoint;
        int index = -1;
        double min = Double.MAX_VALUE;
        double x2 = ALon;
        double y2 = ALat;
        //找到距离最近的点

        for (int i = 0; i < ps.length; i++) {
            Double x = ps[i].getX();
            Double y = ps[i].getY();
            double sqrt = get2PointDis(localPoint, ps[i]);
            if (sqrt <= min) {
                min = sqrt;
                index = i;
            }
            System.out.println("车坐标正在与第" + (i + 1) + "个点进行比较距离,距离为:" + sqrt);
        }
        System.out.println("我们得到最短的距离为:" + min);
        //获取距离最近的点
        if (index != -1) {
            minPoint = ps[index];
            System.out.println("该点为 第" + (index + 1) + "个点,他的经度X=" + minPoint.getX() + ",纬度Y=" + minPoint.getY());
            //找到连接该点的 前后两个点
            Point beforePoint;
            Point afterPoint;
            if (index == ps.length - 1) {
                afterPoint = ps[0];
            } else {
                afterPoint = ps[index + 1];
            }
            if (index == 0) {
                beforePoint = ps[ps.length - 1];
            } else {
                beforePoint = ps[index - 1];
            }
            System.out.println("我们已经找到最近点相连的前一个点,第" + (index) + "个他的坐标经度X=" + beforePoint.getX() + ",纬度Y=" + beforePoint.getY());
            System.out.println("我们已经找到最近点相连的后一个点,第" + (index + 2) + "个他的坐标经度X=" + afterPoint.getX() + ",纬度Y=" + afterPoint.getY());
            /**
             *         计算 车点 到  距离最短点和其前后两点组成的线段 的距离哪个最短
             */
            // 车点1   最近点2  与最近点相连的前一点3
            double a1;// 1 -2 的边长
            double b1;// 2-3 的边长
            double c1;// 3-1 的边长
            // 海伦公式 得到三点围城三角形的面积
            a1 = get2PointDis(localPoint, minPoint);
            b1 = get2PointDis(minPoint, beforePoint);
            c1 = get2PointDis(beforePoint, localPoint);
            System.out.println("通过计算,我们得到第一组三角形他们各边的边长是 { a=" + a1 + "b=" + b1 + "c=" + c1 + "}");
            //****重点  判断三角形是否为锐角三角形
            boolean acuteAngle1 = isAcuteAngle(a1, b1, c1);
            double h1 = a1;//距离 如果是锐角三角形 则高为最短距离,如果是钝角三角形,则最短距离是车到最近点
            if (acuteAngle1) {
                double p1 = (a1 + b1 + c1) / 2;
                System.out.println("我们得到他的边长为:" + (a1 + b1 + c1) + ",他的海伦公式中p=" + p1);
                double S1 = Math.sqrt(p1 * (p1 - a1) * (p1 - b1) * (p1 - c1));
                System.out.println("我们通过海伦公式得到他的面积为:" + S1);
                //求高 也就是距离
                h1 = (2 * S1) / b1;
                System.out.println("该三角形是锐角三角形 以 除车点其余两点 组成的边长为底 高为:" + h1);
            } else {
                System.out.println("该三角形是钝角三角形 以 除车点其余两点 组成的边长为底 高为:" + h1);
            }

            // 车点1   最近点2   与最近点相连的后一点3
            double a2;// 1 -2 的边长
            double b2;// 2-3 的边长
            double c2;// 3-1 的边长

            // 海伦公式 得到三点围城三角形的面积
            a2 = get2PointDis(localPoint, minPoint);
            b2 = get2PointDis(minPoint, afterPoint);
            c2 = get2PointDis(afterPoint, localPoint);
            double h2 = a2;
            boolean acuteAngel2 = isAcuteAngle(a2, b2, c2);
            if (acuteAngel2) {
                System.out.println("通过计算,我们得到第二组三角形他们各边的边长是 { a=" + a2 + "b=" + b2 + "c=" + c2 + "}");
                double p2 = (a2 + b1 + c1) / 2;
                System.out.println("我们得到他的边长为:" + (a1 + b1 + c1) + ",他的海伦公式中p=" + p2);
                double S2 = Math.sqrt(p2 * (p2 - a2) * (p2 - b2) * (p2 - c2));
                System.out.println("我们通过海伦公式得到他的面积为:" + S2);
                //求高 也就是距离
                h2 = (2 * S2) / b1;
                System.out.println("该三角形是锐角三角形 以 除车点其余两点 组成的边长为底 高为:" + h2);
            } else {
                System.out.println("该三角形是钝角三角形 以 除车点其余两点 组成的边长为底 高为:" + h2);
            }
            if ((acuteAngle1 && acuteAngel2) || (!acuteAngle1 && !acuteAngel2)) {
                System.out.println("两个三角形同为锐角,或者同为钝角");
                return h1 < h2 ? h1 : h2;
            } else if (acuteAngle1 && !acuteAngel2) {
                System.out.println("一号三角形为 锐角,二号三角形为钝角,取锐角");
                return h1;
            } else if (!acuteAngle1 && acuteAngel2) {
                System.out.println("一号三角形为钝角,二号三角形为锐角,取锐角");
                return h2;
            }
        }
        return 0;
//        }
    }

    private static double rad(double d) {
        return d * Math.PI / 180.0;
    }

    private static final Double EARTH_RADIUS = 6378.137;

    /**
     * 计算距离
     */
    private static double get2PointDis(Point p1, Point p2) {
        double radLat1 = rad(p1.getY());
        double radLat2 = rad(p2.getY());
        double a = radLat1 - radLat2;
        double b = rad(p1.getX()) - rad(p2.getX());
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2)
                + Math.cos(radLat1) * Math.cos(radLat2)
                * Math.pow(Math.sin(b / 2), 2)));
        s = s * EARTH_RADIUS;
        s = Math.round(s * 10000d) / 10000d;
        s = s * 1000;
        return s;
    }

    /**
     * 判断是否锐角三角形.
     */
    private static boolean isAcuteAngle(double a, double b, double c) {
        return ((a * a + b * b - c * c) >= 0) && ((a * a + c * c - b * b) >= 0);
    }

    /**
     * 计算地球两坐标点之间的距离
     *
     * @param lng1 点1经度
     * @param lat1 点1纬度
     * @param lng2 点2经度
     * @param lat2 点2纬度
     * @return 距离，单位米
     */
    public static Long measureDistance(Double lng1, Double lat1, Double lng2, Double lat2) {
        if (Objects.nonNull(lng1) || Objects.nonNull(lat1) || Objects.nonNull(lng2) || Objects.nonNull(lat2)) {
            return null;
        }
        double EARTH_RADIUS = 6378137;
        long distance = 0;
        double radLatitude1 = lat1 * Math.PI / 180.0;
        double radLatitude2 = lat2 * Math.PI / 180.0;
        double a = Math.abs(radLatitude1 - radLatitude2);
        double b = Math.abs(lng1 * Math.PI / 180.0 - lng2 * Math.PI / 180.0);
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2)
                + Math.cos(radLatitude1) * Math.cos(radLatitude2) * Math.pow(Math.sin(b / 2), 2)));
        s = s * EARTH_RADIUS;
        distance = Math.round(s * 10000) / 10000;
        return distance;
    }

    public static void main(String[] args) {
//        String aaa = "[{\"lng\":119.11585,\"lat\":36.72355},{\"lng\":119.11576,\"lat\":36.71874},{\"lng\":119.1422,\"lat\":36.71963},{\"lng\":119.14143,\"lat\":36.72741},{\"lng\":119.14143,\"lat\":36.72741}]";
//        JSONArray array = JSONArray.parseArray(aaa);
//        String lnglat = "";
//        for (int i = 0; i < array.size(); i++) {
//            JSONObject json = JSON.parseObject(array.get(i).toString());
//            lnglat += i > 0 ? ";" : "";
//            lnglat += json.getString("lng") + "," + json.getString("lat");
//        }
//        System.out.println(lnglat);
//
//        boolean a = isPtInPoly(119.12941, 36.7217, lnglat);
//        System.out.println(a);
//
//        double s = getDistance(119.11585, 36.72354, lnglat);
//        System.out.println(s);
//
//        Long aaaa = measureDistance(119.12941, 36.7217, 119.12941, 36.7216);
//        System.out.println(aaaa);

//        boolean inside = false;
//        Double lon = 119.09949;
//        Double lat = 36.73615;
//        String bb = "[{\"lng\":119.10041,\"lat\":36.73611},{\"lng\":119.10118,\"lat\":36.73607},{\"lng\":119.10123,\"lat\":36.73647},{\"lng\":119.09908,\"lat\":36.73643}]";
//        JSONArray array = JSONArray.parseArray(bb);
//        if (array.size() > 0) {
//            String area = "";
//            for (int j = 0; j < array.size(); j++) {
//                JSONObject json = JSON.parseObject(array.get(j).toString());
//                area += j > 0 ? ";" : "";
//                area += json.getString("lng") + "," + json.getString("lat");
//            }
//            inside = DistanceUtils.getDistance(lon, lat, area) < 464;
//        }
//        System.out.println(inside);
//
//        System.out.println(insideLine(lon, lat, bb));

//        String lnglat = "{\"Lq\":{\"lng\":119.21452,\"lat\":36.71529},\"kq\":{\"lng\":119.19298,\"lat\":36.69947}}";
//        System.out.println(insideRectangle(119.207097, 36.708796, lnglat));
    }
}
