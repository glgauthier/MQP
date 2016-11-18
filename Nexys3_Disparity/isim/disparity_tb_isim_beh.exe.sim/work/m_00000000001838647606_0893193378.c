/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/georges/Documents/GitHub/MQP/Nexys3_Disparity/disparity_tb.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static unsigned int ng3[] = {255U, 0U};
static unsigned int ng4[] = {0U, 0U};
static unsigned int ng5[] = {4U, 0U};
static const char *ng6 = "resultant = [";
static const char *ng7 = "%10d";
static unsigned int ng8[] = {1U, 0U};
static int ng9[] = {3, 0};
static const char *ng10 = "; ";
static const char *ng11 = ",";
static const char *ng12 = "]\n\r";
static unsigned int ng13[] = {2U, 0U};
static unsigned int ng14[] = {3U, 0U};
static int ng15[] = {2, 0};
static const char *ng16 = "Reading files...";
static const char *ng17 = "left_cones.txt";
static const char *ng18 = "right_cones.txt";
static const char *ng19 = "FSM enabled";



static void Always_75_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 5720U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(76, ng0);

LAB4:    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3680);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 5528);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3680);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 5528);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    goto LAB2;

}

static void Always_85_1(char *t0)
{
    char t6[8];
    char t22[8];
    char t36[8];
    char t52[8];
    char t60[8];
    char t92[8];
    char t104[8];
    char t123[8];
    char t131[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    char *t105;
    char *t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    char *t112;
    char *t113;
    char *t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    char *t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    char *t130;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    char *t135;
    char *t136;
    char *t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    char *t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    unsigned int t154;
    int t155;
    int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    unsigned int t161;
    unsigned int t162;
    char *t163;
    unsigned int t164;
    unsigned int t165;
    unsigned int t166;
    unsigned int t167;
    unsigned int t168;
    char *t169;
    char *t170;

LAB0:    t1 = (t0 + 5968U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 6784);
    *((int *)t2) = 1;
    t3 = (t0 + 6000);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(86, ng0);

LAB5:    xsi_set_current_line(88, ng0);
    t4 = (t0 + 2160U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    memset(t22, 0, 8);
    t23 = (t6 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t23) != 0)
        goto LAB12;

LAB13:    t30 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB14;

LAB15:    memcpy(t60, t22, 8);

LAB16:    memset(t92, 0, 8);
    t93 = (t60 + 4);
    t94 = *((unsigned int *)t93);
    t95 = (~(t94));
    t96 = *((unsigned int *)t60);
    t97 = (t96 & t95);
    t98 = (t97 & 1U);
    if (t98 != 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t93) != 0)
        goto LAB30;

LAB31:    t100 = (t92 + 4);
    t101 = *((unsigned int *)t92);
    t102 = *((unsigned int *)t100);
    t103 = (t101 || t102);
    if (t103 > 0)
        goto LAB32;

LAB33:    memcpy(t131, t92, 8);

LAB34:    t163 = (t131 + 4);
    t164 = *((unsigned int *)t163);
    t165 = (~(t164));
    t166 = *((unsigned int *)t131);
    t167 = (t166 & t165);
    t168 = (t167 != 0);
    if (t168 > 0)
        goto LAB48;

LAB49:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2480U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB54;

LAB52:    if (*((unsigned int *)t2) == 0)
        goto LAB51;

LAB53:    t4 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t4) = 1;

LAB54:    t5 = (t6 + 4);
    t7 = (t3 + 4);
    t14 = *((unsigned int *)t3);
    t15 = (~(t14));
    *((unsigned int *)t6) = t15;
    *((unsigned int *)t5) = 0;
    if (*((unsigned int *)t7) != 0)
        goto LAB56;

LAB55:    t20 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t20 & 1U);
    t24 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t24 & 1U);
    t8 = (t6 + 4);
    t25 = *((unsigned int *)t8);
    t26 = (~(t25));
    t27 = *((unsigned int *)t6);
    t28 = (t27 & t26);
    t31 = (t28 != 0);
    if (t31 > 0)
        goto LAB57;

