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
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {4U, 0U};
static unsigned int ng5[] = {1U, 0U};
static const char *ng6 = "Read";
static unsigned int ng7[] = {2U, 0U};
static int ng8[] = {2, 0};
static const char *ng9 = "Separate #%10d of %10d";
static unsigned int ng10[] = {3U, 0U};
static const char *ng11 = "SAD for block (x,y) = (%10d:%10d,%10d:%10d)";
static const char *ng12 = "FINALIZE #%10d";
static const char *ng13 = "Reading files...";
static const char *ng14 = "left_test.txt";
static const char *ng15 = "right_test.txt";
static const char *ng16 = "FSM enabled";



static void Always_76_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 8120U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(77, ng0);

LAB4:    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6240);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 7928);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(80, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6240);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 7928);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    goto LAB2;

}

static void Always_84_1(char *t0)
{
    char t14[8];
    char t21[8];
    char t25[8];
    char t27[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t22;
    char *t23;
    char *t24;
    char *t26;

LAB0:    t1 = (t0 + 8368U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 9184);
    *((int *)t2) = 1;
    t3 = (t0 + 8400);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(85, ng0);

LAB5:    xsi_set_current_line(86, ng0);
    t4 = (t0 + 2480U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 6080);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 6080);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t13 = (t0 + 6080);
    t15 = (t13 + 64U);
    t16 = *((char **)t15);
    t17 = (t0 + 472);
    t18 = *((char **)t17);
    t17 = (t0 + 2320U);
    t19 = *((char **)t17);
    memset(t25, 0, 8);
    xsi_vlog_unsigned_multiply(t25, 32, t18, 32, t19, 10);
    t17 = (t0 + 2160U);
    t20 = *((char **)t17);
    memset(t27, 0, 8);
    xsi_vlog_unsigned_add(t27, 32, t25, 32, t20, 10);
    xsi_vlogtype_concat(t21, 32, 32, 1U, t27, 32);
    xsi_vlog_generic_get_array_select_value(t14, 8, t4, t12, t16, 2, 1, t21, 32, 2);
    t17 = (t0 + 6720);
    xsi_vlogvar_assign_value(t17, t14, 0, 0, 8);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(87, ng0);
    t11 = (t0 + 5920);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t15 = (t0 + 5920);
    t16 = (t15 + 72U);
    t17 = *((char **)t16);
    t18 = (t0 + 5920);
    t19 = (t18 + 64U);
    t20 = *((char **)t19);
    t22 = (t0 + 472);
    t23 = *((char **)t22);
    t22 = (t0 + 2320U);
    t24 = *((char **)t22);
    memset(t25, 0, 8);
    xsi_vlog_unsigned_multiply(t25, 32, t23, 32, t24, 10);
    t22 = (t0 + 2160U);
    t26 = *((char **)t22);
    memset(t27, 0, 8);
    xsi_vlog_unsigned_add(t27, 32, t25, 32, t26, 10);
    xsi_vlogtype_concat(t21, 32, 32, 1U, t27, 32);
    xsi_vlog_generic_get_array_select_value(t14, 8, t13, t17, t20, 2, 1, t21, 32, 2);
    t22 = (t0 + 6720);
    xsi_vlogvar_assign_value(t22, t14, 0, 0, 8);
    goto LAB8;

}

static void Always_92_2(char *t0)
{
    char t11[8];
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

LAB0:    t1 = (t0 + 8616U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 9200);
    *((int *)t2) = 1;
    t3 = (t0 + 8648);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(93, ng0);

LAB5:    xsi_set_current_line(94, ng0);
    t4 = (t0 + 2800U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:
LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(95, ng0);

LAB18:    xsi_set_current_line(96, ng0);
    t7 = (t0 + 5600);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = ((char*)((ng4)));
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

LAB9:    xsi_set_current_line(99, ng0);

LAB26:    xsi_set_current_line(100, ng0);
    t3 = (t0 + 2800U);
    t4 = *((char **)t3);
    t3 = (t0 + 5600);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 3);
    xsi_set_current_line(101, ng0);
    xsi_vlogfile_write(1, 0, 0, ng6, 1, t0);
    goto LAB17;

LAB11:    xsi_set_current_line(103, ng0);

LAB27:    xsi_set_current_line(104, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 7040);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 10);
    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 7200);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 10);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 2800U);
    t3 = *((char **)t2);
    t2 = (t0 + 5600);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 3);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 4720U);
    t3 = *((char **)t2);
    t2 = (t0 + 4080U);
    t4 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng9, 3, t0, (char)118, t3, 10, (char)118, t4, 10);
    goto LAB17;

LAB13:    xsi_set_current_line(109, ng0);

LAB28:    xsi_set_current_line(110, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 7040);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 10);
    xsi_set_current_line(111, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7200);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 10);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 2800U);
    t3 = *((char **)t2);
    t2 = (t0 + 5600);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 3);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 3600U);
    t3 = *((char **)t2);
    t2 = (t0 + 3760U);
    t4 = *((char **)t2);
    t2 = (t0 + 2960U);
    t7 = *((char **)t2);
    t2 = (t0 + 3120U);
    t8 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng11, 5, t0, (char)118, t3, 10, (char)118, t4, 10, (char)118, t7, 10, (char)118, t8, 10);
    goto LAB17;

LAB15:    xsi_set_current_line(115, ng0);

LAB29:    xsi_set_current_line(116, ng0);
    t3 = (t0 + 5760);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = ((char*)((ng5)));
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 8, t7, 8, t8, 8);
    t9 = (t0 + 5760);
    xsi_vlogvar_assign_value(t9, t11, 0, 0, 8);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 5760);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng12, 2, t0, (char)118, t4, 8);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 2800U);
    t3 = *((char **)t2);
    t2 = (t0 + 5600);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 3);
    goto LAB17;

LAB21:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB22;

LAB23:    xsi_set_current_line(97, ng0);
    xsi_vlog_stop(1);
    goto LAB25;

}

static void Initial_123_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 8864U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(123, ng0);

LAB4:    xsi_set_current_line(125, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6400);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(126, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6560);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(127, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6720);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);
    xsi_set_current_line(128, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6880);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7040);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 10);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 7200);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 10);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 8672);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(136, ng0);
    xsi_vlogfile_write(1, 0, 0, ng13, 1, t0);
    xsi_set_current_line(137, ng0);
    t2 = (t0 + 5920);
    xsi_vlogfile_readmemb(ng14, 0, t2, 0, 0, 0, 0);
    xsi_set_current_line(138, ng0);
    t2 = (t0 + 6080);
    xsi_vlogfile_readmemb(ng15, 0, t2, 0, 0, 0, 0);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 8672);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(142, ng0);
    xsi_vlogfile_write(1, 0, 0, ng16, 1, t0);
    xsi_set_current_line(143, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 6400);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 8672);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(145, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6400);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB1;

}


extern void work_m_00000000002399256696_0893193378_init()
{
	static char *pe[] = {(void *)Always_76_0,(void *)Always_84_1,(void *)Always_92_2,(void *)Initial_123_3};
	xsi_register_didat("work_m_00000000002399256696_0893193378", "isim/disparity_tb_isim_beh.exe.sim/work/m_00000000002399256696_0893193378.didat");
	xsi_register_executes(pe);
}
