<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="yes"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="3" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="_hhn_con_pinhead_box_1mm27">
<description>&lt;h2&gt;Pin Header, Box-Type, 1.27mm/0.5"/50mil Pitch, THT and SMT&lt;/h2&gt;

&lt;p&gt;&lt;b&gt;Rev. 5.1.0&lt;/b&gt;&lt;br /&gt;
as of 2012-11-15, for Eagle 5+&lt;br /&gt;&lt;/p&gt;

&lt;p&gt;&lt;pre&gt;&lt;u&gt;No. of circuits:&lt;/u&gt;
2x 03|05|06|07|08|10|12|13|14|15|
   17|20|22|25|30|32|34|40|50
&lt;u&gt;Packages:&lt;/u&gt;
_S: Straight
 N: No Locking
 T: THT-Mounting | S: SMT-Mounting
&lt;u&gt;Schematic option&lt;/u&gt;
_S: Singularized pins (1 pin/gate)&lt;/pre&gt;&lt;/p&gt;
&lt;hr /&gt;

&lt;p&gt;&lt;pre&gt;&lt;b&gt;Changelog&lt;/b&gt;
5.1.0 (2012-11-15)  Packages: Pad-diameters set to 'auto' (0) &amp;ndash; see note below
                    Packages: 'First' flag set on pad no. 1
                    Symbols/Devices: All pins/gates set to swaplevel '1' to facilitate pinswap/gateswap command
5.0.0 (2012-11-11)  Initial&lt;/pre&gt;&lt;/p&gt;
&lt;hr /&gt;


&lt;p&gt;&lt;font color="grey"&gt;&lt;b&gt;Important Note regarding THT- (Thru-Hole-Technology) Version _&amp;hellip;T:&lt;/b&gt;&lt;/font&gt;&lt;p/&gt;