LAB58:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 3520);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3520);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t21 = (t0 + 3520);
    t23 = (t21 + 64U);
    t29 = *((char **)t23);
    t30 = (t0 + 472);
    t34 = *((char **)t30);
    t30 = (t0 + 2320U);
    t35 = *((char **)t30);
    memset(t36, 0, 8);
    xsi_vlog_unsigned_multiply(t36, 32, t34, 32, t35, 10);
    t30 = (t0 + 2160U);
    t37 = *((char **)t30);
    memset(t52, 0, 8);
    xsi_vlog_unsigned_add(t52, 32, t36, 32, t37, 10);
    xsi_vlogtype_concat(t22, 32, 32, 1U, t52, 32);
    xsi_vlog_generic_get_array_select_value(t6, 8, t4, t8, t29, 2, 1, t22, 32, 2);
    t30 = (t0 + 4160);
    xsi_vlogvar_assign_value(t30, t6, 0, 0, 8);

LAB59:
LAB50:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    *((unsigned int *)t22) = 1;
    goto LAB13;

LAB12:    t29 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB13;

LAB14:    t34 = (t0 + 2320U);
    t35 = *((char **)t34);
    t34 = ((char*)((ng1)));
    memset(t36, 0, 8);
    t37 = (t35 + 4);
    t38 = (t34 + 4);
    t39 = *((unsigned int *)t35);
    t40 = *((unsigned int *)t34);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t37);
    t43 = *((unsigned int *)t38);
    t44 = (t42 ^ t43);
    t45 = (t41 | t44);
    t46 = *((unsigned int *)t37);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB20;

LAB17:    if (t48 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t36) = 1;

LAB20:    memset(t52, 0, 8);
    t53 = (t36 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t36);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t53) != 0)
        goto LAB23;

LAB24:    t61 = *((unsigned int *)t22);
    t62 = *((unsigned int *)t52);
    t63 = (t61 & t62);
    *((unsigned int *)t60) = t63;
    t64 = (t22 + 4);
    t65 = (t52 + 4);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t64);
    t68 = *((unsigned int *)t65);
    t69 = (t67 | t68);
    *((unsigned int *)t66) = t69;
    t70 = *((unsigned int *)t66);
    t71 = (t70 != 0);
    if (t71 == 1)
        goto LAB25;

LAB26:
LAB27:    goto LAB16;

LAB19:    t51 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t52) = 1;
    goto LAB24;

LAB23:    t59 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB24;

LAB25:    t72 = *((unsigned int *)t60);
    t73 = *((unsigned int *)t66);
    *((unsigned int *)t60) = (t72 | t73);
    t74 = (t22 + 4);
    t75 = (t52 + 4);
    t76 = *((unsigned int *)t22);
    t77 = (~(t76));
    t78 = *((unsigned int *)t74);
    t79 = (~(t78));
    t80 = *((unsigned int *)t52);
    t81 = (~(t80));
    t82 = *((unsigned int *)t75);
    t83 = (~(t82));
    t84 = (t77 & t79);
    t85 = (t81 & t83);
    t86 = (~(t84));
    t87 = (~(t85));
    t88 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t88 & t86);
    t89 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t89 & t87);
    t90 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t90 & t86);
    t91 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t91 & t87);
    goto LAB27;

LAB28:    *((unsigned int *)t92) = 1;
    goto LAB31;

LAB30:    t99 = (t92 + 4);
    *((unsigned int *)t92) = 1;
    *((unsigned int *)t99) = 1;
    goto LAB31;

LAB32:    t105 = (t0 + 2480U);
    t106 = *((char **)t105);
    memset(t104, 0, 8);
    t105 = (t106 + 4);
    t107 = *((unsigned int *)t105);
    t108 = (~(t107));
    t109 = *((unsigned int *)t106);
    t110 = (t109 & t108);
    t111 = (t110 & 1U);
    if (t111 != 0)
        goto LAB38;

LAB36:    if (*((unsigned int *)t105) == 0)
        goto LAB35;

LAB37:    t112 = (t104 + 4);
    *((unsigned int *)t104) = 1;
    *((unsigned int *)t112) = 1;

LAB38:    t113 = (t104 + 4);
    t114 = (t106 + 4);
    t115 = *((unsigned int *)t106);
    t116 = (~(t115));
    *((unsigned int *)t104) = t116;
    *((unsigned int *)t113) = 0;
    if (*((unsigned int *)t114) != 0)
        goto LAB40;

