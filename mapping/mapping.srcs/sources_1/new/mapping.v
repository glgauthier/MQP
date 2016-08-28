`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2016 01:14:26 PM
// Design Name: 
// Module Name: mapping
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module mapping(
	input clk,
	input reset,
	input [5:0] db_count,
	input [519:0] rfData
);

	reg [389:0] distances;
	reg [11:0] count;
	reg count_en;

	wire [10:0] step0;
	wire [10:0] step1;
	wire [10:0] step2;
	wire [10:0] step3;
	wire [10:0] step4;
	wire [10:0] step5;
	wire [10:0] step6;
	wire [10:0] step7;
	wire [10:0] step8;
	wire [10:0] step9;
	wire [10:0] step10;
	wire [10:0] step11;
	wire [10:0] step12;
	wire [10:0] step13;
	wire [10:0] step14;
	wire [10:0] step15;
	wire [10:0] step16;
	wire [10:0] step17;
	wire [10:0] step18;
	wire [10:0] step19;
	wire [10:0] step20;
	wire [10:0] step21;
	wire [10:0] step22;
	wire [10:0] step23;
	wire [10:0] step24;
	wire [10:0] step25;
	wire [10:0] step26;
	wire [10:0] step27;
	wire [10:0] step28;
	wire [10:0] step29;
	wire [10:0] step30;
	wire [10:0] step31;
	wire [10:0] step32;
	wire [10:0] step33;
	wire [10:0] step34;
	wire [10:0] step35;
	wire [10:0] step36;
	wire [10:0] step37;
	wire [10:0] step38;
	wire [10:0] step39;
	wire [10:0] step40;
	wire [10:0] step41;
	wire [10:0] step42;
	wire [10:0] step43;
	wire [10:0] step44;
	wire [10:0] step45;
	wire [10:0] step46;
	wire [10:0] step47;
	wire [10:0] step48;
	wire [10:0] step49;
	wire [10:0] step50;
	wire [10:0] step51;
	wire [10:0] step52;
	wire [10:0] step53;
	wire [10:0] step54;
	wire [10:0] step55;
	wire [10:0] step56;
	wire [10:0] step57;
	wire [10:0] step58;
	wire [10:0] step59;
	wire [10:0] step60;
	wire [10:0] step61;
	wire [10:0] step62;
	wire [10:0] step63;
	wire [10:0] step64;
	wire [10:0] step65;
	wire [10:0] step66;
	wire [10:0] step67;
	wire [10:0] step68;
	wire [10:0] step69;
	wire [10:0] step70;
	wire [10:0] step71;
	wire [10:0] step72;
	wire [10:0] step73;
	wire [10:0] step74;
	wire [10:0] step75;
	wire [10:0] step76;
	wire [10:0] step77;
	wire [10:0] step78;
	wire [10:0] step79;
	wire [10:0] step80;
	wire [10:0] step81;
	wire [10:0] step82;
	wire [10:0] step83;
	wire [10:0] step84;
	wire [10:0] step85;
	wire [10:0] step86;
	wire [10:0] step87;
	wire [10:0] step88;
	wire [10:0] step89;
	wire [10:0] step90;
	wire [10:0] step91;
	wire [10:0] step92;
	wire [10:0] step93;
	wire [10:0] step94;
	wire [10:0] step95;
	wire [10:0] step96;
	wire [10:0] step97;
	wire [10:0] step98;
	wire [10:0] step99;
	wire [10:0] step100;
	wire [10:0] step101;
	wire [10:0] step102;
	wire [10:0] step103;
	wire [10:0] step104;
	wire [10:0] step105;
	wire [10:0] step106;
	wire [10:0] step107;
	wire [10:0] step108;
	wire [10:0] step109;
	wire [10:0] step110;
	wire [10:0] step111;
	wire [10:0] step112;
	wire [10:0] step113;
	wire [10:0] step114;
	wire [10:0] step115;
	wire [10:0] step116;
	wire [10:0] step117;
	wire [10:0] step118;
	wire [10:0] step119;
	wire [10:0] step120;
	wire [10:0] step121;
	wire [10:0] step122;
	wire [10:0] step123;
	wire [10:0] step124;
	wire [10:0] step125;
	wire [10:0] step126;
	wire [10:0] step127;
	wire [10:0] step128;
	wire [10:0] step129;
	wire [10:0] step130;
	wire [10:0] step131;
	wire [10:0] step132;
	wire [10:0] step133;
	wire [10:0] step134;
	wire [10:0] step135;
	wire [10:0] step136;
	wire [10:0] step137;
	wire [10:0] step138;
	wire [10:0] step139;
	wire [10:0] step140;
	wire [10:0] step141;
	wire [10:0] step142;
	wire [10:0] step143;
	wire [10:0] step144;
	wire [10:0] step145;
	wire [10:0] step146;
	wire [10:0] step147;
	wire [10:0] step148;
	wire [10:0] step149;
	wire [10:0] step150;
	wire [10:0] step151;
	wire [10:0] step152;
	wire [10:0] step153;
	wire [10:0] step154;
	wire [10:0] step155;
	wire [10:0] step156;
	wire [10:0] step157;
	wire [10:0] step158;
	wire [10:0] step159;
	wire [10:0] step160;
	wire [10:0] step161;
	wire [10:0] step162;
	wire [10:0] step163;
	wire [10:0] step164;
	wire [10:0] step165;
	wire [10:0] step166;
	wire [10:0] step167;
	wire [10:0] step168;
	wire [10:0] step169;
	wire [10:0] step170;
	wire [10:0] step171;
	wire [10:0] step172;
	wire [10:0] step173;
	wire [10:0] step174;
	wire [10:0] step175;
	wire [10:0] step176;
	wire [10:0] step177;
	wire [10:0] step178;
	wire [10:0] step179;
	wire [10:0] step180;
	wire [10:0] step181;
	wire [10:0] step182;
	wire [10:0] step183;
	wire [10:0] step184;
	wire [10:0] step185;
	wire [10:0] step186;
	wire [10:0] step187;
	wire [10:0] step188;
	wire [10:0] step189;
	wire [10:0] step190;
	wire [10:0] step191;
	wire [10:0] step192;
	wire [10:0] step193;
	wire [10:0] step194;
	wire [10:0] step195;
	wire [10:0] step196;
	wire [10:0] step197;
	wire [10:0] step198;
	wire [10:0] step199;
	wire [10:0] step200;
	wire [10:0] step201;
	wire [10:0] step202;
	wire [10:0] step203;
	wire [10:0] step204;
	wire [10:0] step205;
	wire [10:0] step206;
	wire [10:0] step207;
	wire [10:0] step208;
	wire [10:0] step209;
	wire [10:0] step210;
	wire [10:0] step211;
	wire [10:0] step212;
	wire [10:0] step213;
	wire [10:0] step214;
	wire [10:0] step215;
	wire [10:0] step216;
	wire [10:0] step217;
	wire [10:0] step218;
	wire [10:0] step219;
	wire [10:0] step220;
	wire [10:0] step221;
	wire [10:0] step222;
	wire [10:0] step223;
	wire [10:0] step224;
	wire [10:0] step225;
	wire [10:0] step226;
	wire [10:0] step227;
	wire [10:0] step228;
	wire [10:0] step229;
	wire [10:0] step230;
	wire [10:0] step231;
	wire [10:0] step232;
	wire [10:0] step233;
	wire [10:0] step234;
	wire [10:0] step235;
	wire [10:0] step236;
	wire [10:0] step237;
	wire [10:0] step238;
	wire [10:0] step239;
	wire [10:0] step240;
	wire [10:0] step241;
	wire [10:0] step242;
	wire [10:0] step243;
	wire [10:0] step244;
	wire [10:0] step245;
	wire [10:0] step246;
	wire [10:0] step247;
	wire [10:0] step248;
	wire [10:0] step249;
	wire [10:0] step250;
	wire [10:0] step251;
	wire [10:0] step252;
	wire [10:0] step253;
	wire [10:0] step254;
	wire [10:0] step255;

	// one quadrant of angles in radians from 0 to pi/2
	// 10 bit signed floating point (two's comp)
	// data is scaled by a left shift of 8 because of fractional data
	// will >> 8 before CORDIC
	assign step0 = 10'SD0;
	assign step1 = 10'SD2;
	assign step2 = 10'SD3;
	assign step3 = 10'SD5;
	assign step4 = 10'SD6;
	assign step5 = 10'SD8;
	assign step6 = 10'SD9;
	assign step7 = 10'SD11;
	assign step8 = 10'SD13;
	assign step9 = 10'SD14;
	assign step10 = 10'SD16;
	assign step11 = 10'SD17;
	assign step12 = 10'SD19;
	assign step13 = 10'SD20;
	assign step14 = 10'SD22;
	assign step15 = 10'SD24;
	assign step16 = 10'SD25;
	assign step17 = 10'SD27;
	assign step18 = 10'SD28;
	assign step19 = 10'SD30;
	assign step20 = 10'SD31;
	assign step21 = 10'SD33;
	assign step22 = 10'SD35;
	assign step23 = 10'SD36;
	assign step24 = 10'SD38;
	assign step25 = 10'SD39;
	assign step26 = 10'SD41;
	assign step27 = 10'SD42;
	assign step28 = 10'SD44;
	assign step29 = 10'SD46;
	assign step30 = 10'SD47;
	assign step31 = 10'SD49;
	assign step32 = 10'SD50;
	assign step33 = 10'SD52;
	assign step34 = 10'SD53;
	assign step35 = 10'SD55;
	assign step36 = 10'SD57;
	assign step37 = 10'SD58;
	assign step38 = 10'SD60;
	assign step39 = 10'SD61;
	assign step40 = 10'SD63;
	assign step41 = 10'SD64;
	assign step42 = 10'SD66;
	assign step43 = 10'SD68;
	assign step44 = 10'SD69;
	assign step45 = 10'SD71;
	assign step46 = 10'SD72;
	assign step47 = 10'SD74;
	assign step48 = 10'SD75;
	assign step49 = 10'SD77;
	assign step50 = 10'SD79;
	assign step51 = 10'SD80;
	assign step52 = 10'SD82;
	assign step53 = 10'SD83;
	assign step54 = 10'SD85;
	assign step55 = 10'SD86;
	assign step56 = 10'SD88;
	assign step57 = 10'SD90;
	assign step58 = 10'SD91;
	assign step59 = 10'SD93;
	assign step60 = 10'SD94;
	assign step61 = 10'SD96;
	assign step62 = 10'SD97;
	assign step63 = 10'SD99;
	assign step64 = 10'SD101;
	assign step65 = 10'SD102;
	assign step66 = 10'SD104;
	assign step67 = 10'SD105;
	assign step68 = 10'SD107;
	assign step69 = 10'SD108;
	assign step70 = 10'SD110;
	assign step71 = 10'SD112;
	assign step72 = 10'SD113;
	assign step73 = 10'SD115;
	assign step74 = 10'SD116;
	assign step75 = 10'SD118;
	assign step76 = 10'SD119;
	assign step77 = 10'SD121;
	assign step78 = 10'SD123;
	assign step79 = 10'SD124;
	assign step80 = 10'SD126;
	assign step81 = 10'SD127;
	assign step82 = 10'SD129;
	assign step83 = 10'SD130;
	assign step84 = 10'SD132;
	assign step85 = 10'SD134;
	assign step86 = 10'SD135;
	assign step87 = 10'SD137;
	assign step88 = 10'SD138;
	assign step89 = 10'SD140;
	assign step90 = 10'SD141;
	assign step91 = 10'SD143;
	assign step92 = 10'SD145;
	assign step93 = 10'SD146;
	assign step94 = 10'SD148;
	assign step95 = 10'SD149;
	assign step96 = 10'SD151;
	assign step97 = 10'SD152;
	assign step98 = 10'SD154;
	assign step99 = 10'SD156;
	assign step100 = 10'SD157;
	assign step101 = 10'SD159;
	assign step102 = 10'SD160;
	assign step103 = 10'SD162;
	assign step104 = 10'SD163;
	assign step105 = 10'SD165;
	assign step106 = 10'SD167;
	assign step107 = 10'SD168;
	assign step108 = 10'SD170;
	assign step109 = 10'SD171;
	assign step110 = 10'SD173;
	assign step111 = 10'SD174;
	assign step112 = 10'SD176;
	assign step113 = 10'SD178;
	assign step114 = 10'SD179;
	assign step115 = 10'SD181;
	assign step116 = 10'SD182;
	assign step117 = 10'SD184;
	assign step118 = 10'SD185;
	assign step119 = 10'SD187;
	assign step120 = 10'SD188;
	assign step121 = 10'SD190;
	assign step122 = 10'SD192;
	assign step123 = 10'SD193;
	assign step124 = 10'SD195;
	assign step125 = 10'SD196;
	assign step126 = 10'SD198;
	assign step127 = 10'SD199;
	assign step128 = 10'SD201;
	assign step129 = 10'SD203;
	assign step130 = 10'SD204;
	assign step131 = 10'SD206;
	assign step132 = 10'SD207;
	assign step133 = 10'SD209;
	assign step134 = 10'SD210;
	assign step135 = 10'SD212;
	assign step136 = 10'SD214;
	assign step137 = 10'SD215;
	assign step138 = 10'SD217;
	assign step139 = 10'SD218;
	assign step140 = 10'SD220;
	assign step141 = 10'SD221;
	assign step142 = 10'SD223;
	assign step143 = 10'SD225;
	assign step144 = 10'SD226;
	assign step145 = 10'SD228;
	assign step146 = 10'SD229;
	assign step147 = 10'SD231;
	assign step148 = 10'SD232;
	assign step149 = 10'SD234;
	assign step150 = 10'SD236;
	assign step151 = 10'SD237;
	assign step152 = 10'SD239;
	assign step153 = 10'SD240;
	assign step154 = 10'SD242;
	assign step155 = 10'SD243;
	assign step156 = 10'SD245;
	assign step157 = 10'SD247;
	assign step158 = 10'SD248;
	assign step159 = 10'SD250;
	assign step160 = 10'SD251;
	assign step161 = 10'SD253;
	assign step162 = 10'SD254;
	assign step163 = 10'SD256;
	assign step164 = 10'SD258;
	assign step165 = 10'SD259;
	assign step166 = 10'SD261;
	assign step167 = 10'SD262;
	assign step168 = 10'SD264;
	assign step169 = 10'SD265;
	assign step170 = 10'SD267;
	assign step171 = 10'SD269;
	assign step172 = 10'SD270;
	assign step173 = 10'SD272;
	assign step174 = 10'SD273;
	assign step175 = 10'SD275;
	assign step176 = 10'SD276;
	assign step177 = 10'SD278;
	assign step178 = 10'SD280;
	assign step179 = 10'SD281;
	assign step180 = 10'SD283;
	assign step181 = 10'SD284;
	assign step182 = 10'SD286;
	assign step183 = 10'SD287;
	assign step184 = 10'SD289;
	assign step185 = 10'SD291;
	assign step186 = 10'SD292;
	assign step187 = 10'SD294;
	assign step188 = 10'SD295;
	assign step189 = 10'SD297;
	assign step190 = 10'SD298;
	assign step191 = 10'SD300;
	assign step192 = 10'SD302;
	assign step193 = 10'SD303;
	assign step194 = 10'SD305;
	assign step195 = 10'SD306;
	assign step196 = 10'SD308;
	assign step197 = 10'SD309;
	assign step198 = 10'SD311;
	assign step199 = 10'SD313;
	assign step200 = 10'SD314;
	assign step201 = 10'SD316;
	assign step202 = 10'SD317;
	assign step203 = 10'SD319;
	assign step204 = 10'SD320;
	assign step205 = 10'SD322;
	assign step206 = 10'SD324;
	assign step207 = 10'SD325;
	assign step208 = 10'SD327;
	assign step209 = 10'SD328;
	assign step210 = 10'SD330;
	assign step211 = 10'SD331;
	assign step212 = 10'SD333;
	assign step213 = 10'SD335;
	assign step214 = 10'SD336;
	assign step215 = 10'SD338;
	assign step216 = 10'SD339;
	assign step217 = 10'SD341;
	assign step218 = 10'SD342;
	assign step219 = 10'SD344;
	assign step220 = 10'SD346;
	assign step221 = 10'SD347;
	assign step222 = 10'SD349;
	assign step223 = 10'SD350;
	assign step224 = 10'SD352;
	assign step225 = 10'SD353;
	assign step226 = 10'SD355;
	assign step227 = 10'SD357;
	assign step228 = 10'SD358;
	assign step229 = 10'SD360;
	assign step230 = 10'SD361;
	assign step231 = 10'SD363;
	assign step232 = 10'SD364;
	assign step233 = 10'SD366;
	assign step234 = 10'SD368;
	assign step235 = 10'SD369;
	assign step236 = 10'SD371;
	assign step237 = 10'SD372;
	assign step238 = 10'SD374;
	assign step239 = 10'SD375;
	assign step240 = 10'SD377;
	assign step241 = 10'SD379;
	assign step242 = 10'SD380;
	assign step243 = 10'SD382;
	assign step244 = 10'SD383;
	assign step245 = 10'SD385;
	assign step246 = 10'SD386;
	assign step247 = 10'SD388;
	assign step248 = 10'SD390;
	assign step249 = 10'SD391;
	assign step250 = 10'SD393;
	assign step251 = 10'SD394;
	assign step252 = 10'SD396;
	assign step253 = 10'SD397;
	assign step254 = 10'SD399;
	assign step255 = 10'SD401;
	assign step256 = 10'SD402;


	// count_en high when data has been written
	// change db_count to some other flag or change db_count logic in distance_acquisition.v
	always @ (posedge clk, posedge reset)
	begin
		if(reset)
			count_en <= 1'b0;
		else if(db_count > 0)
			count_en <= 1'b1;
		else if(count == 4000)
			count_en <= 1'b0;
	end

	// counts number of clock cycles since data has been written
	always @ (posedge clk, posedge reset)
	begin
		if(reset || count_en == 1'b0)
			count <= 12'b0;	
		else if(count_en)
			count <= count + 1'b1;
	end

	// decodes ragefinder data on first enabled clk cycle
	always @ (posedge clk, posedge reset)
	begin
		if(reset)
			distances <= 390'b0;
		else if(count == 12'h001)
		begin
			distances[5:0] = rfData[7:0] - 6'h30;
			distances[11:6] = rfData[15:8] - 6'h30;
			distances[17:12] = rfData[23:16] - 6'h30;
			distances[23:18] = rfData[31:24] - 6'h30;
			distances[29:24] = rfData[39:32] - 6'h30;
			distances[35:30] = rfData[47:40] - 6'h30;
			distances[41:36] = rfData[55:48] - 6'h30;
			distances[47:42] = rfData[63:56] - 6'h30;
			distances[53:48] = rfData[71:64] - 6'h30;
			distances[59:54] = rfData[79:72] - 6'h30;
			distances[65:60] = rfData[87:80] - 6'h30;
			distances[71:66] = rfData[95:88] - 6'h30;
			distances[77:72] = rfData[103:96] - 6'h30;
			distances[83:78] = rfData[111:104] - 6'h30;
			distances[89:84] = rfData[119:112] - 6'h30;
			distances[95:90] = rfData[127:120] - 6'h30;
			distances[101:96] = rfData[135:128] - 6'h30;
			distances[107:102] = rfData[143:136] - 6'h30;
			distances[113:108] = rfData[151:144] - 6'h30;
			distances[119:114] = rfData[159:152] - 6'h30;
			distances[125:120] = rfData[167:160] - 6'h30;
			distances[131:126] = rfData[175:168] - 6'h30;
			distances[137:132] = rfData[183:176] - 6'h30;
			distances[143:138] = rfData[191:184] - 6'h30;
			distances[149:144] = rfData[199:192] - 6'h30;
			distances[155:150] = rfData[207:200] - 6'h30;
			distances[161:156] = rfData[215:208] - 6'h30;
			distances[167:162] = rfData[223:216] - 6'h30;
			distances[173:168] = rfData[231:224] - 6'h30;
			distances[179:174] = rfData[239:232] - 6'h30;
			distances[185:180] = rfData[247:240] - 6'h30;
			distances[191:186] = rfData[255:248] - 6'h30;
			distances[197:192] = rfData[263:256] - 6'h30;
			distances[203:198] = rfData[271:264] - 6'h30;
			distances[209:204] = rfData[279:272] - 6'h30;
			distances[215:210] = rfData[287:280] - 6'h30;
			distances[221:216] = rfData[295:288] - 6'h30;
			distances[227:222] = rfData[303:296] - 6'h30;
			distances[233:228] = rfData[311:304] - 6'h30;
			distances[239:234] = rfData[319:312] - 6'h30;
			distances[245:240] = rfData[327:320] - 6'h30;
			distances[251:246] = rfData[335:328] - 6'h30;
			distances[257:252] = rfData[343:336] - 6'h30;
			distances[263:258] = rfData[351:344] - 6'h30;
			distances[269:264] = rfData[359:352] - 6'h30;
			distances[275:270] = rfData[367:360] - 6'h30;
			distances[281:276] = rfData[375:368] - 6'h30;
			distances[287:282] = rfData[383:376] - 6'h30;
			distances[293:288] = rfData[391:384] - 6'h30;
			distances[299:294] = rfData[399:392] - 6'h30;
			distances[305:300] = rfData[407:400] - 6'h30;
			distances[311:306] = rfData[415:408] - 6'h30;
			distances[317:312] = rfData[423:416] - 6'h30;
			distances[323:318] = rfData[431:424] - 6'h30;
			distances[329:324] = rfData[439:432] - 6'h30;
			distances[335:330] = rfData[447:440] - 6'h30;
			distances[341:336] = rfData[455:448] - 6'h30;
			distances[347:342] = rfData[463:456] - 6'h30;
			distances[353:348] = rfData[471:464] - 6'h30;
			distances[359:354] = rfData[479:472] - 6'h30;
			distances[365:360] = rfData[487:480] - 6'h30;
			distances[371:366] = rfData[495:488] - 6'h30;
			distances[377:372] = rfData[503:496] - 6'h30;
			distances[383:378] = rfData[511:504] - 6'h30;
			distances[389:384] = rfData[519:512] - 6'h30;
		end
	end
	
	// calculates angle in radians for each data block 

	
	
	

endmodule