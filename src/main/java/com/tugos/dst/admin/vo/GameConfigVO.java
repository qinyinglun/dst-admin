package com.tugos.dst.admin.vo;


import lombok.Data;

import java.io.Serializable;

/**
 * @author qinming
 * @date 2020-05-17
 * <p> 游戏房间信息vo </p>
 */
@Data
public class GameConfigVO implements Serializable {

    private String clusterIntention;

    private String clusterName;

    private String clusterDescription;

    private String gameMode;

    private Boolean pvp;

    private Integer maxPlayers;

    private String clusterPassword;

    private String token;

    private String masterMapData;

    private String cavesMapData;

    private String modData;
    /**
     * 1 进保存 2 启动新游戏
     */
    private Integer type;


    /**
     * 没人服务器暂停，刷天数必备
     */
    private Boolean pause_when_empty;
    /**
     * 最大快照数，决定了可回滚的天数
     */
    private Integer max_snapshots = 6;

    /**
     * 是否启用投票功能
     */
    private Boolean vote_enabled = Boolean.FALSE;

    /**
     * 最大快照数，决定了可回滚的天数
     */
    private Integer whitelist_slots = 0;

    /**
     * 每秒通信次数，越高游戏体验越好，但是会加大服务器负担
     */
    private Integer tick_rate = 15;



    //群组配置
    /**
     * 只允许某 Steam 组的成员加入
     */
    private Boolean steam_group_only;

    /**
     * 指定某个 Steam 组，填写组 ID
     */
    private String steam_group_id;

    /**
     * 开启后，Steam 组的管理员拥有服务器的管理权限
     */
    private Boolean steam_group_admins;


}