LAB39:    t121 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t121 & 1U);
    t122 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t122 & 1U);
    memset(t123, 0, 8);
    t124 = (t104 + 4);
    t125 = *((unsigned int *)t124);
    t126 = (~(t125));
    t127 = *((unsigned int *)t104);
    t128 = (t127 & t126);
    t129 = (t128 & 1U);
    if (t129 != 0)
        goto LAB41;

LAB42:    if (*((unsigned int *)t124) != 0)
        goto LAB43;

LAB44:    t132 = *((unsigned int *)t92);
    t133 = *((unsigned int *)t123);
    t134 = (t132 & t133);
    *((unsigned int *)t131) = t134;
    t135 = (t92 + 4);
    t136 = (t123 + 4);
    t137 = (t131 + 4);
    t138 = *((unsigned int *)t135);
    t139 = *((unsigned int *)t136);
    t140 = (t138 | t139);
    *((unsigned int *)t137) = t140;
    t141 = *((unsigned int *)t137);
    t142 = (t141 != 0);
    if (t142 == 1)
        goto LAB45;

LAB46:
LAB47:    goto LAB34;

LAB35:    *((unsigned int *)t104) = 1;
    goto LAB38;

LAB40:    t117 = *((unsigned int *)t104);
    t118 = *((unsigned int *)t114);
    *((unsigned int *)t104) = (t117 | t118);
    t119 = *((unsigned int *)t113);
    t120 = *((unsigned int *)t114);
    *((unsigned int *)t113) = (t119 | t120);
    goto LAB39;

LAB41:    *((unsigned int *)t123) = 1;
    goto LAB44;

LAB43:    t130 = (t123 + 4);
    *((unsigned int *)t123) = 1;
    *((unsigned int *)t130) = 1;
    goto LAB44;

LAB45:    t143 = *((unsigned int *)t131);
    t144 = *((unsigned int *)t137);
    *((unsigned int *)t131) = (t143 | t144);
    t145 = (t92 + 4);
    t146 = (t123 + 4);
    t147 = *((unsigned int *)t92);
    t148 = (~(t147));
    t149 = *((unsigned int *)t145);
    t150 = (~(t149));
    t151 = *((unsigned int *)t123);
    t152 = (~(t151));
    t153 = *((unsigned int *)t146);
    t154 = (~(t153));
    t155 = (t148 & t150);
    t156 = (t152 & t154);
    t157 = (~(t155));
    t158 = (~(t156));
    t159 = *((unsigned int *)t137);
    *((unsigned int *)t137) = (t159 & t157);
    t160 = *((unsigned int *)t137);
    *((unsigned int *)t137) = (t160 & t158);
    t161 = *((unsigned int *)t131);
    *((unsigned int *)t131) = (t161 & t157);
    t162 = *((unsigned int *)t131);
    *((unsigned int *)t131) = (t162 & t158);
    goto LAB47;

LAB48:    xsi_set_current_line(89, ng0);
    t169 = ((char*)((ng3)));
    t170 = (t0 + 4160);
    xsi_vlogvar_assign_value(t170, t169, 0, 0, 8);
    goto LAB50;

LAB51:    *((unsigned int *)t6) = 1;
    goto LAB54;

LAB56:    t16 = *((unsigned int *)t6);
    t17 = *((unsigned int *)t7);
    *((unsigned int *)t6) = (t16 | t17);
    t18 = *((unsigned int *)t5);
    t19 = *((unsigned int *)t7);
    *((unsigned int *)t5) = (t18 | t19);
    goto LAB55;

LAB57:    xsi_set_current_line(91, ng0);

LAB60:    xsi_set_current_line(92, ng0);
    t21 = (t0 + 3360);
    t23 = (t21 + 56U);
    t29 = *((char **)t23);
    t30 = (t0 + 3360);
    t34 = (t30 + 72U);
    t35 = *((char **)t34);
    t37 = (t0 + 3360);
    t38 = (t37 + 64U);
    t51 = *((char **)t38);
    t53 = (t0 + 472);
    t59 = *((char **)t53);
    t53 = (t0 + 2320U);
    t64 = *((char **)t53);
    memset(t52, 0, 8);
    xsi_vlog_unsigned_multiply(t52, 32, t59, 32, t64, 10);
    t53 = (t0 + 2160U);
    t65 = *((char **)t53);
    memset(t60, 0, 8);
    xsi_vlog_unsigned_add(t60, 32, t52, 32, t65, 10);
    xsi_vlogtype_concat(t36, 32, 32, 1U, t60, 32);
    xsi_vlog_generic_get_array_select_value(t22, 8, t29, t35, t51, 2, 1, t36, 32, 2);
    t53 = (t0 + 4160);
    xsi_vlogvar_assign_value(t53, t22, 0, 0, 8);
    goto LAB59;

}