&lt;p&gt;&lt;font color="grey"&gt;Packages: pad-drill is set to 0.65mm (minimum value acc. to manufacturer's data sheet).
Pad-Diameter is calculated by Eagle based on drc-settings (DRC &gt; RESTRING tab). &lt;/font&gt;&lt;p/&gt;

&lt;p&gt;&lt;font color="grey"&gt;To avoid DRC erros of type 'Clearance', set 'min value' to 8mil on top, bottom, inner
in DRC &gt; RESTRING tab. This will, however, require an 8-mil process (pcb manufacturer).&lt;/font&gt;&lt;p/&gt;

&lt;p&gt;&lt;font color="grey"&gt;Other pads are affected too, so you may increase %-value in DRC &gt; RESTRING tab, e.g. to (10/8)*25% = ca. 30%
to minimize the effect on pads with a drill greater than 0.65mm (CadSoft's default.dru sets
min restring to 10mil and percentage to 25%).&lt;/font&gt;&lt;p/&gt;
 
&lt;hr /&gt;

&lt;p&gt;Author: Dipl.-Ing. FH Rainer Bayer&lt;br /&gt;
Heilbronn University: &amp;nbsp;&lt;a href="http://www.hs-heilbronn.de/rainer.bayer" target="_blank"&gt;http://www.hs-heilbronn.de/rainer.bayer&lt;/a&gt;, &amp;nbsp;&lt;a href="mailto:rainer.bayer@hs-heilbronn.de" target="_blank"&gt;rainer.bayer@hs-heilbronn.de&lt;/a&gt;&lt;br /&gt;
Engineering office ing-rb: &amp;nbsp;&lt;a href="http://www.ing-rb.de/" target="_blank"&gt;http://www.ing-rb.de/&lt;/a&gt;, &amp;nbsp;&lt;a href="mailto:eagle@ing-rb.de" target="_blank"&gt;eagle@ing-rb.de&lt;/a&gt;&lt;br /&gt;
Lectureship dozent-rb: &amp;nbsp;&lt;a href="http://www.dozent-rb.de/" target="_blank"&gt;http://www.dozent-rb.de/&lt;/a&gt;, &amp;nbsp;&lt;a href="mailto:eagle@dozent-rb.de" target="_blank"&gt;eagle@dozent-rb.de&lt;/a&gt;&lt;/pre&gt;&lt;/author&gt;&lt;/p&gt;</description>
<packages>
<package name="PHB_1MM27_2X17_SNT">
<description>&lt;p&gt;&lt;b&gt;Pin Header Box-Type, 1.27mm Pitch,  2x17 circuits, Straight, No Locking, THT&lt;/b&gt;&lt;/p&gt;
&lt;p&gt;&lt;u&gt;Important Note&lt;/u&gt; regarding to THT-versions: see description of library&lt;p&gt;</description>
<wire x1="1.2" y1="-2.625" x2="14.195" y2="-2.625" width="0.1016" layer="21"/>
<wire x1="14.195" y1="-2.625" x2="14.195" y2="2.625" width="0.1016" layer="21"/>
<wire x1="14.195" y1="2.625" x2="-14.195" y2="2.625" width="0.1016" layer="21"/>
<wire x1="-14.195" y1="2.625" x2="-14.195" y2="-2.625" width="0.1016" layer="21"/>
<wire x1="-13.17" y1="-1.75" x2="-1.2" y2="-1.75" width="0.1016" layer="21"/>
<wire x1="1.2" y1="-1.75" x2="13.17" y2="-1.75" width="0.1016" layer="21"/>
<wire x1="13.17" y1="-1.75" x2="13.17" y2="1.75" width="0.1016" layer="21"/>
<wire x1="13.17" y1="1.75" x2="-13.17" y2="1.75" width="0.1016" layer="21"/>
<wire x1="-13.17" y1="1.75" x2="-13.17" y2="-1.75" width="0.1016" layer="21"/>
<wire x1="-14.195" y1="-2.625" x2="-1.2" y2="-2.625" width="0.1016" layer="21"/>
<wire x1="-1.2" y1="-2.625" x2="1.2" y2="-2.625" width="0.1016" layer="21"/>
<wire x1="1.2" y1="-2.625" x2="1.2" y2="-1.75" width="0.1016" layer="21"/>
<wire x1="-1.2" y1="-1.75" x2="-1.2" y2="-2.625" width="0.1016" layer="21"/>
<wire x1="-14.3669" y1="2.7781" x2="14.3669" y2="2.7781" width="0.1016" layer="39"/>
<wire x1="14.3669" y1="2.7781" x2="14.3669" y2="-2.7781" width="0.1016" layer="39"/>
<wire x1="14.3669" y1="-2.7781" x2="-14.3669" y2="-2.7781" width="0.1016" layer="39"/>
<wire x1="-14.3669" y1="-2.7781" x2="-14.3669" y2="2.7781" width="0.1016" layer="39"/>
<pad name="6" x="-7.62" y="0.635" drill="0.65"/>
<pad name="5" x="-7.62" y="-0.635" drill="0.65"/>
<pad name="8" x="-6.35" y="0.635" drill="0.65"/>
<pad name="7" x="-6.35" y="-0.635" drill="0.65"/>
<pad name="10" x="-5.08" y="0.635" drill="0.65"/>
<pad name="9" x="-5.08" y="-0.635" drill="0.65"/>
<pad name="4" x="-8.89" y="0.635" drill="0.65"/>
<pad name="3" x="-8.89" y="-0.635" drill="0.65"/>
<pad name="2" x="-10.16" y="0.635" drill="0.65"/>
<pad name="1" x="-10.16" y="-0.635" drill="0.65" first="yes"/>
<pad name="12" x="-3.81" y="0.635" drill="0.65"/>
<pad name="14" x="-2.54" y="0.635" drill="0.65"/>
<pad name="16" x="-1.27" y="0.635" drill="0.65"/>
<pad name="18" x="0" y="0.635" drill="0.65"/>
<pad name="20" x="1.27" y="0.635" drill="0.65"/>
<pad name="22" x="2.54" y="0.635" drill="0.65"/>
<pad name="24" x="3.81" y="0.635" drill="0.65"/>
<pad name="26" x="5.08" y="0.635" drill="0.65"/>
<pad name="28" x="6.35" y="0.635" drill="0.65"/>
<pad name="30" x="7.62" y="0.635" drill="0.65"/>
<pad name="32" x="8.89" y="0.635" drill="0.65"/>
<pad name="34" x="10.16" y="0.635" drill="0.65"/>
<pad name="11" x="-3.81" y="-0.635" drill="0.65"/>
<pad name="13" x="-2.54" y="-0.635" drill="0.65"/>
<pad name="15" x="-1.27" y="-0.635" drill="0.65"/>
<pad name="17" x="0" y="-0.635" drill="0.65"/>
<pad name="19" x="1.27" y="-0.635" drill="0.65"/>
<pad name="21" x="2.54" y="-0.635" drill="0.65"/>
<pad name="23" x="3.81" y="-0.635" drill="0.65"/>
<pad name="25" x="5.08" y="-0.635" drill="0.65"/>
<pad name="27" x="6.35" y="-0.635" drill="0.65"/>
<pad name="29" x="7.62" y="-0.635" drill="0.65"/>
<pad name="31" x="8.89" y="-0.635" drill="0.65"/>
<pad name="33" x="10.16" y="-0.635" drill="0.65"/>
<text x="-11.6681" y="-1.0319" size="0.8128" layer="21" ratio="9">1</text>
<text x="-11.7475" y="0.2381" size="0.8128" layer="21" ratio="9">2</text>
<text x="-14.2081" y="2.9369" size="1.27" layer="25" ratio="9">&gt;NAME</text>
<text x="14.6844" y="4.2068" size="1.27" layer="27" ratio="9" rot="R180">&gt;VALUE</text>
<rectangle x1="2.34" y1="0.435" x2="2.74" y2="0.835" layer="51"/>
<rectangle x1="2.34" y1="-0.835" x2="2.74" y2="-0.435" layer="51"/>
<rectangle x1="3.61" y1="0.435" x2="4.01" y2="0.835" layer="51"/>
<rectangle x1="3.61" y1="-0.835" x2="4.01" y2="-0.435" layer="51"/>
<rectangle x1="4.88" y1="0.435" x2="5.28" y2="0.835" layer="51"/>
<rectangle x1="4.88" y1="-0.835" x2="5.28" y2="-0.435" layer="51"/>
<rectangle x1="6.15" y1="0.435" x2="6.55" y2="0.835" layer="51"/>
<rectangle x1="6.15" y1="-0.835" x2="6.55" y2="-0.435" layer="51"/>
<rectangle x1="7.42" y1="0.435" x2="7.82" y2="0.835" layer="51"/>
<rectangle x1="7.42" y1="-0.835" x2="7.82" y2="-0.435" layer="51"/>
<rectangle x1="-10.36" y1="0.435" x2="-9.96" y2="0.835" layer="51"/>
<rectangle x1="-9.09" y1="0.435" x2="-8.69" y2="0.835" layer="51"/>
<rectangle x1="-7.82" y1="0.435" x2="-7.42" y2="0.835" layer="51"/>
<rectangle x1="-6.55" y1="0.435" x2="-6.15" y2="0.835" layer="51"/>
<rectangle x1="-5.28" y1="0.435" x2="-4.88" y2="0.835" layer="51"/>
<rectangle x1="-4.01" y1="0.435" x2="-3.61" y2="0.835" layer="51"/>
<rectangle x1="-2.74" y1="0.435" x2="-2.34" y2="0.835" layer="51"/>
<rectangle x1="-1.47" y1="0.435" x2="-1.07" y2="0.835" layer="51"/>
<rectangle x1="-0.2" y1="0.435" x2="0.2" y2="0.835" layer="51"/>
<rectangle x1="1.07" y1="0.435" x2="1.47" y2="0.835" layer="51"/>
<rectangle x1="-10.36" y1="-0.835" x2="-9.96" y2="-0.435" layer="51"/>
<rectangle x1="-9.09" y1="-0.835" x2="-8.69" y2="-0.435" layer="51"/>
<rectangle x1="-7.82" y1="-0.835" x2="-7.42" y2="-0.435" layer="51"/>
<rectangle x1="-6.55" y1="-0.835" x2="-6.15" y2="-0.435" layer="51"/>
<rectangle x1="-5.28" y1="-0.835" x2="-4.88" y2="-0.435" layer="51"/>
<rectangle x1="-4.01" y1="-0.835" x2="-3.61" y2="-0.435" layer="51"/>
<rectangle x1="-2.74" y1="-0.835" x2="-2.34" y2="-0.435" layer="51"/>
<rectangle x1="-1.47" y1="-0.835" x2="-1.07" y2="-0.435" layer="51"/>
<rectangle x1="-0.2" y1="-0.835" x2="0.2" y2="-0.435" layer="51"/>
<rectangle x1="1.07" y1="-0.835" x2="1.47" y2="-0.435" layer="51"/>
<rectangle x1="8.69" y1="0.435" x2="9.09" y2="0.835" layer="51"/>
<rectangle x1="9.96" y1="0.435" x2="10.36" y2="0.835" layer="51"/>
<rectangle x1="8.69" y1="-0.835" x2="9.09" y2="-0.435" layer="51"/>
<rectangle x1="9.96" y1="-0.835" x2="10.36" y2="-0.435" layer="51"/>
<polygon width="0.1016" layer="21">
<vertex x="-10.16" y="-2.6194"/>
<vertex x="-10.4775" y="-3.2544"/>
<vertex x="-9.8425" y="-3.2544"/>
</polygon>
</package>
<package name="PHB_1MM27_2X17_SNS">
<description>&lt;p&gt;&lt;b&gt;Pin Header Box-Type, 1.27mm Pitch,  2x17 circuits, Straight, No Locking, SMT&lt;/b&gt;&lt;/p&gt;</description>
<wire x1="14.195" y1="-2.625" x2="14.195" y2="2.625" width="0.1016" layer="21"/>
<wire x1="-14.195" y1="2.625" x2="-14.195" y2="-2.625" width="0.1016" layer="21"/>
<wire x1="13.17" y1="-1.75" x2="13.17" y2="1.75" width="0.1016" layer="21"/>
<wire x1="-13.17" y1="1.75" x2="-13.17" y2="-1.75" width="0.1016" layer="21"/>
<wire x1="-1.2" y1="-2.625" x2="1.2" y2="-2.625" width="0.1016" layer="51"/>
<wire x1="1.2" y1="-2.625" x2="1.2" y2="-1.75" width="0.1016" layer="51"/>
<wire x1="-1.2" y1="-1.75" x2="-1.2" y2="-2.625" width="0.1016" layer="51"/>
<wire x1="-11.7475" y1="-2.8575" x2="-14.4463" y2="-2.8575" width="0.1016" layer="39"/>
<wire x1="-14.4463" y1="-2.8575" x2="-14.4463" y2="2.8575" width="0.1016" layer="39"/>
<wire x1="-14.4463" y1="2.8575" x2="-11.1125" y2="2.8575" width="0.1016" layer="39"/>
<wire x1="-11.1125" y1="2.8575" x2="-11.1125" y2="3.81" width="0.1016" layer="39"/>
<wire x1="-11.1125" y1="3.81" x2="11.1125" y2="3.81" width="0.1016" layer="39"/>
<wire x1="11.1125" y1="3.81" x2="11.1125" y2="2.8575" width="0.1016" layer="39"/>
<wire x1="11.1125" y1="2.8575" x2="14.4463" y2="2.8575" width="0.1016" layer="39"/>
<wire x1="14.4463" y1="2.8575" x2="14.4463" y2="-2.8575" width="0.1016" layer="39"/>
<wire x1="14.4463" y1="-2.8575" x2="11.1126" y2="-2.8575" width="0.1016" layer="39"/>
<wire x1="11.1126" y1="-2.8575" x2="11.1126" y2="-3.81" width="0.1016" layer="39"/>
<wire x1="11.1126" y1="-3.81" x2="-11.7475" y2="-3.81" width="0.1016" layer="39"/>
<wire x1="-11.7475" y1="-3.81" x2="-11.7475" y2="-2.8575" width="0.1016" layer="39"/>
<wire x1="-11.005" y1="2.625" x2="-14.195" y2="2.625" width="0.1016" layer="21"/>
<wire x1="11.02" y1="2.625" x2="-11.02" y2="2.625" width="0.1016" layer="51"/>
<wire x1="14.195" y1="2.625" x2="11.005" y2="2.625" width="0.1016" layer="21"/>
<wire x1="-11.03" y1="-1.75" x2="-1.2" y2="-1.75" width="0.1016" layer="51"/>
<wire x1="1.2" y1="-1.75" x2="11.03" y2="-1.75" width="0.1016" layer="51"/>
<wire x1="-13.17" y1="-1.75" x2="-11.01" y2="-1.75" width="0.1016" layer="21"/>
<wire x1="11.01" y1="-1.75" x2="13.17" y2="-1.75" width="0.1016" layer="21"/>
<wire x1="11.03" y1="1.75" x2="-11.03" y2="1.75" width="0.1016" layer="51"/>
<wire x1="-11.03" y1="1.75" x2="-13.17" y2="1.75" width="0.1016" layer="21"/>
<wire x1="13.17" y1="1.75" x2="11.01" y2="1.75" width="0.1016" layer="21"/>
<wire x1="-11.045" y1="-2.625" x2="-1.2" y2="-2.625" width="0.1016" layer="51"/>
<wire x1="1.2" y1="-2.625" x2="11.045" y2="-2.625" width="0.1016" layer="51"/>
<wire x1="-14.195" y1="-2.625" x2="-11.03" y2="-2.625" width="0.1016" layer="21"/>
<wire x1="11.01" y1="-2.625" x2="14.195" y2="-2.625" width="0.1016" layer="21"/>
<smd name="6" x="-7.62" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="5" x="-7.62" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="8" x="-6.35" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="7" x="-6.35" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="9" x="-5.08" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="10" x="-5.08" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="2" x="-10.16" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="1" x="-10.16" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="3" x="-8.89" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="4" x="-8.89" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="11" x="-3.81" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="12" x="-3.81" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="13" x="-2.54" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="14" x="-2.54" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="15" x="-1.27" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="16" x="-1.27" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="17" x="0" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="18" x="0" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="19" x="1.27" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="20" x="1.27" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="21" x="2.54" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="22" x="2.54" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="23" x="3.81" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="24" x="3.81" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="25" x="5.08" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="26" x="5.08" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="27" x="6.35" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="28" x="6.35" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="29" x="7.62" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="30" x="7.62" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="31" x="8.89" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="32" x="8.89" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="33" x="10.16" y="-1.85" dx="0.76" dy="2.8" layer="1"/>
<smd name="34" x="10.16" y="1.85" dx="0.76" dy="2.8" layer="1"/>
<text x="-11.6681" y="-1.0319" size="0.8128" layer="21" ratio="9">1</text>
<text x="-11.7475" y="0.2381" size="0.8128" layer="21" ratio="9">2</text>
<text x="-14.2081" y="3.4949" size="1.27" layer="25" ratio="9">&gt;NAME</text>
<text x="14.6844" y="4.7648" size="1.27" layer="27" ratio="9" rot="R180">&gt;VALUE</text>
<rectangle x1="-10.36" y1="0.435" x2="-9.96" y2="0.835" layer="51"/>
<rectangle x1="-10.36" y1="-0.835" x2="-9.96" y2="-0.435" layer="51"/>
<rectangle x1="-9.09" y1="0.435" x2="-8.69" y2="0.835" layer="51"/>
<rectangle x1="-9.09" y1="-0.835" x2="-8.69" y2="-0.435" layer="51"/>
<rectangle x1="-7.82" y1="0.435" x2="-7.42" y2="0.835" layer="51"/>
<rectangle x1="-7.82" y1="-0.835" x2="-7.42" y2="-0.435" layer="51"/>
<rectangle x1="-6.55" y1="0.435" x2="-6.15" y2="0.835" layer="51"/>
<rectangle x1="-6.55" y1="-0.835" x2="-6.15" y2="-0.435" layer="51"/>
<rectangle x1="-5.28" y1="0.435" x2="-4.88" y2="0.835" layer="51"/>
<rectangle x1="-5.28" y1="-0.835" x2="-4.88" y2="-0.435" layer="51"/>
<rectangle x1="-4.01" y1="0.435" x2="-3.61" y2="0.835" layer="51"/>
<rectangle x1="-4.01" y1="-0.835" x2="-3.61" y2="-0.435" layer="51"/>
<rectangle x1="-2.74" y1="0.435" x2="-2.34" y2="0.835" layer="51"/>
<rectangle x1="-2.74" y1="-0.835" x2="-2.34" y2="-0.435" layer="51"/>
<rectangle x1="-1.47" y1="0.435" x2="-1.07" y2="0.835" layer="51"/>
<rectangle x1="-1.47" y1="-0.835" x2="-1.07" y2="-0.435" layer="51"/>
<rectangle x1="-0.2" y1="0.435" x2="0.2" y2="0.835" layer="51"/>
<rectangle x1="-0.2" y1="-0.835" x2="0.2" y2="-0.435" layer="51"/>
<rectangle x1="1.07" y1="0.435" x2="1.47" y2="0.835" layer="51"/>
<rectangle x1="1.07" y1="-0.835" x2="1.47" y2="-0.435" layer="51"/>
<rectangle x1="2.34" y1="0.435" x2="2.74" y2="0.835" layer="51"/>
<rectangle x1="2.34" y1="-0.835" x2="2.74" y2="-0.435" layer="51"/>
<rectangle x1="3.61" y1="0.435" x2="4.01" y2="0.835" layer="51"/>
<rectangle x1="3.61" y1="-0.835" x2="4.01" y2="-0.435" layer="51"/>
<rectangle x1="4.88" y1="0.435" x2="5.28" y2="0.835" layer="51"/>
<rectangle x1="4.88" y1="-0.835" x2="5.28" y2="-0.435" layer="51"/>
<rectangle x1="6.15" y1="0.435" x2="6.55" y2="0.835" layer="51"/>
<rectangle x1="6.15" y1="-0.835" x2="6.55" y2="-0.435" layer="51"/>
<rectangle x1="7.42" y1="0.435" x2="7.82" y2="0.835" layer="51"/>
<rectangle x1="7.42" y1="-0.835" x2="7.82" y2="-0.435" layer="51"/>
<rectangle x1="8.69" y1="0.435" x2="9.09" y2="0.835" layer="51"/>
<rectangle x1="8.69" y1="-0.835" x2="9.09" y2="-0.435" layer="51"/>
<rectangle x1="9.96" y1="0.435" x2="10.36" y2="0.835" layer="51"/>
<rectangle x1="9.96" y1="-0.835" x2="10.36" y2="-0.435" layer="51"/>
<polygon width="0.1016" layer="21">
<vertex x="-10.7982" y="-2.9464"/>
<vertex x="-11.4332" y="-2.6289"/>
<vertex x="-11.4332" y="-3.2639"/>
</polygon>
</package>
</packages>
<symbols>
<symbol name="2X17M">
<wire x1="3.81" y1="-21.59" x2="-3.81" y2="-21.59" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="21.59" x2="-3.81" y2="-21.59" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-21.59" x2="3.81" y2="21.59" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-10.16" x2="2.54" y2="-10.16" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-12.7" x2="2.54" y2="-12.7" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-15.24" x2="2.54" y2="-15.24" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-17.78" x2="2.54" y2="-17.78" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-20.32" x2="2.54" y2="-20.32" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-10.16" x2="-1.27" y2="-10.16" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-12.7" x2="-1.27" y2="-12.7" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-15.24" x2="-1.27" y2="-15.24" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-17.78" x2="-1.27" y2="-17.78" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-20.32" x2="-1.27" y2="-20.32" width="0.6096" layer="94"/>
<wire x1="3.81" y1="21.59" x2="-3.81" y2="21.59" width="0.4064" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="2.54" y2="-5.08" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="2.54" y2="-7.62" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-1.27" y2="2.54" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-1.27" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-5.08" x2="-1.27" y2="-5.08" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-7.62" x2="-1.27" y2="-7.62" width="0.6096" layer="94"/>
<wire x1="1.27" y1="15.24" x2="2.54" y2="15.24" width="0.6096" layer="94"/>
<wire x1="1.27" y1="12.7" x2="2.54" y2="12.7" width="0.6096" layer="94"/>
<wire x1="1.27" y1="10.16" x2="2.54" y2="10.16" width="0.6096" layer="94"/>
<wire x1="1.27" y1="7.62" x2="2.54" y2="7.62" width="0.6096" layer="94"/>
<wire x1="1.27" y1="5.08" x2="2.54" y2="5.08" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="15.24" x2="-1.27" y2="15.24" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="12.7" x2="-1.27" y2="12.7" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="10.16" x2="-1.27" y2="10.16" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="7.62" x2="-1.27" y2="7.62" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="5.08" x2="-1.27" y2="5.08" width="0.6096" layer="94"/>
<wire x1="1.27" y1="20.32" x2="2.54" y2="20.32" width="0.6096" layer="94"/>
<wire x1="1.27" y1="17.78" x2="2.54" y2="17.78" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="20.32" x2="-1.27" y2="20.32" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="17.78" x2="-1.27" y2="17.78" width="0.6096" layer="94"/>
<text x="-3.81" y="-23.876" size="1.6764" layer="96">&gt;VALUE</text>
<text x="-3.81" y="22.098" size="1.6764" layer="95" ratio="12">&gt;NAME</text>
<pin name="1" x="7.62" y="-20.32" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="-7.62" y="-20.32" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="3" x="7.62" y="-17.78" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="4" x="-7.62" y="-17.78" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="5" x="7.62" y="-15.24" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="6" x="-7.62" y="-15.24" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="7" x="7.62" y="-12.7" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="8" x="-7.62" y="-12.7" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="9" x="7.62" y="-10.16" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="10" x="-7.62" y="-10.16" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="11" x="7.62" y="-7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="12" x="-7.62" y="-7.62" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="13" x="7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="14" x="-7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="15" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="16" x="-7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="17" x="7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="18" x="-7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="19" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="20" x="-7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="21" x="7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="22" x="-7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="23" x="7.62" y="7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="24" x="-7.62" y="7.62" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="25" x="7.62" y="10.16" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="26" x="-7.62" y="10.16" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="27" x="7.62" y="12.7" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="28" x="-7.62" y="12.7" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="29" x="7.62" y="15.24" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="30" x="-7.62" y="15.24" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="31" x="7.62" y="17.78" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="32" x="-7.62" y="17.78" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="33" x="7.62" y="20.32" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="34" x="-7.62" y="20.32" visible="pad" length="middle" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PHB_1MM27_2X17_*" prefix="X">
<description>&lt;p&gt;&lt;b&gt;Pin Header Box-Type, 1.27mm/0.5"/50mil Pitch, 2x17 Circuits&lt;/b&gt;&lt;/p&gt;
&lt;p&gt;&lt;u&gt;Note:&lt;/u&gt; see library description for an important note about THT-version&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="2X17M" x="0" y="0"/>
</gates>
<devices>
<device name="SNT" package="PHB_1MM27_2X17_SNT">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
<connect gate="G$1" pin="17" pad="17"/>
<connect gate="G$1" pin="18" pad="18"/>
<connect gate="G$1" pin="19" pad="19"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="20" pad="20"/>
<connect gate="G$1" pin="21" pad="21"/>
<connect gate="G$1" pin="22" pad="22"/>
<connect gate="G$1" pin="23" pad="23"/>
<connect gate="G$1" pin="24" pad="24"/>
<connect gate="G$1" pin="25" pad="25"/>
<connect gate="G$1" pin="26" pad="26"/>
<connect gate="G$1" pin="27" pad="27"/>
<connect gate="G$1" pin="28" pad="28"/>
<connect gate="G$1" pin="29" pad="29"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="30" pad="30"/>
<connect gate="G$1" pin="31" pad="31"/>
<connect gate="G$1" pin="32" pad="32"/>
<connect gate="G$1" pin="33" pad="33"/>
<connect gate="G$1" pin="34" pad="34"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SNS" package="PHB_1MM27_2X17_SNS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
<connect gate="G$1" pin="17" pad="17"/>
<connect gate="G$1" pin="18" pad="18"/>
<connect gate="G$1" pin="19" pad="19"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="20" pad="20"/>
<connect gate="G$1" pin="21" pad="21"/>
<connect gate="G$1" pin="22" pad="22"/>
<connect gate="G$1" pin="23" pad="23"/>
<connect gate="G$1" pin="24" pad="24"/>
<connect gate="G$1" pin="25" pad="25"/>
<connect gate="G$1" pin="26" pad="26"/>
<connect gate="G$1" pin="27" pad="27"/>
<connect gate="G$1" pin="28" pad="28"/>
<connect gate="G$1" pin="29" pad="29"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="30" pad="30"/>
<connect gate="G$1" pin="31" pad="31"/>
<connect gate="G$1" pin="32" pad="32"/>
<connect gate="G$1" pin="33" pad="33"/>
<connect gate="G$1" pin="34" pad="34"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="AL422B">
<packages>
<package name="SOP28">
<description>&lt;b&gt;SMALL OUTLINE PACKAGE&lt;/b&gt;</description>
<wire x1="-9.9" y1="6.9" x2="9.9" y2="6.9" width="0.1998" layer="39"/>
<wire x1="9.9" y1="6.9" x2="9.9" y2="-6.9" width="0.1998" layer="39"/>
<wire x1="-9.9" y1="-6.9" x2="-9.9" y2="6.9" width="0.1998" layer="39"/>
<wire x1="9.415" y1="4.91" x2="9.415" y2="-4.91" width="0.2032" layer="51"/>
<wire x1="9.415" y1="-4.91" x2="-9.415" y2="-4.91" width="0.2032" layer="51"/>
<wire x1="-9.415" y1="-4.91" x2="-9.415" y2="4.91" width="0.2032" layer="51"/>
<wire x1="-9.415" y1="4.91" x2="9.415" y2="4.91" width="0.2032" layer="51"/>
<wire x1="9.9" y1="-6.9" x2="-9.9" y2="-6.9" width="0.1998" layer="39"/>
<smd name="1" x="-8.255" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="2" x="-6.985" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="3" x="-5.715" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="4" x="-4.445" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="5" x="-3.175" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="6" x="-1.905" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="7" x="-0.635" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="8" x="0.635" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="9" x="1.905" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="10" x="3.175" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="11" x="4.445" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="12" x="5.715" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="13" x="6.985" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="14" x="8.255" y="-5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="15" x="8.255" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="16" x="6.985" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="17" x="5.715" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="18" x="4.445" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="19" x="3.175" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="20" x="1.905" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="21" x="0.635" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="22" x="-0.635" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="23" x="-1.905" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="24" x="-3.175" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="25" x="-4.445" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="26" x="-5.715" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="27" x="-6.985" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<smd name="28" x="-8.255" y="5.5" dx="0.6" dy="2.2" layer="1"/>
<text x="-8.255" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-8.255" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<text x="-7.62" y="-4.3101" size="1.27" layer="21" rot="R90">1</text>
<rectangle x1="-8.5049" y1="-6.3401" x2="-8.0051" y2="-5.0099" layer="51"/>
<rectangle x1="-7.2349" y1="-6.3401" x2="-6.7351" y2="-5.0099" layer="51"/>
<rectangle x1="-5.9649" y1="-6.3401" x2="-5.4651" y2="-5.0099" layer="51"/>
<rectangle x1="-4.6949" y1="-6.3401" x2="-4.1951" y2="-5.0099" layer="51"/>
<rectangle x1="-3.4249" y1="-6.3401" x2="-2.9251" y2="-5.0099" layer="51"/>
<rectangle x1="-2.1549" y1="-6.3401" x2="-1.6551" y2="-5.0099" layer="51"/>
<rectangle x1="-0.8849" y1="-6.3401" x2="-0.3851" y2="-5.0099" layer="51"/>
<rectangle x1="0.3851" y1="-6.3401" x2="0.8849" y2="-5.0099" layer="51"/>
<rectangle x1="1.6551" y1="-6.3401" x2="2.1549" y2="-5.0099" layer="51"/>
<rectangle x1="2.9251" y1="-6.3401" x2="3.4249" y2="-5.0099" layer="51"/>
<rectangle x1="4.1951" y1="-6.3401" x2="4.6949" y2="-5.0099" layer="51"/>
<rectangle x1="5.4651" y1="-6.3401" x2="5.9649" y2="-5.0099" layer="51"/>
<rectangle x1="6.7351" y1="-6.3401" x2="7.2349" y2="-5.0099" layer="51"/>
<rectangle x1="8.0051" y1="-6.3401" x2="8.5049" y2="-5.0099" layer="51"/>
<rectangle x1="8.0051" y1="5.0099" x2="8.5049" y2="6.3401" layer="51"/>
<rectangle x1="6.7351" y1="5.0099" x2="7.2349" y2="6.3401" layer="51"/>
<rectangle x1="5.4651" y1="5.0099" x2="5.9649" y2="6.3401" layer="51"/>
<rectangle x1="4.1951" y1="5.0099" x2="4.6949" y2="6.3401" layer="51"/>
<rectangle x1="2.9251" y1="5.0099" x2="3.4249" y2="6.3401" layer="51"/>
<rectangle x1="1.6551" y1="5.0099" x2="2.1549" y2="6.3401" layer="51"/>
<rectangle x1="0.3851" y1="5.0099" x2="0.8849" y2="6.3401" layer="51"/>
<rectangle x1="-0.8849" y1="5.0099" x2="-0.3851" y2="6.3401" layer="51"/>
<rectangle x1="-2.1549" y1="5.0099" x2="-1.6551" y2="6.3401" layer="51"/>
<rectangle x1="-3.4249" y1="5.0099" x2="-2.9251" y2="6.3401" layer="51"/>
<rectangle x1="-4.6949" y1="5.0099" x2="-4.1951" y2="6.3401" layer="51"/>
<rectangle x1="-5.9649" y1="5.0099" x2="-5.4651" y2="6.3401" layer="51"/>
<rectangle x1="-7.2349" y1="5.0099" x2="-6.7351" y2="6.3401" layer="51"/>
<rectangle x1="-8.5049" y1="5.0099" x2="-8.0051" y2="6.3401" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="ALB422B">
<wire x1="-12.7" y1="17.78" x2="12.7" y2="17.78" width="0.254" layer="94"/>
<wire x1="12.7" y1="17.78" x2="12.7" y2="-17.78" width="0.254" layer="94"/>
<wire x1="-12.7" y1="17.78" x2="-12.7" y2="-17.78" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-17.78" x2="12.7" y2="-17.78" width="0.254" layer="94"/>
<pin name="DI0" x="-17.78" y="15.24" length="middle"/>
<pin name="DI1" x="-17.78" y="12.7" length="middle"/>
<pin name="DI2" x="-17.78" y="10.16" length="middle"/>
<pin name="DI3" x="-17.78" y="7.62" length="middle"/>
<pin name="/WE" x="-17.78" y="-10.16" length="middle"/>
<pin name="GND1" x="-2.54" y="-22.86" length="middle" direction="pwr" rot="R90"/>
<pin name="TST" x="-17.78" y="-12.7" length="middle"/>
<pin name="/WRST" x="-17.78" y="-15.24" length="middle"/>
<pin name="WCK" x="-17.78" y="-7.62" length="middle"/>
<pin name="VDD" x="0" y="22.86" length="middle" direction="pwr" rot="R270"/>
<pin name="DI4" x="-17.78" y="5.08" length="middle"/>
<pin name="DI5" x="-17.78" y="2.54" length="middle"/>
<pin name="DI6" x="-17.78" y="0" length="middle"/>
<pin name="DI7" x="-17.78" y="-2.54" length="middle"/>
<pin name="DO0" x="17.78" y="15.24" length="middle" rot="R180"/>
<pin name="DO1" x="17.78" y="12.7" length="middle" rot="R180"/>
<pin name="DO2" x="17.78" y="10.16" length="middle" rot="R180"/>
<pin name="DO3" x="17.78" y="7.62" length="middle" rot="R180"/>
<pin name="/RE" x="17.78" y="-5.08" length="middle" rot="R180"/>
<pin name="GND2" x="2.54" y="-22.86" length="middle" direction="pwr" rot="R90"/>
<pin name="/OE" x="17.78" y="-15.24" length="middle" rot="R180"/>
<pin name="/RRST" x="17.78" y="-7.62" length="middle" rot="R180"/>
<pin name="RCK" x="17.78" y="-10.16" length="middle" rot="R180"/>
<pin name="DEC" x="17.78" y="-12.7" length="middle" rot="R180"/>
<pin name="DO4" x="17.78" y="5.08" length="middle" rot="R180"/>
<pin name="DO5" x="17.78" y="2.54" length="middle" rot="R180"/>
<pin name="DO6" x="17.78" y="0" length="middle" rot="R180"/>
<pin name="DO7" x="17.78" y="-2.54" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="AL422B">
<description>Averlogic
AL422B
3Mbit FIFO</description>
<gates>
<gate name="G$1" symbol="ALB422B" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOP28">
<connects>
<connect gate="G$1" pin="/OE" pad="22"/>
<connect gate="G$1" pin="/RE" pad="24"/>
<connect gate="G$1" pin="/RRST" pad="21"/>
<connect gate="G$1" pin="/WE" pad="5"/>
<connect gate="G$1" pin="/WRST" pad="8"/>
<connect gate="G$1" pin="DEC" pad="19"/>
<connect gate="G$1" pin="DI0" pad="1"/>
<connect gate="G$1" pin="DI1" pad="2"/>
<connect gate="G$1" pin="DI2" pad="3"/>
<connect gate="G$1" pin="DI3" pad="4"/>
<connect gate="G$1" pin="DI4" pad="11"/>
<connect gate="G$1" pin="DI5" pad="12"/>
<connect gate="G$1" pin="DI6" pad="13"/>
<connect gate="G$1" pin="DI7" pad="14"/>
<connect gate="G$1" pin="DO0" pad="28"/>
<connect gate="G$1" pin="DO1" pad="27"/>
<connect gate="G$1" pin="DO2" pad="26"/>
<connect gate="G$1" pin="DO3" pad="25"/>
<connect gate="G$1" pin="DO4" pad="18"/>
<connect gate="G$1" pin="DO5" pad="17"/>
<connect gate="G$1" pin="DO6" pad="16"/>
<connect gate="G$1" pin="DO7" pad="15"/>
<connect gate="G$1" pin="GND1" pad="6"/>
<connect gate="G$1" pin="GND2" pad="23"/>
<connect gate="G$1" pin="RCK" pad="20"/>
<connect gate="G$1" pin="TST" pad="7"/>
<connect gate="G$1" pin="VDD" pad="10"/>
<connect gate="G$1" pin="WCK" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="frames">
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="FRAME_A_L">
<frame x1="0" y1="0" x2="279.4" y2="215.9" columns="6" rows="5" layer="94" border-bottom="no"/>
</symbol>
<symbol name="DOCFIELD">
<wire x1="0" y1="0" x2="71.12" y2="0" width="0.1016" layer="94"/>
<wire x1="101.6" y1="15.24" x2="87.63" y2="15.24" width="0.1016" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="5.08" width="0.1016" layer="94"/>
<wire x1="0" y1="5.08" x2="71.12" y2="5.08" width="0.1016" layer="94"/>
<wire x1="0" y1="5.08" x2="0" y2="15.24" width="0.1016" layer="94"/>
<wire x1="101.6" y1="15.24" x2="101.6" y2="5.08" width="0.1016" layer="94"/>
<wire x1="71.12" y1="5.08" x2="71.12" y2="0" width="0.1016" layer="94"/>
<wire x1="71.12" y1="5.08" x2="87.63" y2="5.08" width="0.1016" layer="94"/>
<wire x1="71.12" y1="0" x2="101.6" y2="0" width="0.1016" layer="94"/>
<wire x1="87.63" y1="15.24" x2="87.63" y2="5.08" width="0.1016" layer="94"/>
<wire x1="87.63" y1="15.24" x2="0" y2="15.24" width="0.1016" layer="94"/>
<wire x1="87.63" y1="5.08" x2="101.6" y2="5.08" width="0.1016" layer="94"/>
<wire x1="101.6" y1="5.08" x2="101.6" y2="0" width="0.1016" layer="94"/>
<wire x1="0" y1="15.24" x2="0" y2="22.86" width="0.1016" layer="94"/>
<wire x1="101.6" y1="35.56" x2="0" y2="35.56" width="0.1016" layer="94"/>
<wire x1="101.6" y1="35.56" x2="101.6" y2="22.86" width="0.1016" layer="94"/>
<wire x1="0" y1="22.86" x2="101.6" y2="22.86" width="0.1016" layer="94"/>
<wire x1="0" y1="22.86" x2="0" y2="35.56" width="0.1016" layer="94"/>
<wire x1="101.6" y1="22.86" x2="101.6" y2="15.24" width="0.1016" layer="94"/>
<text x="1.27" y="1.27" size="2.54" layer="94">Date:</text>
<text x="12.7" y="1.27" size="2.54" layer="94">&gt;LAST_DATE_TIME</text>
<text x="72.39" y="1.27" size="2.54" layer="94">Sheet:</text>
<text x="86.36" y="1.27" size="2.54" layer="94">&gt;SHEET</text>
<text x="88.9" y="11.43" size="2.54" layer="94">REV:</text>
<text x="1.27" y="19.05" size="2.54" layer="94">TITLE:</text>
<text x="1.27" y="11.43" size="2.54" layer="94">Document Number:</text>
<text x="17.78" y="19.05" size="2.54" layer="94">&gt;DRAWING_NAME</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="FRAME_A_L" prefix="FRAME" uservalue="yes">
<description>&lt;b&gt;FRAME&lt;/b&gt; A Size , 8 1/2 x 11 INCH, Landscape&lt;p&gt;</description>
<gates>
<gate name="G$1" symbol="FRAME_A_L" x="0" y="0" addlevel="always"/>
<gate name="G$2" symbol="DOCFIELD" x="172.72" y="0" addlevel="always"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="CAM1" library="_hhn_con_pinhead_box_1mm27" deviceset="PHB_1MM27_2X17_*" device="SNT" value=""/>
<part name="CAM2" library="_hhn_con_pinhead_box_1mm27" deviceset="PHB_1MM27_2X17_*" device="SNT" value=""/>
<part name="U$1" library="AL422B" deviceset="AL422B" device=""/>
<part name="U$2" library="AL422B" deviceset="AL422B" device=""/>
<part name="FRAME1" library="frames" deviceset="FRAME_A_L" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="CAM1" gate="G$1" x="157.48" y="177.8"/>
<instance part="CAM2" gate="G$1" x="228.6" y="177.8"/>
<instance part="U$1" gate="G$1" x="55.88" y="53.34"/>
<instance part="U$2" gate="G$1" x="48.26" y="111.76"/>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="FRAME1" gate="G$2" x="3.81" y="176.53"/>
</instances>
<busses>
</busses>
<nets>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
