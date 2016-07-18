set data {
<EDKSYSTEM EDKVERSION="14.1" EDWVERSION="1.2" TIMESTAMP="%timestamp%">

  <SYSTEMINFO ARCH="%family%" DEVICE="%xdevice%" PACKAGE="%xpackage%" PART="%xpart%" SOURCE="" SPEEDGRADE="%xspeedgrade%"/>

  <EXTERNALPORTS>
    <PORT CLKFREQUENCY="%freq%" DIR="I" MHS_INDEX="0" NAME="Clk" SIGIS="CLK" SIGNAME="Clk">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[DLMB:ILMB:M_AXI_DP:M_AXI_IP]" INSTANCE="%microblaze_instance%" PORT="CLK"/>
        <CONNECTION INSTANCE="ilmb" PORT="LMB_CLK"/>
        <CONNECTION INSTANCE="dlmb" PORT="LMB_CLK"/>
        <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="dlmb_cntlr" PORT="LMB_Clk"/>
        <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="ilmb_cntlr" PORT="LMB_Clk"/>
        <CONNECTION INSTANCE="iomodule_0" PORT="CLK"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="I" MHS_INDEX="1" NAME="Reset" RSTPOLARITY="1" SIGIS="RST" SIGNAME="Reset">
      <CONNECTIONS>
        <CONNECTION INSTANCE="%microblaze_instance%" PORT="MB_RESET"/>
        <CONNECTION INSTANCE="ilmb" PORT="SYS_RST"/>
        <CONNECTION INSTANCE="dlmb" PORT="SYS_RST"/>
        <CONNECTION INSTANCE="iomodule_0" PORT="Rst"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="2" NAME="IO_Addr_Strobe" SIGNAME="IO_Addr_Strobe">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="IO_Addr_Strobe"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="3" NAME="IO_Read_Strobe" SIGNAME="IO_Read_Strobe">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="IO_Read_Strobe"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="4" NAME="IO_Write_Strobe" SIGNAME="IO_Write_Strobe">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="IO_Write_Strobe"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MHS_INDEX="5" MSB="31" NAME="IO_Address" RIGHT="0" SIGNAME="IO_Address">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="IO_Address"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MHS_INDEX="6" MSB="3" NAME="IO_Byte_Enable" RIGHT="0" SIGNAME="IO_Byte_Enable">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="IO_Byte_Enable"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MHS_INDEX="7" MSB="31" NAME="IO_Write_Data" RIGHT="0" SIGNAME="IO_Write_Data">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="IO_Write_Data"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MHS_INDEX="8" MSB="31" NAME="IO_Read_Data" RIGHT="0" SIGNAME="IO_Read_Data">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="IO_Read_Data"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="I" MHS_INDEX="9" NAME="IO_Ready" SIGNAME="IO_Ready">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="IO_Ready"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="I" MHS_INDEX="10" NAME="UART_Rx" SIGNAME="UART_Rx">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[uart_0]" INSTANCE="iomodule_0" PORT="UART_Rx"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="11" NAME="UART_Tx" SIGNAME="UART_Tx">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[uart_0]" INSTANCE="iomodule_0" PORT="UART_Tx"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="12" NAME="UART_Interrupt" SIGNAME="UART_Interrupt">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="UART_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="13" NAME="FIT1_Interrupt" SIGNAME="FIT1_Interrupt">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="FIT1_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="14" NAME="FIT1_Toggle" SIGNAME="FIT1_Toggle">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="FIT1_Toggle"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="15" NAME="FIT2_Interrupt" SIGNAME="FIT2_Interrupt">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="FIT2_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="16" NAME="FIT2_Toggle" SIGNAME="FIT2_Toggle">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="FIT2_Toggle"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="17" NAME="FIT3_Interrupt" SIGNAME="FIT3_Interrupt">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="FIT3_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="18" NAME="FIT3_Toggle" SIGNAME="FIT3_Toggle">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="FIT3_Toggle"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="19" NAME="FIT4_Interrupt" SIGNAME="FIT4_Interrupt">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="FIT4_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="20" NAME="FIT4_Toggle" SIGNAME="FIT4_Toggle">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="FIT4_Toggle"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="I" MHS_INDEX="21" NAME="PIT1_Enable" SIGNAME="PIT1_Enable">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="PIT1_Enable"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="22" NAME="PIT1_Interrupt" SIGNAME="PIT1_Interrupt">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="PIT1_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="23" NAME="PIT1_Toggle" SIGNAME="PIT1_Toggle">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="PIT1_Toggle"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="I" MHS_INDEX="24" NAME="PIT2_Enable" SIGNAME="PIT2_Enable">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="PIT2_Enable"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="25" NAME="PIT2_Interrupt" SIGNAME="PIT2_Interrupt">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="PIT2_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="26" NAME="PIT2_Toggle" SIGNAME="PIT2_Toggle">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="PIT2_Toggle"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="I" MHS_INDEX="27" NAME="PIT3_Enable" SIGNAME="PIT3_Enable">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="PIT3_Enable"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="28" NAME="PIT3_Interrupt" SIGNAME="PIT3_Interrupt">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="PIT3_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="29" NAME="PIT3_Toggle" SIGNAME="PIT3_Toggle">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="PIT3_Toggle"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="I" MHS_INDEX="30" NAME="PIT4_Enable" SIGNAME="PIT4_Enable">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="PIT4_Enable"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="31" NAME="PIT4_Interrupt" SIGNAME="PIT4_Interrupt">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="PIT4_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="32" NAME="PIT4_Toggle" SIGNAME="PIT4_Toggle">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="PIT4_Toggle"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="LITTLE" LEFT="%gpo1_size-1%" LSB="0" MHS_INDEX="33" MSB="%gpo1_size-1%" NAME="GPO1" RIGHT="0" SIGNAME="GPO1">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[gpio_0]" INSTANCE="iomodule_0" PORT="GPO1"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="LITTLE" LEFT="%gpo2_size-1%" LSB="0" MHS_INDEX="34" MSB="%gpo2_size-1%" NAME="GPO2" RIGHT="0" SIGNAME="GPO2">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[gpio_0]" INSTANCE="iomodule_0" PORT="GPO2"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="LITTLE" LEFT="%gpo3_size-1%" LSB="0" MHS_INDEX="35" MSB="%gpo3_size-1%" NAME="GPO3" RIGHT="0" SIGNAME="GPO3">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[gpio_0]" INSTANCE="iomodule_0" PORT="GPO3"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="LITTLE" LEFT="%gpo4_size-1%" LSB="0" MHS_INDEX="36" MSB="%gpo4_size-1%" NAME="GPO4" RIGHT="0" SIGNAME="GPO4">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[gpio_0]" INSTANCE="iomodule_0" PORT="GPO4"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="I" ENDIAN="LITTLE" LEFT="%gpi1_size-1%" LSB="0" MHS_INDEX="37" MSB="%gpi1_size-1%" NAME="GPI1" RIGHT="0" SIGNAME="GPI1">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[gpio_0]" INSTANCE="iomodule_0" PORT="GPI1"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="I" ENDIAN="LITTLE" LEFT="%gpi2_size-1%" LSB="0" MHS_INDEX="38" MSB="%gpi2_size-1%" NAME="GPI2" RIGHT="0" SIGNAME="GPI2">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[gpio_0]" INSTANCE="iomodule_0" PORT="GPI2"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="I" ENDIAN="LITTLE" LEFT="%gpi3_size-1%" LSB="0" MHS_INDEX="39" MSB="%gpi3_size-1%" NAME="GPI3" RIGHT="0" SIGNAME="GPI3">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[gpio_0]" INSTANCE="iomodule_0" PORT="GPI3"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="I" ENDIAN="LITTLE" LEFT="%gpi4_size-1%" LSB="0" MHS_INDEX="40" MSB="%gpi4_size-1%" NAME="GPI4" RIGHT="0" SIGNAME="GPI4">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[gpio_0]" INSTANCE="iomodule_0" PORT="GPI4"/>
      </CONNECTIONS>
    </PORT>
    %intc_0_comment_start%
    <PORT DIR="I" MHS_INDEX="41" NAME="INTC_Interrupt_0" SIGNAME="INTC_Interrupt_0">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_0_comment_end%
    %intc_1_comment_start%
    <PORT DIR="I" MHS_INDEX="42" NAME="INTC_Interrupt_1" SIGNAME="INTC_Interrupt_1">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_1_comment_end%
    %intc_2_comment_start%
    <PORT DIR="I" MHS_INDEX="43" NAME="INTC_Interrupt_2" SIGNAME="INTC_Interrupt_2">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_2_comment_end%
    %intc_3_comment_start%
    <PORT DIR="I" MHS_INDEX="44" NAME="INTC_Interrupt_3" SIGNAME="INTC_Interrupt_3">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_3_comment_end%
    %intc_4_comment_start%
    <PORT DIR="I" MHS_INDEX="45" NAME="INTC_Interrupt_4" SIGNAME="INTC_Interrupt_4">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_4_comment_end%
    %intc_5_comment_start%
    <PORT DIR="I" MHS_INDEX="46" NAME="INTC_Interrupt_5" SIGNAME="INTC_Interrupt_5">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_5_comment_end%
    %intc_6_comment_start%
    <PORT DIR="I" MHS_INDEX="47" NAME="INTC_Interrupt_6" SIGNAME="INTC_Interrupt_6">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_6_comment_end%
    %intc_7_comment_start%
    <PORT DIR="I" MHS_INDEX="48" NAME="INTC_Interrupt_7" SIGNAME="INTC_Interrupt_7">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_7_comment_end%
    %intc_8_comment_start%
    <PORT DIR="I" MHS_INDEX="49" NAME="INTC_Interrupt_8" SIGNAME="INTC_Interrupt_8">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_8_comment_end%
    %intc_9_comment_start%
    <PORT DIR="I" MHS_INDEX="50" NAME="INTC_Interrupt_9" SIGNAME="INTC_Interrupt_9">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_9_comment_end%
    %intc_10_comment_start%
    <PORT DIR="I" MHS_INDEX="51" NAME="INTC_Interrupt_10" SIGNAME="INTC_Interrupt_10">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_10_comment_end%
    %intc_11_comment_start%
    <PORT DIR="I" MHS_INDEX="52" NAME="INTC_Interrupt_11" SIGNAME="INTC_Interrupt_11">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_11_comment_end%
    %intc_12_comment_start%
    <PORT DIR="I" MHS_INDEX="53" NAME="INTC_Interrupt_12" SIGNAME="INTC_Interrupt_12">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_12_comment_end%
    %intc_13_comment_start%
    <PORT DIR="I" MHS_INDEX="54" NAME="INTC_Interrupt_13" SIGNAME="INTC_Interrupt_13">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_13_comment_end%
    %intc_14_comment_start%
    <PORT DIR="I" MHS_INDEX="55" NAME="INTC_Interrupt_14" SIGNAME="INTC_Interrupt_14">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_14_comment_end%
    %intc_15_comment_start%
    <PORT DIR="I" MHS_INDEX="56" NAME="INTC_Interrupt_15" SIGNAME="INTC_Interrupt_15">
      <CONNECTIONS>
        <CONNECTION INSTANCE="iomodule_0" PORT="INTC_Interrupt"/>
      </CONNECTIONS>
    </PORT>
    %intc_15_comment_end%
    <PORT DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MHS_INDEX="57" MSB="0" NAME="Trace_Instruction" RIGHT="31" SIGNAME="Trace_Instruction">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_Instruction"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="58" NAME="Trace_Valid_Instr" SIGNAME="Trace_Valid_Instr">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_Valid_Instr"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MHS_INDEX="59" MSB="0" NAME="Trace_PC" RIGHT="31" SIGNAME="Trace_PC">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_PC"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="60" NAME="Trace_Reg_Write" SIGNAME="Trace_Reg_Write">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_Reg_Write"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="BIG" LEFT="0" LSB="4" MHS_INDEX="61" MSB="0" NAME="Trace_Reg_Addr" RIGHT="4" SIGNAME="Trace_Reg_Addr">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_Reg_Addr"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="BIG" LEFT="0" LSB="14" MHS_INDEX="62" MSB="0" NAME="Trace_MSR_Reg" RIGHT="14" SIGNAME="Trace_MSR_Reg">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_MSR_Reg"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MHS_INDEX="63" MSB="0" NAME="Trace_New_Reg_Value" RIGHT="31" SIGNAME="Trace_New_Reg_Value">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_New_Reg_Value"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="64" NAME="Trace_Jump_Taken" SIGNAME="Trace_Jump_Taken">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_Jump_Taken"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="65" NAME="Trace_Delay_Slot" SIGNAME="Trace_Delay_Slot">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_Delay_Slot"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MHS_INDEX="66" MSB="0" NAME="Trace_Data_Address" RIGHT="31" SIGNAME="Trace_Data_Address">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_Data_Address"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="67" NAME="Trace_Data_Access" SIGNAME="Trace_Data_Access">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_Data_Access"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="68" NAME="Trace_Data_Read" SIGNAME="Trace_Data_Read">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_Data_Read"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="69" NAME="Trace_Data_Write" SIGNAME="Trace_Data_Write">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_Data_Write"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MHS_INDEX="70" MSB="0" NAME="Trace_Data_Write_Value" RIGHT="31" SIGNAME="Trace_Data_Write_Value">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_Data_Write_Value"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" ENDIAN="BIG" LEFT="0" LSB="3" MHS_INDEX="71" MSB="0" NAME="Trace_Data_Byte_Enable" RIGHT="3" SIGNAME="Trace_Data_Byte_Enable">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_Data_Byte_Enable"/>
      </CONNECTIONS>
    </PORT>
    <PORT DIR="O" MHS_INDEX="72" NAME="Trace_MB_Halted" SIGNAME="Trace_MB_Halted">
      <CONNECTIONS>
        <CONNECTION BUSINTERFACE="[TRACE]" INSTANCE="%microblaze_instance%" PORT="Trace_MB_Halted"/>
      </CONNECTIONS>
    </PORT>
  </EXTERNALPORTS>

  <MODULES>
    <MODULE HWVERSION="8.30.a" INSTANCE="%microblaze_instance%" IPTYPE="PROCESSOR" MHS_INDEX="0" MODCLASS="PROCESSOR" MODTYPE="microblaze" PROCTYPE="MICROBLAZE">
      <DOCUMENTATION>
        <DOCUMENT SOURCE="" TYPE="IP"/>
      </DOCUMENTATION>
      <LICENSEINFO ICON_NAME="ps_core_preferred"/>
      <PARAMETERS>
        <PARAMETER MPD_INDEX="0" NAME="C_SCO" TYPE="integer" VALUE="0"/>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="1" NAME="C_FREQ" TYPE="integer" VALUE="%freq%"/>
        <PARAMETER MPD_INDEX="2" NAME="C_DATA_SIZE" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="3" NAME="C_DYNAMIC_BUS_SIZING" TYPE="integer" VALUE="1"/>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="4" MPD_INDEX="4" NAME="C_FAMILY" TYPE="string" VALUE="%family%"/>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="5" NAME="C_INSTANCE" TYPE="string" VALUE="%microblaze_instance%"/>
        <PARAMETER MPD_INDEX="6" NAME="C_AVOID_PRIMITIVES" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="7" NAME="C_FAULT_TOLERANT" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Fault Tolerance Support</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="8" NAME="C_ECC_USE_CE_EXCEPTION" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="9" NAME="C_LOCKSTEP_SLAVE" TYPE="integer" VALUE="0"/>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="10" NAME="C_ENDIANNESS" TYPE="integer" VALUE="1"/>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="3" MPD_INDEX="11" NAME="C_AREA_OPTIMIZED" TYPE="integer" VALUE="1">
          <DESCRIPTION>Select implementation to optimize area (with lower instruction throughput)</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="12" NAME="C_OPTIMIZATION" TYPE="integer" VALUE="0"/>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="9" MPD_INDEX="13" NAME="C_INTERCONNECT" TYPE="integer" VALUE="2">
          <DESCRIPTION>Select Bus Interfaces</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="14" NAME="C_STREAM_INTERCONNECT" TYPE="integer" VALUE="0">
          <DESCRIPTION>Select Stream Interfaces</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="15" NAME="C_DPLB_DWIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="16" NAME="C_DPLB_NATIVE_DWIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="17" NAME="C_DPLB_BURST_EN" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="18" NAME="C_DPLB_P2P" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="19" NAME="C_IPLB_DWIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="20" NAME="C_IPLB_NATIVE_DWIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="21" NAME="C_IPLB_BURST_EN" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="22" NAME="C_IPLB_P2P" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="23" NAME="C_M_AXI_DP_SUPPORTS_THREADS" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="24" NAME="C_M_AXI_DP_THREAD_ID_WIDTH" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="25" NAME="C_M_AXI_DP_SUPPORTS_READ" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="26" NAME="C_M_AXI_DP_SUPPORTS_WRITE" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="27" NAME="C_M_AXI_DP_SUPPORTS_NARROW_BURST" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="28" NAME="C_M_AXI_DP_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="29" NAME="C_M_AXI_DP_ADDR_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="30" NAME="C_M_AXI_DP_PROTOCOL" TYPE="string" VALUE="AXI4LITE"/>
        <PARAMETER MPD_INDEX="31" NAME="C_M_AXI_DP_EXCLUSIVE_ACCESS" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="32" NAME="C_INTERCONNECT_M_AXI_DP_READ_ISSUING" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="33" NAME="C_INTERCONNECT_M_AXI_DP_WRITE_ISSUING" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="34" NAME="C_M_AXI_IP_SUPPORTS_THREADS" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="35" NAME="C_M_AXI_IP_THREAD_ID_WIDTH" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="36" NAME="C_M_AXI_IP_SUPPORTS_READ" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="37" NAME="C_M_AXI_IP_SUPPORTS_WRITE" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="38" NAME="C_M_AXI_IP_SUPPORTS_NARROW_BURST" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="39" NAME="C_M_AXI_IP_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="40" NAME="C_M_AXI_IP_ADDR_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="41" NAME="C_M_AXI_IP_PROTOCOL" TYPE="string" VALUE="AXI4LITE"/>
        <PARAMETER MPD_INDEX="42" NAME="C_INTERCONNECT_M_AXI_IP_READ_ISSUING" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="43" NAME="C_D_AXI" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="44" NAME="C_D_PLB" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="45" NAME="C_D_LMB" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="46" NAME="C_I_AXI" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="47" NAME="C_I_PLB" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="48" NAME="C_I_LMB" TYPE="integer" VALUE="1"/>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="6" MPD_INDEX="49" NAME="C_USE_MSR_INSTR" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Additional Machine Status Register Instructions</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="7" MPD_INDEX="50" NAME="C_USE_PCMP_INSTR" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Pattern Comparator</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="51" NAME="C_USE_BARREL" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Barrel Shifter</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="52" NAME="C_USE_DIV" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Integer Divider</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="5" MPD_INDEX="53" NAME="C_USE_HW_MUL" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Integer Multiplier</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="54" NAME="C_USE_FPU" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Floating Point Unit</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="8" MPD_INDEX="55" NAME="C_USE_REORDER_INSTR" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Reversed Load/Store and Swap Instructions</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="56" NAME="C_UNALIGNED_EXCEPTIONS" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Unaligned Data Exception</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="57" NAME="C_ILL_OPCODE_EXCEPTION" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Illegal Instruction Exception</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="58" NAME="C_M_AXI_I_BUS_EXCEPTION" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Instruction-side AXI Exception</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="59" NAME="C_M_AXI_D_BUS_EXCEPTION" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Data-side AXI Exception</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="60" NAME="C_IPLB_BUS_EXCEPTION" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Instruction-side PLB Exception</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="61" NAME="C_DPLB_BUS_EXCEPTION" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Data-side PLB Exception</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="62" NAME="C_DIV_ZERO_EXCEPTION" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Integer Divide Exception</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="63" NAME="C_FPU_EXCEPTION" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Floating Point Unit Exceptions</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="64" NAME="C_FSL_EXCEPTION" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Stream Exception</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="65" NAME="C_USE_STACK_PROTECTION" TYPE="integer" VALUE="0">
          <DESCRIPTION>&lt;qt&gt;Enable stack protection&lt;/qt&gt;</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="66" NAME="C_PVR" TYPE="integer" VALUE="0">
          <DESCRIPTION>Specifies Processor Version Register</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ENDIAN="BIG" LSB="7" MPD_INDEX="67" MSB="0" NAME="C_PVR_USER1" TYPE="std_logic_vector" VALUE="0x00">
          <DESCRIPTION>Specify USER1 Bits in Processor Version Register</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ENDIAN="BIG" LSB="31" MPD_INDEX="68" MSB="0" NAME="C_PVR_USER2" TYPE="std_logic_vector" VALUE="0x00000000">
          <DESCRIPTION>Specify USER2 Bits in Processor Version Registers</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="2" MPD_INDEX="69" NAME="C_DEBUG_ENABLED" TYPE="integer" VALUE="%debug_enabled%">
          <DESCRIPTION>Enable MicroBlaze Debug Module Interface</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="70" NAME="C_NUMBER_OF_PC_BRK" TYPE="integer" VALUE="1">
          <DESCRIPTION>Number of PC Breakpoints </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="71" NAME="C_NUMBER_OF_RD_ADDR_BRK" TYPE="integer" VALUE="0">
          <DESCRIPTION>Number of Read Address Watchpoints </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="72" NAME="C_NUMBER_OF_WR_ADDR_BRK" TYPE="integer" VALUE="0">
          <DESCRIPTION>Number of Write Address Watchpoints </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="73" NAME="C_INTERRUPT_IS_EDGE" TYPE="integer" VALUE="0">
          <DESCRIPTION>Sense Interrupt on Edge vs. Level </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="74" NAME="C_EDGE_IS_POSITIVE" TYPE="integer" VALUE="1">
          <DESCRIPTION>Sense Interrupt on Rising vs. Falling Edge </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="75" NAME="C_RESET_MSR" TYPE="std_logic_vector" VALUE="0x00000000">
          <DESCRIPTION>Specify Reset Value for Select MSR Bits</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="76" NAME="C_OPCODE_0x0_ILLEGAL" TYPE="integer" VALUE="0">
          <DESCRIPTION>&lt;qt&gt;Generate Illegal Instruction Exception for NULL Instruction&lt;/qt&gt;</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="77" NAME="C_FSL_LINKS" TYPE="integer" VALUE="0">
          <DESCRIPTION>Number of Stream Links </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="78" NAME="C_FSL_DATA_SIZE" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="79" NAME="C_USE_EXTENDED_FSL_INSTR" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Additional Stream Instructions</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="80" NAME="C_M0_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="81" NAME="C_S0_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="82" NAME="C_M1_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="83" NAME="C_S1_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="84" NAME="C_M2_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="85" NAME="C_S2_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="86" NAME="C_M3_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="87" NAME="C_S3_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="88" NAME="C_M4_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="89" NAME="C_S4_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="90" NAME="C_M5_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="91" NAME="C_S5_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="92" NAME="C_M6_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="93" NAME="C_S6_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="94" NAME="C_M7_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="95" NAME="C_S7_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="96" NAME="C_M8_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="97" NAME="C_S8_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="98" NAME="C_M9_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="99" NAME="C_S9_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="100" NAME="C_M10_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="101" NAME="C_S10_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="102" NAME="C_M11_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="103" NAME="C_S11_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="104" NAME="C_M12_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="105" NAME="C_S12_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="106" NAME="C_M13_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="107" NAME="C_S13_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="108" NAME="C_M14_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="109" NAME="C_S14_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="110" NAME="C_M15_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="111" NAME="C_S15_AXIS_PROTOCOL" TYPE="string" VALUE="GENERIC"/>
        <PARAMETER MPD_INDEX="112" NAME="C_M0_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="113" NAME="C_S0_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="114" NAME="C_M1_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="115" NAME="C_S1_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="116" NAME="C_M2_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="117" NAME="C_S2_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="118" NAME="C_M3_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="119" NAME="C_S3_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="120" NAME="C_M4_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="121" NAME="C_S4_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="122" NAME="C_M5_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="123" NAME="C_S5_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="124" NAME="C_M6_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="125" NAME="C_S6_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="126" NAME="C_M7_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="127" NAME="C_S7_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="128" NAME="C_M8_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="129" NAME="C_S8_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="130" NAME="C_M9_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="131" NAME="C_S9_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="132" NAME="C_M10_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="133" NAME="C_S10_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="134" NAME="C_M11_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="135" NAME="C_S11_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="136" NAME="C_M12_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="137" NAME="C_S12_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="138" NAME="C_M13_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="139" NAME="C_S13_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="140" NAME="C_M14_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="141" NAME="C_S14_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="142" NAME="C_M15_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="143" NAME="C_S15_AXIS_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER ADDRESS="NONE" MPD_INDEX="144" NAME="C_ICACHE_BASEADDR" TYPE="std_logic_vector" VALUE="0x00000000">
          <DESCRIPTION>Base Address </DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="NONE" MPD_INDEX="145" NAME="C_ICACHE_HIGHADDR" TYPE="std_logic_vector" VALUE="0x3FFFFFFF">
          <DESCRIPTION>High Address </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="146" NAME="C_USE_ICACHE" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Instruction Cache </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="147" NAME="C_ALLOW_ICACHE_WR" TYPE="integer" VALUE="1">
          <DESCRIPTION>Enable Writes</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="148" NAME="C_ADDR_TAG_BITS" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="149" NAME="C_CACHE_BYTE_SIZE" TYPE="integer" VALUE="%memorysize%">
          <DESCRIPTION>Size in Bytes</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="150" NAME="C_ICACHE_USE_FSL" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="151" NAME="C_ICACHE_LINE_LEN" TYPE="integer" VALUE="4">
          <DESCRIPTION>Line Length</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="152" NAME="C_ICACHE_ALWAYS_USED" TYPE="integer" VALUE="0">
          <DESCRIPTION>Use Cache Links for All Memory Accesses </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="153" NAME="C_ICACHE_INTERFACE" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="154" NAME="C_ICACHE_VICTIMS" TYPE="integer" VALUE="0">
          <DESCRIPTION>Number of Victims</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="155" NAME="C_ICACHE_STREAMS" TYPE="integer" VALUE="0">
          <DESCRIPTION>Number of Streams</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="156" NAME="C_ICACHE_FORCE_TAG_LUTRAM" TYPE="integer" VALUE="0">
          <DESCRIPTION>Use Distributed RAM for Tags</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="157" NAME="C_ICACHE_DATA_WIDTH" TYPE="integer" VALUE="0">
          <DESCRIPTION>Data Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="158" NAME="C_M_AXI_IC_SUPPORTS_THREADS" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="159" NAME="C_M_AXI_IC_THREAD_ID_WIDTH" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="160" NAME="C_M_AXI_IC_SUPPORTS_READ" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="161" NAME="C_M_AXI_IC_SUPPORTS_WRITE" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="162" NAME="C_M_AXI_IC_SUPPORTS_NARROW_BURST" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="163" NAME="C_M_AXI_IC_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="164" NAME="C_M_AXI_IC_ADDR_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="165" NAME="C_M_AXI_IC_PROTOCOL" TYPE="string" VALUE="AXI4"/>
        <PARAMETER MPD_INDEX="166" NAME="C_M_AXI_IC_USER_VALUE" TYPE="integer" VALUE="0b11111"/>
        <PARAMETER MPD_INDEX="167" NAME="C_M_AXI_IC_SUPPORTS_USER_SIGNALS" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="168" NAME="C_M_AXI_IC_AWUSER_WIDTH" TYPE="integer" VALUE="5"/>
        <PARAMETER MPD_INDEX="169" NAME="C_M_AXI_IC_ARUSER_WIDTH" TYPE="integer" VALUE="5"/>
        <PARAMETER MPD_INDEX="170" NAME="C_M_AXI_IC_WUSER_WIDTH" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="171" NAME="C_M_AXI_IC_RUSER_WIDTH" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="172" NAME="C_M_AXI_IC_BUSER_WIDTH" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="173" NAME="C_INTERCONNECT_M_AXI_IC_READ_ISSUING" TYPE="integer" VALUE="2"/>
        <PARAMETER ADDRESS="NONE" MPD_INDEX="174" NAME="C_DCACHE_BASEADDR" TYPE="std_logic_vector" VALUE="0x00000000">
          <DESCRIPTION>Base Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="NONE" MPD_INDEX="175" NAME="C_DCACHE_HIGHADDR" TYPE="std_logic_vector" VALUE="0x3FFFFFFF">
          <DESCRIPTION>High Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="176" NAME="C_USE_DCACHE" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Data Cache</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="177" NAME="C_ALLOW_DCACHE_WR" TYPE="integer" VALUE="1">
          <DESCRIPTION>Enable Writes</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="178" NAME="C_DCACHE_ADDR_TAG" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="179" NAME="C_DCACHE_BYTE_SIZE" TYPE="integer" VALUE="%memorysize%">
          <DESCRIPTION>Size in Bytes</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="180" NAME="C_DCACHE_USE_FSL" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="181" NAME="C_DCACHE_LINE_LEN" TYPE="integer" VALUE="4">
          <DESCRIPTION>Line Length</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="182" NAME="C_DCACHE_ALWAYS_USED" TYPE="integer" VALUE="0">
          <DESCRIPTION>Use Cache Links for All Memory Accesses </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="183" NAME="C_DCACHE_INTERFACE" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="184" NAME="C_DCACHE_USE_WRITEBACK" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Write-back Storage Policy</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="185" NAME="C_DCACHE_VICTIMS" TYPE="integer" VALUE="0">
          <DESCRIPTION>Number of Victims</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="186" NAME="C_DCACHE_FORCE_TAG_LUTRAM" TYPE="integer" VALUE="0">
          <DESCRIPTION>Use Distributed RAM for Tags</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="187" NAME="C_DCACHE_DATA_WIDTH" TYPE="integer" VALUE="0">
          <DESCRIPTION>Data Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="188" NAME="C_M_AXI_DC_SUPPORTS_THREADS" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="189" NAME="C_M_AXI_DC_THREAD_ID_WIDTH" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="190" NAME="C_M_AXI_DC_SUPPORTS_READ" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="191" NAME="C_M_AXI_DC_SUPPORTS_WRITE" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="192" NAME="C_M_AXI_DC_SUPPORTS_NARROW_BURST" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="193" NAME="C_M_AXI_DC_DATA_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="194" NAME="C_M_AXI_DC_ADDR_WIDTH" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="195" NAME="C_M_AXI_DC_PROTOCOL" TYPE="string" VALUE="AXI4"/>
        <PARAMETER MPD_INDEX="196" NAME="C_M_AXI_DC_EXCLUSIVE_ACCESS" TYPE="integer" VALUE="0"/>
        <PARAMETER MPD_INDEX="197" NAME="C_M_AXI_DC_USER_VALUE" TYPE="integer" VALUE="0b11111"/>
        <PARAMETER MPD_INDEX="198" NAME="C_M_AXI_DC_SUPPORTS_USER_SIGNALS" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="199" NAME="C_M_AXI_DC_AWUSER_WIDTH" TYPE="integer" VALUE="5"/>
        <PARAMETER MPD_INDEX="200" NAME="C_M_AXI_DC_ARUSER_WIDTH" TYPE="integer" VALUE="5"/>
        <PARAMETER MPD_INDEX="201" NAME="C_M_AXI_DC_WUSER_WIDTH" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="202" NAME="C_M_AXI_DC_RUSER_WIDTH" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="203" NAME="C_M_AXI_DC_BUSER_WIDTH" TYPE="integer" VALUE="1"/>
        <PARAMETER MPD_INDEX="204" NAME="C_INTERCONNECT_M_AXI_DC_READ_ISSUING" TYPE="integer" VALUE="2"/>
        <PARAMETER MPD_INDEX="205" NAME="C_INTERCONNECT_M_AXI_DC_WRITE_ISSUING" TYPE="integer" VALUE="32"/>
        <PARAMETER MPD_INDEX="206" NAME="C_USE_MMU" TYPE="integer" VALUE="0">
          <DESCRIPTION>Memory Management</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="207" NAME="C_MMU_DTLB_SIZE" TYPE="integer" VALUE="4">
          <DESCRIPTION>Data Shadow Translation Look-Aside Buffer Size</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="208" NAME="C_MMU_ITLB_SIZE" TYPE="integer" VALUE="2">
          <DESCRIPTION>Instruction Shadow Translation Look-Aside Buffer Size</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="209" NAME="C_MMU_TLB_ACCESS" TYPE="integer" VALUE="3">
          <DESCRIPTION>Enable Access to Memory Management Special Registers</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="210" NAME="C_MMU_ZONES" TYPE="integer" VALUE="16">
          <DESCRIPTION>Number of Memory Protection Zones</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="211" NAME="C_MMU_PRIVILEGED_INSTR" TYPE="integer" VALUE="0">
          <DESCRIPTION>Privileged Instructions</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="10" MPD_INDEX="212" NAME="C_USE_INTERRUPT" TYPE="integer" VALUE="2"/>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="213" NAME="C_USE_EXT_BRK" TYPE="integer" VALUE="%debug_enabled%"/>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="214" NAME="C_USE_EXT_NM_BRK" TYPE="integer" VALUE="%debug_enabled%"/>
        <PARAMETER MPD_INDEX="215" NAME="C_USE_BRANCH_TARGET_CACHE" TYPE="integer" VALUE="0">
          <DESCRIPTION>Enable Branch Target Cache</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="216" NAME="C_BRANCH_TARGET_CACHE_SIZE" TYPE="integer" VALUE="0">
          <DESCRIPTION>Branch Target Cache Size</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="217" NAME="C_PC_WIDTH" TYPE="integer" VALUE="32"/>
      </PARAMETERS>
      <PORTS>
        <PORT DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="0" MPD_INDEX="2" NAME="MB_RESET" SIGIS="RST" SIGNAME="Reset">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Reset"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="INTERRUPT" DEF_SIGNAME="Interrupt" DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="1" MPD_INDEX="3" NAME="INTERRUPT" SENSITIVITY="LEVEL_HIGH" SIGIS="INTERRUPT" SIGNAME="INTC_IRQ">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[INTERRUPT]" INSTANCE="iomodule_0" PORT="INTC_IRQ"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="INTERRUPT" DEF_SIGNAME="Interrupt_Address" DIR="I" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LEFT="0" LSB="31" MHS_INDEX="2" MPD_INDEX="4" MSB="0" NAME="INTERRUPT_ADDRESS" RIGHT="31" SIGNAME="Interrupt_Address" VECFORMULA="[0:31]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[INTERRUPT]" INSTANCE="iomodule_0" PORT="INTC_Interrupt_Address"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="INTERRUPT" DEF_SIGNAME="Interrupt_Ack" DIR="O" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LEFT="0" LSB="1" MHS_INDEX="3" MPD_INDEX="5" MSB="0" NAME="INTERRUPT_ACK" RIGHT="1" SIGNAME="Interrupt_Ack" VECFORMULA="[0:1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[INTERRUPT]" INSTANCE="iomodule_0" PORT="INTC_Processor_Ack"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DPLB:IPLB:DLMB:ILMB:M_AXI_DP:M_AXI_IP:M_AXI_DC:M_AXI_IC:M0_AXIS:S0_AXIS:M1_AXIS:S1_AXIS:M2_AXIS:S2_AXIS:M3_AXIS:S3_AXIS:M4_AXIS:S4_AXIS:M5_AXIS:S5_AXIS:M6_AXIS:S6_AXIS:M7_AXIS:S7_AXIS:M8_AXIS:S8_AXIS:M9_AXIS:S9_AXIS:M10_AXIS:S10_AXIS:M11_AXIS:S11_AXIS:M12_AXIS:S12_AXIS:M13_AXIS:S13_AXIS:M14_AXIS:S14_AXIS:M15_AXIS:S15_AXIS" CLKFREQUENCY="%freq%" DEF_SIGNAME="__BUS__" DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="4" MPD_INDEX="0" NAME="CLK" SIGIS="CLK" SIGNAME="Clk">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Clk"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_Instruction" DIR="O" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LEFT="0" LSB="31" MHS_INDEX="5" MPD_INDEX="259" MSB="0" NAME="Trace_Instruction" RIGHT="31" SIGNAME="Trace_Instruction" VECFORMULA="[0:31]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_Instruction"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_Valid_Instr" DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="6" MPD_INDEX="260" NAME="Trace_Valid_Instr" SIGNAME="Trace_Valid_Instr">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_Valid_Instr"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_PC" DIR="O" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LEFT="0" LSB="31" MHS_INDEX="7" MPD_INDEX="261" MSB="0" NAME="Trace_PC" RIGHT="31" SIGNAME="Trace_PC" VECFORMULA="[0:31]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_PC"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_Reg_Write" DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="8" MPD_INDEX="262" NAME="Trace_Reg_Write" SIGNAME="Trace_Reg_Write">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_Reg_Write"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_Reg_Addr" DIR="O" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LEFT="0" LSB="4" MHS_INDEX="9" MPD_INDEX="263" MSB="0" NAME="Trace_Reg_Addr" RIGHT="4" SIGNAME="Trace_Reg_Addr" VECFORMULA="[0:4]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_Reg_Addr"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_MSR_Reg" DIR="O" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LEFT="0" LSB="14" MHS_INDEX="10" MPD_INDEX="264" MSB="0" NAME="Trace_MSR_Reg" RIGHT="14" SIGNAME="Trace_MSR_Reg" VECFORMULA="[0:14]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_MSR_Reg"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_New_Reg_Value" DIR="O" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LEFT="0" LSB="31" MHS_INDEX="11" MPD_INDEX="266" MSB="0" NAME="Trace_New_Reg_Value" RIGHT="31" SIGNAME="Trace_New_Reg_Value" VECFORMULA="[0:31]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_New_Reg_Value"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_Jump_Taken" DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="12" MPD_INDEX="269" NAME="Trace_Jump_Taken" SIGNAME="Trace_Jump_Taken">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_Jump_Taken"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_Delay_Slot" DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="13" MPD_INDEX="270" NAME="Trace_Delay_Slot" SIGNAME="Trace_Delay_Slot">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_Delay_Slot"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_Data_Address" DIR="O" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LEFT="0" LSB="31" MHS_INDEX="14" MPD_INDEX="271" MSB="0" NAME="Trace_Data_Address" RIGHT="31" SIGNAME="Trace_Data_Address" VECFORMULA="[0:31]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_Data_Address"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_Data_Access" DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="15" MPD_INDEX="272" NAME="Trace_Data_Access" SIGNAME="Trace_Data_Access">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_Data_Access"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_Data_Read" DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="16" MPD_INDEX="273" NAME="Trace_Data_Read" SIGNAME="Trace_Data_Read">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_Data_Read"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_Data_Write" DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="17" MPD_INDEX="274" NAME="Trace_Data_Write" SIGNAME="Trace_Data_Write">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_Data_Write"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_Data_Write_Value" DIR="O" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LEFT="0" LSB="31" MHS_INDEX="18" MPD_INDEX="275" MSB="0" NAME="Trace_Data_Write_Value" RIGHT="31" SIGNAME="Trace_Data_Write_Value" VECFORMULA="[0:31]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_Data_Write_Value"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_Data_Byte_Enable" DIR="O" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LEFT="0" LSB="3" MHS_INDEX="19" MPD_INDEX="276" MSB="0" NAME="Trace_Data_Byte_Enable" RIGHT="3" SIGNAME="Trace_Data_Byte_Enable" VECFORMULA="[0:3]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_Data_Byte_Enable"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="Trace_MB_Halted" DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="20" MPD_INDEX="287" NAME="Trace_MB_Halted" SIGNAME="Trace_MB_Halted">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Trace_MB_Halted"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DLMB:ILMB" DEF_SIGNAME="dlmb_LMB_Rst" DIR="I" MPD_INDEX="1" NAME="RESET" SIGIS="RST" SIGNAME="dlmb_LMB_Rst">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_RST"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="Ext_BRK" DIR="I" MPD_INDEX="6" NAME="EXT_BRK" SIGNAME="Ext_BRK">
          <CONNECTIONS>
            <CONNECTION INSTANCE="mdm_0" PORT="Ext_BRK"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="Ext_NM_BRK" DIR="I" MPD_INDEX="7" NAME="EXT_NM_BRK" SIGNAME="Ext_NM_BRK">
          <CONNECTIONS>
            <CONNECTION INSTANCE="mdm_0" PORT="Ext_NM_BRK"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" MPD_INDEX="8" NAME="DBG_STOP" SIGNAME="__NOC__"/>
        <PORT DIR="O" MPD_INDEX="9" NAME="MB_Halted" SIGNAME="__NOC__"/>
        <PORT DIR="O" MPD_INDEX="10" NAME="MB_Error" SIGNAME="__NOC__"/>
        <PORT DIR="O" ENDIAN="BIG" LEFT="0" LSB="4095" MPD_INDEX="11" MSB="0" NAME="LOCKSTEP_MASTER_OUT" RIGHT="4095" SIGNAME="__NOC__" VECFORMULA="[0:4095]"/>
        <PORT DIR="I" ENDIAN="BIG" LEFT="0" LSB="4095" MPD_INDEX="12" MSB="0" NAME="LOCKSTEP_SLAVE_IN" RIGHT="4095" SIGNAME="__NOC__" VECFORMULA="[0:4095]"/>
        <PORT DIR="O" ENDIAN="BIG" LEFT="0" LSB="4095" MPD_INDEX="13" MSB="0" NAME="LOCKSTEP_OUT" RIGHT="4095" SIGNAME="__NOC__" VECFORMULA="[0:4095]"/>
        <PORT BUS="ILMB" DEF_SIGNAME="ilmb_LMB_ReadDBus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="14" MSB="0" NAME="INSTR" RIGHT="31" SIGNAME="ilmb_LMB_ReadDBus" VECFORMULA="[0:31]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="LMB_READDBUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="ILMB" DEF_SIGNAME="ilmb_LMB_Ready" DIR="I" MPD_INDEX="15" NAME="IREADY" SIGNAME="ilmb_LMB_Ready">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="LMB_READY"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="ILMB" DEF_SIGNAME="ilmb_LMB_Wait" DIR="I" MPD_INDEX="16" NAME="IWAIT" SIGNAME="ilmb_LMB_Wait">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="LMB_WAIT"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="ILMB" DEF_SIGNAME="ilmb_LMB_CE" DIR="I" MPD_INDEX="17" NAME="ICE" SIGNAME="ilmb_LMB_CE">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="LMB_CE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="ILMB" DEF_SIGNAME="ilmb_LMB_UE" DIR="I" MPD_INDEX="18" NAME="IUE" SIGNAME="ilmb_LMB_UE">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="LMB_UE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="ILMB" DEF_SIGNAME="ilmb_M_ABus" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="19" MSB="0" NAME="INSTR_ADDR" RIGHT="31" SIGNAME="ilmb_M_ABus" VECFORMULA="[0:31]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="M_ABUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="ILMB" DEF_SIGNAME="ilmb_M_ReadStrobe" DIR="O" MPD_INDEX="20" NAME="IFETCH" SIGNAME="ilmb_M_ReadStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="M_READSTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="ILMB" DEF_SIGNAME="ilmb_M_AddrStrobe" DIR="O" MPD_INDEX="21" NAME="I_AS" SIGNAME="ilmb_M_AddrStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="M_ADDRSTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="22" NAME="IPLB_M_ABort" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="23" MSB="0" NAME="IPLB_M_ABus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="24" MSB="0" NAME="IPLB_M_UABus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="25" MSB="0" NAME="IPLB_M_BE" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:(C_IPLB_DWIDTH-1)/8]"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="26" NAME="IPLB_M_busLock" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="27" NAME="IPLB_M_lockErr" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="28" MSB="0" NAME="IPLB_M_MSize" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="29" MSB="0" NAME="IPLB_M_priority" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="30" NAME="IPLB_M_rdBurst" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="31" NAME="IPLB_M_request" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="32" NAME="IPLB_M_RNW" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="33" MSB="0" NAME="IPLB_M_size" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:3]"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="15" MPD_INDEX="34" MSB="0" NAME="IPLB_M_TAttribute" RIGHT="15" SIGNAME="__NOC__" VECFORMULA="[0:15]"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="2" MPD_INDEX="35" MSB="0" NAME="IPLB_M_type" RIGHT="2" SIGNAME="__NOC__" VECFORMULA="[0:2]"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="36" NAME="IPLB_M_wrBurst" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="37" MSB="0" NAME="IPLB_M_wrDBus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_IPLB_DWIDTH-1]"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="38" NAME="IPLB_MBusy" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="39" NAME="IPLB_MRdErr" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="40" NAME="IPLB_MWrErr" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="41" NAME="IPLB_MIRQ" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="42" NAME="IPLB_MWrBTerm" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="43" NAME="IPLB_MWrDAck" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="44" NAME="IPLB_MAddrAck" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="45" NAME="IPLB_MRdBTerm" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="46" NAME="IPLB_MRdDAck" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="47" MSB="0" NAME="IPLB_MRdDBus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_IPLB_DWIDTH-1]"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="48" MSB="0" NAME="IPLB_MRdWdAddr" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:3]"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="49" NAME="IPLB_MRearbitrate" SIGNAME="__NOC__"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="50" MSB="0" NAME="IPLB_MSSize" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="IPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="51" NAME="IPLB_MTimeout" SIGNAME="__NOC__"/>
        <PORT BUS="DLMB" DEF_SIGNAME="dlmb_LMB_ReadDBus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="52" MSB="0" NAME="DATA_READ" RIGHT="31" SIGNAME="dlmb_LMB_ReadDBus" VECFORMULA="[0:31]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_READDBUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DLMB" DEF_SIGNAME="dlmb_LMB_Ready" DIR="I" MPD_INDEX="53" NAME="DREADY" SIGNAME="dlmb_LMB_Ready">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_READY"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DLMB" DEF_SIGNAME="dlmb_LMB_Wait" DIR="I" MPD_INDEX="54" NAME="DWAIT" SIGNAME="dlmb_LMB_Wait">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_WAIT"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DLMB" DEF_SIGNAME="dlmb_LMB_CE" DIR="I" MPD_INDEX="55" NAME="DCE" SIGNAME="dlmb_LMB_CE">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_CE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DLMB" DEF_SIGNAME="dlmb_LMB_UE" DIR="I" MPD_INDEX="56" NAME="DUE" SIGNAME="dlmb_LMB_UE">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_UE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DLMB" DEF_SIGNAME="dlmb_M_DBus" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="57" MSB="0" NAME="DATA_WRITE" RIGHT="31" SIGNAME="dlmb_M_DBus" VECFORMULA="[0:31]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="M_DBUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DLMB" DEF_SIGNAME="dlmb_M_ABus" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="58" MSB="0" NAME="DATA_ADDR" RIGHT="31" SIGNAME="dlmb_M_ABus" VECFORMULA="[0:31]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="M_ABUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DLMB" DEF_SIGNAME="dlmb_M_AddrStrobe" DIR="O" MPD_INDEX="59" NAME="D_AS" SIGNAME="dlmb_M_AddrStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="M_ADDRSTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DLMB" DEF_SIGNAME="dlmb_M_ReadStrobe" DIR="O" MPD_INDEX="60" NAME="READ_STROBE" SIGNAME="dlmb_M_ReadStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="M_READSTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DLMB" DEF_SIGNAME="dlmb_M_WriteStrobe" DIR="O" MPD_INDEX="61" NAME="WRITE_STROBE" SIGNAME="dlmb_M_WriteStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="M_WRITESTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DLMB" DEF_SIGNAME="dlmb_M_BE" DIR="O" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="62" MSB="0" NAME="BYTE_ENABLE" RIGHT="3" SIGNAME="dlmb_M_BE" VECFORMULA="[0:3]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="M_BE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="63" NAME="DPLB_M_ABort" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="64" MSB="0" NAME="DPLB_M_ABus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="65" MSB="0" NAME="DPLB_M_UABus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="66" MSB="0" NAME="DPLB_M_BE" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:(C_DPLB_DWIDTH-1)/8]"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="67" NAME="DPLB_M_busLock" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="68" NAME="DPLB_M_lockErr" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="69" MSB="0" NAME="DPLB_M_MSize" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="70" MSB="0" NAME="DPLB_M_priority" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="71" NAME="DPLB_M_rdBurst" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="72" NAME="DPLB_M_request" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="73" NAME="DPLB_M_RNW" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="74" MSB="0" NAME="DPLB_M_size" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:3]"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="15" MPD_INDEX="75" MSB="0" NAME="DPLB_M_TAttribute" RIGHT="15" SIGNAME="__NOC__" VECFORMULA="[0:15]"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="2" MPD_INDEX="76" MSB="0" NAME="DPLB_M_type" RIGHT="2" SIGNAME="__NOC__" VECFORMULA="[0:2]"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="77" NAME="DPLB_M_wrBurst" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="78" MSB="0" NAME="DPLB_M_wrDBus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_DPLB_DWIDTH-1]"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="79" NAME="DPLB_MBusy" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="80" NAME="DPLB_MRdErr" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="81" NAME="DPLB_MWrErr" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="82" NAME="DPLB_MIRQ" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="83" NAME="DPLB_MWrBTerm" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="84" NAME="DPLB_MWrDAck" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="85" NAME="DPLB_MAddrAck" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="86" NAME="DPLB_MRdBTerm" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="87" NAME="DPLB_MRdDAck" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="88" MSB="0" NAME="DPLB_MRdDBus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_DPLB_DWIDTH-1]"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="89" MSB="0" NAME="DPLB_MRdWdAddr" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:3]"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="90" NAME="DPLB_MRearbitrate" SIGNAME="__NOC__"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="91" MSB="0" NAME="DPLB_MSSize" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="DPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="92" NAME="DPLB_MTimeout" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="93" NAME="M_AXI_IP_AWID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IP_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="94" MSB="31" NAME="M_AXI_IP_AWADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IP_ADDR_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="7" LSB="0" MPD_INDEX="95" MSB="7" NAME="M_AXI_IP_AWLEN" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[7:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="96" MSB="2" NAME="M_AXI_IP_AWSIZE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="97" MSB="1" NAME="M_AXI_IP_AWBURST" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="98" NAME="M_AXI_IP_AWLOCK" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="99" MSB="3" NAME="M_AXI_IP_AWCACHE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="100" MSB="2" NAME="M_AXI_IP_AWPROT" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="101" MSB="3" NAME="M_AXI_IP_AWQOS" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="102" NAME="M_AXI_IP_AWVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="103" NAME="M_AXI_IP_AWREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="104" MSB="31" NAME="M_AXI_IP_WDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IP_DATA_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="105" MSB="3" NAME="M_AXI_IP_WSTRB" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[((C_M_AXI_IP_DATA_WIDTH/8)-1):0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="106" NAME="M_AXI_IP_WLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="107" NAME="M_AXI_IP_WVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="108" NAME="M_AXI_IP_WREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="109" NAME="M_AXI_IP_BID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IP_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="110" MSB="1" NAME="M_AXI_IP_BRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="111" NAME="M_AXI_IP_BVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="112" NAME="M_AXI_IP_BREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="113" NAME="M_AXI_IP_ARID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IP_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="114" MSB="31" NAME="M_AXI_IP_ARADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IP_ADDR_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="7" LSB="0" MPD_INDEX="115" MSB="7" NAME="M_AXI_IP_ARLEN" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[7:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="116" MSB="2" NAME="M_AXI_IP_ARSIZE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="117" MSB="1" NAME="M_AXI_IP_ARBURST" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="118" NAME="M_AXI_IP_ARLOCK" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="119" MSB="3" NAME="M_AXI_IP_ARCACHE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="120" MSB="2" NAME="M_AXI_IP_ARPROT" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="121" MSB="3" NAME="M_AXI_IP_ARQOS" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="122" NAME="M_AXI_IP_ARVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="123" NAME="M_AXI_IP_ARREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="124" NAME="M_AXI_IP_RID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IP_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="125" MSB="31" NAME="M_AXI_IP_RDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IP_DATA_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="126" MSB="1" NAME="M_AXI_IP_RRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="127" NAME="M_AXI_IP_RLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="128" NAME="M_AXI_IP_RVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="129" NAME="M_AXI_IP_RREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="130" NAME="M_AXI_DP_AWID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DP_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="131" MSB="31" NAME="M_AXI_DP_AWADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DP_ADDR_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="7" LSB="0" MPD_INDEX="132" MSB="7" NAME="M_AXI_DP_AWLEN" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[7:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="133" MSB="2" NAME="M_AXI_DP_AWSIZE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="134" MSB="1" NAME="M_AXI_DP_AWBURST" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="135" NAME="M_AXI_DP_AWLOCK" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="136" MSB="3" NAME="M_AXI_DP_AWCACHE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="137" MSB="2" NAME="M_AXI_DP_AWPROT" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="138" MSB="3" NAME="M_AXI_DP_AWQOS" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="139" NAME="M_AXI_DP_AWVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="140" NAME="M_AXI_DP_AWREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="141" MSB="31" NAME="M_AXI_DP_WDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DP_DATA_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="142" MSB="3" NAME="M_AXI_DP_WSTRB" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[((C_M_AXI_DP_DATA_WIDTH/8)-1):0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="143" NAME="M_AXI_DP_WLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="144" NAME="M_AXI_DP_WVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="145" NAME="M_AXI_DP_WREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="146" NAME="M_AXI_DP_BID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DP_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="147" MSB="1" NAME="M_AXI_DP_BRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="148" NAME="M_AXI_DP_BVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="149" NAME="M_AXI_DP_BREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="150" NAME="M_AXI_DP_ARID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DP_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="151" MSB="31" NAME="M_AXI_DP_ARADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DP_ADDR_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="7" LSB="0" MPD_INDEX="152" MSB="7" NAME="M_AXI_DP_ARLEN" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[7:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="153" MSB="2" NAME="M_AXI_DP_ARSIZE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="154" MSB="1" NAME="M_AXI_DP_ARBURST" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="155" NAME="M_AXI_DP_ARLOCK" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="156" MSB="3" NAME="M_AXI_DP_ARCACHE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="157" MSB="2" NAME="M_AXI_DP_ARPROT" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="158" MSB="3" NAME="M_AXI_DP_ARQOS" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="159" NAME="M_AXI_DP_ARVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="160" NAME="M_AXI_DP_ARREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="161" NAME="M_AXI_DP_RID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DP_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="162" MSB="31" NAME="M_AXI_DP_RDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DP_DATA_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="163" MSB="1" NAME="M_AXI_DP_RRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="164" NAME="M_AXI_DP_RLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="165" NAME="M_AXI_DP_RVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DP" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="166" NAME="M_AXI_DP_RREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="167" NAME="M_AXI_IC_AWID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IC_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="168" MSB="31" NAME="M_AXI_IC_AWADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IC_ADDR_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="7" LSB="0" MPD_INDEX="169" MSB="7" NAME="M_AXI_IC_AWLEN" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[7:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="170" MSB="2" NAME="M_AXI_IC_AWSIZE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="171" MSB="1" NAME="M_AXI_IC_AWBURST" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="172" NAME="M_AXI_IC_AWLOCK" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="173" MSB="3" NAME="M_AXI_IC_AWCACHE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="174" MSB="2" NAME="M_AXI_IC_AWPROT" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="175" MSB="3" NAME="M_AXI_IC_AWQOS" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="176" NAME="M_AXI_IC_AWVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="177" NAME="M_AXI_IC_AWREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="4" LSB="0" MPD_INDEX="178" MSB="4" NAME="M_AXI_IC_AWUSER" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IC_AWUSER_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="179" MSB="31" NAME="M_AXI_IC_WDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IC_DATA_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="180" MSB="3" NAME="M_AXI_IC_WSTRB" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[((C_M_AXI_IC_DATA_WIDTH/8)-1):0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="181" NAME="M_AXI_IC_WLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="182" NAME="M_AXI_IC_WVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="183" NAME="M_AXI_IC_WREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="184" NAME="M_AXI_IC_WUSER" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IC_WUSER_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="185" NAME="M_AXI_IC_BID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IC_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="186" MSB="1" NAME="M_AXI_IC_BRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="187" NAME="M_AXI_IC_BVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="188" NAME="M_AXI_IC_BREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="189" NAME="M_AXI_IC_BUSER" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IC_BUSER_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="190" NAME="M_AXI_IC_ARID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IC_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="191" MSB="31" NAME="M_AXI_IC_ARADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IC_ADDR_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="7" LSB="0" MPD_INDEX="192" MSB="7" NAME="M_AXI_IC_ARLEN" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[7:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="193" MSB="2" NAME="M_AXI_IC_ARSIZE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="194" MSB="1" NAME="M_AXI_IC_ARBURST" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="195" NAME="M_AXI_IC_ARLOCK" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="196" MSB="3" NAME="M_AXI_IC_ARCACHE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="197" MSB="2" NAME="M_AXI_IC_ARPROT" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="198" MSB="3" NAME="M_AXI_IC_ARQOS" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="199" NAME="M_AXI_IC_ARVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="200" NAME="M_AXI_IC_ARREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="4" LSB="0" MPD_INDEX="201" MSB="4" NAME="M_AXI_IC_ARUSER" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IC_ARUSER_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="202" NAME="M_AXI_IC_RID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IC_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="203" MSB="31" NAME="M_AXI_IC_RDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IC_DATA_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="204" MSB="1" NAME="M_AXI_IC_RRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="205" NAME="M_AXI_IC_RLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="206" NAME="M_AXI_IC_RVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="207" NAME="M_AXI_IC_RREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_IC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="208" NAME="M_AXI_IC_RUSER" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_IC_RUSER_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="209" NAME="M_AXI_DC_AWID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DC_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="210" MSB="31" NAME="M_AXI_DC_AWADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DC_ADDR_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="7" LSB="0" MPD_INDEX="211" MSB="7" NAME="M_AXI_DC_AWLEN" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[7:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="212" MSB="2" NAME="M_AXI_DC_AWSIZE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="213" MSB="1" NAME="M_AXI_DC_AWBURST" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="214" NAME="M_AXI_DC_AWLOCK" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="215" MSB="3" NAME="M_AXI_DC_AWCACHE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="216" MSB="2" NAME="M_AXI_DC_AWPROT" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="217" MSB="3" NAME="M_AXI_DC_AWQOS" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="218" NAME="M_AXI_DC_AWVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="219" NAME="M_AXI_DC_AWREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="4" LSB="0" MPD_INDEX="220" MSB="4" NAME="M_AXI_DC_AWUSER" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DC_AWUSER_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="221" MSB="31" NAME="M_AXI_DC_WDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DC_DATA_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="222" MSB="3" NAME="M_AXI_DC_WSTRB" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[((C_M_AXI_DC_DATA_WIDTH/8)-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="223" NAME="M_AXI_DC_WLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="224" NAME="M_AXI_DC_WVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="225" NAME="M_AXI_DC_WREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="226" NAME="M_AXI_DC_WUSER" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DC_WUSER_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="227" NAME="M_AXI_DC_BID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DC_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="228" MSB="1" NAME="M_AXI_DC_BRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="229" NAME="M_AXI_DC_BVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="230" NAME="M_AXI_DC_BREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="231" NAME="M_AXI_DC_BUSER" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DC_BUSER_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="232" NAME="M_AXI_DC_ARID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DC_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="233" MSB="31" NAME="M_AXI_DC_ARADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DC_ADDR_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="7" LSB="0" MPD_INDEX="234" MSB="7" NAME="M_AXI_DC_ARLEN" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[7:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="235" MSB="2" NAME="M_AXI_DC_ARSIZE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="236" MSB="1" NAME="M_AXI_DC_ARBURST" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="237" NAME="M_AXI_DC_ARLOCK" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="238" MSB="3" NAME="M_AXI_DC_ARCACHE" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="2" LSB="0" MPD_INDEX="239" MSB="2" NAME="M_AXI_DC_ARPROT" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[2:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="240" MSB="3" NAME="M_AXI_DC_ARQOS" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[3:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="241" NAME="M_AXI_DC_ARVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="242" NAME="M_AXI_DC_ARREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="4" LSB="0" MPD_INDEX="243" MSB="4" NAME="M_AXI_DC_ARUSER" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DC_ARUSER_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="244" NAME="M_AXI_DC_RID" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DC_THREAD_ID_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="245" MSB="31" NAME="M_AXI_DC_RDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DC_DATA_WIDTH-1):0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="246" MSB="1" NAME="M_AXI_DC_RRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="247" NAME="M_AXI_DC_RLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="248" NAME="M_AXI_DC_RVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="249" NAME="M_AXI_DC_RREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M_AXI_DC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="250" NAME="M_AXI_DC_RUSER" SIGNAME="__NOC__" VECFORMULA="[(C_M_AXI_DC_RUSER_WIDTH-1):0]"/>
        <PORT BUS="DEBUG" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_Clk" DIR="I" MPD_INDEX="251" NAME="DBG_CLK" SIGNAME="mdm_0_MBDEBUG_0_Dbg_Clk">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[MBDEBUG_0]" INSTANCE="mdm_0" PORT="Dbg_Clk_0"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DEBUG" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_TDI" DIR="I" MPD_INDEX="252" NAME="DBG_TDI" SIGNAME="mdm_0_MBDEBUG_0_Dbg_TDI">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[MBDEBUG_0]" INSTANCE="mdm_0" PORT="Dbg_TDI_0"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DEBUG" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_TDO" DIR="O" MPD_INDEX="253" NAME="DBG_TDO" SIGNAME="mdm_0_MBDEBUG_0_Dbg_TDO">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[MBDEBUG_0]" INSTANCE="mdm_0" PORT="Dbg_TDO_0"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DEBUG" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_Reg_En" DIR="I" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="254" MSB="0" NAME="DBG_REG_EN" RIGHT="7" SIGNAME="mdm_0_MBDEBUG_0_Dbg_Reg_En" VECFORMULA="[0:7]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[MBDEBUG_0]" INSTANCE="mdm_0" PORT="Dbg_Reg_En_0"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DEBUG" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_Shift" DIR="I" MPD_INDEX="255" NAME="DBG_SHIFT" SIGNAME="mdm_0_MBDEBUG_0_Dbg_Shift">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[MBDEBUG_0]" INSTANCE="mdm_0" PORT="Dbg_Shift_0"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DEBUG" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_Capture" DIR="I" MPD_INDEX="256" NAME="DBG_CAPTURE" SIGNAME="mdm_0_MBDEBUG_0_Dbg_Capture">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[MBDEBUG_0]" INSTANCE="mdm_0" PORT="Dbg_Capture_0"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DEBUG" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_Update" DIR="I" MPD_INDEX="257" NAME="DBG_UPDATE" SIGNAME="mdm_0_MBDEBUG_0_Dbg_Update">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[MBDEBUG_0]" INSTANCE="mdm_0" PORT="Dbg_Update_0"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="DEBUG" DEF_SIGNAME="mdm_0_MBDEBUG_0_Debug_Rst" DIR="I" MPD_INDEX="258" NAME="DEBUG_RST" SIGIS="RST" SIGNAME="mdm_0_MBDEBUG_0_Debug_Rst">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[MBDEBUG_0]" INSTANCE="mdm_0" PORT="Dbg_Rst_0"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="265" MSB="0" NAME="Trace_PID_Reg" RIGHT="7" SIGNAME="__NOC__" VECFORMULA="[0:7]"/>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="267" NAME="Trace_Exception_Taken" SIGNAME="__NOC__"/>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="4" MPD_INDEX="268" MSB="0" NAME="Trace_Exception_Kind" RIGHT="4" SIGNAME="__NOC__" VECFORMULA="[0:4]"/>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="277" NAME="Trace_DCache_Req" SIGNAME="__NOC__"/>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="278" NAME="Trace_DCache_Hit" SIGNAME="__NOC__"/>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="279" NAME="Trace_DCache_Rdy" SIGNAME="__NOC__"/>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="280" NAME="Trace_DCache_Read" SIGNAME="__NOC__"/>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="281" NAME="Trace_ICache_Req" SIGNAME="__NOC__"/>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="282" NAME="Trace_ICache_Hit" SIGNAME="__NOC__"/>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="283" NAME="Trace_ICache_Rdy" SIGNAME="__NOC__"/>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="284" NAME="Trace_OF_PipeRun" SIGNAME="__NOC__"/>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="285" NAME="Trace_EX_PipeRun" SIGNAME="__NOC__"/>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="286" NAME="Trace_MEM_PipeRun" SIGNAME="__NOC__"/>
        <PORT BUS="TRACE" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="288" NAME="Trace_Jump_Hit" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL0:DRFSL0" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="289" NAME="FSL0_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL0:DRFSL0" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="290" NAME="FSL0_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL0:DRFSL0" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="291" MSB="0" NAME="FSL0_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL0:DRFSL0" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="292" NAME="FSL0_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL0:DRFSL0" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="293" NAME="FSL0_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL0:DWFSL0" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="294" NAME="FSL0_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL0:DWFSL0" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="295" NAME="FSL0_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL0:DWFSL0" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="296" MSB="0" NAME="FSL0_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL0:DWFSL0" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="297" NAME="FSL0_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL0:DWFSL0" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="298" NAME="FSL0_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL1:DRFSL1" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="299" NAME="FSL1_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL1:DRFSL1" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="300" NAME="FSL1_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL1:DRFSL1" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="301" MSB="0" NAME="FSL1_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL1:DRFSL1" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="302" NAME="FSL1_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL1:DRFSL1" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="303" NAME="FSL1_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL1:DWFSL1" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="304" NAME="FSL1_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL1:DWFSL1" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="305" NAME="FSL1_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL1:DWFSL1" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="306" MSB="0" NAME="FSL1_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL1:DWFSL1" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="307" NAME="FSL1_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL1:DWFSL1" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="308" NAME="FSL1_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL2:DRFSL2" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="309" NAME="FSL2_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL2:DRFSL2" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="310" NAME="FSL2_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL2:DRFSL2" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="311" MSB="0" NAME="FSL2_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL2:DRFSL2" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="312" NAME="FSL2_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL2:DRFSL2" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="313" NAME="FSL2_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL2:DWFSL2" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="314" NAME="FSL2_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL2:DWFSL2" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="315" NAME="FSL2_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL2:DWFSL2" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="316" MSB="0" NAME="FSL2_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL2:DWFSL2" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="317" NAME="FSL2_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL2:DWFSL2" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="318" NAME="FSL2_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL3:DRFSL3" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="319" NAME="FSL3_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL3:DRFSL3" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="320" NAME="FSL3_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL3:DRFSL3" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="321" MSB="0" NAME="FSL3_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL3:DRFSL3" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="322" NAME="FSL3_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL3:DRFSL3" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="323" NAME="FSL3_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL3:DWFSL3" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="324" NAME="FSL3_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL3:DWFSL3" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="325" NAME="FSL3_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL3:DWFSL3" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="326" MSB="0" NAME="FSL3_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL3:DWFSL3" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="327" NAME="FSL3_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL3:DWFSL3" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="328" NAME="FSL3_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL4:DRFSL4" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="329" NAME="FSL4_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL4:DRFSL4" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="330" NAME="FSL4_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL4:DRFSL4" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="331" MSB="0" NAME="FSL4_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL4:DRFSL4" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="332" NAME="FSL4_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL4:DRFSL4" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="333" NAME="FSL4_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL4:DWFSL4" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="334" NAME="FSL4_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL4:DWFSL4" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="335" NAME="FSL4_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL4:DWFSL4" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="336" MSB="0" NAME="FSL4_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL4:DWFSL4" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="337" NAME="FSL4_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL4:DWFSL4" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="338" NAME="FSL4_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL5:DRFSL5" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="339" NAME="FSL5_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL5:DRFSL5" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="340" NAME="FSL5_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL5:DRFSL5" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="341" MSB="0" NAME="FSL5_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL5:DRFSL5" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="342" NAME="FSL5_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL5:DRFSL5" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="343" NAME="FSL5_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL5:DWFSL5" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="344" NAME="FSL5_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL5:DWFSL5" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="345" NAME="FSL5_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL5:DWFSL5" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="346" MSB="0" NAME="FSL5_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL5:DWFSL5" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="347" NAME="FSL5_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL5:DWFSL5" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="348" NAME="FSL5_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL6:DRFSL6" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="349" NAME="FSL6_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL6:DRFSL6" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="350" NAME="FSL6_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL6:DRFSL6" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="351" MSB="0" NAME="FSL6_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL6:DRFSL6" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="352" NAME="FSL6_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL6:DRFSL6" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="353" NAME="FSL6_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL6:DWFSL6" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="354" NAME="FSL6_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL6:DWFSL6" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="355" NAME="FSL6_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL6:DWFSL6" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="356" MSB="0" NAME="FSL6_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL6:DWFSL6" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="357" NAME="FSL6_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL6:DWFSL6" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="358" NAME="FSL6_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL7:DRFSL7" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="359" NAME="FSL7_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL7:DRFSL7" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="360" NAME="FSL7_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL7:DRFSL7" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="361" MSB="0" NAME="FSL7_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL7:DRFSL7" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="362" NAME="FSL7_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL7:DRFSL7" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="363" NAME="FSL7_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL7:DWFSL7" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="364" NAME="FSL7_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL7:DWFSL7" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="365" NAME="FSL7_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL7:DWFSL7" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="366" MSB="0" NAME="FSL7_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL7:DWFSL7" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="367" NAME="FSL7_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL7:DWFSL7" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="368" NAME="FSL7_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL8:DRFSL8" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="369" NAME="FSL8_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL8:DRFSL8" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="370" NAME="FSL8_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL8:DRFSL8" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="371" MSB="0" NAME="FSL8_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL8:DRFSL8" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="372" NAME="FSL8_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL8:DRFSL8" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="373" NAME="FSL8_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL8:DWFSL8" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="374" NAME="FSL8_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL8:DWFSL8" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="375" NAME="FSL8_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL8:DWFSL8" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="376" MSB="0" NAME="FSL8_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL8:DWFSL8" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="377" NAME="FSL8_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL8:DWFSL8" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="378" NAME="FSL8_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL9:DRFSL9" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="379" NAME="FSL9_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL9:DRFSL9" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="380" NAME="FSL9_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL9:DRFSL9" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="381" MSB="0" NAME="FSL9_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL9:DRFSL9" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="382" NAME="FSL9_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL9:DRFSL9" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="383" NAME="FSL9_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL9:DWFSL9" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="384" NAME="FSL9_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL9:DWFSL9" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="385" NAME="FSL9_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL9:DWFSL9" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="386" MSB="0" NAME="FSL9_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL9:DWFSL9" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="387" NAME="FSL9_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL9:DWFSL9" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="388" NAME="FSL9_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL10:DRFSL10" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="389" NAME="FSL10_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL10:DRFSL10" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="390" NAME="FSL10_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL10:DRFSL10" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="391" MSB="0" NAME="FSL10_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL10:DRFSL10" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="392" NAME="FSL10_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL10:DRFSL10" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="393" NAME="FSL10_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL10:DWFSL10" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="394" NAME="FSL10_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL10:DWFSL10" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="395" NAME="FSL10_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL10:DWFSL10" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="396" MSB="0" NAME="FSL10_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL10:DWFSL10" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="397" NAME="FSL10_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL10:DWFSL10" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="398" NAME="FSL10_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL11:DRFSL11" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="399" NAME="FSL11_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL11:DRFSL11" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="400" NAME="FSL11_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL11:DRFSL11" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="401" MSB="0" NAME="FSL11_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL11:DRFSL11" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="402" NAME="FSL11_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL11:DRFSL11" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="403" NAME="FSL11_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL11:DWFSL11" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="404" NAME="FSL11_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL11:DWFSL11" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="405" NAME="FSL11_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL11:DWFSL11" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="406" MSB="0" NAME="FSL11_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL11:DWFSL11" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="407" NAME="FSL11_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL11:DWFSL11" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="408" NAME="FSL11_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL12:DRFSL12" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="409" NAME="FSL12_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL12:DRFSL12" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="410" NAME="FSL12_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL12:DRFSL12" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="411" MSB="0" NAME="FSL12_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL12:DRFSL12" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="412" NAME="FSL12_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL12:DRFSL12" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="413" NAME="FSL12_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL12:DWFSL12" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="414" NAME="FSL12_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL12:DWFSL12" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="415" NAME="FSL12_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL12:DWFSL12" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="416" MSB="0" NAME="FSL12_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL12:DWFSL12" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="417" NAME="FSL12_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL12:DWFSL12" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="418" NAME="FSL12_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL13:DRFSL13" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="419" NAME="FSL13_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL13:DRFSL13" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="420" NAME="FSL13_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL13:DRFSL13" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="421" MSB="0" NAME="FSL13_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL13:DRFSL13" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="422" NAME="FSL13_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL13:DRFSL13" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="423" NAME="FSL13_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL13:DWFSL13" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="424" NAME="FSL13_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL13:DWFSL13" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="425" NAME="FSL13_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL13:DWFSL13" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="426" MSB="0" NAME="FSL13_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL13:DWFSL13" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="427" NAME="FSL13_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL13:DWFSL13" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="428" NAME="FSL13_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL14:DRFSL14" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="429" NAME="FSL14_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL14:DRFSL14" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="430" NAME="FSL14_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL14:DRFSL14" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="431" MSB="0" NAME="FSL14_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL14:DRFSL14" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="432" NAME="FSL14_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL14:DRFSL14" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="433" NAME="FSL14_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL14:DWFSL14" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="434" NAME="FSL14_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL14:DWFSL14" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="435" NAME="FSL14_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL14:DWFSL14" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="436" MSB="0" NAME="FSL14_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL14:DWFSL14" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="437" NAME="FSL14_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL14:DWFSL14" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="438" NAME="FSL14_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL15:DRFSL15" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="439" NAME="FSL15_S_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL15:DRFSL15" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="440" NAME="FSL15_S_READ" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL15:DRFSL15" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="441" MSB="0" NAME="FSL15_S_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="SFSL15:DRFSL15" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="442" NAME="FSL15_S_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="SFSL15:DRFSL15" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="443" NAME="FSL15_S_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL15:DWFSL15" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="444" NAME="FSL15_M_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL15:DWFSL15" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="445" NAME="FSL15_M_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL15:DWFSL15" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="446" MSB="0" NAME="FSL15_M_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:C_FSL_DATA_SIZE-1]"/>
        <PORT BUS="MFSL15:DWFSL15" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="447" NAME="FSL15_M_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="MFSL15:DWFSL15" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="448" NAME="FSL15_M_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="M0_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="449" NAME="M0_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M0_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="450" MSB="31" NAME="M0_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M0_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M0_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="451" NAME="M0_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M0_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="452" NAME="M0_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S0_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="453" NAME="S0_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S0_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="454" MSB="31" NAME="S0_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S0_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S0_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="455" NAME="S0_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S0_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="456" NAME="S0_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M1_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="457" NAME="M1_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M1_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="458" MSB="31" NAME="M1_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M1_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M1_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="459" NAME="M1_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M1_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="460" NAME="M1_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S1_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="461" NAME="S1_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S1_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="462" MSB="31" NAME="S1_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S1_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S1_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="463" NAME="S1_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S1_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="464" NAME="S1_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M2_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="465" NAME="M2_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M2_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="466" MSB="31" NAME="M2_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M2_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M2_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="467" NAME="M2_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M2_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="468" NAME="M2_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S2_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="469" NAME="S2_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S2_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="470" MSB="31" NAME="S2_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S2_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S2_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="471" NAME="S2_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S2_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="472" NAME="S2_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M3_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="473" NAME="M3_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M3_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="474" MSB="31" NAME="M3_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M3_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M3_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="475" NAME="M3_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M3_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="476" NAME="M3_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S3_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="477" NAME="S3_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S3_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="478" MSB="31" NAME="S3_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S3_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S3_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="479" NAME="S3_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S3_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="480" NAME="S3_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M4_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="481" NAME="M4_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M4_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="482" MSB="31" NAME="M4_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M4_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M4_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="483" NAME="M4_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M4_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="484" NAME="M4_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S4_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="485" NAME="S4_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S4_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="486" MSB="31" NAME="S4_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S4_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S4_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="487" NAME="S4_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S4_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="488" NAME="S4_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M5_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="489" NAME="M5_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M5_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="490" MSB="31" NAME="M5_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M5_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M5_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="491" NAME="M5_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M5_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="492" NAME="M5_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S5_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="493" NAME="S5_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S5_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="494" MSB="31" NAME="S5_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S5_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S5_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="495" NAME="S5_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S5_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="496" NAME="S5_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M6_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="497" NAME="M6_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M6_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="498" MSB="31" NAME="M6_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M6_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M6_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="499" NAME="M6_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M6_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="500" NAME="M6_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S6_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="501" NAME="S6_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S6_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="502" MSB="31" NAME="S6_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S6_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S6_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="503" NAME="S6_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S6_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="504" NAME="S6_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M7_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="505" NAME="M7_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M7_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="506" MSB="31" NAME="M7_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M7_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M7_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="507" NAME="M7_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M7_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="508" NAME="M7_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S7_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="509" NAME="S7_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S7_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="510" MSB="31" NAME="S7_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S7_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S7_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="511" NAME="S7_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S7_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="512" NAME="S7_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M8_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="513" NAME="M8_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M8_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="514" MSB="31" NAME="M8_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M8_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M8_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="515" NAME="M8_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M8_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="516" NAME="M8_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S8_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="517" NAME="S8_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S8_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="518" MSB="31" NAME="S8_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S8_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S8_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="519" NAME="S8_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S8_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="520" NAME="S8_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M9_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="521" NAME="M9_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M9_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="522" MSB="31" NAME="M9_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M9_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M9_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="523" NAME="M9_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M9_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="524" NAME="M9_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S9_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="525" NAME="S9_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S9_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="526" MSB="31" NAME="S9_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S9_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S9_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="527" NAME="S9_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S9_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="528" NAME="S9_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M10_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="529" NAME="M10_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M10_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="530" MSB="31" NAME="M10_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M10_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M10_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="531" NAME="M10_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M10_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="532" NAME="M10_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S10_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="533" NAME="S10_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S10_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="534" MSB="31" NAME="S10_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S10_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S10_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="535" NAME="S10_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S10_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="536" NAME="S10_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M11_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="537" NAME="M11_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M11_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="538" MSB="31" NAME="M11_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M11_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M11_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="539" NAME="M11_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M11_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="540" NAME="M11_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S11_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="541" NAME="S11_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S11_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="542" MSB="31" NAME="S11_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S11_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S11_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="543" NAME="S11_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S11_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="544" NAME="S11_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M12_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="545" NAME="M12_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M12_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="546" MSB="31" NAME="M12_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M12_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M12_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="547" NAME="M12_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M12_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="548" NAME="M12_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S12_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="549" NAME="S12_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S12_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="550" MSB="31" NAME="S12_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S12_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S12_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="551" NAME="S12_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S12_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="552" NAME="S12_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M13_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="553" NAME="M13_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M13_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="554" MSB="31" NAME="M13_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M13_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M13_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="555" NAME="M13_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M13_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="556" NAME="M13_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S13_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="557" NAME="S13_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S13_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="558" MSB="31" NAME="S13_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S13_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S13_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="559" NAME="S13_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S13_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="560" NAME="S13_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M14_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="561" NAME="M14_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M14_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="562" MSB="31" NAME="M14_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M14_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M14_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="563" NAME="M14_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M14_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="564" NAME="M14_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S14_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="565" NAME="S14_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S14_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="566" MSB="31" NAME="S14_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S14_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S14_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="567" NAME="S14_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S14_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="568" NAME="S14_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="M15_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="569" NAME="M15_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="M15_AXIS" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="570" MSB="31" NAME="M15_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_M15_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="M15_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="571" NAME="M15_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="M15_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="572" NAME="M15_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S15_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="573" NAME="S15_AXIS_TLAST" SIGNAME="__NOC__"/>
        <PORT BUS="S15_AXIS" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="574" MSB="31" NAME="S15_AXIS_TDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[C_S15_AXIS_DATA_WIDTH-1:0]"/>
        <PORT BUS="S15_AXIS" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="575" NAME="S15_AXIS_TVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S15_AXIS" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="576" NAME="S15_AXIS_TREADY" SIGNAME="__NOC__"/>
        <PORT BUS="IXCL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="577" NAME="ICACHE_FSL_IN_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="IXCL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="578" NAME="ICACHE_FSL_IN_READ" SIGNAME="__NOC__"/>
        <PORT BUS="IXCL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="579" MSB="0" NAME="ICACHE_FSL_IN_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="IXCL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="580" NAME="ICACHE_FSL_IN_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="IXCL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="581" NAME="ICACHE_FSL_IN_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="IXCL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="582" NAME="ICACHE_FSL_OUT_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="IXCL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="583" NAME="ICACHE_FSL_OUT_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="IXCL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="584" MSB="0" NAME="ICACHE_FSL_OUT_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="IXCL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="585" NAME="ICACHE_FSL_OUT_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="IXCL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="586" NAME="ICACHE_FSL_OUT_FULL" SIGNAME="__NOC__"/>
        <PORT BUS="DXCL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="587" NAME="DCACHE_FSL_IN_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="DXCL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="588" NAME="DCACHE_FSL_IN_READ" SIGNAME="__NOC__"/>
        <PORT BUS="DXCL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="589" MSB="0" NAME="DCACHE_FSL_IN_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="DXCL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="590" NAME="DCACHE_FSL_IN_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="DXCL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="591" NAME="DCACHE_FSL_IN_EXISTS" SIGNAME="__NOC__"/>
        <PORT BUS="DXCL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="592" NAME="DCACHE_FSL_OUT_CLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="DXCL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="593" NAME="DCACHE_FSL_OUT_WRITE" SIGNAME="__NOC__"/>
        <PORT BUS="DXCL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="594" MSB="0" NAME="DCACHE_FSL_OUT_DATA" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="DXCL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="595" NAME="DCACHE_FSL_OUT_CONTROL" SIGNAME="__NOC__"/>
        <PORT BUS="DXCL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="596" NAME="DCACHE_FSL_OUT_FULL" SIGNAME="__NOC__"/>
      </PORTS>
      <BUSINTERFACES>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_MBINTERRUPT" MPD_INDEX="108" NAME="INTERRUPT" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="INTERRUPT"/>
            <PORTMAP DIR="I" PHYSICAL="INTERRUPT_ADDRESS"/>
            <PORTMAP DIR="O" PHYSICAL="INTERRUPT_ACK"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="PLBV46" BUSSTD_PSF="PLBV46" IS_DATA="TRUE" IS_VALID="FALSE" MPD_INDEX="2" NAME="DPLB" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_ABort"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_ABus"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_UABus"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_BE"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_busLock"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_lockErr"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_MSize"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_priority"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_rdBurst"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_request"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_RNW"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_size"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_TAttribute"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_type"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_wrBurst"/>
            <PORTMAP DIR="O" PHYSICAL="DPLB_M_wrDBus"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MBusy"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MRdErr"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MWrErr"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MIRQ"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MWrBTerm"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MWrDAck"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MAddrAck"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MRdBTerm"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MRdDAck"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MRdDBus"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MRdWdAddr"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MRearbitrate"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MSSize"/>
            <PORTMAP DIR="I" PHYSICAL="DPLB_MTimeout"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="PLBV46" BUSSTD_PSF="PLBV46" IS_INSTRUCTION="TRUE" IS_VALID="FALSE" MPD_INDEX="3" NAME="IPLB" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_ABort"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_ABus"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_UABus"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_BE"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_busLock"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_lockErr"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_MSize"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_priority"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_rdBurst"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_request"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_RNW"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_size"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_TAttribute"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_type"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_wrBurst"/>
            <PORTMAP DIR="O" PHYSICAL="IPLB_M_wrDBus"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MBusy"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MRdErr"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MWrErr"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MIRQ"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MWrBTerm"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MWrDAck"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MAddrAck"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MRdBTerm"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MRdDAck"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MRdDBus"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MRdWdAddr"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MRearbitrate"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MSSize"/>
            <PORTMAP DIR="I" PHYSICAL="IPLB_MTimeout"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="dlmb" BUSSTD="LMB" BUSSTD_PSF="LMB" IS_DATA="TRUE" IS_INSTANTIATED="TRUE" MHS_INDEX="1" MPD_INDEX="0" NAME="DLMB" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="RESET"/>
            <PORTMAP DIR="I" PHYSICAL="DATA_READ"/>
            <PORTMAP DIR="I" PHYSICAL="DREADY"/>
            <PORTMAP DIR="I" PHYSICAL="DWAIT"/>
            <PORTMAP DIR="I" PHYSICAL="DCE"/>
            <PORTMAP DIR="I" PHYSICAL="DUE"/>
            <PORTMAP DIR="O" PHYSICAL="DATA_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="DATA_ADDR"/>
            <PORTMAP DIR="O" PHYSICAL="D_AS"/>
            <PORTMAP DIR="O" PHYSICAL="READ_STROBE"/>
            <PORTMAP DIR="O" PHYSICAL="WRITE_STROBE"/>
            <PORTMAP DIR="O" PHYSICAL="BYTE_ENABLE"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="ilmb" BUSSTD="LMB" BUSSTD_PSF="LMB" IS_INSTANTIATED="TRUE" IS_INSTRUCTION="TRUE" MHS_INDEX="2" MPD_INDEX="1" NAME="ILMB" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="RESET"/>
            <PORTMAP DIR="I" PHYSICAL="INSTR"/>
            <PORTMAP DIR="I" PHYSICAL="IREADY"/>
            <PORTMAP DIR="I" PHYSICAL="IWAIT"/>
            <PORTMAP DIR="I" PHYSICAL="ICE"/>
            <PORTMAP DIR="I" PHYSICAL="IUE"/>
            <PORTMAP DIR="O" PHYSICAL="INSTR_ADDR"/>
            <PORTMAP DIR="O" PHYSICAL="IFETCH"/>
            <PORTMAP DIR="O" PHYSICAL="I_AS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXI" BUSSTD_PSF="AXI" IS_DATA="TRUE" MPD_INDEX="4" NAME="M_AXI_DP" PROTOCOL="AXI4LITE" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_AWID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_AWADDR"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_AWLEN"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_AWSIZE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_AWBURST"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_AWLOCK"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_AWCACHE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_AWPROT"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_AWQOS"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_AWVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DP_AWREADY"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_WDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_WSTRB"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_WLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_WVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DP_WREADY"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DP_BID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DP_BRESP"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DP_BVALID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_BREADY"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_ARID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_ARADDR"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_ARLEN"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_ARSIZE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_ARBURST"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_ARLOCK"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_ARCACHE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_ARPROT"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_ARQOS"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_ARVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DP_ARREADY"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DP_RID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DP_RDATA"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DP_RRESP"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DP_RLAST"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DP_RVALID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DP_RREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXI" BUSSTD_PSF="AXI" IS_INSTRUCTION="TRUE" MPD_INDEX="5" NAME="M_AXI_IP" PROTOCOL="AXI4LITE" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_AWID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_AWADDR"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_AWLEN"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_AWSIZE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_AWBURST"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_AWLOCK"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_AWCACHE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_AWPROT"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_AWQOS"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_AWVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IP_AWREADY"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_WDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_WSTRB"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_WLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_WVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IP_WREADY"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IP_BID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IP_BRESP"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IP_BVALID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_BREADY"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_ARID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_ARADDR"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_ARLEN"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_ARSIZE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_ARBURST"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_ARLOCK"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_ARCACHE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_ARPROT"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_ARQOS"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_ARVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IP_ARREADY"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IP_RID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IP_RDATA"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IP_RRESP"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IP_RLAST"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IP_RVALID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IP_RREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXI" BUSSTD_PSF="AXI" IS_DATA="TRUE" IS_VALID="FALSE" MPD_INDEX="104" NAME="M_AXI_DC" PROTOCOL="AXI4" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_AWID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_AWADDR"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_AWLEN"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_AWSIZE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_AWBURST"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_AWLOCK"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_AWCACHE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_AWPROT"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_AWQOS"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_AWVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DC_AWREADY"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_AWUSER"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_WDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_WSTRB"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_WLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_WVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DC_WREADY"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_WUSER"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DC_BID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DC_BRESP"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DC_BVALID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_BREADY"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DC_BUSER"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_ARID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_ARADDR"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_ARLEN"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_ARSIZE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_ARBURST"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_ARLOCK"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_ARCACHE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_ARPROT"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_ARQOS"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_ARVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DC_ARREADY"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_ARUSER"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DC_RID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DC_RDATA"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DC_RRESP"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DC_RLAST"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DC_RVALID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_DC_RREADY"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_DC_RUSER"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXI" BUSSTD_PSF="AXI" IS_INSTRUCTION="TRUE" IS_VALID="FALSE" MPD_INDEX="105" NAME="M_AXI_IC" PROTOCOL="AXI4" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_AWID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_AWADDR"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_AWLEN"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_AWSIZE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_AWBURST"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_AWLOCK"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_AWCACHE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_AWPROT"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_AWQOS"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_AWVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IC_AWREADY"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_AWUSER"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_WDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_WSTRB"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_WLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_WVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IC_WREADY"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_WUSER"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IC_BID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IC_BRESP"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IC_BVALID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_BREADY"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IC_BUSER"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_ARID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_ARADDR"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_ARLEN"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_ARSIZE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_ARBURST"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_ARLOCK"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_ARCACHE"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_ARPROT"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_ARQOS"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_ARVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IC_ARREADY"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_ARUSER"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IC_RID"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IC_RDATA"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IC_RRESP"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IC_RLAST"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IC_RVALID"/>
            <PORTMAP DIR="O" PHYSICAL="M_AXI_IC_RREADY"/>
            <PORTMAP DIR="I" PHYSICAL="M_AXI_IC_RUSER"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="70" NAME="M0_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M0_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M0_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M0_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M0_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="71" NAME="S0_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S0_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S0_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S0_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S0_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="72" NAME="M1_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M1_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M1_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M1_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M1_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="73" NAME="S1_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S1_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S1_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S1_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S1_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="74" NAME="M2_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M2_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M2_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M2_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M2_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="75" NAME="S2_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S2_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S2_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S2_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S2_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="76" NAME="M3_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M3_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M3_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M3_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M3_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="77" NAME="S3_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S3_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S3_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S3_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S3_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="78" NAME="M4_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M4_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M4_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M4_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M4_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="79" NAME="S4_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S4_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S4_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S4_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S4_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="80" NAME="M5_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M5_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M5_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M5_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M5_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="81" NAME="S5_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S5_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S5_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S5_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S5_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="82" NAME="M6_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M6_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M6_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M6_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M6_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="83" NAME="S6_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S6_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S6_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S6_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S6_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="84" NAME="M7_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M7_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M7_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M7_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M7_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="85" NAME="S7_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S7_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S7_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S7_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S7_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="86" NAME="M8_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M8_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M8_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M8_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M8_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="87" NAME="S8_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S8_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S8_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S8_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S8_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="88" NAME="M9_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M9_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M9_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M9_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M9_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="89" NAME="S9_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S9_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S9_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S9_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S9_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="90" NAME="M10_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M10_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M10_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M10_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M10_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="91" NAME="S10_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S10_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S10_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S10_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S10_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="92" NAME="M11_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M11_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M11_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M11_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M11_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="93" NAME="S11_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S11_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S11_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S11_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S11_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="94" NAME="M12_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M12_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M12_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M12_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M12_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="95" NAME="S12_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S12_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S12_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S12_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S12_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="96" NAME="M13_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M13_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M13_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M13_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M13_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="97" NAME="S13_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S13_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S13_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S13_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S13_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="98" NAME="M14_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M14_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M14_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M14_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M14_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="99" NAME="S14_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S14_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S14_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S14_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S14_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="100" NAME="M15_AXIS" PROTOCOL="GENERIC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="O" PHYSICAL="M15_AXIS_TLAST"/>
            <PORTMAP DIR="O" PHYSICAL="M15_AXIS_TDATA"/>
            <PORTMAP DIR="O" PHYSICAL="M15_AXIS_TVALID"/>
            <PORTMAP DIR="I" PHYSICAL="M15_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXIS" BUSSTD_PSF="AXIS" IS_VALID="FALSE" MPD_INDEX="101" NAME="S15_AXIS" PROTOCOL="GENERIC" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="CLK"/>
            <PORTMAP DIR="I" PHYSICAL="S15_AXIS_TLAST"/>
            <PORTMAP DIR="I" PHYSICAL="S15_AXIS_TDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S15_AXIS_TVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S15_AXIS_TREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_MBTRACE2" MPD_INDEX="107" NAME="TRACE" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="Trace_Instruction"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Valid_Instr"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_PC"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Reg_Write"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Reg_Addr"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_MSR_Reg"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_New_Reg_Value"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Jump_Taken"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Delay_Slot"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Data_Address"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Data_Access"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Data_Read"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Data_Write"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Data_Write_Value"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Data_Byte_Enable"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_MB_Halted"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_PID_Reg"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Exception_Taken"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Exception_Kind"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_DCache_Req"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_DCache_Hit"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_DCache_Rdy"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_DCache_Read"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_ICache_Req"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_ICache_Hit"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_ICache_Rdy"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_OF_PipeRun"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_EX_PipeRun"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_MEM_PipeRun"/>
            <PORTMAP DIR="O" PHYSICAL="Trace_Jump_Hit"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="mdm_0_MBDEBUG_0" BUSSTD="XIL" BUSSTD_PSF="XIL_MBDEBUG3" IS_INSTANTIATED="TRUE" MHS_INDEX="0" MPD_INDEX="106" NAME="DEBUG" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="DBG_CLK"/>
            <PORTMAP DIR="I" PHYSICAL="DBG_TDI"/>
            <PORTMAP DIR="O" PHYSICAL="DBG_TDO"/>
            <PORTMAP DIR="I" PHYSICAL="DBG_REG_EN"/>
            <PORTMAP DIR="I" PHYSICAL="DBG_SHIFT"/>
            <PORTMAP DIR="I" PHYSICAL="DBG_CAPTURE"/>
            <PORTMAP DIR="I" PHYSICAL="DBG_UPDATE"/>
            <PORTMAP DIR="I" PHYSICAL="DEBUG_RST"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="6" NAME="SFSL0" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL0_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL0_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL0_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL0_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL0_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="38" NAME="DRFSL0" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL0_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL0_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL0_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL0_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL0_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="7" NAME="MFSL0" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL0_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL0_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL0_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL0_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL0_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="39" NAME="DWFSL0" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL0_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL0_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL0_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL0_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL0_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="8" NAME="SFSL1" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL1_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL1_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL1_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL1_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL1_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="40" NAME="DRFSL1" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL1_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL1_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL1_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL1_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL1_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="9" NAME="MFSL1" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL1_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL1_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL1_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL1_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL1_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="41" NAME="DWFSL1" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL1_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL1_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL1_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL1_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL1_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="10" NAME="SFSL2" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL2_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL2_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL2_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL2_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL2_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="42" NAME="DRFSL2" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL2_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL2_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL2_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL2_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL2_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="11" NAME="MFSL2" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL2_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL2_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL2_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL2_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL2_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="43" NAME="DWFSL2" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL2_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL2_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL2_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL2_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL2_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="12" NAME="SFSL3" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL3_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL3_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL3_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL3_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL3_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="44" NAME="DRFSL3" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL3_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL3_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL3_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL3_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL3_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="13" NAME="MFSL3" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL3_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL3_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL3_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL3_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL3_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="45" NAME="DWFSL3" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL3_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL3_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL3_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL3_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL3_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="14" NAME="SFSL4" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL4_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL4_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL4_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL4_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL4_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="46" NAME="DRFSL4" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL4_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL4_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL4_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL4_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL4_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="15" NAME="MFSL4" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL4_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL4_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL4_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL4_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL4_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="47" NAME="DWFSL4" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL4_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL4_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL4_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL4_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL4_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="16" NAME="SFSL5" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL5_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL5_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL5_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL5_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL5_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="48" NAME="DRFSL5" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL5_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL5_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL5_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL5_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL5_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="17" NAME="MFSL5" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL5_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL5_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL5_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL5_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL5_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="49" NAME="DWFSL5" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL5_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL5_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL5_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL5_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL5_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="18" NAME="SFSL6" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL6_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL6_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL6_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL6_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL6_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="50" NAME="DRFSL6" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL6_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL6_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL6_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL6_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL6_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="19" NAME="MFSL6" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL6_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL6_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL6_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL6_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL6_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="51" NAME="DWFSL6" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL6_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL6_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL6_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL6_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL6_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="20" NAME="SFSL7" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL7_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL7_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL7_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL7_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL7_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="52" NAME="DRFSL7" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL7_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL7_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL7_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL7_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL7_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="21" NAME="MFSL7" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL7_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL7_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL7_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL7_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL7_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="53" NAME="DWFSL7" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL7_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL7_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL7_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL7_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL7_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="22" NAME="SFSL8" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL8_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL8_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL8_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL8_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL8_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="54" NAME="DRFSL8" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL8_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL8_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL8_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL8_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL8_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="23" NAME="MFSL8" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL8_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL8_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL8_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL8_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL8_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="55" NAME="DWFSL8" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL8_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL8_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL8_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL8_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL8_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="24" NAME="SFSL9" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL9_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL9_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL9_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL9_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL9_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="56" NAME="DRFSL9" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL9_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL9_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL9_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL9_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL9_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="25" NAME="MFSL9" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL9_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL9_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL9_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL9_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL9_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="57" NAME="DWFSL9" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL9_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL9_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL9_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL9_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL9_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="26" NAME="SFSL10" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL10_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL10_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL10_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL10_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL10_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="58" NAME="DRFSL10" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL10_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL10_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL10_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL10_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL10_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="27" NAME="MFSL10" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL10_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL10_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL10_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL10_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL10_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="59" NAME="DWFSL10" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL10_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL10_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL10_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL10_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL10_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="28" NAME="SFSL11" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL11_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL11_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL11_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL11_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL11_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="60" NAME="DRFSL11" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL11_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL11_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL11_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL11_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL11_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="29" NAME="MFSL11" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL11_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL11_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL11_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL11_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL11_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="61" NAME="DWFSL11" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL11_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL11_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL11_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL11_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL11_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="30" NAME="SFSL12" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL12_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL12_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL12_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL12_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL12_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="62" NAME="DRFSL12" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL12_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL12_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL12_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL12_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL12_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="31" NAME="MFSL12" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL12_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL12_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL12_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL12_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL12_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="63" NAME="DWFSL12" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL12_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL12_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL12_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL12_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL12_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="32" NAME="SFSL13" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL13_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL13_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL13_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL13_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL13_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="64" NAME="DRFSL13" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL13_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL13_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL13_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL13_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL13_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="33" NAME="MFSL13" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL13_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL13_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL13_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL13_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL13_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="65" NAME="DWFSL13" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL13_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL13_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL13_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL13_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL13_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="34" NAME="SFSL14" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL14_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL14_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL14_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL14_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL14_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="66" NAME="DRFSL14" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL14_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL14_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL14_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL14_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL14_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="35" NAME="MFSL14" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL14_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL14_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL14_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL14_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL14_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="67" NAME="DWFSL14" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL14_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL14_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL14_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL14_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL14_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="36" NAME="SFSL15" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL15_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL15_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL15_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL15_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL15_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DRFSL" IS_VALID="FALSE" MPD_INDEX="68" NAME="DRFSL15" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL15_S_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL15_S_READ"/>
            <PORTMAP DIR="I" PHYSICAL="FSL15_S_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="FSL15_S_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL15_S_EXISTS"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="FSL" BUSSTD_PSF="FSL" IS_VALID="FALSE" MPD_INDEX="37" NAME="MFSL15" TYPE="MASTER">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL15_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL15_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL15_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL15_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL15_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_DWFSL" IS_VALID="FALSE" MPD_INDEX="69" NAME="DWFSL15" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="FSL15_M_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="FSL15_M_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="FSL15_M_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="FSL15_M_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="FSL15_M_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_MEMORY_CHANNEL" IS_INSTRUCTION="TRUE" IS_VALID="FALSE" MPD_INDEX="103" NAME="IXCL" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="ICACHE_FSL_IN_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="ICACHE_FSL_IN_READ"/>
            <PORTMAP DIR="I" PHYSICAL="ICACHE_FSL_IN_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="ICACHE_FSL_IN_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="ICACHE_FSL_IN_EXISTS"/>
            <PORTMAP DIR="O" PHYSICAL="ICACHE_FSL_OUT_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="ICACHE_FSL_OUT_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="ICACHE_FSL_OUT_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="ICACHE_FSL_OUT_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="ICACHE_FSL_OUT_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_MEMORY_CHANNEL" IS_DATA="TRUE" IS_VALID="FALSE" MPD_INDEX="102" NAME="DXCL" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="DCACHE_FSL_IN_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="DCACHE_FSL_IN_READ"/>
            <PORTMAP DIR="I" PHYSICAL="DCACHE_FSL_IN_DATA"/>
            <PORTMAP DIR="I" PHYSICAL="DCACHE_FSL_IN_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="DCACHE_FSL_IN_EXISTS"/>
            <PORTMAP DIR="O" PHYSICAL="DCACHE_FSL_OUT_CLK"/>
            <PORTMAP DIR="O" PHYSICAL="DCACHE_FSL_OUT_WRITE"/>
            <PORTMAP DIR="O" PHYSICAL="DCACHE_FSL_OUT_DATA"/>
            <PORTMAP DIR="O" PHYSICAL="DCACHE_FSL_OUT_CONTROL"/>
            <PORTMAP DIR="I" PHYSICAL="DCACHE_FSL_OUT_FULL"/>
          </PORTMAPS>
        </BUSINTERFACE>
      </BUSINTERFACES>
      <MEMORYMAP>
        <MEMRANGE BASEDECIMAL="0" BASENAME="C_BASEADDR" BASEVALUE="0x00000000" HIGHDECIMAL="%highdecimal%" HIGHNAME="C_HIGHADDR" HIGHVALUE="%highvalue%" INSTANCE="dlmb_cntlr" IS_DATA="TRUE" IS_INSTRUCTION="FALSE" IS_VALID="TRUE" MEMTYPE="MEMORY" SIZE="%memorysize%" SIZEABRV="%sizeabrv%">
          <ACCESSROUTE>
            <ROUTEPNT INDEX="0" INSTANCE="dlmb"/>
          </ACCESSROUTE>
        </MEMRANGE>
        <MEMRANGE BASEDECIMAL="2147483648" BASENAME="C_BASEADDR" BASEVALUE="0x80000000" HIGHDECIMAL="2147483775" HIGHNAME="C_HIGHADDR" HIGHVALUE="0x8000007F" INSTANCE="iomodule_0" IS_DATA="TRUE" IS_INSTRUCTION="FALSE" IS_VALID="TRUE" MEMTYPE="IO" SIZE="128" SIZEABRV="128">
          <ACCESSROUTE>
            <ROUTEPNT INDEX="0" INSTANCE="dlmb"/>
          </ACCESSROUTE>
        </MEMRANGE>
        <MEMRANGE BASEDECIMAL="3221225472" BASENAME="C_IO_BASEADDR" BASEVALUE="0xC0000000" HIGHDECIMAL="4294967295" HIGHNAME="C_IO_HIGHADDR" HIGHVALUE="0xFFFFFFFF" INSTANCE="iomodule_0" IS_DATA="TRUE" IS_INSTRUCTION="FALSE" IS_VALID="TRUE" MEMTYPE="IO" SIZE="1073741824" SIZEABRV="1G">
          <ACCESSROUTE>
            <ROUTEPNT INDEX="0" INSTANCE="dlmb"/>
          </ACCESSROUTE>
        </MEMRANGE>
        <MEMRANGE BASEDECIMAL="0" BASENAME="C_BASEADDR" BASEVALUE="0x00000000" HIGHDECIMAL="%highdecimal%" HIGHNAME="C_HIGHADDR" HIGHVALUE="%highvalue%" INSTANCE="ilmb_cntlr" IS_DATA="FALSE" IS_INSTRUCTION="TRUE" IS_VALID="TRUE" MEMTYPE="MEMORY" SIZE="%memorysize%" SIZEABRV="%sizeabrv%">
          <ACCESSROUTE>
            <ROUTEPNT INDEX="0" INSTANCE="ilmb"/>
          </ACCESSROUTE>
        </MEMRANGE>
      </MEMORYMAP>
      <PERIPHERALS>
        <PERIPHERAL INSTANCE="dlmb_cntlr"/>
        <PERIPHERAL INSTANCE="iomodule_0"/>
        <PERIPHERAL INSTANCE="ilmb_cntlr"/>
      </PERIPHERALS>
    </MODULE>
    <MODULE BUSSTD="LMB" BUSSTD_PSF="LMB" HWVERSION="2.00.b" INSTANCE="ilmb" IPTYPE="BUS" MHS_INDEX="1" MODCLASS="BUS" MODTYPE="lmb_v10">
      <DESCRIPTION TYPE="SHORT">Local Memory Bus (LMB) 1.0</DESCRIPTION>
      <DESCRIPTION TYPE="LONG">'The LMB is a fast, local bus for connecting MicroBlaze I and D ports to peripherals and BRAM'</DESCRIPTION>
      <DOCUMENTATION>
        <DOCUMENT SOURCE="" TYPE="IP"/>
      </DOCUMENTATION>
      <LICENSEINFO ICON_NAME="ps_core_preferred"/>
      <PARAMETERS>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="0" NAME="C_LMB_NUM_SLAVES" TYPE="integer" VALUE="1">
          <DESCRIPTION>Number of Bus Slaves </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="1" NAME="C_LMB_AWIDTH" TYPE="integer" VALUE="32">
          <DESCRIPTION>LMB Address Bus Width </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="2" NAME="C_LMB_DWIDTH" TYPE="integer" VALUE="32">
          <DESCRIPTION>LMB Data Bus Width </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="3" NAME="C_EXT_RESET_HIGH" TYPE="integer" VALUE="1">
          <DESCRIPTION>Active High External Reset</DESCRIPTION>
        </PARAMETER>
      </PARAMETERS>
      <PORTS>
        <PORT CLKFREQUENCY="%freq%" DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="0" MPD_INDEX="0" NAME="LMB_CLK" SIGIS="CLK" SIGNAME="Clk">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Clk"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="1" MPD_INDEX="1" NAME="SYS_RST" SIGIS="RST" SIGNAME="Reset">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Reset"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_LMB_Rst" DIR="O" MPD_INDEX="2" NAME="LMB_Rst" SIGIS="RST" SIGNAME="ilmb_LMB_Rst">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="ilmb_cntlr" PORT="LMB_Rst"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_M_ABus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="3" MSB="0" NAME="M_ABus" RIGHT="31" SIGNAME="ilmb_M_ABus" VECFORMULA="[0:C_LMB_AWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[ILMB]" INSTANCE="%microblaze_instance%" PORT="INSTR_ADDR"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_M_ReadStrobe" DIR="I" MPD_INDEX="4" NAME="M_ReadStrobe" SIGNAME="ilmb_M_ReadStrobe">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[ILMB]" INSTANCE="%microblaze_instance%" PORT="IFETCH"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_M_WriteStrobe" DIR="I" MPD_INDEX="5" NAME="M_WriteStrobe" SIGNAME="ilmb_M_WriteStrobe">
          <CONNECTIONS/>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_M_AddrStrobe" DIR="I" MPD_INDEX="6" NAME="M_AddrStrobe" SIGNAME="ilmb_M_AddrStrobe">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[ILMB]" INSTANCE="%microblaze_instance%" PORT="I_AS"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_M_DBus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="7" MSB="0" NAME="M_DBus" RIGHT="31" SIGNAME="ilmb_M_DBus" VECFORMULA="[0:C_LMB_DWIDTH-1]">
          <CONNECTIONS/>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_M_BE" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="8" MSB="0" NAME="M_BE" RIGHT="3" SIGNAME="ilmb_M_BE" VECFORMULA="[0:(C_LMB_DWIDTH+7)/8-1]">
          <CONNECTIONS/>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_Sl_DBus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="9" MSB="0" NAME="Sl_DBus" RIGHT="31" SIGNAME="ilmb_Sl_DBus" VECFORMULA="[0:(C_LMB_DWIDTH*C_LMB_NUM_SLAVES)-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="ilmb_cntlr" PORT="Sl_DBus"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_Sl_Ready" DIR="I" MPD_INDEX="10" NAME="Sl_Ready" SIGNAME="ilmb_Sl_Ready" VECFORMULA="[0:C_LMB_NUM_SLAVES-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="ilmb_cntlr" PORT="Sl_Ready"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_Sl_Wait" DIR="I" MPD_INDEX="11" NAME="Sl_Wait" SIGNAME="ilmb_Sl_Wait" VECFORMULA="[0:C_LMB_NUM_SLAVES-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="ilmb_cntlr" PORT="Sl_Wait"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_Sl_UE" DIR="I" MPD_INDEX="12" NAME="Sl_UE" SIGNAME="ilmb_Sl_UE" VECFORMULA="[0:C_LMB_NUM_SLAVES-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="ilmb_cntlr" PORT="Sl_UE"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_Sl_CE" DIR="I" MPD_INDEX="13" NAME="Sl_CE" SIGNAME="ilmb_Sl_CE" VECFORMULA="[0:C_LMB_NUM_SLAVES-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="ilmb_cntlr" PORT="Sl_CE"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_LMB_ABus" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="14" MSB="0" NAME="LMB_ABus" RIGHT="31" SIGNAME="ilmb_LMB_ABus" VECFORMULA="[0:C_LMB_AWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="ilmb_cntlr" PORT="LMB_ABus"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_LMB_ReadStrobe" DIR="O" MPD_INDEX="15" NAME="LMB_ReadStrobe" SIGNAME="ilmb_LMB_ReadStrobe">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="ilmb_cntlr" PORT="LMB_ReadStrobe"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_LMB_WriteStrobe" DIR="O" MPD_INDEX="16" NAME="LMB_WriteStrobe" SIGNAME="ilmb_LMB_WriteStrobe">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="ilmb_cntlr" PORT="LMB_WriteStrobe"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_LMB_AddrStrobe" DIR="O" MPD_INDEX="17" NAME="LMB_AddrStrobe" SIGNAME="ilmb_LMB_AddrStrobe">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="ilmb_cntlr" PORT="LMB_AddrStrobe"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_LMB_ReadDBus" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="18" MSB="0" NAME="LMB_ReadDBus" RIGHT="31" SIGNAME="ilmb_LMB_ReadDBus" VECFORMULA="[0:C_LMB_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[ILMB]" INSTANCE="%microblaze_instance%" PORT="INSTR"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_LMB_WriteDBus" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="19" MSB="0" NAME="LMB_WriteDBus" RIGHT="31" SIGNAME="ilmb_LMB_WriteDBus" VECFORMULA="[0:C_LMB_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="ilmb_cntlr" PORT="LMB_WriteDBus"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_LMB_Ready" DIR="O" MPD_INDEX="20" NAME="LMB_Ready" SIGNAME="ilmb_LMB_Ready">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[ILMB]" INSTANCE="%microblaze_instance%" PORT="IREADY"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_LMB_Wait" DIR="O" MPD_INDEX="21" NAME="LMB_Wait" SIGNAME="ilmb_LMB_Wait">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[ILMB]" INSTANCE="%microblaze_instance%" PORT="IWAIT"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_LMB_UE" DIR="O" MPD_INDEX="22" NAME="LMB_UE" SIGNAME="ilmb_LMB_UE">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[ILMB]" INSTANCE="%microblaze_instance%" PORT="IUE"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_LMB_CE" DIR="O" MPD_INDEX="23" NAME="LMB_CE" SIGNAME="ilmb_LMB_CE">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[ILMB]" INSTANCE="%microblaze_instance%" PORT="ICE"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="ilmb_LMB_BE" DIR="O" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="24" MSB="0" NAME="LMB_BE" RIGHT="3" SIGNAME="ilmb_LMB_BE" VECFORMULA="[0:(C_LMB_DWIDTH+7)/8-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="ilmb_cntlr" PORT="LMB_BE"/>
          </CONNECTIONS>
        </PORT>
      </PORTS>
      <BUSINTERFACES/>
      <IOINTERFACES>
        <IOINTERFACE MPD_INDEX="0" NAME="reset_0"/>
      </IOINTERFACES>
    </MODULE>
    <MODULE BUSSTD="LMB" BUSSTD_PSF="LMB" HWVERSION="2.00.b" INSTANCE="dlmb" IPTYPE="BUS" MHS_INDEX="2" MODCLASS="BUS" MODTYPE="lmb_v10">
      <DESCRIPTION TYPE="SHORT">Local Memory Bus (LMB) 1.0</DESCRIPTION>
      <DESCRIPTION TYPE="LONG">'The LMB is a fast, local bus for connecting MicroBlaze I and D ports to peripherals and BRAM'</DESCRIPTION>
      <DOCUMENTATION>
        <DOCUMENT SOURCE="" TYPE="IP"/>
      </DOCUMENTATION>
      <LICENSEINFO ICON_NAME="ps_core_preferred"/>
      <PARAMETERS>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="0" NAME="C_LMB_NUM_SLAVES" TYPE="integer" VALUE="2">
          <DESCRIPTION>Number of Bus Slaves </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="1" NAME="C_LMB_AWIDTH" TYPE="integer" VALUE="32">
          <DESCRIPTION>LMB Address Bus Width </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="2" NAME="C_LMB_DWIDTH" TYPE="integer" VALUE="32">
          <DESCRIPTION>LMB Data Bus Width </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="3" NAME="C_EXT_RESET_HIGH" TYPE="integer" VALUE="1">
          <DESCRIPTION>Active High External Reset</DESCRIPTION>
        </PARAMETER>
      </PARAMETERS>
      <PORTS>
        <PORT CLKFREQUENCY="%freq%" DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="0" MPD_INDEX="0" NAME="LMB_CLK" SIGIS="CLK" SIGNAME="Clk">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Clk"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="1" MPD_INDEX="1" NAME="SYS_RST" SIGIS="RST" SIGNAME="Reset">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Reset"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_LMB_Rst" DIR="O" MPD_INDEX="2" NAME="LMB_Rst" SIGIS="RST" SIGNAME="dlmb_LMB_Rst">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DLMB:ILMB]" INSTANCE="%microblaze_instance%" PORT="RESET"/>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="dlmb_cntlr" PORT="LMB_Rst"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_M_ABus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="3" MSB="0" NAME="M_ABus" RIGHT="31" SIGNAME="dlmb_M_ABus" VECFORMULA="[0:C_LMB_AWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DLMB]" INSTANCE="%microblaze_instance%" PORT="DATA_ADDR"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_M_ReadStrobe" DIR="I" MPD_INDEX="4" NAME="M_ReadStrobe" SIGNAME="dlmb_M_ReadStrobe">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DLMB]" INSTANCE="%microblaze_instance%" PORT="READ_STROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_M_WriteStrobe" DIR="I" MPD_INDEX="5" NAME="M_WriteStrobe" SIGNAME="dlmb_M_WriteStrobe">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DLMB]" INSTANCE="%microblaze_instance%" PORT="WRITE_STROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_M_AddrStrobe" DIR="I" MPD_INDEX="6" NAME="M_AddrStrobe" SIGNAME="dlmb_M_AddrStrobe">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DLMB]" INSTANCE="%microblaze_instance%" PORT="D_AS"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_M_DBus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="7" MSB="0" NAME="M_DBus" RIGHT="31" SIGNAME="dlmb_M_DBus" VECFORMULA="[0:C_LMB_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DLMB]" INSTANCE="%microblaze_instance%" PORT="DATA_WRITE"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_M_BE" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="8" MSB="0" NAME="M_BE" RIGHT="3" SIGNAME="dlmb_M_BE" VECFORMULA="[0:(C_LMB_DWIDTH+7)/8-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DLMB]" INSTANCE="%microblaze_instance%" PORT="BYTE_ENABLE"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_Sl_DBus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="63" MPD_INDEX="9" MSB="0" NAME="Sl_DBus" RIGHT="63" SIGNAME="dlmb_Sl_DBus" VECFORMULA="[0:(C_LMB_DWIDTH*C_LMB_NUM_SLAVES)-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="dlmb_cntlr" PORT="Sl_DBus"/>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="iomodule_0" PORT="Sl_DBus"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_Sl_Ready" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="10" MSB="0" NAME="Sl_Ready" RIGHT="1" SIGNAME="dlmb_Sl_Ready" VECFORMULA="[0:C_LMB_NUM_SLAVES-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="dlmb_cntlr" PORT="Sl_Ready"/>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="iomodule_0" PORT="Sl_Ready"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_Sl_Wait" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="11" MSB="0" NAME="Sl_Wait" RIGHT="1" SIGNAME="dlmb_Sl_Wait" VECFORMULA="[0:C_LMB_NUM_SLAVES-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="dlmb_cntlr" PORT="Sl_Wait"/>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="iomodule_0" PORT="Sl_Wait"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_Sl_UE" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="12" MSB="0" NAME="Sl_UE" RIGHT="1" SIGNAME="dlmb_Sl_UE" VECFORMULA="[0:C_LMB_NUM_SLAVES-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="dlmb_cntlr" PORT="Sl_UE"/>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="iomodule_0" PORT="Sl_UE"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_Sl_CE" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="13" MSB="0" NAME="Sl_CE" RIGHT="1" SIGNAME="dlmb_Sl_CE" VECFORMULA="[0:C_LMB_NUM_SLAVES-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="dlmb_cntlr" PORT="Sl_CE"/>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="iomodule_0" PORT="Sl_CE"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_LMB_ABus" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="14" MSB="0" NAME="LMB_ABus" RIGHT="31" SIGNAME="dlmb_LMB_ABus" VECFORMULA="[0:C_LMB_AWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="dlmb_cntlr" PORT="LMB_ABus"/>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="iomodule_0" PORT="LMB_ABus"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_LMB_ReadStrobe" DIR="O" MPD_INDEX="15" NAME="LMB_ReadStrobe" SIGNAME="dlmb_LMB_ReadStrobe">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="dlmb_cntlr" PORT="LMB_ReadStrobe"/>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="iomodule_0" PORT="LMB_ReadStrobe"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_LMB_WriteStrobe" DIR="O" MPD_INDEX="16" NAME="LMB_WriteStrobe" SIGNAME="dlmb_LMB_WriteStrobe">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="dlmb_cntlr" PORT="LMB_WriteStrobe"/>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="iomodule_0" PORT="LMB_WriteStrobe"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_LMB_AddrStrobe" DIR="O" MPD_INDEX="17" NAME="LMB_AddrStrobe" SIGNAME="dlmb_LMB_AddrStrobe">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="dlmb_cntlr" PORT="LMB_AddrStrobe"/>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="iomodule_0" PORT="LMB_AddrStrobe"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_LMB_ReadDBus" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="18" MSB="0" NAME="LMB_ReadDBus" RIGHT="31" SIGNAME="dlmb_LMB_ReadDBus" VECFORMULA="[0:C_LMB_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DLMB]" INSTANCE="%microblaze_instance%" PORT="DATA_READ"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_LMB_WriteDBus" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="19" MSB="0" NAME="LMB_WriteDBus" RIGHT="31" SIGNAME="dlmb_LMB_WriteDBus" VECFORMULA="[0:C_LMB_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="dlmb_cntlr" PORT="LMB_WriteDBus"/>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="iomodule_0" PORT="LMB_WriteDBus"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_LMB_Ready" DIR="O" MPD_INDEX="20" NAME="LMB_Ready" SIGNAME="dlmb_LMB_Ready">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DLMB]" INSTANCE="%microblaze_instance%" PORT="DREADY"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_LMB_Wait" DIR="O" MPD_INDEX="21" NAME="LMB_Wait" SIGNAME="dlmb_LMB_Wait">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DLMB]" INSTANCE="%microblaze_instance%" PORT="DWAIT"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_LMB_UE" DIR="O" MPD_INDEX="22" NAME="LMB_UE" SIGNAME="dlmb_LMB_UE">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DLMB]" INSTANCE="%microblaze_instance%" PORT="DUE"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_LMB_CE" DIR="O" MPD_INDEX="23" NAME="LMB_CE" SIGNAME="dlmb_LMB_CE">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DLMB]" INSTANCE="%microblaze_instance%" PORT="DCE"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="dlmb_LMB_BE" DIR="O" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="24" MSB="0" NAME="LMB_BE" RIGHT="3" SIGNAME="dlmb_LMB_BE" VECFORMULA="[0:(C_LMB_DWIDTH+7)/8-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="dlmb_cntlr" PORT="LMB_BE"/>
            <CONNECTION BUSINTERFACE="[SLMB]" INSTANCE="iomodule_0" PORT="LMB_BE"/>
          </CONNECTIONS>
        </PORT>
      </PORTS>
      <BUSINTERFACES/>
      <IOINTERFACES>
        <IOINTERFACE MPD_INDEX="0" NAME="reset_0"/>
      </IOINTERFACES>
    </MODULE>
    <MODULE HWVERSION="3.00.b" INSTANCE="dlmb_cntlr" IPTYPE="PERIPHERAL" MHS_INDEX="3" MODCLASS="MEMORY_CNTLR" MODTYPE="lmb_bram_if_cntlr">
      <DESCRIPTION TYPE="SHORT">LMB BRAM Controller</DESCRIPTION>
      <DESCRIPTION TYPE="LONG">Local Memory Bus (LMB) Block RAM (BRAM) Interface Controller connects to an lmb bus</DESCRIPTION>
      <DOCUMENTATION>
        <DOCUMENT SOURCE="" TYPE="IP"/>
      </DOCUMENTATION>
      <LICENSEINFO ICON_NAME="ps_core_preferred"/>
      <PARAMETERS>
        <PARAMETER ADDRESS="BASE" ADDR_TYPE="MEMORY" CHANGEDBY="USER" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LSB="31" MHS_INDEX="2" MPD_INDEX="0" MSB="0" NAME="C_BASEADDR" TYPE="std_logic_vector" VALUE="0x00000000">
          <DESCRIPTION>LMB BRAM Base Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="HIGH" ADDR_TYPE="MEMORY" CHANGEDBY="USER" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LSB="31" MHS_INDEX="3" MPD_INDEX="1" MSB="0" NAME="C_HIGHADDR" TYPE="std_logic_vector" VALUE="%highvalue%">
          <DESCRIPTION>LMB BRAM High Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="2" NAME="C_FAMILY" TYPE="string" VALUE="%family%"/>
        <PARAMETER CHANGEDBY="USER" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LSB="31" MHS_INDEX="4" MPD_INDEX="3" MSB="0" NAME="C_MASK" TYPE="std_logic_vector" VALUE="0x80000000">
          <DESCRIPTION>LMB Address Decode Mask</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="4" NAME="C_LMB_AWIDTH" TYPE="integer" VALUE="32">
          <DESCRIPTION>LMB Address Bus Width </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="5" NAME="C_LMB_DWIDTH" TYPE="integer" VALUE="32">
          <DESCRIPTION>LMB Data Bus Width </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="6" NAME="C_ECC" TYPE="integer" VALUE="0">
          <DESCRIPTION>Error Correction Code </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="7" NAME="C_INTERCONNECT" TYPE="integer" VALUE="0">
          <DESCRIPTION>Select Interconnect </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="8" NAME="C_FAULT_INJECT" TYPE="integer" VALUE="0">
          <DESCRIPTION>Fault Inject Registers </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="9" NAME="C_CE_FAILING_REGISTERS" TYPE="integer" VALUE="0">
          <DESCRIPTION>Correctable Error First Failing Register </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="10" NAME="C_UE_FAILING_REGISTERS" TYPE="integer" VALUE="0">
          <DESCRIPTION>Uncorrectable Error First Failing Register </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="11" NAME="C_ECC_STATUS_REGISTERS" TYPE="integer" VALUE="0">
          <DESCRIPTION>ECC Status and Control Register </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="12" NAME="C_ECC_ONOFF_REGISTER" TYPE="integer" VALUE="0">
          <DESCRIPTION>ECC On/Off Register </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="13" NAME="C_ECC_ONOFF_RESET_VALUE" TYPE="integer" VALUE="1">
          <DESCRIPTION>ECC On/Off Reset Value </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="14" NAME="C_CE_COUNTER_WIDTH" TYPE="integer" VALUE="0">
          <DESCRIPTION>Correctable Error Counter Register Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="15" NAME="C_WRITE_ACCESS" TYPE="integer" VALUE="2">
          <DESCRIPTION>Write Access setting </DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="BASE" ADDR_TYPE="REGISTER" MPD_INDEX="16" NAME="C_SPLB_CTRL_BASEADDR" TYPE="std_logic_vector" VALUE="0xFFFFFFFF">
          <DESCRIPTION>Base Address for PLB Interface</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="HIGH" ADDR_TYPE="REGISTER" MPD_INDEX="17" NAME="C_SPLB_CTRL_HIGHADDR" TYPE="std_logic_vector" VALUE="0x00000000">
          <DESCRIPTION>High Address for PLB Interface</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="18" NAME="C_SPLB_CTRL_AWIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>PLB Address Bus Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="19" NAME="C_SPLB_CTRL_DWIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>PLB Data Bus Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="20" NAME="C_SPLB_CTRL_P2P" TYPE="INTEGER" VALUE="0">
          <DESCRIPTION>PLB Slave Uses P2P Topology</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="21" NAME="C_SPLB_CTRL_MID_WIDTH" TYPE="INTEGER" VALUE="1">
          <DESCRIPTION>Master ID Bus Width of PLB</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="22" NAME="C_SPLB_CTRL_NUM_MASTERS" TYPE="INTEGER" VALUE="1">
          <DESCRIPTION>Number of PLB Masters</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="23" NAME="C_SPLB_CTRL_SUPPORT_BURSTS" TYPE="INTEGER" VALUE="0">
          <DESCRIPTION>PLB Slave is Capable of Bursts</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="24" NAME="C_SPLB_CTRL_NATIVE_DWIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>Native Data Bus Width of PLB Slave</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="25" NAME="C_SPLB_CTRL_CLK_FREQ_HZ" TYPE="INTEGER" VALUE="%freq%">
          <DESCRIPTION>Frequency of PLB Slave</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="26" NAME="C_S_AXI_CTRL_ACLK_FREQ_HZ" TYPE="INTEGER" VALUE="%freq%">
          <DESCRIPTION>S_AXI_CTRL Clock Frequency</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="BASE" ADDR_TYPE="REGISTER" MPD_INDEX="27" NAME="C_S_AXI_CTRL_BASEADDR" TYPE="std_logic_vector" VALUE="0xFFFFFFFF">
          <DESCRIPTION>S_AXI_CTRL Base Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="HIGH" ADDR_TYPE="REGISTER" MPD_INDEX="28" NAME="C_S_AXI_CTRL_HIGHADDR" TYPE="std_logic_vector" VALUE="0x00000000">
          <DESCRIPTION>S_AXI_CTRL High Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="29" NAME="C_S_AXI_CTRL_ADDR_WIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>S_AXI_CTRL Address Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="30" NAME="C_S_AXI_CTRL_DATA_WIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>S_AXI_CTRL Data Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="31" NAME="C_S_AXI_CTRL_PROTOCOL" TYPE="STRING" VALUE="AXI4LITE">
          <DESCRIPTION>S_AXI_CTRL Protocol</DESCRIPTION>
        </PARAMETER>
      </PARAMETERS>
      <PORTS>
        <PORT BUS="SLMB" CLKFREQUENCY="%freq%" DEF_SIGNAME="Clk" DIR="I" MPD_INDEX="0" NAME="LMB_Clk" SIGIS="CLK" SIGNAME="Clk">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Clk"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_LMB_Rst" DIR="I" MPD_INDEX="1" NAME="LMB_Rst" SIGIS="RST" SIGNAME="dlmb_LMB_Rst">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_RST"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_LMB_ABus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="2" MSB="0" NAME="LMB_ABus" RIGHT="31" SIGNAME="dlmb_LMB_ABus" VECFORMULA="[0:C_LMB_AWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_ABUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_LMB_WriteDBus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="3" MSB="0" NAME="LMB_WriteDBus" RIGHT="31" SIGNAME="dlmb_LMB_WriteDBus" VECFORMULA="[0:C_LMB_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_WRITEDBUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_LMB_AddrStrobe" DIR="I" MPD_INDEX="4" NAME="LMB_AddrStrobe" SIGNAME="dlmb_LMB_AddrStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_ADDRSTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_LMB_ReadStrobe" DIR="I" MPD_INDEX="5" NAME="LMB_ReadStrobe" SIGNAME="dlmb_LMB_ReadStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_READSTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_LMB_WriteStrobe" DIR="I" MPD_INDEX="6" NAME="LMB_WriteStrobe" SIGNAME="dlmb_LMB_WriteStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_WRITESTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_LMB_BE" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="7" MSB="0" NAME="LMB_BE" RIGHT="3" SIGNAME="dlmb_LMB_BE" VECFORMULA="[0:C_LMB_DWIDTH/8-1]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_BE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_Sl_DBus" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="8" MSB="0" NAME="Sl_DBus" RIGHT="31" SIGNAME="dlmb_Sl_DBus" VECFORMULA="[0:C_LMB_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="SL_DBUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_Sl_Ready" DIR="O" MPD_INDEX="9" NAME="Sl_Ready" SIGNAME="dlmb_Sl_Ready">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="SL_READY"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_Sl_Wait" DIR="O" MPD_INDEX="10" NAME="Sl_Wait" SIGNAME="dlmb_Sl_Wait">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="SL_WAIT"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_Sl_UE" DIR="O" MPD_INDEX="11" NAME="Sl_UE" SIGNAME="dlmb_Sl_UE">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="SL_UE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_Sl_CE" DIR="O" MPD_INDEX="12" NAME="Sl_CE" SIGNAME="dlmb_Sl_CE">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="SL_CE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="dlmb_port_BRAM_Rst" DIR="O" MPD_INDEX="13" NAME="BRAM_Rst_A" SIGIS="RST" SIGNAME="dlmb_port_BRAM_Rst">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTB]" INSTANCE="lmb_bram" PORT="BRAM_Rst_B"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="dlmb_port_BRAM_Clk" DIR="O" MPD_INDEX="14" NAME="BRAM_Clk_A" SIGIS="CLK" SIGNAME="dlmb_port_BRAM_Clk">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTB]" INSTANCE="lmb_bram" PORT="BRAM_Clk_B"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="dlmb_port_BRAM_EN" DIR="O" MPD_INDEX="15" NAME="BRAM_EN_A" SIGNAME="dlmb_port_BRAM_EN">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTB]" INSTANCE="lmb_bram" PORT="BRAM_EN_B"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="dlmb_port_BRAM_WEN" DIR="O" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="16" MSB="0" NAME="BRAM_WEN_A" RIGHT="3" SIGNAME="dlmb_port_BRAM_WEN" VECFORMULA="[0:((C_LMB_DWIDTH+8*C_ECC)/8)-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTB]" INSTANCE="lmb_bram" PORT="BRAM_WEN_B"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="dlmb_port_BRAM_Addr" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="17" MSB="0" NAME="BRAM_Addr_A" RIGHT="31" SIGNAME="dlmb_port_BRAM_Addr" VECFORMULA="[0:C_LMB_AWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTB]" INSTANCE="lmb_bram" PORT="BRAM_Addr_B"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="dlmb_port_BRAM_Din" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="18" MSB="0" NAME="BRAM_Din_A" RIGHT="31" SIGNAME="dlmb_port_BRAM_Din" VECFORMULA="[0:C_LMB_DWIDTH-1+8*C_ECC]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTB]" INSTANCE="lmb_bram" PORT="BRAM_Din_B"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="dlmb_port_BRAM_Dout" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="19" MSB="0" NAME="BRAM_Dout_A" RIGHT="31" SIGNAME="dlmb_port_BRAM_Dout" VECFORMULA="[0:C_LMB_DWIDTH-1+8*C_ECC]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTB]" INSTANCE="lmb_bram" PORT="BRAM_Dout_B"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" MPD_INDEX="20" NAME="Interrupt" SENSITIVITY="LEVEL_HIGH" SIGIS="INTERRUPT" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="21" MSB="0" NAME="SPLB_CTRL_PLB_ABus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="22" NAME="SPLB_CTRL_PLB_PAValid" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="23" NAME="SPLB_CTRL_PLB_masterID" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_MID_WIDTH-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="24" NAME="SPLB_CTRL_PLB_RNW" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="25" MSB="0" NAME="SPLB_CTRL_PLB_BE" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:((C_SPLB_CTRL_DWIDTH/8)-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="26" MSB="0" NAME="SPLB_CTRL_PLB_size" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:3]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="2" MPD_INDEX="27" MSB="0" NAME="SPLB_CTRL_PLB_type" RIGHT="2" SIGNAME="__NOC__" VECFORMULA="[0:2]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="28" MSB="0" NAME="SPLB_CTRL_PLB_wrDBus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_DWIDTH-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="29" NAME="SPLB_CTRL_Sl_addrAck" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="30" MSB="0" NAME="SPLB_CTRL_Sl_SSize" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="31" NAME="SPLB_CTRL_Sl_wait" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="32" NAME="SPLB_CTRL_Sl_rearbitrate" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="33" NAME="SPLB_CTRL_Sl_wrDAck" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="34" NAME="SPLB_CTRL_Sl_wrComp" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="35" MSB="0" NAME="SPLB_CTRL_Sl_rdDBus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_DWIDTH-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="36" NAME="SPLB_CTRL_Sl_rdDAck" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="37" NAME="SPLB_CTRL_Sl_rdComp" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="38" NAME="SPLB_CTRL_Sl_MBusy" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_NUM_MASTERS-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="39" NAME="SPLB_CTRL_Sl_MWrErr" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_NUM_MASTERS-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="40" NAME="SPLB_CTRL_Sl_MRdErr" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_NUM_MASTERS-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="41" MSB="0" NAME="SPLB_CTRL_PLB_UABus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="42" NAME="SPLB_CTRL_PLB_SAValid" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="43" NAME="SPLB_CTRL_PLB_rdPrim" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="44" NAME="SPLB_CTRL_PLB_wrPrim" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="45" NAME="SPLB_CTRL_PLB_abort" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="46" NAME="SPLB_CTRL_PLB_busLock" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="47" MSB="0" NAME="SPLB_CTRL_PLB_MSize" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="48" NAME="SPLB_CTRL_PLB_lockErr" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="49" NAME="SPLB_CTRL_PLB_wrBurst" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="50" NAME="SPLB_CTRL_PLB_rdBurst" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="51" NAME="SPLB_CTRL_PLB_wrPendReq" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="52" NAME="SPLB_CTRL_PLB_rdPendReq" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="53" MSB="0" NAME="SPLB_CTRL_PLB_wrPendPri" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="54" MSB="0" NAME="SPLB_CTRL_PLB_rdPendPri" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="55" MSB="0" NAME="SPLB_CTRL_PLB_reqPri" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="15" MPD_INDEX="56" MSB="0" NAME="SPLB_CTRL_PLB_TAttribute" RIGHT="15" SIGNAME="__NOC__" VECFORMULA="[0:15]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="57" NAME="SPLB_CTRL_Sl_wrBTerm" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="58" MSB="0" NAME="SPLB_CTRL_Sl_rdWdAddr" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:3]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="59" NAME="SPLB_CTRL_Sl_rdBTerm" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="60" NAME="SPLB_CTRL_Sl_MIRQ" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_NUM_MASTERS-1)]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" IS_VALID="FALSE" MPD_INDEX="61" NAME="S_AXI_CTRL_ACLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" IS_VALID="FALSE" MPD_INDEX="62" NAME="S_AXI_CTRL_ARESETN" SIGIS="RST" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="63" MSB="31" NAME="S_AXI_CTRL_AWADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_S_AXI_CTRL_ADDR_WIDTH-1):0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="64" NAME="S_AXI_CTRL_AWVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="65" NAME="S_AXI_CTRL_AWREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="66" MSB="31" NAME="S_AXI_CTRL_WDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_S_AXI_CTRL_DATA_WIDTH-1):0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="67" MSB="3" NAME="S_AXI_CTRL_WSTRB" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[((C_S_AXI_CTRL_DATA_WIDTH/8)-1):0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="68" NAME="S_AXI_CTRL_WVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="69" NAME="S_AXI_CTRL_WREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="70" MSB="1" NAME="S_AXI_CTRL_BRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="71" NAME="S_AXI_CTRL_BVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="72" NAME="S_AXI_CTRL_BREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="73" MSB="31" NAME="S_AXI_CTRL_ARADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_S_AXI_CTRL_ADDR_WIDTH-1):0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="74" NAME="S_AXI_CTRL_ARVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="75" NAME="S_AXI_CTRL_ARREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="76" MSB="31" NAME="S_AXI_CTRL_RDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_S_AXI_CTRL_DATA_WIDTH-1):0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="77" MSB="1" NAME="S_AXI_CTRL_RRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="78" NAME="S_AXI_CTRL_RVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="79" NAME="S_AXI_CTRL_RREADY" SIGNAME="__NOC__"/>
      </PORTS>
      <BUSINTERFACES>
        <BUSINTERFACE BUSNAME="dlmb" BUSSTD="LMB" BUSSTD_PSF="LMB" IS_INSTANTIATED="TRUE" MHS_INDEX="0" MPD_INDEX="0" NAME="SLMB" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="LMB_Clk"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_Rst"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_ABus"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_WriteDBus"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_AddrStrobe"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_ReadStrobe"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_WriteStrobe"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_BE"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_DBus"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_Ready"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_Wait"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_UE"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_CE"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="dlmb_port" BUSSTD="XIL" BUSSTD_PSF="XIL_BRAM" IS_INSTANTIATED="TRUE" MHS_INDEX="1" MPD_INDEX="1" NAME="BRAM_PORT" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="BRAM_Rst_A"/>
            <PORTMAP DIR="O" PHYSICAL="BRAM_Clk_A"/>
            <PORTMAP DIR="O" PHYSICAL="BRAM_EN_A"/>
            <PORTMAP DIR="O" PHYSICAL="BRAM_WEN_A"/>
            <PORTMAP DIR="O" PHYSICAL="BRAM_Addr_A"/>
            <PORTMAP DIR="I" PHYSICAL="BRAM_Din_A"/>
            <PORTMAP DIR="O" PHYSICAL="BRAM_Dout_A"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="PLBV46" BUSSTD_PSF="PLBV46" IS_VALID="FALSE" MPD_INDEX="2" NAME="SPLB_CTRL" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_ABus"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_PAValid"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_masterID"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_RNW"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_BE"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_size"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_type"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_wrDBus"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_addrAck"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_SSize"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_wait"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_rearbitrate"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_wrDAck"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_wrComp"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_rdDBus"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_rdDAck"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_rdComp"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_MBusy"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_MWrErr"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_MRdErr"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_UABus"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_SAValid"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_rdPrim"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_wrPrim"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_abort"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_busLock"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_MSize"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_lockErr"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_wrBurst"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_rdBurst"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_wrPendReq"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_rdPendReq"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_wrPendPri"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_rdPendPri"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_reqPri"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_TAttribute"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_wrBTerm"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_rdWdAddr"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_rdBTerm"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_MIRQ"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXI" BUSSTD_PSF="AXI" IS_VALID="FALSE" MPD_INDEX="3" NAME="S_AXI_CTRL" PROTOCOL="AXI4LITE" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_ACLK"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_ARESETN"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_AWADDR"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_AWVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_AWREADY"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_WDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_WSTRB"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_WVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_WREADY"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_BRESP"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_BVALID"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_BREADY"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_ARADDR"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_ARVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_ARREADY"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_RDATA"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_RRESP"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_RVALID"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_RREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
      </BUSINTERFACES>
      <MEMORYMAP>
        <MEMRANGE BASEDECIMAL="0" BASENAME="C_BASEADDR" BASEVALUE="0x00000000" HIGHDECIMAL="%highdecimal%" HIGHNAME="C_HIGHADDR" HIGHVALUE="%highvalue%" MEMTYPE="MEMORY" MINSIZE="0x800" SIZE="%memorysize%" SIZEABRV="%sizeabrv%">
          <SLAVES>
            <SLAVE BUSINTERFACE="SLMB"/>
          </SLAVES>
        </MEMRANGE>
        <MEMRANGE BASEDECIMAL="4294967295" BASENAME="C_SPLB_CTRL_BASEADDR" BASEVALUE="0xFFFFFFFF" HIGHDECIMAL="0" HIGHNAME="C_SPLB_CTRL_HIGHADDR" HIGHVALUE="0x00000000" IS_VALID="FALSE" MEMTYPE="REGISTER" MINSIZE="0x100" SIZE="0" SIZEABRV="U">
          <SLAVES>
            <SLAVE BUSINTERFACE="SPLB_CTRL"/>
          </SLAVES>
        </MEMRANGE>
        <MEMRANGE BASEDECIMAL="4294967295" BASENAME="C_S_AXI_CTRL_BASEADDR" BASEVALUE="0xFFFFFFFF" HIGHDECIMAL="0" HIGHNAME="C_S_AXI_CTRL_HIGHADDR" HIGHVALUE="0x00000000" IS_VALID="FALSE" MEMTYPE="REGISTER" MINSIZE="0x100" SIZE="0" SIZEABRV="U">
          <SLAVES>
            <SLAVE BUSINTERFACE="S_AXI_CTRL"/>
          </SLAVES>
        </MEMRANGE>
      </MEMORYMAP>
    </MODULE>
    <MODULE HWVERSION="3.00.b" INSTANCE="ilmb_cntlr" IPTYPE="PERIPHERAL" MHS_INDEX="4" MODCLASS="MEMORY_CNTLR" MODTYPE="lmb_bram_if_cntlr">
      <DESCRIPTION TYPE="SHORT">LMB BRAM Controller</DESCRIPTION>
      <DESCRIPTION TYPE="LONG">Local Memory Bus (LMB) Block RAM (BRAM) Interface Controller connects to an lmb bus</DESCRIPTION>
      <DOCUMENTATION>
        <DOCUMENT SOURCE="" TYPE="IP"/>
      </DOCUMENTATION>
      <LICENSEINFO ICON_NAME="ps_core_preferred"/>
      <PARAMETERS>
        <PARAMETER ADDRESS="BASE" ADDR_TYPE="MEMORY" CHANGEDBY="USER" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LSB="31" MHS_INDEX="2" MPD_INDEX="0" MSB="0" NAME="C_BASEADDR" TYPE="std_logic_vector" VALUE="0x00000000">
          <DESCRIPTION>LMB BRAM Base Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="HIGH" ADDR_TYPE="MEMORY" CHANGEDBY="USER" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LSB="31" MHS_INDEX="3" MPD_INDEX="1" MSB="0" NAME="C_HIGHADDR" TYPE="std_logic_vector" VALUE="%highvalue%">
          <DESCRIPTION>LMB BRAM High Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="2" NAME="C_FAMILY" TYPE="string" VALUE="%family%"/>
        <PARAMETER CHANGEDBY="USER" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LSB="31" MHS_INDEX="4" MPD_INDEX="3" MSB="0" NAME="C_MASK" TYPE="std_logic_vector" VALUE="0x80000000">
          <DESCRIPTION>LMB Address Decode Mask</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="4" NAME="C_LMB_AWIDTH" TYPE="integer" VALUE="32">
          <DESCRIPTION>LMB Address Bus Width </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="5" NAME="C_LMB_DWIDTH" TYPE="integer" VALUE="32">
          <DESCRIPTION>LMB Data Bus Width </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="6" NAME="C_ECC" TYPE="integer" VALUE="0">
          <DESCRIPTION>Error Correction Code </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="7" NAME="C_INTERCONNECT" TYPE="integer" VALUE="0">
          <DESCRIPTION>Select Interconnect </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="8" NAME="C_FAULT_INJECT" TYPE="integer" VALUE="0">
          <DESCRIPTION>Fault Inject Registers </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="9" NAME="C_CE_FAILING_REGISTERS" TYPE="integer" VALUE="0">
          <DESCRIPTION>Correctable Error First Failing Register </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="10" NAME="C_UE_FAILING_REGISTERS" TYPE="integer" VALUE="0">
          <DESCRIPTION>Uncorrectable Error First Failing Register </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="11" NAME="C_ECC_STATUS_REGISTERS" TYPE="integer" VALUE="0">
          <DESCRIPTION>ECC Status and Control Register </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="12" NAME="C_ECC_ONOFF_REGISTER" TYPE="integer" VALUE="0">
          <DESCRIPTION>ECC On/Off Register </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="13" NAME="C_ECC_ONOFF_RESET_VALUE" TYPE="integer" VALUE="1">
          <DESCRIPTION>ECC On/Off Reset Value </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="14" NAME="C_CE_COUNTER_WIDTH" TYPE="integer" VALUE="0">
          <DESCRIPTION>Correctable Error Counter Register Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="15" NAME="C_WRITE_ACCESS" TYPE="integer" VALUE="2">
          <DESCRIPTION>Write Access setting </DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="BASE" ADDR_TYPE="REGISTER" MPD_INDEX="16" NAME="C_SPLB_CTRL_BASEADDR" TYPE="std_logic_vector" VALUE="0xFFFFFFFF">
          <DESCRIPTION>Base Address for PLB Interface</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="HIGH" ADDR_TYPE="REGISTER" MPD_INDEX="17" NAME="C_SPLB_CTRL_HIGHADDR" TYPE="std_logic_vector" VALUE="0x00000000">
          <DESCRIPTION>High Address for PLB Interface</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="18" NAME="C_SPLB_CTRL_AWIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>PLB Address Bus Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="19" NAME="C_SPLB_CTRL_DWIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>PLB Data Bus Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="20" NAME="C_SPLB_CTRL_P2P" TYPE="INTEGER" VALUE="0">
          <DESCRIPTION>PLB Slave Uses P2P Topology</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="21" NAME="C_SPLB_CTRL_MID_WIDTH" TYPE="INTEGER" VALUE="1">
          <DESCRIPTION>Master ID Bus Width of PLB</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="22" NAME="C_SPLB_CTRL_NUM_MASTERS" TYPE="INTEGER" VALUE="1">
          <DESCRIPTION>Number of PLB Masters</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="23" NAME="C_SPLB_CTRL_SUPPORT_BURSTS" TYPE="INTEGER" VALUE="0">
          <DESCRIPTION>PLB Slave is Capable of Bursts</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="24" NAME="C_SPLB_CTRL_NATIVE_DWIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>Native Data Bus Width of PLB Slave</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="25" NAME="C_SPLB_CTRL_CLK_FREQ_HZ" TYPE="INTEGER" VALUE="%freq%">
          <DESCRIPTION>Frequency of PLB Slave</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="26" NAME="C_S_AXI_CTRL_ACLK_FREQ_HZ" TYPE="INTEGER" VALUE="%freq%">
          <DESCRIPTION>S_AXI_CTRL Clock Frequency</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="BASE" ADDR_TYPE="REGISTER" MPD_INDEX="27" NAME="C_S_AXI_CTRL_BASEADDR" TYPE="std_logic_vector" VALUE="0xFFFFFFFF">
          <DESCRIPTION>S_AXI_CTRL Base Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="HIGH" ADDR_TYPE="REGISTER" MPD_INDEX="28" NAME="C_S_AXI_CTRL_HIGHADDR" TYPE="std_logic_vector" VALUE="0x00000000">
          <DESCRIPTION>S_AXI_CTRL High Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="29" NAME="C_S_AXI_CTRL_ADDR_WIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>S_AXI_CTRL Address Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="30" NAME="C_S_AXI_CTRL_DATA_WIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>S_AXI_CTRL Data Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="31" NAME="C_S_AXI_CTRL_PROTOCOL" TYPE="STRING" VALUE="AXI4LITE">
          <DESCRIPTION>S_AXI_CTRL Protocol</DESCRIPTION>
        </PARAMETER>
      </PARAMETERS>
      <PORTS>
        <PORT BUS="SLMB" CLKFREQUENCY="%freq%" DEF_SIGNAME="Clk" DIR="I" MPD_INDEX="0" NAME="LMB_Clk" SIGIS="CLK" SIGNAME="Clk">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Clk"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="ilmb_LMB_Rst" DIR="I" MPD_INDEX="1" NAME="LMB_Rst" SIGIS="RST" SIGNAME="ilmb_LMB_Rst">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="LMB_RST"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="ilmb_LMB_ABus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="2" MSB="0" NAME="LMB_ABus" RIGHT="31" SIGNAME="ilmb_LMB_ABus" VECFORMULA="[0:C_LMB_AWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="LMB_ABUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="ilmb_LMB_WriteDBus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="3" MSB="0" NAME="LMB_WriteDBus" RIGHT="31" SIGNAME="ilmb_LMB_WriteDBus" VECFORMULA="[0:C_LMB_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="LMB_WRITEDBUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="ilmb_LMB_AddrStrobe" DIR="I" MPD_INDEX="4" NAME="LMB_AddrStrobe" SIGNAME="ilmb_LMB_AddrStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="LMB_ADDRSTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="ilmb_LMB_ReadStrobe" DIR="I" MPD_INDEX="5" NAME="LMB_ReadStrobe" SIGNAME="ilmb_LMB_ReadStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="LMB_READSTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="ilmb_LMB_WriteStrobe" DIR="I" MPD_INDEX="6" NAME="LMB_WriteStrobe" SIGNAME="ilmb_LMB_WriteStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="LMB_WRITESTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="ilmb_LMB_BE" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="7" MSB="0" NAME="LMB_BE" RIGHT="3" SIGNAME="ilmb_LMB_BE" VECFORMULA="[0:C_LMB_DWIDTH/8-1]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="LMB_BE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="ilmb_Sl_DBus" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="8" MSB="0" NAME="Sl_DBus" RIGHT="31" SIGNAME="ilmb_Sl_DBus" VECFORMULA="[0:C_LMB_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="SL_DBUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="ilmb_Sl_Ready" DIR="O" MPD_INDEX="9" NAME="Sl_Ready" SIGNAME="ilmb_Sl_Ready">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="SL_READY"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="ilmb_Sl_Wait" DIR="O" MPD_INDEX="10" NAME="Sl_Wait" SIGNAME="ilmb_Sl_Wait">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="SL_WAIT"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="ilmb_Sl_UE" DIR="O" MPD_INDEX="11" NAME="Sl_UE" SIGNAME="ilmb_Sl_UE">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="SL_UE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="ilmb_Sl_CE" DIR="O" MPD_INDEX="12" NAME="Sl_CE" SIGNAME="ilmb_Sl_CE">
          <CONNECTIONS>
            <CONNECTION INSTANCE="ilmb" PORT="SL_CE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="ilmb_port_BRAM_Rst" DIR="O" MPD_INDEX="13" NAME="BRAM_Rst_A" SIGIS="RST" SIGNAME="ilmb_port_BRAM_Rst">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTA]" INSTANCE="lmb_bram" PORT="BRAM_Rst_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="ilmb_port_BRAM_Clk" DIR="O" MPD_INDEX="14" NAME="BRAM_Clk_A" SIGIS="CLK" SIGNAME="ilmb_port_BRAM_Clk">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTA]" INSTANCE="lmb_bram" PORT="BRAM_Clk_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="ilmb_port_BRAM_EN" DIR="O" MPD_INDEX="15" NAME="BRAM_EN_A" SIGNAME="ilmb_port_BRAM_EN">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTA]" INSTANCE="lmb_bram" PORT="BRAM_EN_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="ilmb_port_BRAM_WEN" DIR="O" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="16" MSB="0" NAME="BRAM_WEN_A" RIGHT="3" SIGNAME="ilmb_port_BRAM_WEN" VECFORMULA="[0:((C_LMB_DWIDTH+8*C_ECC)/8)-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTA]" INSTANCE="lmb_bram" PORT="BRAM_WEN_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="ilmb_port_BRAM_Addr" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="17" MSB="0" NAME="BRAM_Addr_A" RIGHT="31" SIGNAME="ilmb_port_BRAM_Addr" VECFORMULA="[0:C_LMB_AWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTA]" INSTANCE="lmb_bram" PORT="BRAM_Addr_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="ilmb_port_BRAM_Din" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="18" MSB="0" NAME="BRAM_Din_A" RIGHT="31" SIGNAME="ilmb_port_BRAM_Din" VECFORMULA="[0:C_LMB_DWIDTH-1+8*C_ECC]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTA]" INSTANCE="lmb_bram" PORT="BRAM_Din_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="BRAM_PORT" DEF_SIGNAME="ilmb_port_BRAM_Dout" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="19" MSB="0" NAME="BRAM_Dout_A" RIGHT="31" SIGNAME="ilmb_port_BRAM_Dout" VECFORMULA="[0:C_LMB_DWIDTH-1+8*C_ECC]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[PORTA]" INSTANCE="lmb_bram" PORT="BRAM_Dout_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" MPD_INDEX="20" NAME="Interrupt" SENSITIVITY="LEVEL_HIGH" SIGIS="INTERRUPT" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="21" MSB="0" NAME="SPLB_CTRL_PLB_ABus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="22" NAME="SPLB_CTRL_PLB_PAValid" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="23" NAME="SPLB_CTRL_PLB_masterID" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_MID_WIDTH-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="24" NAME="SPLB_CTRL_PLB_RNW" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="25" MSB="0" NAME="SPLB_CTRL_PLB_BE" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:((C_SPLB_CTRL_DWIDTH/8)-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="26" MSB="0" NAME="SPLB_CTRL_PLB_size" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:3]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="2" MPD_INDEX="27" MSB="0" NAME="SPLB_CTRL_PLB_type" RIGHT="2" SIGNAME="__NOC__" VECFORMULA="[0:2]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="28" MSB="0" NAME="SPLB_CTRL_PLB_wrDBus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_DWIDTH-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="29" NAME="SPLB_CTRL_Sl_addrAck" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="30" MSB="0" NAME="SPLB_CTRL_Sl_SSize" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="31" NAME="SPLB_CTRL_Sl_wait" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="32" NAME="SPLB_CTRL_Sl_rearbitrate" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="33" NAME="SPLB_CTRL_Sl_wrDAck" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="34" NAME="SPLB_CTRL_Sl_wrComp" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="35" MSB="0" NAME="SPLB_CTRL_Sl_rdDBus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_DWIDTH-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="36" NAME="SPLB_CTRL_Sl_rdDAck" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="37" NAME="SPLB_CTRL_Sl_rdComp" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="38" NAME="SPLB_CTRL_Sl_MBusy" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_NUM_MASTERS-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="39" NAME="SPLB_CTRL_Sl_MWrErr" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_NUM_MASTERS-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="40" NAME="SPLB_CTRL_Sl_MRdErr" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_NUM_MASTERS-1)]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="41" MSB="0" NAME="SPLB_CTRL_PLB_UABus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="42" NAME="SPLB_CTRL_PLB_SAValid" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="43" NAME="SPLB_CTRL_PLB_rdPrim" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="44" NAME="SPLB_CTRL_PLB_wrPrim" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="45" NAME="SPLB_CTRL_PLB_abort" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="46" NAME="SPLB_CTRL_PLB_busLock" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="47" MSB="0" NAME="SPLB_CTRL_PLB_MSize" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="48" NAME="SPLB_CTRL_PLB_lockErr" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="49" NAME="SPLB_CTRL_PLB_wrBurst" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="50" NAME="SPLB_CTRL_PLB_rdBurst" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="51" NAME="SPLB_CTRL_PLB_wrPendReq" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="52" NAME="SPLB_CTRL_PLB_rdPendReq" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="53" MSB="0" NAME="SPLB_CTRL_PLB_wrPendPri" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="54" MSB="0" NAME="SPLB_CTRL_PLB_rdPendPri" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="55" MSB="0" NAME="SPLB_CTRL_PLB_reqPri" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="15" MPD_INDEX="56" MSB="0" NAME="SPLB_CTRL_PLB_TAttribute" RIGHT="15" SIGNAME="__NOC__" VECFORMULA="[0:15]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="57" NAME="SPLB_CTRL_Sl_wrBTerm" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="58" MSB="0" NAME="SPLB_CTRL_Sl_rdWdAddr" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:3]"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="59" NAME="SPLB_CTRL_Sl_rdBTerm" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="60" NAME="SPLB_CTRL_Sl_MIRQ" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_CTRL_NUM_MASTERS-1)]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" IS_VALID="FALSE" MPD_INDEX="61" NAME="S_AXI_CTRL_ACLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" IS_VALID="FALSE" MPD_INDEX="62" NAME="S_AXI_CTRL_ARESETN" SIGIS="RST" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="63" MSB="31" NAME="S_AXI_CTRL_AWADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_S_AXI_CTRL_ADDR_WIDTH-1):0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="64" NAME="S_AXI_CTRL_AWVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="65" NAME="S_AXI_CTRL_AWREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="66" MSB="31" NAME="S_AXI_CTRL_WDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_S_AXI_CTRL_DATA_WIDTH-1):0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="67" MSB="3" NAME="S_AXI_CTRL_WSTRB" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[((C_S_AXI_CTRL_DATA_WIDTH/8)-1):0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="68" NAME="S_AXI_CTRL_WVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="69" NAME="S_AXI_CTRL_WREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="70" MSB="1" NAME="S_AXI_CTRL_BRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="71" NAME="S_AXI_CTRL_BVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="72" NAME="S_AXI_CTRL_BREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="73" MSB="31" NAME="S_AXI_CTRL_ARADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_S_AXI_CTRL_ADDR_WIDTH-1):0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="74" NAME="S_AXI_CTRL_ARVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="75" NAME="S_AXI_CTRL_ARREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="76" MSB="31" NAME="S_AXI_CTRL_RDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_S_AXI_CTRL_DATA_WIDTH-1):0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="77" MSB="1" NAME="S_AXI_CTRL_RRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="78" NAME="S_AXI_CTRL_RVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI_CTRL" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="79" NAME="S_AXI_CTRL_RREADY" SIGNAME="__NOC__"/>
      </PORTS>
      <BUSINTERFACES>
        <BUSINTERFACE BUSNAME="ilmb" BUSSTD="LMB" BUSSTD_PSF="LMB" IS_INSTANTIATED="TRUE" MHS_INDEX="0" MPD_INDEX="0" NAME="SLMB" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="LMB_Clk"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_Rst"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_ABus"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_WriteDBus"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_AddrStrobe"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_ReadStrobe"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_WriteStrobe"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_BE"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_DBus"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_Ready"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_Wait"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_UE"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_CE"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="ilmb_port" BUSSTD="XIL" BUSSTD_PSF="XIL_BRAM" IS_INSTANTIATED="TRUE" MHS_INDEX="1" MPD_INDEX="1" NAME="BRAM_PORT" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="BRAM_Rst_A"/>
            <PORTMAP DIR="O" PHYSICAL="BRAM_Clk_A"/>
            <PORTMAP DIR="O" PHYSICAL="BRAM_EN_A"/>
            <PORTMAP DIR="O" PHYSICAL="BRAM_WEN_A"/>
            <PORTMAP DIR="O" PHYSICAL="BRAM_Addr_A"/>
            <PORTMAP DIR="I" PHYSICAL="BRAM_Din_A"/>
            <PORTMAP DIR="O" PHYSICAL="BRAM_Dout_A"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="PLBV46" BUSSTD_PSF="PLBV46" IS_VALID="FALSE" MPD_INDEX="2" NAME="SPLB_CTRL" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_ABus"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_PAValid"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_masterID"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_RNW"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_BE"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_size"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_type"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_wrDBus"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_addrAck"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_SSize"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_wait"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_rearbitrate"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_wrDAck"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_wrComp"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_rdDBus"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_rdDAck"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_rdComp"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_MBusy"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_MWrErr"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_MRdErr"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_UABus"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_SAValid"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_rdPrim"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_wrPrim"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_abort"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_busLock"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_MSize"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_lockErr"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_wrBurst"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_rdBurst"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_wrPendReq"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_rdPendReq"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_wrPendPri"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_rdPendPri"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_reqPri"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_CTRL_PLB_TAttribute"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_wrBTerm"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_rdWdAddr"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_rdBTerm"/>
            <PORTMAP DIR="O" PHYSICAL="SPLB_CTRL_Sl_MIRQ"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXI" BUSSTD_PSF="AXI" IS_VALID="FALSE" MPD_INDEX="3" NAME="S_AXI_CTRL" PROTOCOL="AXI4LITE" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_ACLK"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_ARESETN"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_AWADDR"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_AWVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_AWREADY"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_WDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_WSTRB"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_WVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_WREADY"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_BRESP"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_BVALID"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_BREADY"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_ARADDR"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_ARVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_ARREADY"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_RDATA"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_RRESP"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_CTRL_RVALID"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_CTRL_RREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
      </BUSINTERFACES>
      <MEMORYMAP>
        <MEMRANGE BASEDECIMAL="0" BASENAME="C_BASEADDR" BASEVALUE="0x00000000" HIGHDECIMAL="%highdecimal%" HIGHNAME="C_HIGHADDR" HIGHVALUE="%highvalue%" MEMTYPE="MEMORY" MINSIZE="0x800" SIZE="%memorysize%" SIZEABRV="%sizeabrv%">
          <SLAVES>
            <SLAVE BUSINTERFACE="SLMB"/>
          </SLAVES>
        </MEMRANGE>
        <MEMRANGE BASEDECIMAL="4294967295" BASENAME="C_SPLB_CTRL_BASEADDR" BASEVALUE="0xFFFFFFFF" HIGHDECIMAL="0" HIGHNAME="C_SPLB_CTRL_HIGHADDR" HIGHVALUE="0x00000000" IS_VALID="FALSE" MEMTYPE="REGISTER" MINSIZE="0x100" SIZE="0" SIZEABRV="U">
          <SLAVES>
            <SLAVE BUSINTERFACE="SPLB_CTRL"/>
          </SLAVES>
        </MEMRANGE>
        <MEMRANGE BASEDECIMAL="4294967295" BASENAME="C_S_AXI_CTRL_BASEADDR" BASEVALUE="0xFFFFFFFF" HIGHDECIMAL="0" HIGHNAME="C_S_AXI_CTRL_HIGHADDR" HIGHVALUE="0x00000000" IS_VALID="FALSE" MEMTYPE="REGISTER" MINSIZE="0x100" SIZE="0" SIZEABRV="U">
          <SLAVES>
            <SLAVE BUSINTERFACE="S_AXI_CTRL"/>
          </SLAVES>
        </MEMRANGE>
      </MEMORYMAP>
    </MODULE>
    <MODULE HWVERSION="1.00.a" INSTANCE="lmb_bram" IPTYPE="PERIPHERAL" MHS_INDEX="5" MODCLASS="MEMORY" MODTYPE="bram_block">
      <DESCRIPTION TYPE="SHORT">Block RAM (BRAM) Block</DESCRIPTION>
      <DESCRIPTION TYPE="LONG">The BRAM Block is a configurable memory module that attaches to a variety of BRAM Interface Controllers.</DESCRIPTION>
      <DOCUMENTATION>
        <DOCUMENT SOURCE="" TYPE="IP"/>
      </DOCUMENTATION>
      <LICENSEINFO ICON_NAME="ps_core_preferred"/>
      <PARAMETERS>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="0" NAME="C_MEMSIZE" TYPE="integer" VALUE="0x2000">
          <DESCRIPTION>Size of BRAM(s) in Bytes</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="1" NAME="C_PORT_DWIDTH" TYPE="integer" VALUE="32">
          <DESCRIPTION>Data Width of Port A and B</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="2" NAME="C_PORT_AWIDTH" TYPE="integer" VALUE="32">
          <DESCRIPTION>Address Width of Port A and B</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="3" NAME="C_NUM_WE" TYPE="integer" VALUE="4">
          <DESCRIPTION>Number of Byte Write Enables</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="4" NAME="C_FAMILY" TYPE="string" VALUE="%family%">
          <DESCRIPTION>Device Family</DESCRIPTION>
        </PARAMETER>
      </PARAMETERS>
      <PORTS>
        <PORT BUS="PORTA" DEF_SIGNAME="ilmb_port_BRAM_Rst" DIR="I" MPD_INDEX="0" NAME="BRAM_Rst_A" SIGNAME="ilmb_port_BRAM_Rst">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="ilmb_cntlr" PORT="BRAM_Rst_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="PORTA" DEF_SIGNAME="ilmb_port_BRAM_Clk" DIR="I" MPD_INDEX="1" NAME="BRAM_Clk_A" SIGIS="CLK" SIGNAME="ilmb_port_BRAM_Clk">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="ilmb_cntlr" PORT="BRAM_Clk_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="PORTA" DEF_SIGNAME="ilmb_port_BRAM_EN" DIR="I" MPD_INDEX="2" NAME="BRAM_EN_A" SIGNAME="ilmb_port_BRAM_EN">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="ilmb_cntlr" PORT="BRAM_EN_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="PORTA" DEF_SIGNAME="ilmb_port_BRAM_WEN" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="3" MSB="0" NAME="BRAM_WEN_A" RIGHT="3" SIGNAME="ilmb_port_BRAM_WEN" VECFORMULA="[0:C_NUM_WE-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="ilmb_cntlr" PORT="BRAM_WEN_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="PORTA" DEF_SIGNAME="ilmb_port_BRAM_Addr" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="4" MSB="0" NAME="BRAM_Addr_A" RIGHT="31" SIGNAME="ilmb_port_BRAM_Addr" VECFORMULA="[0:C_PORT_AWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="ilmb_cntlr" PORT="BRAM_Addr_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="PORTA" DEF_SIGNAME="ilmb_port_BRAM_Din" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="5" MSB="0" NAME="BRAM_Din_A" RIGHT="31" SIGNAME="ilmb_port_BRAM_Din" VECFORMULA="[0:C_PORT_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="ilmb_cntlr" PORT="BRAM_Din_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="PORTA" DEF_SIGNAME="ilmb_port_BRAM_Dout" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="6" MSB="0" NAME="BRAM_Dout_A" RIGHT="31" SIGNAME="ilmb_port_BRAM_Dout" VECFORMULA="[0:C_PORT_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="ilmb_cntlr" PORT="BRAM_Dout_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="PORTB" DEF_SIGNAME="dlmb_port_BRAM_Rst" DIR="I" MPD_INDEX="7" NAME="BRAM_Rst_B" SIGNAME="dlmb_port_BRAM_Rst">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="dlmb_cntlr" PORT="BRAM_Rst_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="PORTB" DEF_SIGNAME="dlmb_port_BRAM_Clk" DIR="I" MPD_INDEX="8" NAME="BRAM_Clk_B" SIGIS="CLK" SIGNAME="dlmb_port_BRAM_Clk">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="dlmb_cntlr" PORT="BRAM_Clk_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="PORTB" DEF_SIGNAME="dlmb_port_BRAM_EN" DIR="I" MPD_INDEX="9" NAME="BRAM_EN_B" SIGNAME="dlmb_port_BRAM_EN">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="dlmb_cntlr" PORT="BRAM_EN_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="PORTB" DEF_SIGNAME="dlmb_port_BRAM_WEN" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="10" MSB="0" NAME="BRAM_WEN_B" RIGHT="3" SIGNAME="dlmb_port_BRAM_WEN" VECFORMULA="[0:C_NUM_WE-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="dlmb_cntlr" PORT="BRAM_WEN_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="PORTB" DEF_SIGNAME="dlmb_port_BRAM_Addr" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="11" MSB="0" NAME="BRAM_Addr_B" RIGHT="31" SIGNAME="dlmb_port_BRAM_Addr" VECFORMULA="[0:C_PORT_AWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="dlmb_cntlr" PORT="BRAM_Addr_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="PORTB" DEF_SIGNAME="dlmb_port_BRAM_Din" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="12" MSB="0" NAME="BRAM_Din_B" RIGHT="31" SIGNAME="dlmb_port_BRAM_Din" VECFORMULA="[0:C_PORT_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="dlmb_cntlr" PORT="BRAM_Din_A"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="PORTB" DEF_SIGNAME="dlmb_port_BRAM_Dout" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="13" MSB="0" NAME="BRAM_Dout_B" RIGHT="31" SIGNAME="dlmb_port_BRAM_Dout" VECFORMULA="[0:C_PORT_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[BRAM_PORT]" INSTANCE="dlmb_cntlr" PORT="BRAM_Dout_A"/>
          </CONNECTIONS>
        </PORT>
      </PORTS>
      <BUSINTERFACES>
        <BUSINTERFACE BUSNAME="ilmb_port" BUSSTD="XIL" BUSSTD_PSF="XIL_BRAM" IS_INSTANTIATED="TRUE" MHS_INDEX="0" MPD_INDEX="0" NAME="PORTA" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="BRAM_Rst_A"/>
            <PORTMAP DIR="I" PHYSICAL="BRAM_Clk_A"/>
            <PORTMAP DIR="I" PHYSICAL="BRAM_EN_A"/>
            <PORTMAP DIR="I" PHYSICAL="BRAM_WEN_A"/>
            <PORTMAP DIR="I" PHYSICAL="BRAM_Addr_A"/>
            <PORTMAP DIR="O" PHYSICAL="BRAM_Din_A"/>
            <PORTMAP DIR="I" PHYSICAL="BRAM_Dout_A"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="dlmb_port" BUSSTD="XIL" BUSSTD_PSF="XIL_BRAM" IS_INSTANTIATED="TRUE" MHS_INDEX="1" MPD_INDEX="1" NAME="PORTB" TYPE="TARGET">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="BRAM_Rst_B"/>
            <PORTMAP DIR="I" PHYSICAL="BRAM_Clk_B"/>
            <PORTMAP DIR="I" PHYSICAL="BRAM_EN_B"/>
            <PORTMAP DIR="I" PHYSICAL="BRAM_WEN_B"/>
            <PORTMAP DIR="I" PHYSICAL="BRAM_Addr_B"/>
            <PORTMAP DIR="O" PHYSICAL="BRAM_Din_B"/>
            <PORTMAP DIR="I" PHYSICAL="BRAM_Dout_B"/>
          </PORTMAPS>
        </BUSINTERFACE>
      </BUSINTERFACES>
    </MODULE>
    %mdm_comment_start%
    <MODULE HWVERSION="2.00.b" INSTANCE="mdm_0" IPTYPE="PERIPHERAL" MHS_INDEX="6" MODCLASS="DEBUG" MODTYPE="mdm">
      <DESCRIPTION TYPE="SHORT">MicroBlaze Debug Module (MDM)</DESCRIPTION>
      <DESCRIPTION TYPE="LONG">Debug module for MicroBlaze Soft Processor.</DESCRIPTION>
      <DOCUMENTATION>
        <DOCUMENT SOURCE="" TYPE="IP"/>
      </DOCUMENTATION>
      <LICENSEINFO ICON_NAME="ps_core_preferred"/>
      <PARAMETERS>
        <PARAMETER MPD_INDEX="0" NAME="C_FAMILY" TYPE="STRING" VALUE="%family%">
          <DESCRIPTION>Device Family</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="1" NAME="C_JTAG_CHAIN" TYPE="INTEGER" VALUE="2">
          <DESCRIPTION>Specifies the JTAG user-defined register used </DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="2" MPD_INDEX="2" NAME="C_INTERCONNECT" TYPE="INTEGER" VALUE="2">
          <DESCRIPTION>Specifies the Bus Interface for the JTAG UART </DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="BASE" ADDR_TYPE="REGISTER" MPD_INDEX="3" NAME="C_BASEADDR" TYPE="STD_LOGIC_VECTOR" VALUE="0xFFFFFFFF">
          <DESCRIPTION>Base Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="HIGH" ADDR_TYPE="REGISTER" MPD_INDEX="4" NAME="C_HIGHADDR" TYPE="STD_LOGIC_VECTOR" VALUE="0x00000000">
          <DESCRIPTION>High Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="5" NAME="C_SPLB_AWIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>PLB Address Bus Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="6" NAME="C_SPLB_DWIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>PLB Data Bus Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="7" NAME="C_SPLB_P2P" TYPE="INTEGER" VALUE="0">
          <DESCRIPTION>PLB Slave Uses P2P Topology</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="8" NAME="C_SPLB_MID_WIDTH" TYPE="INTEGER" VALUE="3">
          <DESCRIPTION>Master ID Bus Width of PLB</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="9" NAME="C_SPLB_NUM_MASTERS" TYPE="INTEGER" VALUE="8">
          <DESCRIPTION>Number of PLB Masters</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="10" NAME="C_SPLB_NATIVE_DWIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>Native Data Bus Width of PLB Slave</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="11" NAME="C_SPLB_SUPPORT_BURSTS" TYPE="INTEGER" VALUE="0">
          <DESCRIPTION>PLB Slave is Capable of Bursts</DESCRIPTION>
        </PARAMETER>
        <PARAMETER IS_INSTANTIATED="TRUE" MHS_INDEX="1" MPD_INDEX="12" NAME="C_MB_DBG_PORTS" TYPE="INTEGER" VALUE="1">
          <DESCRIPTION>Number of MicroBlaze debug ports </DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="3" MPD_INDEX="13" NAME="C_USE_UART" TYPE="INTEGER" VALUE="0">
          <DESCRIPTION>Enable JTAG UART </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="14" NAME="C_S_AXI_ADDR_WIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>AXI Address Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="15" NAME="C_S_AXI_DATA_WIDTH" TYPE="INTEGER" VALUE="32">
          <DESCRIPTION>AXI Data Width</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="16" NAME="C_S_AXI_PROTOCOL" TYPE="STRING" VALUE="AXI4LITE">
          <DESCRIPTION>AXI4LITE protocal</DESCRIPTION>
        </PARAMETER>
      </PARAMETERS>
      <PORTS>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="0" MPD_INDEX="1" NAME="Debug_SYS_Rst" SIGIS="RST" SIGNAME="Debug_SYS_Rst">
          <CONNECTIONS/>
        </PORT>
        <PORT DIR="O" MPD_INDEX="0" NAME="Interrupt" SENSITIVITY="EDGE_RISING" SIGIS="INTERRUPT" SIGNAME="__NOC__"/>
        <PORT DEF_SIGNAME="Ext_BRK" DIR="O" MPD_INDEX="2" NAME="Ext_BRK" SIGNAME="Ext_BRK">
          <CONNECTIONS>
            <CONNECTION INSTANCE="%microblaze_instance%" PORT="EXT_BRK"/>
          </CONNECTIONS>
        </PORT>
        <PORT DEF_SIGNAME="Ext_NM_BRK" DIR="O" MPD_INDEX="3" NAME="Ext_NM_BRK" SIGNAME="Ext_NM_BRK">
          <CONNECTIONS>
            <CONNECTION INSTANCE="%microblaze_instance%" PORT="EXT_NM_BRK"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="4" NAME="S_AXI_ACLK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="5" NAME="S_AXI_ARESETN" SIGIS="RST" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="6" MSB="31" NAME="S_AXI_AWADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_S_AXI_ADDR_WIDTH-1):0]"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="7" NAME="S_AXI_AWVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="8" NAME="S_AXI_AWREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="9" MSB="31" NAME="S_AXI_WDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_S_AXI_DATA_WIDTH-1):0]"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="3" LSB="0" MPD_INDEX="10" MSB="3" NAME="S_AXI_WSTRB" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_S_AXI_DATA_WIDTH/8-1):0]"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="11" NAME="S_AXI_WVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="12" NAME="S_AXI_WREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="13" MSB="1" NAME="S_AXI_BRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="14" NAME="S_AXI_BVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="15" NAME="S_AXI_BREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="16" MSB="31" NAME="S_AXI_ARADDR" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_S_AXI_ADDR_WIDTH-1):0]"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="17" NAME="S_AXI_ARVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="18" NAME="S_AXI_ARREADY" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="31" LSB="0" MPD_INDEX="19" MSB="31" NAME="S_AXI_RDATA" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[(C_S_AXI_DATA_WIDTH-1):0]"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="LITTLE" LEFT="1" LSB="0" MPD_INDEX="20" MSB="1" NAME="S_AXI_RRESP" RIGHT="0" SIGNAME="__NOC__" VECFORMULA="[1:0]"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="21" NAME="S_AXI_RVALID" SIGNAME="__NOC__"/>
        <PORT BUS="S_AXI" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="22" NAME="S_AXI_RREADY" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="23" NAME="SPLB_Clk" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="24" NAME="SPLB_Rst" SIGIS="RST" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="25" MSB="0" NAME="PLB_ABus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="26" MSB="0" NAME="PLB_UABus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:31]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="27" NAME="PLB_PAValid" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="28" NAME="PLB_SAValid" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="29" NAME="PLB_rdPrim" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="30" NAME="PLB_wrPrim" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="2" MPD_INDEX="31" MSB="0" NAME="PLB_masterID" RIGHT="2" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_MID_WIDTH-1)]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="32" NAME="PLB_abort" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="33" NAME="PLB_busLock" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="34" NAME="PLB_RNW" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="35" MSB="0" NAME="PLB_BE" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:((C_SPLB_DWIDTH/8)-1)]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="36" MSB="0" NAME="PLB_MSize" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="37" MSB="0" NAME="PLB_size" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:3]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="2" MPD_INDEX="38" MSB="0" NAME="PLB_type" RIGHT="2" SIGNAME="__NOC__" VECFORMULA="[0:2]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="39" NAME="PLB_lockErr" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="40" MSB="0" NAME="PLB_wrDBus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_DWIDTH-1)]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="41" NAME="PLB_wrBurst" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="42" NAME="PLB_rdBurst" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="43" NAME="PLB_wrPendReq" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="44" NAME="PLB_rdPendReq" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="45" MSB="0" NAME="PLB_wrPendPri" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="46" MSB="0" NAME="PLB_rdPendPri" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="47" MSB="0" NAME="PLB_reqPri" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="I" ENDIAN="BIG" LEFT="0" LSB="15" MPD_INDEX="48" MSB="0" NAME="PLB_TAttribute" RIGHT="15" SIGNAME="__NOC__" VECFORMULA="[0:15]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="49" NAME="Sl_addrAck" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="1" MPD_INDEX="50" MSB="0" NAME="Sl_SSize" RIGHT="1" SIGNAME="__NOC__" VECFORMULA="[0:1]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="51" NAME="Sl_wait" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="52" NAME="Sl_rearbitrate" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="53" NAME="Sl_wrDAck" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="54" NAME="Sl_wrComp" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="55" NAME="Sl_wrBTerm" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="56" MSB="0" NAME="Sl_rdDBus" RIGHT="31" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_DWIDTH-1)]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="57" MSB="0" NAME="Sl_rdWdAddr" RIGHT="3" SIGNAME="__NOC__" VECFORMULA="[0:3]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="58" NAME="Sl_rdDAck" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="59" NAME="Sl_rdComp" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="60" NAME="Sl_rdBTerm" SIGNAME="__NOC__"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="61" MSB="0" NAME="Sl_MBusy" RIGHT="7" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_NUM_MASTERS-1)]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="62" MSB="0" NAME="Sl_MWrErr" RIGHT="7" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_NUM_MASTERS-1)]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="63" MSB="0" NAME="Sl_MRdErr" RIGHT="7" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_NUM_MASTERS-1)]"/>
        <PORT BUS="SPLB" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="64" MSB="0" NAME="Sl_MIRQ" RIGHT="7" SIGNAME="__NOC__" VECFORMULA="[0:(C_SPLB_NUM_MASTERS-1)]"/>
        <PORT BUS="MBDEBUG_0" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_Clk" DIR="O" MPD_INDEX="65" NAME="Dbg_Clk_0" SIGIS="CLK" SIGNAME="mdm_0_MBDEBUG_0_Dbg_Clk">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DEBUG]" INSTANCE="%microblaze_instance%" PORT="DBG_CLK"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="MBDEBUG_0" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_TDI" DIR="O" MPD_INDEX="66" NAME="Dbg_TDI_0" SIGNAME="mdm_0_MBDEBUG_0_Dbg_TDI">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DEBUG]" INSTANCE="%microblaze_instance%" PORT="DBG_TDI"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="MBDEBUG_0" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_TDO" DIR="I" MPD_INDEX="67" NAME="Dbg_TDO_0" SIGNAME="mdm_0_MBDEBUG_0_Dbg_TDO">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DEBUG]" INSTANCE="%microblaze_instance%" PORT="DBG_TDO"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="MBDEBUG_0" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_Reg_En" DIR="O" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="68" MSB="0" NAME="Dbg_Reg_En_0" RIGHT="7" SIGNAME="mdm_0_MBDEBUG_0_Dbg_Reg_En" VECFORMULA="[0:7]">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DEBUG]" INSTANCE="%microblaze_instance%" PORT="DBG_REG_EN"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="MBDEBUG_0" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_Capture" DIR="O" MPD_INDEX="69" NAME="Dbg_Capture_0" SIGNAME="mdm_0_MBDEBUG_0_Dbg_Capture">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DEBUG]" INSTANCE="%microblaze_instance%" PORT="DBG_CAPTURE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="MBDEBUG_0" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_Shift" DIR="O" MPD_INDEX="70" NAME="Dbg_Shift_0" SIGNAME="mdm_0_MBDEBUG_0_Dbg_Shift">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DEBUG]" INSTANCE="%microblaze_instance%" PORT="DBG_SHIFT"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="MBDEBUG_0" DEF_SIGNAME="mdm_0_MBDEBUG_0_Dbg_Update" DIR="O" MPD_INDEX="71" NAME="Dbg_Update_0" SIGNAME="mdm_0_MBDEBUG_0_Dbg_Update">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DEBUG]" INSTANCE="%microblaze_instance%" PORT="DBG_UPDATE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="MBDEBUG_0" DEF_SIGNAME="mdm_0_MBDEBUG_0_Debug_Rst" DIR="O" MPD_INDEX="72" NAME="Dbg_Rst_0" SIGIS="RST" SIGNAME="mdm_0_MBDEBUG_0_Debug_Rst">
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[DEBUG]" INSTANCE="%microblaze_instance%" PORT="DEBUG_RST"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="MBDEBUG_1" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="73" NAME="Dbg_Clk_1" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_1" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="74" NAME="Dbg_TDI_1" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_1" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="75" NAME="Dbg_TDO_1" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_1" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="76" MSB="0" NAME="Dbg_Reg_En_1" RIGHT="7" SIGNAME="__NOC__" VECFORMULA="[0:7]"/>
        <PORT BUS="MBDEBUG_1" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="77" NAME="Dbg_Capture_1" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_1" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="78" NAME="Dbg_Shift_1" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_1" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="79" NAME="Dbg_Update_1" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_1" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="80" NAME="Dbg_Rst_1" SIGIS="RST" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_2" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="81" NAME="Dbg_Clk_2" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_2" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="82" NAME="Dbg_TDI_2" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_2" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="83" NAME="Dbg_TDO_2" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_2" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="84" MSB="0" NAME="Dbg_Reg_En_2" RIGHT="7" SIGNAME="__NOC__" VECFORMULA="[0:7]"/>
        <PORT BUS="MBDEBUG_2" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="85" NAME="Dbg_Capture_2" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_2" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="86" NAME="Dbg_Shift_2" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_2" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="87" NAME="Dbg_Update_2" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_2" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="88" NAME="Dbg_Rst_2" SIGIS="RST" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_3" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="89" NAME="Dbg_Clk_3" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_3" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="90" NAME="Dbg_TDI_3" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_3" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="91" NAME="Dbg_TDO_3" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_3" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="92" MSB="0" NAME="Dbg_Reg_En_3" RIGHT="7" SIGNAME="__NOC__" VECFORMULA="[0:7]"/>
        <PORT BUS="MBDEBUG_3" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="93" NAME="Dbg_Capture_3" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_3" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="94" NAME="Dbg_Shift_3" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_3" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="95" NAME="Dbg_Update_3" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_3" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="96" NAME="Dbg_Rst_3" SIGIS="RST" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_4" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="97" NAME="Dbg_Clk_4" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_4" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="98" NAME="Dbg_TDI_4" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_4" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="99" NAME="Dbg_TDO_4" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_4" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="100" MSB="0" NAME="Dbg_Reg_En_4" RIGHT="7" SIGNAME="__NOC__" VECFORMULA="[0:7]"/>
        <PORT BUS="MBDEBUG_4" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="101" NAME="Dbg_Capture_4" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_4" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="102" NAME="Dbg_Shift_4" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_4" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="103" NAME="Dbg_Update_4" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_4" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="104" NAME="Dbg_Rst_4" SIGIS="RST" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_5" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="105" NAME="Dbg_Clk_5" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_5" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="106" NAME="Dbg_TDI_5" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_5" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="107" NAME="Dbg_TDO_5" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_5" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="108" MSB="0" NAME="Dbg_Reg_En_5" RIGHT="7" SIGNAME="__NOC__" VECFORMULA="[0:7]"/>
        <PORT BUS="MBDEBUG_5" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="109" NAME="Dbg_Capture_5" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_5" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="110" NAME="Dbg_Shift_5" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_5" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="111" NAME="Dbg_Update_5" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_5" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="112" NAME="Dbg_Rst_5" SIGIS="RST" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_6" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="113" NAME="Dbg_Clk_6" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_6" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="114" NAME="Dbg_TDI_6" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_6" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="115" NAME="Dbg_TDO_6" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_6" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="116" MSB="0" NAME="Dbg_Reg_En_6" RIGHT="7" SIGNAME="__NOC__" VECFORMULA="[0:7]"/>
        <PORT BUS="MBDEBUG_6" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="117" NAME="Dbg_Capture_6" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_6" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="118" NAME="Dbg_Shift_6" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_6" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="119" NAME="Dbg_Update_6" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_6" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="120" NAME="Dbg_Rst_6" SIGIS="RST" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_7" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="121" NAME="Dbg_Clk_7" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_7" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="122" NAME="Dbg_TDI_7" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_7" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="123" NAME="Dbg_TDO_7" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_7" DEF_SIGNAME="__BUS__" DIR="O" ENDIAN="BIG" LEFT="0" LSB="7" MPD_INDEX="124" MSB="0" NAME="Dbg_Reg_En_7" RIGHT="7" SIGNAME="__NOC__" VECFORMULA="[0:7]"/>
        <PORT BUS="MBDEBUG_7" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="125" NAME="Dbg_Capture_7" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_7" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="126" NAME="Dbg_Shift_7" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_7" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="127" NAME="Dbg_Update_7" SIGNAME="__NOC__"/>
        <PORT BUS="MBDEBUG_7" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="128" NAME="Dbg_Rst_7" SIGIS="RST" SIGNAME="__NOC__"/>
        <PORT DEF_SIGNAME="bscan_tdi" DIR="O" MPD_INDEX="129" NAME="bscan_tdi" SIGNAME="bscan_tdi">
          <CONNECTIONS/>
        </PORT>
        <PORT DEF_SIGNAME="bscan_reset" DIR="O" MPD_INDEX="130" NAME="bscan_reset" SIGIS="RST" SIGNAME="bscan_reset">
          <CONNECTIONS/>
        </PORT>
        <PORT DEF_SIGNAME="bscan_shift" DIR="O" MPD_INDEX="131" NAME="bscan_shift" SIGNAME="bscan_shift">
          <CONNECTIONS/>
        </PORT>
        <PORT DEF_SIGNAME="bscan_update" DIR="O" MPD_INDEX="132" NAME="bscan_update" SIGNAME="bscan_update">
          <CONNECTIONS/>
        </PORT>
        <PORT DEF_SIGNAME="bscan_capture" DIR="O" MPD_INDEX="133" NAME="bscan_capture" SIGNAME="bscan_capture">
          <CONNECTIONS/>
        </PORT>
        <PORT DEF_SIGNAME="bscan_sel1" DIR="O" MPD_INDEX="134" NAME="bscan_sel1" SIGNAME="bscan_sel1">
          <CONNECTIONS/>
        </PORT>
        <PORT DEF_SIGNAME="bscan_drck1" DIR="O" MPD_INDEX="135" NAME="bscan_drck1" SIGIS="CLK" SIGNAME="bscan_drck1">
          <CONNECTIONS/>
        </PORT>
        <PORT DEF_SIGNAME="bscan_tdo1" DIR="I" MPD_INDEX="136" NAME="bscan_tdo1" SIGNAME="bscan_tdo1">
          <CONNECTIONS/>
        </PORT>
        <PORT BUS="XMTC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="137" NAME="Ext_JTAG_DRCK" SIGIS="CLK" SIGNAME="__NOC__"/>
        <PORT BUS="XMTC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="138" NAME="Ext_JTAG_RESET" SIGIS="RST" SIGNAME="__NOC__"/>
        <PORT BUS="XMTC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="139" NAME="Ext_JTAG_SEL" SIGNAME="__NOC__"/>
        <PORT BUS="XMTC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="140" NAME="Ext_JTAG_CAPTURE" SIGNAME="__NOC__"/>
        <PORT BUS="XMTC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="141" NAME="Ext_JTAG_SHIFT" SIGNAME="__NOC__"/>
        <PORT BUS="XMTC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="142" NAME="Ext_JTAG_UPDATE" SIGNAME="__NOC__"/>
        <PORT BUS="XMTC" DEF_SIGNAME="__BUS__" DIR="O" MPD_INDEX="143" NAME="Ext_JTAG_TDI" SIGNAME="__NOC__"/>
        <PORT BUS="XMTC" DEF_SIGNAME="__BUS__" DIR="I" MPD_INDEX="144" NAME="Ext_JTAG_TDO" SIGNAME="__NOC__"/>
      </PORTS>
      <BUSINTERFACES>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="AXI" BUSSTD_PSF="AXI" IS_VALID="FALSE" MPD_INDEX="0" NAME="S_AXI" PROTOCOL="AXI4LITE" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_ACLK"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_ARESETN"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_AWADDR"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_AWVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_AWREADY"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_WDATA"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_WSTRB"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_WVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_WREADY"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_BRESP"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_BVALID"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_BREADY"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_ARADDR"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_ARVALID"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_ARREADY"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_RDATA"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_RRESP"/>
            <PORTMAP DIR="O" PHYSICAL="S_AXI_RVALID"/>
            <PORTMAP DIR="I" PHYSICAL="S_AXI_RREADY"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="PLBV46" BUSSTD_PSF="PLBV46" IS_VALID="FALSE" MPD_INDEX="1" NAME="SPLB" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="SPLB_Clk"/>
            <PORTMAP DIR="I" PHYSICAL="SPLB_Rst"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_ABus"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_UABus"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_PAValid"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_SAValid"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_rdPrim"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_wrPrim"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_masterID"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_abort"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_busLock"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_RNW"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_BE"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_MSize"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_size"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_type"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_lockErr"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_wrDBus"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_wrBurst"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_rdBurst"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_wrPendReq"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_rdPendReq"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_wrPendPri"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_rdPendPri"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_reqPri"/>
            <PORTMAP DIR="I" PHYSICAL="PLB_TAttribute"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_addrAck"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_SSize"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_wait"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_rearbitrate"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_wrDAck"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_wrComp"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_wrBTerm"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_rdDBus"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_rdWdAddr"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_rdDAck"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_rdComp"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_rdBTerm"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_MBusy"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_MWrErr"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_MRdErr"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_MIRQ"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="mdm_0_MBDEBUG_0" BUSSTD="XIL" BUSSTD_PSF="XIL_MBDEBUG3" IS_INSTANTIATED="TRUE" MHS_INDEX="0" MPD_INDEX="2" NAME="MBDEBUG_0" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Clk_0"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_TDI_0"/>
            <PORTMAP DIR="I" PHYSICAL="Dbg_TDO_0"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Reg_En_0"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Capture_0"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Shift_0"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Update_0"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Rst_0"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_MBDEBUG3" IS_VALID="FALSE" MPD_INDEX="3" NAME="MBDEBUG_1" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Clk_1"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_TDI_1"/>
            <PORTMAP DIR="I" PHYSICAL="Dbg_TDO_1"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Reg_En_1"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Capture_1"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Shift_1"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Update_1"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Rst_1"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_MBDEBUG3" IS_VALID="FALSE" MPD_INDEX="4" NAME="MBDEBUG_2" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Clk_2"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_TDI_2"/>
            <PORTMAP DIR="I" PHYSICAL="Dbg_TDO_2"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Reg_En_2"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Capture_2"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Shift_2"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Update_2"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Rst_2"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_MBDEBUG3" IS_VALID="FALSE" MPD_INDEX="5" NAME="MBDEBUG_3" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Clk_3"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_TDI_3"/>
            <PORTMAP DIR="I" PHYSICAL="Dbg_TDO_3"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Reg_En_3"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Capture_3"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Shift_3"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Update_3"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Rst_3"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_MBDEBUG3" IS_VALID="FALSE" MPD_INDEX="6" NAME="MBDEBUG_4" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Clk_4"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_TDI_4"/>
            <PORTMAP DIR="I" PHYSICAL="Dbg_TDO_4"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Reg_En_4"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Capture_4"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Shift_4"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Update_4"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Rst_4"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_MBDEBUG3" IS_VALID="FALSE" MPD_INDEX="7" NAME="MBDEBUG_5" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Clk_5"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_TDI_5"/>
            <PORTMAP DIR="I" PHYSICAL="Dbg_TDO_5"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Reg_En_5"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Capture_5"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Shift_5"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Update_5"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Rst_5"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_MBDEBUG3" IS_VALID="FALSE" MPD_INDEX="8" NAME="MBDEBUG_6" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Clk_6"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_TDI_6"/>
            <PORTMAP DIR="I" PHYSICAL="Dbg_TDO_6"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Reg_En_6"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Capture_6"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Shift_6"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Update_6"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Rst_6"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_MBDEBUG3" IS_VALID="FALSE" MPD_INDEX="9" NAME="MBDEBUG_7" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Clk_7"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_TDI_7"/>
            <PORTMAP DIR="I" PHYSICAL="Dbg_TDO_7"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Reg_En_7"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Capture_7"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Shift_7"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Update_7"/>
            <PORTMAP DIR="O" PHYSICAL="Dbg_Rst_7"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_BSCAN" MPD_INDEX="10" NAME="XMTC" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="Ext_JTAG_DRCK"/>
            <PORTMAP DIR="O" PHYSICAL="Ext_JTAG_RESET"/>
            <PORTMAP DIR="O" PHYSICAL="Ext_JTAG_SEL"/>
            <PORTMAP DIR="O" PHYSICAL="Ext_JTAG_CAPTURE"/>
            <PORTMAP DIR="O" PHYSICAL="Ext_JTAG_SHIFT"/>
            <PORTMAP DIR="O" PHYSICAL="Ext_JTAG_UPDATE"/>
            <PORTMAP DIR="O" PHYSICAL="Ext_JTAG_TDI"/>
            <PORTMAP DIR="I" PHYSICAL="Ext_JTAG_TDO"/>
          </PORTMAPS>
        </BUSINTERFACE>
      </BUSINTERFACES>
      <MEMORYMAP>
        <MEMRANGE BASEDECIMAL="4294967295" BASENAME="C_BASEADDR" BASEVALUE="0xFFFFFFFF" HIGHDECIMAL="0" HIGHNAME="C_HIGHADDR" HIGHVALUE="0x00000000" IS_VALID="FALSE" MEMTYPE="REGISTER" MINSIZE="0x100" SIZE="0" SIZEABRV="U">
          <SLAVES>
            <SLAVE BUSINTERFACE="SPLB"/>
            <SLAVE BUSINTERFACE="S_AXI"/>
          </SLAVES>
        </MEMRANGE>
      </MEMORYMAP>
    </MODULE>
    %mdm_comment_end%
    <MODULE HWVERSION="1.00.a" INSTANCE="iomodule_0" IPTYPE="PERIPHERAL" MHS_INDEX="7" MODCLASS="PERIPHERAL" MODTYPE="iomodule">
      <DESCRIPTION TYPE="SHORT">LMB I/O Module</DESCRIPTION>
      <DESCRIPTION TYPE="LONG">LMB module which includes plenty of I/O peripherals</DESCRIPTION>
      <DOCUMENTATION>
        <DOCUMENT SOURCE="" TYPE="IP"/>
      </DOCUMENTATION>
      <LICENSEINFO ICON_NAME="ps_core_preferred"/>
      <PARAMETERS>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="0" NAME="C_FAMILY" TYPE="string" VALUE="%family%"/>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="1" NAME="C_FREQ" TYPE="integer" VALUE="%freq%"/>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="2" NAME="C_INSTANCE" TYPE="string" VALUE="iomodule_0"/>
        <PARAMETER ADDRESS="BASE" ADDR_TYPE="IO" CHANGEDBY="USER" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LSB="31" MHS_INDEX="2" MPD_INDEX="3" MSB="0" NAME="C_BASEADDR" TYPE="std_logic_vector" VALUE="0x80000000">
          <DESCRIPTION>I/O Module Register Base Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="HIGH" ADDR_TYPE="IO" CHANGEDBY="USER" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LSB="31" MHS_INDEX="3" MPD_INDEX="4" MSB="0" NAME="C_HIGHADDR" TYPE="std_logic_vector" VALUE="0x8000007F">
          <DESCRIPTION>I/O Module Register High Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LSB="31" MHS_INDEX="4" MPD_INDEX="5" MSB="0" NAME="C_MASK" TYPE="std_logic_vector" VALUE="0xC0000000">
          <DESCRIPTION>I/O Module Register Address Decode Mask</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="BASE" ADDR_TYPE="IO" CHANGEDBY="USER" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LSB="31" MHS_INDEX="5" MPD_INDEX="6" MSB="0" NAME="C_IO_BASEADDR" TYPE="std_logic_vector" VALUE="0xC0000000">
          <DESCRIPTION>I/O Module IO Bus Base Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER ADDRESS="HIGH" ADDR_TYPE="IO" CHANGEDBY="USER" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LSB="31" MHS_INDEX="6" MPD_INDEX="7" MSB="0" NAME="C_IO_HIGHADDR" TYPE="std_logic_vector" VALUE="0xFFFFFFFF">
          <DESCRIPTION>I/O Module IO Bus High Address</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" ENDIAN="BIG" IS_INSTANTIATED="TRUE" LSB="31" MHS_INDEX="7" MPD_INDEX="8" MSB="0" NAME="C_IO_MASK" TYPE="std_logic_vector" VALUE="0xC0000000">
          <DESCRIPTION>I/O Module IO Bus Address Decode Mask</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="9" NAME="C_LMB_AWIDTH" TYPE="integer" VALUE="32">
          <DESCRIPTION>LMB Address Bus Width </DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="10" NAME="C_LMB_DWIDTH" TYPE="integer" VALUE="32">
          <DESCRIPTION>LMB Data Bus Width </DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="10" MPD_INDEX="11" NAME="C_USE_IO_BUS" TYPE="integer" VALUE="%use_io_bus%">
          <DESCRIPTION>Enable IO Bus</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="8" MPD_INDEX="12" NAME="C_USE_UART_RX" TYPE="integer" VALUE="%use_uart_rx%">
          <DESCRIPTION>Enable Receiver</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="9" MPD_INDEX="13" NAME="C_USE_UART_TX" TYPE="integer" VALUE="%use_uart_tx%">
          <DESCRIPTION>Enable Transmitter</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="14" NAME="C_UART_BAUDRATE" TYPE="integer" VALUE="%uart_baudrate%">
          <DESCRIPTION>Define Baud Rate</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="15" NAME="C_UART_DATA_BITS" TYPE="integer" VALUE="%uart_data_bits%">
          <DESCRIPTION>Number of Data Bits</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="16" NAME="C_UART_USE_PARITY" TYPE="integer" VALUE="%uart_use_parity%">
          <DESCRIPTION>Use Parity</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="17" NAME="C_UART_ODD_PARITY" TYPE="integer" VALUE="%uart_odd_parity%">
          <DESCRIPTION>Even or Odd Parity</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="18" NAME="C_UART_RX_INTERRUPT" TYPE="integer" VALUE="%uart_rx_interrupt%">
          <DESCRIPTION>Implement Receive Interrupt</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="19" NAME="C_UART_TX_INTERRUPT" TYPE="integer" VALUE="%uart_tx_interrupt%">
          <DESCRIPTION>Implement Transmit Interrupt</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="20" NAME="C_UART_ERROR_INTERRUPT" TYPE="integer" VALUE="%uart_error_interrupt%">
          <DESCRIPTION>Implement Error Interrupt</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="21" NAME="C_USE_FIT1" TYPE="integer" VALUE="%use_fit1%">
          <DESCRIPTION>Use FIT</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="22" NAME="C_FIT1_No_CLOCKS" TYPE="integer" VALUE="%fit1_no_clocks%">
          <DESCRIPTION>Number of Clocks Between Strobes</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="23" NAME="C_FIT1_INTERRUPT" TYPE="integer" VALUE="%fit1_interrupt%">
          <DESCRIPTION>Generate Interrupt</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="24" NAME="C_USE_FIT2" TYPE="integer" VALUE="%use_fit2%">
          <DESCRIPTION>Use FIT</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="25" NAME="C_FIT2_No_CLOCKS" TYPE="integer" VALUE="%fit2_no_clocks%">
          <DESCRIPTION>Number of Clocks Between Strobes</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="26" NAME="C_FIT2_INTERRUPT" TYPE="integer" VALUE="%fit2_interrupt%">
          <DESCRIPTION>Generate Interrupt</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="27" NAME="C_USE_FIT3" TYPE="integer" VALUE="%use_fit3%">
          <DESCRIPTION>Use FIT</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="28" NAME="C_FIT3_No_CLOCKS" TYPE="integer" VALUE="%fit3_no_clocks%">
          <DESCRIPTION>Number of Clocks Between Strobes</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="29" NAME="C_FIT3_INTERRUPT" TYPE="integer" VALUE="%fit3_interrupt%">
          <DESCRIPTION>Generate Interrupt</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="30" NAME="C_USE_FIT4" TYPE="integer" VALUE="%use_fit4%">
          <DESCRIPTION>Use FIT</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="31" NAME="C_FIT4_No_CLOCKS" TYPE="integer" VALUE="%fit4_no_clocks%">
          <DESCRIPTION>Number of Clocks Between Strobes</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="32" NAME="C_FIT4_INTERRUPT" TYPE="integer" VALUE="%fit4_interrupt%">
          <DESCRIPTION>Generate Interrupt</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="33" NAME="C_USE_PIT1" TYPE="integer" VALUE="%use_pit1%">
          <DESCRIPTION>Use PIT</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="34" NAME="C_PIT1_SIZE" TYPE="integer" VALUE="%pit1_size%">
          <DESCRIPTION>Number of Bits for Timer</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="35" NAME="C_PIT1_READABLE" TYPE="integer" VALUE="%pit1_readable%">
          <DESCRIPTION>Shall Counter Value Be Readable</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="36" NAME="C_PIT1_PRESCALER" TYPE="integer" VALUE="%pit1_prescaler%">
          <DESCRIPTION>Define Prescaler</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="37" NAME="C_PIT1_INTERRUPT" TYPE="integer" VALUE="%pit1_interrupt%">
          <DESCRIPTION>Generate Interrupt</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="38" NAME="C_USE_PIT2" TYPE="integer" VALUE="%use_pit2%">
          <DESCRIPTION>Use PIT</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="39" NAME="C_PIT2_SIZE" TYPE="integer" VALUE="%pit2_size%">
          <DESCRIPTION>Number of Bits for Timer</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="40" NAME="C_PIT2_READABLE" TYPE="integer" VALUE="%pit2_readable%">
          <DESCRIPTION>Shall Counter Value Be Readable</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="41" NAME="C_PIT2_PRESCALER" TYPE="integer" VALUE="%pit2_prescaler%">
          <DESCRIPTION>Define Prescaler</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="42" NAME="C_PIT2_INTERRUPT" TYPE="integer" VALUE="%pit2_interrupt%">
          <DESCRIPTION>Generate Interrupt</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="43" NAME="C_USE_PIT3" TYPE="integer" VALUE="%use_pit3%">
          <DESCRIPTION>Use PIT</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="44" NAME="C_PIT3_SIZE" TYPE="integer" VALUE="%pit3_size%">
          <DESCRIPTION>Number of Bits for Timer</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="45" NAME="C_PIT3_READABLE" TYPE="integer" VALUE="%pit3_readable%">
          <DESCRIPTION>Shall Counter Value be Readable</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="46" NAME="C_PIT3_PRESCALER" TYPE="integer" VALUE="%pit3_prescaler%">
          <DESCRIPTION>Define Prescaler</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="47" NAME="C_PIT3_INTERRUPT" TYPE="integer" VALUE="%pit3_interrupt%">
          <DESCRIPTION>Generate Interrupt</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="48" NAME="C_USE_PIT4" TYPE="integer" VALUE="%use_pit4%">
          <DESCRIPTION>Use PIT</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="49" NAME="C_PIT4_SIZE" TYPE="integer" VALUE="%pit4_size%">
          <DESCRIPTION>Number of Bits for Timer</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="50" NAME="C_PIT4_READABLE" TYPE="integer" VALUE="%pit4_readable%">
          <DESCRIPTION>Shall Counter Value Be Readable</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="51" NAME="C_PIT4_PRESCALER" TYPE="integer" VALUE="%pit4_prescaler%">
          <DESCRIPTION>Define Prescaler</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="52" NAME="C_PIT4_INTERRUPT" TYPE="integer" VALUE="%pit4_interrupt%">
          <DESCRIPTION>Generate Interrupt</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="53" NAME="C_USE_GPO1" TYPE="integer" VALUE="%use_gpo1%">
          <DESCRIPTION>Use GPO</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="54" NAME="C_GPO1_SIZE" TYPE="integer" VALUE="%gpo1_size%">
          <DESCRIPTION>Number of Bits</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="55" NAME="C_GPO1_INIT" TYPE="std_logic_vector" VALUE="%gpo1_init%">
          <DESCRIPTION>Initial Value of GPO</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="56" NAME="C_USE_GPO2" TYPE="integer" VALUE="%use_gpo2%">
          <DESCRIPTION>Use GPO</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="57" NAME="C_GPO2_SIZE" TYPE="integer" VALUE="%gpo2_size%">
          <DESCRIPTION>Number of Bits</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="58" NAME="C_GPO2_INIT" TYPE="std_logic_vector" VALUE="%gpo2_init%">
          <DESCRIPTION>Initial Value of GPO</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="59" NAME="C_USE_GPO3" TYPE="integer" VALUE="%use_gpo3%">
          <DESCRIPTION>Use GPO</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="60" NAME="C_GPO3_SIZE" TYPE="integer" VALUE="%gpo3_size%">
          <DESCRIPTION>Number of Bits</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="61" NAME="C_GPO3_INIT" TYPE="std_logic_vector" VALUE="%gpo3_init%">
          <DESCRIPTION>Initial Value of GPO</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="62" NAME="C_USE_GPO4" TYPE="integer" VALUE="%use_gpo4%">
          <DESCRIPTION>Use GPO</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="63" NAME="C_GPO4_SIZE" TYPE="integer" VALUE="%gpo4_size%">
          <DESCRIPTION>Number of Bits</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="64" NAME="C_GPO4_INIT" TYPE="std_logic_vector" VALUE="%gpo4_init%">
          <DESCRIPTION>Initial Value of GPO</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="65" NAME="C_USE_GPI1" TYPE="integer" VALUE="%use_gpi1%">
          <DESCRIPTION>Use GPI</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="66" NAME="C_GPI1_SIZE" TYPE="integer" VALUE="%gpi1_size%">
          <DESCRIPTION>Number of Bits</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="67" NAME="C_USE_GPI2" TYPE="integer" VALUE="%use_gpi2%">
          <DESCRIPTION>Use GPI</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="68" NAME="C_GPI2_SIZE" TYPE="integer" VALUE="%gpi2_size%">
          <DESCRIPTION>Number of Bits</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="69" NAME="C_USE_GPI3" TYPE="integer" VALUE="%use_gpi3%">
          <DESCRIPTION>Use GPI</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="70" NAME="C_GPI3_SIZE" TYPE="integer" VALUE="%gpi3_size%">
          <DESCRIPTION>Number of Bits</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="71" NAME="C_USE_GPI4" TYPE="integer" VALUE="%use_gpi4%">
          <DESCRIPTION>Use GPI</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="72" NAME="C_GPI4_SIZE" TYPE="integer" VALUE="%gpi4_size%">
          <DESCRIPTION>Number of Bits</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="11" MPD_INDEX="73" NAME="C_INTC_USE_EXT_INTR" TYPE="integer" VALUE="%intc_use_ext_intr%">
          <DESCRIPTION>Use External Interrupts</DESCRIPTION>
        </PARAMETER>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="12" MPD_INDEX="74" NAME="C_INTC_INTR_SIZE" TYPE="integer" VALUE="%intc_intr_size%">
          <DESCRIPTION>Number of External Inputs</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="75" NAME="C_INTC_LEVEL_EDGE" TYPE="std_logic_vector" VALUE="%intc_level_edge%"/>
        <PARAMETER CHANGEDBY="SYSTEM" MPD_INDEX="76" NAME="C_INTC_POSITIVE" TYPE="std_logic_vector" VALUE="%intc_positive%"/>
        <PARAMETER CHANGEDBY="USER" IS_INSTANTIATED="TRUE" MHS_INDEX="13" MPD_INDEX="77" NAME="C_INTC_HAS_FAST" TYPE="integer" VALUE="1">
          <DESCRIPTION>Use Low-latency Interrupt Handling</DESCRIPTION>
        </PARAMETER>
        <PARAMETER MPD_INDEX="78" NAME="C_INTC_ADDR_WIDTH" TYPE="integer" VALUE="32"/>
      </PARAMETERS>
      <PORTS>
        <PORT DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="0" MPD_INDEX="1" NAME="Rst" SIGIS="RST" SIGNAME="Reset">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Reset"/>
          </CONNECTIONS>
        </PORT>
        <PORT CLKFREQUENCY="%freq%" DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="1" MPD_INDEX="0" NAME="CLK" SIGIS="CLK" SIGNAME="Clk">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="Clk"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="2" MPD_INDEX="2" NAME="IO_Addr_Strobe" SIGNAME="IO_Addr_Strobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="IO_Addr_Strobe"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="3" MPD_INDEX="3" NAME="IO_Read_Strobe" SIGNAME="IO_Read_Strobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="IO_Read_Strobe"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="4" MPD_INDEX="4" NAME="IO_Write_Strobe" SIGNAME="IO_Write_Strobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="IO_Write_Strobe"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" ENDIAN="LITTLE" IS_INSTANTIATED="TRUE" LEFT="31" LSB="0" MHS_INDEX="5" MPD_INDEX="5" MSB="31" NAME="IO_Address" RIGHT="0" SIGNAME="IO_Address" VECFORMULA="[C_LMB_AWIDTH-1:0]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="IO_Address"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" ENDIAN="LITTLE" IS_INSTANTIATED="TRUE" LEFT="3" LSB="0" MHS_INDEX="6" MPD_INDEX="6" MSB="3" NAME="IO_Byte_Enable" RIGHT="0" SIGNAME="IO_Byte_Enable" VECFORMULA="[C_LMB_DWIDTH/8-1:0]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="IO_Byte_Enable"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" ENDIAN="LITTLE" IS_INSTANTIATED="TRUE" LEFT="31" LSB="0" MHS_INDEX="7" MPD_INDEX="7" MSB="31" NAME="IO_Write_Data" RIGHT="0" SIGNAME="IO_Write_Data" VECFORMULA="[C_LMB_DWIDTH-1:0]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="IO_Write_Data"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" ENDIAN="LITTLE" IS_INSTANTIATED="TRUE" LEFT="31" LSB="0" MHS_INDEX="8" MPD_INDEX="8" MSB="31" NAME="IO_Read_Data" RIGHT="0" SIGNAME="IO_Read_Data" VECFORMULA="[C_LMB_DWIDTH-1:0]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="IO_Read_Data"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="9" MPD_INDEX="9" NAME="IO_Ready" SIGNAME="IO_Ready">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="IO_Ready"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" IOS="uart_0" IS_INSTANTIATED="TRUE" MHS_INDEX="10" MPD_INDEX="10" NAME="UART_Rx" SIGNAME="UART_Rx">
          <DESCRIPTION>Serial Data In</DESCRIPTION>
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="UART_Rx"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IOS="uart_0" IS_INSTANTIATED="TRUE" MHS_INDEX="11" MPD_INDEX="11" NAME="UART_Tx" SIGNAME="UART_Tx">
          <DESCRIPTION>Serial Data Out</DESCRIPTION>
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="UART_Tx"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="12" MPD_INDEX="12" NAME="UART_Interrupt" SENSITIVITY="EDGE_RISING" SIGIS="INTERRUPT" SIGNAME="UART_Interrupt">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="UART_Interrupt"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="13" MPD_INDEX="13" NAME="FIT1_Interrupt" SENSITIVITY="EDGE_RISING" SIGIS="INTERRUPT" SIGNAME="FIT1_Interrupt">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="FIT1_Interrupt"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="14" MPD_INDEX="14" NAME="FIT1_Toggle" SIGNAME="FIT1_Toggle">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="FIT1_Toggle"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="15" MPD_INDEX="15" NAME="FIT2_Interrupt" SENSITIVITY="EDGE_RISING" SIGIS="INTERRUPT" SIGNAME="FIT2_Interrupt">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="FIT2_Interrupt"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="16" MPD_INDEX="16" NAME="FIT2_Toggle" SIGNAME="FIT2_Toggle">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="FIT2_Toggle"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="17" MPD_INDEX="17" NAME="FIT3_Interrupt" SENSITIVITY="EDGE_RISING" SIGIS="INTERRUPT" SIGNAME="FIT3_Interrupt">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="FIT3_Interrupt"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="18" MPD_INDEX="18" NAME="FIT3_Toggle" SIGNAME="FIT3_Toggle">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="FIT3_Toggle"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="19" MPD_INDEX="19" NAME="FIT4_Interrupt" SENSITIVITY="EDGE_RISING" SIGIS="INTERRUPT" SIGNAME="FIT4_Interrupt">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="FIT4_Interrupt"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="20" MPD_INDEX="20" NAME="FIT4_Toggle" SIGNAME="FIT4_Toggle">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="FIT4_Toggle"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="21" MPD_INDEX="21" NAME="PIT1_Enable" SIGNAME="PIT1_Enable">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="PIT1_Enable"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="22" MPD_INDEX="22" NAME="PIT1_Interrupt" SENSITIVITY="EDGE_RISING" SIGIS="INTERRUPT" SIGNAME="PIT1_Interrupt">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="PIT1_Interrupt"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="23" MPD_INDEX="23" NAME="PIT1_Toggle" SIGNAME="PIT1_Toggle">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="PIT1_Toggle"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="24" MPD_INDEX="24" NAME="PIT2_Enable" SIGNAME="PIT2_Enable">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="PIT2_Enable"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="25" MPD_INDEX="25" NAME="PIT2_Interrupt" SENSITIVITY="EDGE_RISING" SIGIS="INTERRUPT" SIGNAME="PIT2_Interrupt">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="PIT2_Interrupt"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="26" MPD_INDEX="26" NAME="PIT2_Toggle" SIGNAME="PIT2_Toggle">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="PIT2_Toggle"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="27" MPD_INDEX="27" NAME="PIT3_Enable" SIGNAME="PIT3_Enable">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="PIT3_Enable"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="28" MPD_INDEX="28" NAME="PIT3_Interrupt" SENSITIVITY="EDGE_RISING" SIGIS="INTERRUPT" SIGNAME="PIT3_Interrupt">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="PIT3_Interrupt"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="29" MPD_INDEX="29" NAME="PIT3_Toggle" SIGNAME="PIT3_Toggle">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="PIT3_Toggle"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" IS_INSTANTIATED="TRUE" MHS_INDEX="30" MPD_INDEX="30" NAME="PIT4_Enable" SIGNAME="PIT4_Enable">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="PIT4_Enable"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="31" MPD_INDEX="31" NAME="PIT4_Interrupt" SENSITIVITY="EDGE_RISING" SIGIS="INTERRUPT" SIGNAME="PIT4_Interrupt">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="PIT4_Interrupt"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="32" MPD_INDEX="32" NAME="PIT4_Toggle" SIGNAME="PIT4_Toggle">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="PIT4_Toggle"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" ENDIAN="LITTLE" IOS="gpio_0" IS_INSTANTIATED="TRUE" LEFT="%gpo1_size-1%" LSB="0" MHS_INDEX="33" MPD_INDEX="33" MSB="%gpo1_size-1%" NAME="GPO1" RIGHT="0" SIGNAME="GPO1" VECFORMULA="[C_GPO1_SIZE-1:0]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="GPO1"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" ENDIAN="LITTLE" IOS="gpio_0" IS_INSTANTIATED="TRUE" LEFT="%gpo2_size-1%" LSB="0" MHS_INDEX="34" MPD_INDEX="34" MSB="%gpo2_size-1%" NAME="GPO2" RIGHT="0" SIGNAME="GPO2" VECFORMULA="[C_GPO2_SIZE-1:0]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="GPO2"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" ENDIAN="LITTLE" IOS="gpio_0" IS_INSTANTIATED="TRUE" LEFT="%gpo3_size-1%" LSB="0" MHS_INDEX="35" MPD_INDEX="35" MSB="%gpo3_size-1%" NAME="GPO3" RIGHT="0" SIGNAME="GPO3" VECFORMULA="[C_GPO3_SIZE-1:0]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="GPO3"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="O" ENDIAN="LITTLE" IOS="gpio_0" IS_INSTANTIATED="TRUE" LEFT="%gpo4_size-1%" LSB="0" MHS_INDEX="36" MPD_INDEX="36" MSB="%gpo4_size-1%" NAME="GPO4" RIGHT="0" SIGNAME="GPO4" VECFORMULA="[C_GPO4_SIZE-1:0]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="GPO4"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" ENDIAN="LITTLE" IOS="gpio_0" IS_INSTANTIATED="TRUE" LEFT="%gpi1_size-1%" LSB="0" MHS_INDEX="37" MPD_INDEX="37" MSB="%gpi1_size-1%" NAME="GPI1" RIGHT="0" SIGNAME="GPI1" VECFORMULA="[C_GPI1_SIZE-1:0]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="GPI1"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" ENDIAN="LITTLE" IOS="gpio_0" IS_INSTANTIATED="TRUE" LEFT="%gpi2_size-1%" LSB="0" MHS_INDEX="38" MPD_INDEX="38" MSB="%gpi2_size-1%" NAME="GPI2" RIGHT="0" SIGNAME="GPI2" VECFORMULA="[C_GPI2_SIZE-1:0]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="GPI2"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" ENDIAN="LITTLE" IOS="gpio_0" IS_INSTANTIATED="TRUE" LEFT="%gpi3_size-1%" LSB="0" MHS_INDEX="39" MPD_INDEX="39" MSB="%gpi3_size-1%" NAME="GPI3" RIGHT="0" SIGNAME="GPI3" VECFORMULA="[C_GPI3_SIZE-1:0]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="GPI3"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" ENDIAN="LITTLE" IOS="gpio_0" IS_INSTANTIATED="TRUE" LEFT="%gpi4_size-1%" LSB="0" MHS_INDEX="40" MPD_INDEX="40" MSB="%gpi4_size-1%" NAME="GPI4" RIGHT="0" SIGNAME="GPI4" VECFORMULA="[C_GPI4_SIZE-1:0]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="External Ports" PORT="GPI4"/>
          </CONNECTIONS>
        </PORT>
        <PORT DIR="I" ENDIAN="LITTLE" IS_INSTANTIATED="TRUE" LEFT="%intc_intr_size-1%" LSB="0" MHS_INDEX="41" MPD_INDEX="41" MSB="%intc_intr_size-1%" NAME="INTC_Interrupt" RIGHT="0" SENSITIVITY="EDGE_RISING" SIGIS="INTERRUPT" SIGNAME="%intc_interrupt%" VECFORMULA="[(C_INTC_INTR_SIZE-1):0]">
          %intc_0_comment_start%
          <SIGNALS>
          %intc_0_comment_end%
            %intc_15_comment_start%
            <SIGNAL NAME="INTC_Interrupt_15"/>
            %intc_15_comment_end%
            %intc_14_comment_start%
            <SIGNAL NAME="INTC_Interrupt_14"/>
            %intc_14_comment_end%
            %intc_13_comment_start%
            <SIGNAL NAME="INTC_Interrupt_13"/>
            %intc_13_comment_end%
            %intc_12_comment_start%
            <SIGNAL NAME="INTC_Interrupt_12"/>
            %intc_12_comment_end%
            %intc_11_comment_start%
            <SIGNAL NAME="INTC_Interrupt_11"/>
            %intc_11_comment_end%
            %intc_10_comment_start%
            <SIGNAL NAME="INTC_Interrupt_10"/>
            %intc_10_comment_end%
            %intc_9_comment_start%
            <SIGNAL NAME="INTC_Interrupt_9"/>
            %intc_9_comment_end%
            %intc_8_comment_start%
            <SIGNAL NAME="INTC_Interrupt_8"/>
            %intc_8_comment_end%
            %intc_7_comment_start%
            <SIGNAL NAME="INTC_Interrupt_7"/>
            %intc_7_comment_end%
            %intc_6_comment_start%
            <SIGNAL NAME="INTC_Interrupt_6"/>
            %intc_6_comment_end%
            %intc_5_comment_start%
            <SIGNAL NAME="INTC_Interrupt_5"/>
            %intc_5_comment_end%
            %intc_4_comment_start%
            <SIGNAL NAME="INTC_Interrupt_4"/>
            %intc_4_comment_end%
            %intc_3_comment_start%
            <SIGNAL NAME="INTC_Interrupt_3"/>
            %intc_3_comment_end%
            %intc_2_comment_start%
            <SIGNAL NAME="INTC_Interrupt_2"/>
            %intc_2_comment_end%
            %intc_1_comment_start%
            <SIGNAL NAME="INTC_Interrupt_1"/>
            %intc_1_comment_end%
            <SIGNAL NAME="INTC_Interrupt_0"/>
          %intc_0_comment_start%
          </SIGNALS>
          %intc_0_comment_end%
          <DESCRIPTION>Interrupt Inputs</DESCRIPTION>
          %intc_0_comment_start%
          <CONNECTIONS>
            <CONNECTION INSTANCE="%intc_interrupt%"/>
          </CONNECTIONS>
          %intc_0_comment_end%
        </PORT>
        <PORT BUS="INTERRUPT" DEF_SIGNAME="Interrupt" DIR="O" IS_INSTANTIATED="TRUE" MHS_INDEX="42" MPD_INDEX="42" NAME="INTC_IRQ" SENSITIVITY="LEVEL_HIGH" SIGIS="INTERRUPT" SIGNAME="INTC_IRQ">
          <DESCRIPTION>Interrupt Request Output</DESCRIPTION>
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[INTERRUPT]" INSTANCE="%microblaze_instance%" PORT="INTERRUPT"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="INTERRUPT" DEF_SIGNAME="Interrupt_Address" DIR="O" ENDIAN="LITTLE" IS_INSTANTIATED="TRUE" LEFT="31" LSB="0" MHS_INDEX="43" MPD_INDEX="44" MSB="31" NAME="INTC_Interrupt_Address" RIGHT="0" SIGNAME="Interrupt_Address" VECFORMULA="[31:0]">
          <DESCRIPTION>Interrupt Vector Address Output</DESCRIPTION>
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[INTERRUPT]" INSTANCE="%microblaze_instance%" PORT="INTERRUPT_ADDRESS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="INTERRUPT" DEF_SIGNAME="Interrupt_Ack" DIR="I" ENDIAN="LITTLE" IS_INSTANTIATED="TRUE" LEFT="1" LSB="0" MHS_INDEX="44" MPD_INDEX="43" MSB="1" NAME="INTC_Processor_Ack" RIGHT="0" SIGNAME="Interrupt_Ack" VECFORMULA="[1:0]">
          <DESCRIPTION>Interrupt Acknowledgement Input</DESCRIPTION>
          <CONNECTIONS>
            <CONNECTION BUSINTERFACE="[INTERRUPT]" INSTANCE="%microblaze_instance%" PORT="INTERRUPT_ACK"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_LMB_ABus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="45" MSB="0" NAME="LMB_ABus" RIGHT="31" SIGNAME="dlmb_LMB_ABus" VECFORMULA="[0:C_LMB_AWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_ABUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_LMB_WriteDBus" DIR="I" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="46" MSB="0" NAME="LMB_WriteDBus" RIGHT="31" SIGNAME="dlmb_LMB_WriteDBus" VECFORMULA="[0:C_LMB_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_WRITEDBUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_LMB_AddrStrobe" DIR="I" MPD_INDEX="47" NAME="LMB_AddrStrobe" SIGNAME="dlmb_LMB_AddrStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_ADDRSTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_LMB_ReadStrobe" DIR="I" MPD_INDEX="48" NAME="LMB_ReadStrobe" SIGNAME="dlmb_LMB_ReadStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_READSTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_LMB_WriteStrobe" DIR="I" MPD_INDEX="49" NAME="LMB_WriteStrobe" SIGNAME="dlmb_LMB_WriteStrobe">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_WRITESTROBE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_LMB_BE" DIR="I" ENDIAN="BIG" LEFT="0" LSB="3" MPD_INDEX="50" MSB="0" NAME="LMB_BE" RIGHT="3" SIGNAME="dlmb_LMB_BE" VECFORMULA="[0:C_LMB_DWIDTH/8-1]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="LMB_BE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_Sl_DBus" DIR="O" ENDIAN="BIG" LEFT="0" LSB="31" MPD_INDEX="51" MSB="0" NAME="Sl_DBus" RIGHT="31" SIGNAME="dlmb_Sl_DBus" VECFORMULA="[0:C_LMB_DWIDTH-1]">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="SL_DBUS"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_Sl_Ready" DIR="O" MPD_INDEX="52" NAME="Sl_Ready" SIGNAME="dlmb_Sl_Ready">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="SL_READY"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_Sl_Wait" DIR="O" MPD_INDEX="53" NAME="Sl_Wait" SIGNAME="dlmb_Sl_Wait">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="SL_WAIT"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_Sl_UE" DIR="O" MPD_INDEX="54" NAME="Sl_UE" SIGNAME="dlmb_Sl_UE">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="SL_UE"/>
          </CONNECTIONS>
        </PORT>
        <PORT BUS="SLMB" DEF_SIGNAME="dlmb_Sl_CE" DIR="O" MPD_INDEX="55" NAME="Sl_CE" SIGNAME="dlmb_Sl_CE">
          <CONNECTIONS>
            <CONNECTION INSTANCE="dlmb" PORT="SL_CE"/>
          </CONNECTIONS>
        </PORT>
      </PORTS>
      <BUSINTERFACES>
        <BUSINTERFACE BUSNAME="__NOC__" BUSSTD="XIL" BUSSTD_PSF="XIL_MBINTERRUPT" MPD_INDEX="1" NAME="INTERRUPT" TYPE="INITIATOR">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="INTC_IRQ"/>
            <PORTMAP DIR="O" PHYSICAL="INTC_Interrupt_Address"/>
            <PORTMAP DIR="I" PHYSICAL="INTC_Processor_Ack"/>
          </PORTMAPS>
        </BUSINTERFACE>
        <BUSINTERFACE BUSNAME="dlmb" BUSSTD="LMB" BUSSTD_PSF="LMB" IS_INSTANTIATED="TRUE" MHS_INDEX="0" MPD_INDEX="0" NAME="SLMB" TYPE="SLAVE">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="LMB_ABus"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_WriteDBus"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_AddrStrobe"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_ReadStrobe"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_WriteStrobe"/>
            <PORTMAP DIR="I" PHYSICAL="LMB_BE"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_DBus"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_Ready"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_Wait"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_UE"/>
            <PORTMAP DIR="O" PHYSICAL="Sl_CE"/>
          </PORTMAPS>
        </BUSINTERFACE>
      </BUSINTERFACES>
      <IOINTERFACES>
        <IOINTERFACE MPD_INDEX="0" NAME="uart_0" TYPE="XIL_UART_V1_hide">
          <PORTMAPS>
            <PORTMAP DIR="I" PHYSICAL="UART_Rx"/>
            <PORTMAP DIR="O" PHYSICAL="UART_Tx"/>
          </PORTMAPS>
        </IOINTERFACE>
        <IOINTERFACE MPD_INDEX="1" NAME="gpio_0" TYPE="XIL_GPIO_V1">
          <PORTMAPS>
            <PORTMAP DIR="O" PHYSICAL="GPO1"/>
            <PORTMAP DIR="O" PHYSICAL="GPO2"/>
            <PORTMAP DIR="O" PHYSICAL="GPO3"/>
            <PORTMAP DIR="O" PHYSICAL="GPO4"/>
            <PORTMAP DIR="I" PHYSICAL="GPI1"/>
            <PORTMAP DIR="I" PHYSICAL="GPI2"/>
            <PORTMAP DIR="I" PHYSICAL="GPI3"/>
            <PORTMAP DIR="I" PHYSICAL="GPI4"/>
          </PORTMAPS>
        </IOINTERFACE>
      </IOINTERFACES>
      <MEMORYMAP>
        <MEMRANGE BASEDECIMAL="2147483648" BASENAME="C_BASEADDR" BASEVALUE="0x80000000" HIGHDECIMAL="2147483775" HIGHNAME="C_HIGHADDR" HIGHVALUE="0x8000007F" MEMTYPE="IO" MINSIZE="0x80" SIZE="128" SIZEABRV="128">
          <SLAVES>
            <SLAVE BUSINTERFACE="SLMB"/>
          </SLAVES>
        </MEMRANGE>
        <MEMRANGE BASEDECIMAL="3221225472" BASENAME="C_IO_BASEADDR" BASEVALUE="0xC0000000" HIGHDECIMAL="4294967295" HIGHNAME="C_IO_HIGHADDR" HIGHVALUE="0xFFFFFFFF" MEMTYPE="IO" MINSIZE="0x80" SIZE="1073741824" SIZEABRV="1G">
          <SLAVES>
            <SLAVE BUSINTERFACE="SLMB"/>
          </SLAVES>
        </MEMRANGE>
      </MEMORYMAP>
    </MODULE>
  </MODULES>

</EDKSYSTEM>
}