static void Always_99_2(char *t0)
{
    char t11[8];
    char t35[8];
    char t36[8];
    char t43[8];
    char t44[8];
    char t48[8];
    char t56[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;
    char *t45;
    char *t46;
    char *t47;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    char *t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    char *t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;

LAB0:    t1 = (t0 + 6216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 6800);
    *((int *)t2) = 1;
    t3 = (t0 + 6248);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(100, ng0);

LAB5:    xsi_set_current_line(101, ng0);
    t4 = (t0 + 2800U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:
LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(102, ng0);

LAB18:    xsi_set_current_line(103, ng0);
    t7 = (t0 + 3200);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = ((char*)((ng5)));
    memset(t11, 0, 8);
    t12 = (t9 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB22;

LAB19:    if (t23 != 0)
        goto LAB21;

LAB20:    *((unsigned int *)t11) = 1;

LAB22:    t27 = (t11 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB23;

LAB24:
LAB25:    goto LAB17;

LAB9:    xsi_set_current_line(127, ng0);

LAB93:    xsi_set_current_line(128, ng0);
    t3 = (t0 + 2800U);
    t4 = *((char **)t3);
    t3 = (t0 + 3200);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 3);
    goto LAB17;

LAB11:    xsi_set_current_line(131, ng0);

LAB94:    xsi_set_current_line(132, ng0);
    t3 = (t0 + 2800U);
    t4 = *((char **)t3);
    t3 = (t0 + 3200);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 3);
    goto LAB17;

LAB13:    xsi_set_current_line(135, ng0);

LAB95:    xsi_set_current_line(136, ng0);
    t3 = (t0 + 2800U);
    t4 = *((char **)t3);
    t3 = (t0 + 3200);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 3);
    goto LAB17;

LAB15:    xsi_set_current_line(139, ng0);

LAB96:    xsi_set_current_line(141, ng0);
    t3 = (t0 + 2800U);
    t4 = *((char **)t3);
    t3 = (t0 + 3200);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 3);
    goto LAB17;

LAB21:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB22;

LAB23:    xsi_set_current_line(103, ng0);

LAB26:    xsi_set_current_line(104, ng0);
    t33 = ((char*)((ng1)));
    t34 = (t0 + 4480);
    xsi_vlogvar_assign_value(t34, t33, 0, 0, 10);
    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4640);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 10);
    xsi_set_current_line(106, ng0);
    xsi_vlogfile_write(0, 0, 1, ng6, 1, t0);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 472);
    t3 = *((char **)t2);
    t2 = (t0 + 608);
    t4 = *((char **)t2);
    memset(t11, 0, 8);
    xsi_vlog_signed_multiply(t11, 32, t3, 32, t4, 32);
    t2 = (t11 + 4);
    t14 = *((unsigned int *)t2);
    t15 = (~(t14));
    t16 = *((unsigned int *)t11);
    t6 = (t16 & t15);
    t7 = (t0 + 9112);
    *((int *)t7) = t6;

LAB27:    t8 = (t0 + 9112);
    if (*((int *)t8) > 0)
        goto LAB28;

LAB29:    goto LAB25;

LAB28:    xsi_set_current_line(107, ng0);

LAB30:    xsi_set_current_line(108, ng0);
    t9 = (t0 + 6024);
    xsi_process_wait(t9, 100000LL);
    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB31:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 2000U);
    t3 = *((char **)t2);
    xsi_vlogfile_write(0, 0, 1, ng7, 2, t0, (char)118, t3, 41);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 4480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = ((char*)((ng8)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 10, t4, 10, t7, 10);
    t8 = (t0 + 4480);
    xsi_vlogvar_assign_value(t8, t11, 0, 0, 10);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 4480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t0 + 472);
    t8 = *((char **)t7);
    t7 = ((char*)((ng9)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_minus(t11, 32, t8, 32, t7, 32);
    memset(t35, 0, 8);
    t9 = (t4 + 4);
    t10 = (t11 + 4);
    t14 = *((unsigned int *)t4);
    t15 = *((unsigned int *)t11);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t9);
    t18 = *((unsigned int *)t10);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t9);
    t22 = *((unsigned int *)t10);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB35;

