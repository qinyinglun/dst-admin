package com.tugos.dst.admin;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.json.JSONUtil;
import com.tugos.dst.admin.service.SettingService;
import com.tugos.dst.admin.vo.GameConfigVO;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class test {

    @Test
    public void test() throws Exception {
        SettingService settingService = new SettingService();

        List<String> clusterData = settingService.getClusterData();
        Map<String,Object> valueMap = new HashMap<>();
        clusterData.forEach(s -> {
            if (s.contains("=")){
                String[] split = s.split("=");
                if (StringUtils.isNotBlank(split[1])) {
                    valueMap.put(split[0].trim(), split[1].trim());
                }
            }
        });


        GameConfigVO gameConfigVO = new GameConfigVO();
        BeanUtil.copyProperties(valueMap,gameConfigVO);
        System.out.println(JSONUtil.toJsonStr(gameConfigVO));


    }
}
