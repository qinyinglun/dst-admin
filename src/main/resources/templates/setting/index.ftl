<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <#import "../system/user/spring.ftl" as spring>
    <title><@spring.message code="setting.config.title"/></title>
    <#include "../common/header.ftl"/>
</head>
<body>

<div id="setting_index_app">
    <div style="width: 20%;float:left;" v-if="labelPosition === 'left'">
        <el-card>
            <div style="height: 500px">
                <el-steps direction="vertical" :active="active">
                    <el-step title="<@spring.message code="setting.room.basic.title"/>"></el-step>
                    <el-step title="<@spring.message code="setting.ground.world.title"/>"></el-step>
                    <el-step title="<@spring.message code="setting.cave.world.title"/>"></el-step>
                    <el-step title="MOD <@spring.message code="setting.word"/>"></el-step>
                    <el-step title="<@spring.message code="setting.success"/>"></el-step>
                </el-steps>
            </div>
        </el-card>
    </div>
    <div  :style="labelPosition === 'left'? 'width: 78%;float:left;':'width:100%'">
        <el-row>
            <el-col :style="labelPosition === 'left'? 'margin-left: 10px':''" >
                <el-card v-if="active ===0">
                    <div slot="header" class="clearfix">
                        <span><@spring.message code="setting.room.basic.title"/></span>
                    </div>
                    <el-form :size="size" :model="model" ref="form1" label-width="<#if lang == 'zh'>100px<#else >150px</#if>" :label-position="labelPosition">
                        <el-row>
                            <el-col :span="<#if lang == 'zh'>15<#else >18</#if>">
                                <el-form-item prop="region" label="<@spring.message code="setting.room.server.style"/>">
                                    <el-radio-group v-model="model.clusterIntention">
                                        <el-radio-button label="social"><@spring.message code="setting.room.server.style.social"/></el-radio-button>
                                    </el-radio-group>
                                    <el-radio-group v-model="model.clusterIntention">
                                        <el-radio-button label="cooperative"><@spring.message code="setting.room.server.style.cooperative"/></el-radio-button>
                                    </el-radio-group>
                                    <el-radio-group v-model="model.clusterIntention">
                                        <el-radio-button label="competitive"><@spring.message code="setting.room.server.style.competitive"/></el-radio-button>
                                    </el-radio-group>
                                    <el-radio-group v-model="model.clusterIntention">
                                        <el-radio-button label="madness"><@spring.message code="setting.room.server.style.madness"/></el-radio-button>
                                    </el-radio-group>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="clusterName" label="<@spring.message code="setting.room.name"/>"
                                              :rules="[{ required: true, message: '<@spring.message code="tips.setting.room"/>', trigger: 'blur' }]">
                                    <el-input v-model="model.clusterName" placeholder="<@spring.message code="tips.setting.room"/>" clearable
                                              maxlength="100"
                                              show-word-limit></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="email" label="<@spring.message code="setting.room.description"/>">
                                    <el-input v-model="model.clusterDescription" clearable maxlength="200" show-word-limit
                                              type="textarea" :rows="4"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="region" label="<@spring.message code="setting.game.mode"/>">
                                    <el-radio-group v-model="model.gameMode">
                                        <el-radio-button label="survival"><@spring.message code="setting.game.mode.survival"/></el-radio-button>
                                        <el-radio-button label="wilderness"><@spring.message code="setting.game.mode.wilderness"/></el-radio-button>
                                        <el-radio-button label="endless"><@spring.message code="setting.game.mode.endless"/></el-radio-button>
                                    </el-radio-group>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="ss" label="PVP">
                                    <el-switch v-model="model.pvp" active-text="<@spring.message code="home.pane1.card1.dst.active.on"/>" inactive-text="<@spring.message code="home.pane1.card1.dst.active.off"/>"></el-switch>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="slider" label="<@spring.message code="setting.game.max.players"/>">
                                    <el-slider v-model="model.maxPlayers" :min="1" :max="max" :show-input="labelPosition === 'left'"></el-slider>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="email"  label="<@spring.message code="setting.game.password"/>">
                                    <el-input v-model="model.clusterPassword" clearable maxlength="20"
                                              show-word-limit></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="token" label="<@spring.message code="setting.token.name"/>"
                                              :rules="[{ required: true, message: '<@spring.message code="tips.setting.input"/> <@spring.message code="setting.token.name"/>', trigger: 'blur' }]">
                                    <el-input v-model="model.token" placeholder="<@spring.message code="tips.setting.input"/> <@spring.message code="setting.account.token"/>" :rows="3" clearable
                                              maxlength="100" show-word-limit
                                              type="textarea"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>


                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="slider" label="<@spring.message code="setting.game.max_snapshots"/>">
                                    <el-slider v-model="model.max_snapshots" :min="6" :max="max" :show-input="labelPosition === 'left'"></el-slider>
                                </el-form-item>
                            </el-col>
                        </el-row>


                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="slider" label="<@spring.message code="setting.game.whitelist_slots"/>">
                                    <el-slider v-model="model.whitelist_slots" :min="0" :max="max" :show-input="labelPosition === 'left'"></el-slider>
                                </el-form-item>
                            </el-col>
                        </el-row>


                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="slider" label="<@spring.message code="setting.game.tick_rate"/>">
                                    <el-slider v-model="model.tick_rate" :min="15" :step="15" :max="60" :show-input="labelPosition === 'left'"></el-slider>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="ss" label="<@spring.message code="setting.game.pause_when_empty"/>">
                                    <el-switch v-model="model.pause_when_empty" active-text="<@spring.message code="home.pane1.card1.dst.active.on"/>" inactive-text="<@spring.message code="home.pane1.card1.dst.active.off"/>"></el-switch>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="ss" label="<@spring.message code="setting.game.vote_enabled"/>">
                                    <el-switch v-model="model.vote_enabled" active-text="<@spring.message code="home.pane1.card1.dst.active.on"/>" inactive-text="<@spring.message code="home.pane1.card1.dst.active.off"/>"></el-switch>
                                </el-form-item>
                            </el-col>
                        </el-row>




                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="email"  label="<@spring.message code="setting.game.steam_group_id"/>">
                                    <el-input v-model="model.steam_group_id" clearable maxlength="20"
                                              show-word-limit></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>

                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="ss" label="<@spring.message code="setting.game.steam_group_only"/>">
                                    <el-switch v-model="model.steam_group_only" active-text="<@spring.message code="home.pane1.card1.dst.active.on"/>" inactive-text="<@spring.message code="home.pane1.card1.dst.active.off"/>"></el-switch>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="15">
                                <el-form-item prop="ss" label="<@spring.message code="setting.game.steam_group_admins"/>">
                                    <el-switch v-model="model.steam_group_admins" active-text="<@spring.message code="home.pane1.card1.dst.active.on"/>" inactive-text="<@spring.message code="home.pane1.card1.dst.active.off"/>"></el-switch>
                                </el-form-item>
                            </el-col>
                        </el-row>
                    </el-form>

                    <el-button :size="size" @click="drawer = true" type="primary" style="margin-left: 16px;">
                        <@spring.message code="setting.example"/>
                    </el-button>
                </el-card>

                <el-card v-if="active ===1" style="height: 500px;">
                    <div slot="header" class="clearfix">
                        <span><@spring.message code="setting.ground.world.title"/></span>
                    </div>
                    <el-form :size="size" :model="model" ref="form2" label-width="130px" :label-position="labelPosition">
                        <el-form-item label="<@spring.message code="setting.ground.title"/>">
                            <el-input type="textarea" placeholder="<@spring.message code="tips.setting.input"/> <@spring.message code="setting.ground.title"/>" :rows="15"
                                      v-model="model.masterMapData"></el-input>
                        </el-form-item>
                    </el-form>
                    <el-button :size="size" @click="drawer = true" type="primary" style="margin-left: 16px;">
                        <@spring.message code="setting.example"/>
                    </el-button>
                </el-card>

                <el-card v-if="active ===2" style="height: 500px;">
                    <div slot="header" class="clearfix">
                        <span><@spring.message code="setting.cave.world.title"/></span>
                    </div>
                    <el-form :size="size" :model="model" ref="form3" label-width="130px" :label-position="labelPosition">
                        <el-form-item label="<@spring.message code="setting.cave.title"/>">
                            <el-input type="textarea" :rows="15" v-model="model.cavesMapData"></el-input>
                        </el-form-item>
                    </el-form>
                    <el-button :size="size" @click="drawer = true" type="primary" style="margin-left: 16px;">
                        <@spring.message code="setting.example"/>
                    </el-button>
                </el-card>

                <el-card v-if="active ===3" style="height: 500px;">
                    <div slot="header" class="clearfix">
                        <span>MOD <@spring.message code="setting.word"/></span>
                    </div>
                    <el-form :size="size" :model="model" ref="form4" label-width="130px" :label-position="labelPosition">
                        <el-form-item prop="ss" label="MOD <@spring.message code="setting.word"/>">
                            <el-input type="textarea" :rows="15" v-model="model.modData"></el-input>
                        </el-form-item>
                    </el-form>
                    <el-button :size="size" @click="drawer = true" type="primary" style="margin-left: 16px;">
                        <@spring.message code="setting.example"/>
                    </el-button>
                </el-card>

                <el-drawer title="<@spring.message code="setting.example"/>" :visible.sync="drawer" :with-header="false" size="50%">
                    <el-card>
                        <el-row>
                            <el-col>
                                <span><@spring.message code="setting.my"/> Token：{{myToken}}</span>
                                <br/>
                                <el-button :size="size" style="margin: 10px" @click="copy(0)"><@spring.message code="setting.copy"/></el-button>
                            </el-col>
                        </el-row>

                        <el-row>
                            <el-col>
                                <span><@spring.message code="setting.my"/> <@spring.message code="setting.ground.title"/>：return {["desc"]="<@spring.message code="setting.standard.experience"/>......</span>
                                <br/>
                                <el-button :size="size" style="margin: 10px" @click="copy(1)"><@spring.message code="setting.copy"/></el-button>
                            </el-col>
                        </el-row>

                        <el-row>
                            <el-col>
                                <span><@spring.message code="setting.my"/> <@spring.message code="setting.cave.title"/>：return {["desc"]="<@spring.message code="setting.cave.desc"/>......</span>
                                <br/>
                                <el-button :size="size" style="margin: 10px" @click="copy(2)"><@spring.message code="setting.copy"/></el-button>
                            </el-col>
                        </el-row>

                        <el-row>
                            <el-col>
                                <span><@spring.message code="setting.my"/> MOD <@spring.message code="setting.word"/>：return {["workshop-1651623054"]......</span>
                                <br/>
                                <el-button :size="size" style="margin: 10px" @click="copy(3)"><@spring.message code="setting.copy"/></el-button>
                            </el-col>
                        </el-row>
                    </el-card>

                </el-drawer>

                <el-card style="margin-top: 10px; position: sticky; bottom: 0;  z-index: 10;">
                    <el-button :size="size" v-show="active != 0" @click="previous()"><@spring.message code="setting.previous"/></el-button>
                    <el-button :size="size" icon="el-icon-refresh-left" v-show="active === 0" @click="clearSetting()" type="warning">
                        <@spring.message code="setting.reset"/>
                    </el-button>
                    <el-button :size="size" v-show="active != 3" type="primary" @click="next(active)"><@spring.message code="setting.next.step"/></el-button>
                    <el-button :size="size" v-show="active == 3" type="primary" @click="save(1)"><@spring.message code="setting.save.settings.only"/></el-button>
                    <el-button :size="size" v-show="active == 3" type="primary" @click="save(2)"><@spring.message code="setting.generate.a.new.game"/></el-button>
                </el-card>
            </el-col>
        </el-row>
    </div>


</div>

</body>

<script>

    new Vue({
        el: '#setting_index_app',
        data: {
            active: 0,
            max: 64,
            drawer: false,
            myToken: 'pds-g^KU_3pCs5TYV^AE/mmOIA7sQWSHX+ZAmtTI5F0gERacZseBlzzsl9VsQ=',
            myMaster: "return {"
                +"    custom_settings_desc = \"\","
                +"    custom_settings_id = \"CUSTOM_小世界资源\","
                +"    custom_settings_name = \"小世界资源\","
                +"    custom_worldgen_desc = \"\","
                +"    custom_worldgen_id = \"CUSTOM_小世界资源\","
                +"    custom_worldgen_name = \"小世界资源\","
                +"    desc = \"标准《饥荒》体验。\","
                +"    hideminimap = false,"
                +"    id = \"SURVIVAL_TOGETHER\","
                +"    location = \"forest\","
                +"    max_playlist_position = 999,"
                +"    min_playlist_position = 0,"
                +"    name = \"标准森林\","
                +"    numrandom_set_pieces = 4,"
                +"    override_level_string = false,"
                +"    overrides = {"
                +"        alternatehunt = \"default\","
                +"        angrybees = \"default\","
                +"        antliontribute = \"default\","
                +"        autumn = \"default\","
                +"        bats_setting = \"default\","
                +"        bearger = \"often\","
                +"        beefalo = \"default\","
                +"        beefaloheat = \"default\","
                +"        beequeen = \"often\","
                +"        bees = \"default\","
                +"        bees_setting = \"default\","
                +"        berrybush = \"uncommon\","
                +"        birds = \"default\","
                +"        boons = \"default\","
                +"        branching = \"never\","
                +"        brightmarecreatures = \"default\","
                +"        bunnymen_setting = \"default\","
                +"        butterfly = \"default\","
                +"        buzzard = \"default\","
                +"        cactus = \"default\","
                +"        carrot = \"uncommon\","
                +"        carrots_regrowth = \"slow\","
                +"        catcoon = \"default\","
                +"        catcoons = \"default\","
                +"        chess = \"default\","
                +"        cookiecutters = \"default\","
                +"        crabking = \"default\","
                +"        day = \"default\","
                +"        deciduousmonster = \"default\","
                +"        deciduoustree_regrowth = \"slow\","
                +"        deerclops = \"often\","
                +"        dragonfly = \"often\","
                +"        dropeverythingondespawn = \"default\","
                +"        evergreen_regrowth = \"slow\","
                +"        extrastartingitems = \"default\","
                +"        fishschools = \"default\","
                +"        flint = \"uncommon\","
                +"        flowers = \"uncommon\","
                +"        flowers_regrowth = \"slow\","
                +"        frograin = \"rare\","
                +"        frogs = \"default\","
                +"        fruitfly = \"default\","
                +"        gnarwail = \"default\","
                +"        goosemoose = \"often\","
                +"        grass = \"uncommon\","
                +"        grassgekkos = \"default\","
                +"        has_ocean = true,"
                +"        hound_mounds = \"default\","
                +"        houndmound = \"default\","
                +"        hounds = \"default\","
                +"        hunt = \"default\","
                +"        keep_disconnected_tiles = true,"
                +"        klaus = \"often\","
                +"        krampus = \"often\","
                +"        layout_mode = \"LinkNodesByKeys\","
                +"        liefs = \"default\","
                +"        lightning = \"default\","
                +"        lightninggoat = \"default\","
                +"        loop = \"never\","
                +"        lureplants = \"default\","
                +"        malbatross = \"default\","
                +"        marshbush = \"uncommon\","
                +"        merm = \"default\","
                +"        merms = \"default\","
                +"        meteorshowers = \"default\","
                +"        meteorspawner = \"default\","
                +"        moles = \"default\","
                +"        moles_setting = \"default\","
                +"        moon_berrybush = \"uncommon\","
                +"        moon_bullkelp = \"uncommon\","
                +"        moon_carrot = \"default\","
                +"        moon_fissure = \"default\","
                +"        moon_fruitdragon = \"default\","
                +"        moon_hotspring = \"default\","
                +"        moon_rock = \"uncommon\","
                +"        moon_sapling = \"uncommon\","
                +"        moon_spider = \"default\","
                +"        moon_spiders = \"default\","
                +"        moon_starfish = \"default\","
                +"        moon_tree = \"uncommon\","
                +"        moon_tree_regrowth = \"slow\","
                +"        mosquitos = \"default\","
                +"        mushroom = \"uncommon\","
                +"        mutated_hounds = \"default\","
                +"        no_joining_islands = true,"
                +"        no_wormholes_to_disconnected_tiles = true,"
                +"        ocean_bullkelp = \"uncommon\","
                +"        ocean_seastack = \"ocean_uncommon\","
                +"        ocean_shoal = \"default\","
                +"        ocean_waterplant = \"ocean_default\","
                +"        ocean_wobsterden = \"default\","
                +"        penguins = \"default\","
                +"        penguins_moon = \"default\","
                +"        perd = \"default\","
                +"        petrification = \"default\","
                +"        pigs = \"default\","
                +"        pigs_setting = \"default\","
                +"        ponds = \"default\","
                +"        prefabswaps_start = \"classic\","
                +"        rabbits = \"default\","
                +"        rabbits_setting = \"default\","
                +"        reeds = \"uncommon\","
                +"        regrowth = \"veryslow\","
                +"        roads = \"default\","
                +"        rock = \"uncommon\","
                +"        rock_ice = \"default\","
                +"        saltstack_regrowth = \"slow\","
                +"        sapling = \"uncommon\","
                +"        season_start = \"default\","
                +"        seasonalstartingitems = \"default\","
                +"        shadowcreatures = \"default\","
                +"        sharks = \"default\","
                +"        spawnprotection = \"default\","
                +"        specialevent = \"winters_feast\","
                +"        spider_warriors = \"default\","
                +"        spiderqueen = \"default\","
                +"        spiders = \"default\","
                +"        spiders_setting = \"default\","
                +"        spring = \"default\","
                +"        squid = \"default\","
                +"        start_location = \"default\","
                +"        summer = \"default\","
                +"        tallbirds = \"default\","
                +"        task_set = \"default\","
                +"        tentacles = \"default\","
                +"        touchstone = \"default\","
                +"        trees = \"uncommon\","
                +"        tumbleweed = \"default\","
                +"        twiggytrees_regrowth = \"slow\","
                +"        walrus = \"default\","
                +"        walrus_setting = \"default\","
                +"        wasps = \"default\","
                +"        weather = \"default\","
                +"        wildfires = \"never\","
                +"        winter = \"default\","
                +"        wobsters = \"default\","
                +"        world_size = \"small\","
                +"        wormhole_prefab = \"wormhole\""
                +"    },"
                +"    random_set_pieces = {"
                +"        \"Sculptures_2\","
                +"        \"Sculptures_3\","
                +"        \"Sculptures_4\","
                +"        \"Sculptures_5\","
                +"        \"Chessy_1\","
                +"        \"Chessy_2\","
                +"        \"Chessy_3\","
                +"        \"Chessy_4\","
                +"        \"Chessy_5\","
                +"        \"Chessy_6\","
                +"        \"Maxwell1\","
                +"        \"Maxwell2\","
                +"        \"Maxwell3\","
                +"        \"Maxwell4\","
                +"        \"Maxwell6\","
                +"        \"Maxwell7\","
                +"        \"Warzone_1\","
                +"        \"Warzone_2\","
                +"        \"Warzone_3\""
                +"    },"
                +"    required_prefabs = {"
                +"        \"multiplayer_portal\""
                +"    },"
                +"    required_setpieces = {"
                +"        \"Sculptures_1\","
                +"        \"Maxwell5\""
                +"    },"
                +"    settings_desc = \"标准《饥荒》体验。\","
                +"    settings_id = \"SURVIVAL_TOGETHER\","
                +"    settings_name = \"标准森林\","
                +"    substitutes = {},"
                +"    version = 4,"
                +"    worldgen_desc = \"标准《饥荒》体验。\","
                +"    worldgen_id = \"SURVIVAL_TOGETHER\","
                +"    worldgen_name = \"标准森林\""
                +"}"
            ,
            myCaves: "return {"
                +"  background_node_range={ 0, 1 },"
                +"  custom_settings_desc=\"\","
                +"  custom_settings_id=\"CUSTOM_小世界\","
                +"  custom_settings_name=\"小世界\","
                +"  custom_worldgen_desc=\"\","
                +"  custom_worldgen_id=\"CUSTOM_小世界\","
                +"  custom_worldgen_name=\"小世界\","
                +"  desc=\"探查洞穴…… 一起！\","
                +"  hideminimap=false,"
                +"  id=\"DST_CAVE\","
                +"  location=\"cave\","
                +"  max_playlist_position=999,"
                +"  min_playlist_position=0,"
                +"  name=\"洞穴\","
                +"  numrandom_set_pieces=0,"
                +"  override_level_string=false,"
                +"  overrides={"
                +"    atriumgate=\"default\","
                +"    banana=\"uncommon\","
                +"    bats=\"default\","
                +"    bats_setting=\"default\","
                +"    beefaloheat=\"default\","
                +"    berrybush=\"uncommon\","
                +"    boons=\"default\","
                +"    branching=\"never\","
                +"    brightmarecreatures=\"default\","
                +"    bunnymen=\"default\","
                +"    bunnymen_setting=\"default\","
                +"    cave_ponds=\"default\","
                +"    cave_spiders=\"default\","
                +"    cavelight=\"default\","
                +"    chess=\"default\","
                +"    day=\"default\","
                +"    dropeverythingondespawn=\"default\","
                +"    dustmoths=\"default\","
                +"    earthquakes=\"default\","
                +"    extrastartingitems=\"default\","
                +"    fern=\"uncommon\","
                +"    fissure=\"default\","
                +"    flint=\"uncommon\","
                +"    flower_cave=\"uncommon\","
                +"    flower_cave_regrowth=\"slow\","
                +"    fruitfly=\"default\","
                +"    grass=\"uncommon\","
                +"    grassgekkos=\"default\","
                +"    krampus=\"often\","
                +"    layout_mode=\"RestrictNodesByKey\","
                +"    lichen=\"uncommon\","
                +"    liefs=\"default\","
                +"    lightflier_flower_regrowth=\"slow\","
                +"    lightfliers=\"default\","
                +"    loop=\"never\","
                +"    marshbush=\"default\","
                +"    merms=\"default\","
                +"    molebats=\"default\","
                +"    moles_setting=\"default\","
                +"    monkey=\"default\","
                +"    monkey_setting=\"default\","
                +"    mushgnome=\"default\","
                +"    mushroom=\"uncommon\","
                +"    mushtree=\"uncommon\","
                +"    mushtree_moon_regrowth=\"slow\","
                +"    mushtree_regrowth=\"slow\","
                +"    nightmarecreatures=\"default\","
                +"    pigs_setting=\"default\","
                +"    prefabswaps_start=\"default\","
                +"    reeds=\"uncommon\","
                +"    regrowth=\"slow\","
                +"    roads=\"never\","
                +"    rock=\"uncommon\","
                +"    rocky=\"default\","
                +"    rocky_setting=\"default\","
                +"    sapling=\"uncommon\","
                +"    season_start=\"default\","
                +"    seasonalstartingitems=\"default\","
                +"    shadowcreatures=\"default\","
                +"    slurper=\"default\","
                +"    slurtles=\"default\","
                +"    slurtles_setting=\"default\","
                +"    snurtles=\"default\","
                +"    spawnprotection=\"default\","
                +"    specialevent=\"winters_feast\","
                +"    spider_dropper=\"default\","
                +"    spider_hider=\"default\","
                +"    spider_spitter=\"default\","
                +"    spider_warriors=\"default\","
                +"    spiderqueen=\"default\","
                +"    spiders=\"default\","
                +"    spiders_setting=\"default\","
                +"    start_location=\"caves\","
                +"    task_set=\"cave_default\","
                +"    tentacles=\"default\","
                +"    toadstool=\"default\","
                +"    touchstone=\"default\","
                +"    trees=\"uncommon\","
                +"    weather=\"default\","
                +"    world_size=\"small\","
                +"    wormattacks=\"default\","
                +"    wormhole_prefab=\"tentacle_pillar\","
                +"    wormlights=\"default\","
                +"    worms=\"default\" "
                +"  },"
                +"  required_prefabs={ \"multiplayer_portal\" },"
                +"  settings_desc=\"探查洞穴…… 一起！\","
                +"  settings_id=\"DST_CAVE\","
                +"  settings_name=\"洞穴\","
                +"  substitutes={  },"
                +"  version=4,"
                +"  worldgen_desc=\"探查洞穴…… 一起！\","
                +"  worldgen_id=\"DST_CAVE\","
                +"  worldgen_name=\"洞穴\" "
                +"}"
            ,
            myMod: "return {"
                +"  [\"workshop-1301033176\"]={ configuration_options={ LANG=\"auto\" }, enabled=true },"
                +"  [\"workshop-1530801499\"]={"
                +"    configuration_options={ Hunger_Cost=2, Ownership=false, Sanity_Cost=1 },"
                +"    enabled=true "
                +"  },"
                +"  [\"workshop-1818688368\"]={ configuration_options={  }, enabled=true },"
                +"  [\"workshop-375859599\"]={"
                +"    configuration_options={"
                +"      divider=5,"
                +"      random_health_value=0,"
                +"      random_range=0,"
                +"      send_unknwon_prefabs=false,"
                +"      show_type=0,"
                +"      unknwon_prefabs=1,"
                +"      use_blacklist=true "
                +"    },"
                +"    enabled=true "
                +"  },"
                +"  [\"workshop-635876729\"]={"
                +"    configuration_options={"
                +"      Invincible_Wall=true,"
                +"      KrampusMustDropSack=0.03,"
                +"      RELEASE_BEES=false,"
                +"      SPRING_BEES=true,"
                +"      afk_enabled=true,"
                +"      afk_time=30,"
                +"      amudiao=true,"
                +"      auto_door=true,"
                +"      auto_stack=true,"
                +"      baodiao=1,"
                +"      beefalo_power=false,"
                +"      chester_hutch=false,"
                +"      clean_custom=\"\","
                +"      clean_level=1,"
                +"      clean_period=10,"
                +"      death_no_diao=true,"
                +"      detect_witherable=1,"
                +"      disable_moontree_regrowth=true,"
                +"      disable_mushtree_regrowth=true,"
                +"      emergency_time=5,"
                +"      force_twiggytree_removal=true,"
                +"      fuel_time=5,"
                +"      give_start_item=true,"
                +"      handmake=20,"
                +"      krampus_sack_ice=true,"
                +"      maprevealer_switch=true,"
                +"      mode=\"random\","
                +"      nice_boat_leak=true,"
                +"      no_bat=false,"
                +"      no_grass_and_diseaseable=true,"
                +"      onlyclose=false,"
                +"      quick_harvest=true,"
                +"      rendiao=2,"
                +"      respawn_atrium=5,"
                +"      respawn_beeqeen=5,"
                +"      respawn_toadstool=5,"
                +"      retrapfix=60,"
                +"      retraprandomx=10,"
                +"      retraprandomy=60,"
                +"      spread_fire=1,"
                +"      zbdiao=true "
                +"    },"
                +"    enabled=true "
                +"  },"
                +"  [\"workshop-666155465\"]={"
                +"    configuration_options={"
                +"      chestB=-1,"
                +"      chestG=-1,"
                +"      chestR=-1,"
                +"      food_estimation=-1,"
                +"      food_order=0,"
                +"      food_style=0,"
                +"      lang=\"auto\","
                +"      show_food_units=-1,"
                +"      show_uses=-1 "
                +"    },"
                +"    enabled=true "
                +"  } "
                +"}"
            ,
            model: {
                clusterIntention: 'social',
                clusterName: undefined,
                clusterDescription: undefined,
                gameMode: 'survival',
                pvp: false,
                maxPlayers: 6,
                clusterPassword: undefined,
                token: undefined,
                masterMapData: undefined,
                cavesMapData: undefined,
                modData: undefined,
                type: 1,

                max_snapshots: 6,
                whitelist_slots: 0,
                tick_rate: 15,
                pause_when_empty: false,
                vote_enabled: false,
                steam_group_only: false,
                steam_group_id: 0,
                steam_group_admins: false ,
            },
            labelPosition:'left',
            size:'medium'
        },
        created() {
            //拉取服务器信息
            this.getConfig();
            this.getLabelPosition()
        },
         mounted(){
         window.onresize = () => {
                this.getLabelPosition()
            }
          },
        methods: {
            getLabelPosition(){
                            let windowWidth = window.innerWidth

            console.log('getLabelPosition',windowWidth)
                if(windowWidth < 768){
                this.labelPosition = 'top'
                this.size= 'mini'
                }
                else {
                this.labelPosition = 'left'
                this.size = 'medium'
                }

            },
            copy(val) {
                let tmpInput = document.createElement('textarea');
                if (val === 0) {
                    tmpInput.value = this.myToken;
                }
                if (val === 1) {
                    tmpInput.value = this.myMaster;
                }
                if (val === 2) {
                    tmpInput.value = this.myCaves;
                }
                if (val === 3) {
                    tmpInput.value = this.myMod;
                }
                document.body.appendChild(tmpInput);
                tmpInput.select();
                document.execCommand("Copy");
                tmpInput.className = 'tmpInput';
                tmpInput.style.display = 'none';
                this.successMessage('复制成功');
            },
            save(type) {
                this.model.type = type;
                post("/setting/saveConfig", this.model).then((data) => {
                    if (data) {
                        this.warningMessage(data.message);
                    } else {
                        this.successMessage("成功");
                        this.active = 0;
                        this.getConfig();
                    }
                })
            },
            getConfig() {
                get("/setting/getConfig").then((data) => {
                    if (data) {
                        this.model = data;
                    }
                })
            },
            clearSetting() {
                let tmp = {
                    clusterIntention: 'social',
                    clusterName: undefined,
                    clusterDescription: undefined,
                    gameMode: 'survival',
                    pvp: false,
                    maxPlayers: 6,
                    clusterPassword: undefined,
                    token: undefined,
                    masterMapData: undefined,
                    cavesMapData: undefined,
                    modData: undefined,
                    type: 1,

                    max_snapshots: 6,
                    whitelist_slots: 0,
                    tick_rate: 15,
                    pause_when_empty: false,
                    vote_enabled: false,
                    steam_group_only: false,
                    steam_group_id: 0,
                    steam_group_admins: false ,
                };
                this.model = tmp;
            },
            next(val) {
                if (val === 0) {
                    //校验基础信息
                    this.$refs['form1'].validate((valid) => {
                        if (valid) {
                            this.active++;
                        } else {
                            return false;
                        }
                    });
                } else {
                    this.active++;
                }

            },
            previous() {
                this.active--;
            },
            successMessage(message) {
                this.$message({
                    message: message,
                    type: 'success'
                });
            },
            warningMessage(message) {
                this.$message({
                    message: message,
                    type: 'warning'
                });
            },
        }
    });


</script>

</html>