LAB32:    if (t23 != 0)
        goto LAB34;

LAB33:    *((unsigned int *)t35) = 1;

LAB35:    memset(t36, 0, 8);
    t13 = (t35 + 4);
    t28 = *((unsigned int *)t13);
    t29 = (~(t28));
    t30 = *((unsigned int *)t35);
    t31 = (t30 & t29);
    t32 = (t31 & 1U);
    if (t32 != 0)
        goto LAB36;

LAB37:    if (*((unsigned int *)t13) != 0)
        goto LAB38;

LAB39:    t27 = (t36 + 4);
    t37 = *((unsigned int *)t36);
    t38 = *((unsigned int *)t27);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB40;

LAB41:    memcpy(t56, t36, 8);

LAB42:    t87 = (t56 + 4);
    t88 = *((unsigned int *)t87);
    t89 = (~(t88));
    t90 = *((unsigned int *)t56);
    t91 = (t90 & t89);
    t92 = (t91 != 0);
    if (t92 > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(117, ng0);
    t2 = (t0 + 4480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = ((char*)((ng1)));
    memset(t11, 0, 8);
    t8 = (t4 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB60;

LAB59:    t9 = (t7 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB60;

LAB63:    if (*((unsigned int *)t4) > *((unsigned int *)t7))
        goto LAB61;

LAB62:    t12 = (t11 + 4);
    t14 = *((unsigned int *)t12);
    t15 = (~(t14));
    t16 = *((unsigned int *)t11);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB64;

LAB65:
LAB66:
LAB57:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 4480);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t0 + 472);
    t8 = *((char **)t7);
    t7 = ((char*)((ng9)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_minus(t11, 32, t8, 32, t7, 32);
    memset(t35, 0, 8);
    t9 = (t4 + 4);
    t10 = (t11 + 4);
    t14 = *((unsigned int *)t4);
    t15 = *((unsigned int *)t11);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t9);
    t18 = *((unsigned int *)t10);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t9);
    t22 = *((unsigned int *)t10);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB70;

LAB67:    if (t23 != 0)
        goto LAB69;

LAB68:    *((unsigned int *)t35) = 1;

LAB70:    memset(t36, 0, 8);
    t13 = (t35 + 4);
    t28 = *((unsigned int *)t13);
    t29 = (~(t28));
    t30 = *((unsigned int *)t35);
    t31 = (t30 & t29);
    t32 = (t31 & 1U);
    if (t32 != 0)
        goto LAB71;

LAB72:    if (*((unsigned int *)t13) != 0)
        goto LAB73;

LAB74:    t27 = (t36 + 4);
    t37 = *((unsigned int *)t36);
    t38 = *((unsigned int *)t27);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB75;

LAB76:    memcpy(t56, t36, 8);

LAB77:    t87 = (t56 + 4);
    t102 = *((unsigned int *)t87);
    t103 = (~(t102));
    t104 = *((unsigned int *)t56);
    t105 = (t104 & t103);
    t106 = (t105 != 0);
    if (t106 > 0)
        goto LAB89;

LAB90:
LAB91:    t2 = (t0 + 9112);
    t6 = *((int *)t2);
    *((int *)t2) = (t6 - 1);
    goto LAB27;

LAB34:    t12 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB35;

LAB36:    *((unsigned int *)t36) = 1;
    goto LAB39;

LAB38:    t26 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB39;

LAB40:    t33 = (t0 + 4640);
    t34 = (t33 + 56U);
    t40 = *((char **)t34);
    t41 = (t0 + 608);
    t42 = *((char **)t41);
    t41 = ((char*)((ng2)));
    memset(t43, 0, 8);
    xsi_vlog_unsigned_minus(t43, 32, t42, 32, t41, 32);
    memset(t44, 0, 8);
    t45 = (t40 + 4);
    if (*((unsigned int *)t45) != 0)
        goto LAB44;

LAB43:    t46 = (t43 + 4);
    if (*((unsigned int *)t46) != 0)
        goto LAB44;

LAB47:    if (*((unsigned int *)t40) < *((unsigned int *)t43))
        goto LAB45;

LAB46:    memset(t48, 0, 8);
    t49 = (t44 + 4);
    t50 = *((unsigned int *)t49);
    t51 = (~(t50));
    t52 = *((unsigned int *)t44);
    t53 = (t52 & t51);
    t54 = (t53 & 1U);
    if (t54 != 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t49) != 0)
        goto LAB50;

LAB51:    t57 = *((unsigned int *)t36);
    t58 = *((unsigned int *)t48);
    t59 = (t57 & t58);
    *((unsigned int *)t56) = t59;
    t60 = (t36 + 4);
    t61 = (t48 + 4);
    t62 = (t56 + 4);
    t63 = *((unsigned int *)t60);
    t64 = *((unsigned int *)t61);
    t65 = (t63 | t64);
    *((unsigned int *)t62) = t65;
    t66 = *((unsigned int *)t62);
    t67 = (t66 != 0);
    if (t67 == 1)
        goto LAB52;

LAB53:
LAB54:    goto LAB42;

LAB44:    t47 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB46;

LAB45:    *((unsigned int *)t44) = 1;
    goto LAB46;

LAB48:    *((unsigned int *)t48) = 1;
    goto LAB51;

LAB50:    t55 = (t48 + 4);
    *((unsigned int *)t48) = 1;
    *((unsigned int *)t55) = 1;
    goto LAB51;

LAB52:    t68 = *((unsigned int *)t56);
    t69 = *((unsigned int *)t62);
    *((unsigned int *)t56) = (t68 | t69);
    t70 = (t36 + 4);
    t71 = (t48 + 4);
    t72 = *((unsigned int *)t36);
    t73 = (~(t72));
    t74 = *((unsigned int *)t70);
    t75 = (~(t74));
    t76 = *((unsigned int *)t48);
    t77 = (~(t76));
    t78 = *((unsigned int *)t71);
    t79 = (~(t78));
    t6 = (t73 & t75);
    t80 = (t77 & t79);
    t81 = (~(t6));
    t82 = (~(t80));
    t83 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t83 & t81);
    t84 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t84 & t82);
    t85 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t85 & t81);
    t86 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t86 & t82);
    goto LAB54;

LAB55:    xsi_set_current_line(112, ng0);

LAB58:    xsi_set_current_line(113, ng0);
    t93 = ((char*)((ng1)));
    t94 = (t0 + 4480);
    xsi_vlogvar_assign_value(t94, t93, 0, 0, 10);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 4640);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = ((char*)((ng8)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 10, t4, 10, t7, 10);
    t8 = (t0 + 4640);
    xsi_vlogvar_assign_value(t8, t11, 0, 0, 10);
    xsi_set_current_line(115, ng0);
    xsi_vlogfile_write(0, 0, 1, ng10, 1, t0);
    goto LAB57;

LAB60:    t10 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB62;

LAB61:    *((unsigned int *)t11) = 1;
    goto LAB62;

LAB64:    xsi_set_current_line(118, ng0);
    xsi_vlogfile_write(0, 0, 1, ng11, 1, t0);
    goto LAB66;

LAB69:    t12 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB70;

LAB71:    *((unsigned int *)t36) = 1;
    goto LAB74;

LAB73:    t26 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB74;

LAB75:    t33 = (t0 + 4640);
    t34 = (t33 + 56U);
    t40 = *((char **)t34);
    t41 = (t0 + 608);
    t42 = *((char **)t41);
    t41 = ((char*)((ng2)));
    memset(t43, 0, 8);
    xsi_vlog_unsigned_minus(t43, 32, t42, 32, t41, 32);
    memset(t44, 0, 8);
    t45 = (t40 + 4);
    t46 = (t43 + 4);
    t50 = *((unsigned int *)t40);
    t51 = *((unsigned int *)t43);
    t52 = (t50 ^ t51);
    t53 = *((unsigned int *)t45);
    t54 = *((unsigned int *)t46);
    t57 = (t53 ^ t54);
    t58 = (t52 | t57);
    t59 = *((unsigned int *)t45);
    t63 = *((unsigned int *)t46);
    t64 = (t59 | t63);
    t65 = (~(t64));
    t66 = (t58 & t65);
    if (t66 != 0)
        goto LAB81;

LAB78:    if (t64 != 0)
        goto LAB80;

LAB79:    *((unsigned int *)t44) = 1;

LAB81:    memset(t48, 0, 8);
    t49 = (t44 + 4);
    t67 = *((unsigned int *)t49);
    t68 = (~(t67));
    t69 = *((unsigned int *)t44);
    t72 = (t69 & t68);
    t73 = (t72 & 1U);
    if (t73 != 0)
        goto LAB82;

LAB83:    if (*((unsigned int *)t49) != 0)
        goto LAB84;

LAB85:    t74 = *((unsigned int *)t36);
    t75 = *((unsigned int *)t48);
    t76 = (t74 & t75);
    *((unsigned int *)t56) = t76;
    t60 = (t36 + 4);
    t61 = (t48 + 4);
    t62 = (t56 + 4);
    t77 = *((unsigned int *)t60);
    t78 = *((unsigned int *)t61);
    t79 = (t77 | t78);
    *((unsigned int *)t62) = t79;
    t81 = *((unsigned int *)t62);
    t82 = (t81 != 0);
    if (t82 == 1)
        goto LAB86;

LAB87:
LAB88:    goto LAB77;

LAB80:    t47 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB81;

LAB82:    *((unsigned int *)t48) = 1;
    goto LAB85;

LAB84:    t55 = (t48 + 4);
    *((unsigned int *)t48) = 1;
    *((unsigned int *)t55) = 1;
    goto LAB85;

LAB86:    t83 = *((unsigned int *)t56);
    t84 = *((unsigned int *)t62);
    *((unsigned int *)t56) = (t83 | t84);
    t70 = (t36 + 4);
    t71 = (t48 + 4);
    t85 = *((unsigned int *)t36);
    t86 = (~(t85));
    t88 = *((unsigned int *)t70);
    t89 = (~(t88));
    t90 = *((unsigned int *)t48);
    t91 = (~(t90));
    t92 = *((unsigned int *)t71);
    t95 = (~(t92));
    t6 = (t86 & t89);
    t80 = (t91 & t95);
    t96 = (~(t6));
    t97 = (~(t80));
    t98 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t98 & t96);
    t99 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t99 & t97);
    t100 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t100 & t96);
    t101 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t101 & t97);
    goto LAB88;

LAB89:    xsi_set_current_line(120, ng0);

LAB92:    xsi_set_current_line(121, ng0);
    xsi_vlogfile_write(0, 0, 1, ng12, 1, t0);
    xsi_set_current_line(122, ng0);
    xsi_vlog_stop(1);
    goto LAB91;

}

static void Initial_153_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 6464U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(153, ng0);

LAB4:    xsi_set_current_line(155, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3840);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4000);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(157, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4160);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);
    xsi_set_current_line(158, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4320);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(159, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4480);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 10);
    xsi_set_current_line(160, ng0);
    t2 = ((char*)((ng15)));
    t3 = (t0 + 4640);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 10);
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 6272);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(166, ng0);
    xsi_vlogfile_write(1, 0, 0, ng16, 1, t0);
    xsi_set_current_line(169, ng0);
    t2 = (t0 + 3360);
    xsi_vlogfile_readmemb(ng17, 0, t2, 0, 0, 0, 0);
    xsi_set_current_line(170, ng0);
    t2 = (t0 + 3520);
    xsi_vlogfile_readmemb(ng18, 0, t2, 0, 0, 0, 0);
    xsi_set_current_line(171, ng0);
    t2 = (t0 + 6272);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(174, ng0);
    xsi_vlogfile_write(1, 0, 0, ng19, 1, t0);
    xsi_set_current_line(175, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3840);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(176, ng0);
    t2 = (t0 + 6272);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(177, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3840);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB1;

}


extern void work_m_00000000001838647606_0893193378_init()
{
	static char *pe[] = {(void *)Always_75_0,(void *)Always_85_1,(void *)Always_99_2,(void *)Initial_153_3};
	xsi_register_didat("work_m_00000000001838647606_0893193378", "isim/disparity_tb_isim_beh.exe.sim/work/m_00000000001838647606_0893193378.didat");
	xsi_register_executes(pe);
}
