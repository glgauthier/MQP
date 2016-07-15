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
<layer number="51" name="tDocu" color="14" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="14" fill="1" visible="no" active="no"/>
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
<library name="zed-board">
<packages>
<package name="ASP-134604-01">
<wire x1="-27.8892" y1="7.3406" x2="27.8892" y2="7.3406" width="0.127" layer="51"/>
<wire x1="27.8892" y1="7.3406" x2="27.8892" y2="0.762" width="0.127" layer="51"/>
<wire x1="27.8892" y1="0.762" x2="28.7782" y2="0.762" width="0.127" layer="51"/>
<wire x1="28.7782" y1="0.762" x2="28.7782" y2="-0.762" width="0.127" layer="51"/>
<wire x1="28.7782" y1="-0.762" x2="27.8892" y2="-0.762" width="0.127" layer="51"/>
<wire x1="27.8892" y1="-0.762" x2="27.8892" y2="-7.3406" width="0.127" layer="51"/>
<wire x1="27.8892" y1="-7.3406" x2="-27.8892" y2="-7.3406" width="0.127" layer="51"/>
<wire x1="-27.8892" y1="-7.3406" x2="-27.8892" y2="7.3406" width="0.127" layer="51"/>
<wire x1="-28.575" y1="8.255" x2="28.575" y2="8.255" width="0.127" layer="21"/>
<wire x1="28.575" y1="8.255" x2="28.575" y2="1.27" width="0.127" layer="21"/>
<wire x1="28.575" y1="1.27" x2="29.21" y2="1.27" width="0.127" layer="21"/>
<wire x1="29.21" y1="1.27" x2="29.21" y2="-1.27" width="0.127" layer="21"/>
<wire x1="29.21" y1="-1.27" x2="28.575" y2="-1.27" width="0.127" layer="21"/>
<wire x1="28.575" y1="-1.27" x2="28.575" y2="-8.255" width="0.127" layer="21"/>
<wire x1="28.575" y1="-8.255" x2="-28.575" y2="-8.255" width="0.127" layer="21"/>
<wire x1="-28.575" y1="-8.255" x2="-28.575" y2="8.255" width="0.127" layer="21"/>
<wire x1="27.94" y1="8.255" x2="28.575" y2="7.62" width="0.127" layer="25"/>
<smd name="C1" x="24.765" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C2" x="23.495" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C3" x="22.225" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C4" x="20.955" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C5" x="19.685" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C6" x="18.415" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C7" x="17.145" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C8" x="15.875" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C9" x="14.605" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C10" x="13.335" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C11" x="12.065" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C12" x="10.795" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C13" x="9.525" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C14" x="8.255" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C15" x="6.985" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C16" x="5.715" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C17" x="4.445" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C18" x="3.175" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C19" x="1.905" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C20" x="0.635" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C21" x="-0.635" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C22" x="-1.905" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C23" x="-3.175" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C24" x="-4.445" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C25" x="-5.715" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C26" x="-6.985" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C27" x="-8.255" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C28" x="-9.525" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C29" x="-10.795" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C30" x="-12.065" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C31" x="-13.335" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C32" x="-14.605" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C33" x="-15.875" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C34" x="-17.145" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C35" x="-18.415" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C36" x="-19.685" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C37" x="-20.955" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C38" x="-22.225" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C39" x="-23.495" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="C40" x="-24.765" y="3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D1" x="24.765" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D2" x="23.495" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D3" x="22.225" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D4" x="20.955" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D5" x="19.685" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D6" x="18.415" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D7" x="17.145" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D8" x="15.875" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D9" x="14.605" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D10" x="13.335" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D11" x="12.065" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D12" x="10.795" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D13" x="9.525" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D14" x="8.255" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D15" x="6.985" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D16" x="5.715" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D17" x="4.445" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D18" x="3.175" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D19" x="1.905" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D20" x="0.635" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D21" x="-0.635" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D22" x="-1.905" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D23" x="-3.175" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D24" x="-4.445" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D25" x="-5.715" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D26" x="-6.985" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D27" x="-8.255" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D28" x="-9.525" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D29" x="-10.795" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D30" x="-12.065" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D31" x="-13.335" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D32" x="-14.605" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D33" x="-15.875" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D34" x="-17.145" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D35" x="-18.415" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D36" x="-19.685" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D37" x="-20.955" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D38" x="-22.225" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D39" x="-23.495" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="D40" x="-24.765" y="1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G1" x="24.765" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G2" x="23.495" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G3" x="22.225" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G4" x="20.955" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G5" x="19.685" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G6" x="18.415" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G7" x="17.145" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G8" x="15.875" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G9" x="14.605" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G10" x="13.335" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G11" x="12.065" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G12" x="10.795" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G13" x="9.525" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G14" x="8.255" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G15" x="6.985" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G16" x="5.715" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G17" x="4.445" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G18" x="3.175" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G19" x="1.905" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G20" x="0.635" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G21" x="-0.635" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G22" x="-1.905" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G23" x="-3.175" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G24" x="-4.445" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G25" x="-5.715" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G26" x="-6.985" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G27" x="-8.255" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G28" x="-9.525" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G29" x="-10.795" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G30" x="-12.065" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G31" x="-13.335" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G32" x="-14.605" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G33" x="-15.875" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G34" x="-17.145" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G35" x="-18.415" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G36" x="-19.685" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G37" x="-20.955" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G38" x="-22.225" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G39" x="-23.495" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="G40" x="-24.765" y="-1.905" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H1" x="24.765" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H2" x="23.495" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H3" x="22.225" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H4" x="20.955" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H5" x="19.685" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H6" x="18.415" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H7" x="17.145" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H8" x="15.875" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H9" x="14.605" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H10" x="13.335" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H11" x="12.065" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H12" x="10.795" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H13" x="9.525" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H14" x="8.255" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H15" x="6.985" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H16" x="5.715" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H17" x="4.445" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H18" x="3.175" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H19" x="1.905" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H20" x="0.635" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H21" x="-0.635" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H22" x="-1.905" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H23" x="-3.175" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H24" x="-4.445" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H25" x="-5.715" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H26" x="-6.985" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H27" x="-8.255" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H28" x="-9.525" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H29" x="-10.795" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H30" x="-12.065" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H31" x="-13.335" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H32" x="-14.605" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H33" x="-15.875" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H34" x="-17.145" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H35" x="-18.415" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H36" x="-19.685" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H37" x="-20.955" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H38" x="-22.225" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H39" x="-23.495" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<smd name="H40" x="-24.765" y="-3.175" dx="0.635" dy="0.635" layer="1" roundness="100"/>
<text x="25.4" y="4.445" size="1.016" layer="21" ratio="15" rot="R90">1</text>
<text x="-24.13" y="4.445" size="1.016" layer="21" ratio="15" rot="R90">40</text>
<text x="26.035" y="2.54" size="1.016" layer="21" ratio="15">C</text>
<text x="26.035" y="1.27" size="1.016" layer="21" ratio="15">D</text>
<text x="26.035" y="-2.54" size="1.016" layer="21" ratio="15">G</text>
<text x="26.035" y="-3.81" size="1.016" layer="21" ratio="15">H</text>
<text x="-27.305" y="8.89" size="1.27" layer="25" ratio="15">&gt;NAME</text>
<text x="-27.305" y="-10.16" size="1.27" layer="27" ratio="15">&gt;VALUE</text>
<hole x="27.1907" y="0" drill="1.27"/>
<hole x="-27.1907" y="-3.048" drill="1.27"/>
</package>
</packages>
<symbols>
<symbol name="BANK01">
<pin name="C1" x="-15.24" y="50.8" length="middle"/>
<pin name="C2" x="-15.24" y="48.26" length="middle"/>
<pin name="C3" x="-15.24" y="45.72" length="middle"/>
<pin name="C4" x="-15.24" y="43.18" length="middle"/>
<pin name="C5" x="-15.24" y="40.64" length="middle"/>
<pin name="C6" x="-15.24" y="38.1" length="middle"/>
<pin name="C7" x="-15.24" y="35.56" length="middle"/>
<pin name="C8" x="-15.24" y="33.02" length="middle"/>
<pin name="C9" x="-15.24" y="30.48" length="middle"/>
<pin name="C10" x="-15.24" y="27.94" length="middle"/>
<pin name="C11" x="-15.24" y="25.4" length="middle"/>
<pin name="C12" x="-15.24" y="22.86" length="middle"/>
<pin name="C13" x="-15.24" y="20.32" length="middle"/>
<pin name="C14" x="-15.24" y="17.78" length="middle"/>
<pin name="C15" x="-15.24" y="15.24" length="middle"/>
<pin name="C16" x="-15.24" y="12.7" length="middle"/>
<pin name="C17" x="-15.24" y="10.16" length="middle"/>
<pin name="C18" x="-15.24" y="7.62" length="middle"/>
<pin name="C19" x="-15.24" y="5.08" length="middle"/>
<pin name="C20" x="-15.24" y="2.54" length="middle"/>
<pin name="C21" x="-15.24" y="0" length="middle"/>
<pin name="C22" x="-15.24" y="-2.54" length="middle"/>
<pin name="C23" x="-15.24" y="-5.08" length="middle"/>
<pin name="C24" x="-15.24" y="-7.62" length="middle"/>
<pin name="C25" x="-15.24" y="-10.16" length="middle"/>
<pin name="C26" x="-15.24" y="-12.7" length="middle"/>
<pin name="C27" x="-15.24" y="-15.24" length="middle"/>
<pin name="C28" x="-15.24" y="-17.78" length="middle"/>
<pin name="C29" x="-15.24" y="-20.32" length="middle"/>
<pin name="C30" x="-15.24" y="-22.86" length="middle"/>
<pin name="C31" x="-15.24" y="-25.4" length="middle"/>
<pin name="C32" x="-15.24" y="-27.94" length="middle"/>
<pin name="C33" x="-15.24" y="-30.48" length="middle"/>
<pin name="C34" x="-15.24" y="-33.02" length="middle"/>
<pin name="C35" x="-15.24" y="-35.56" length="middle"/>
<pin name="C36" x="-15.24" y="-38.1" length="middle"/>
<pin name="C37" x="-15.24" y="-40.64" length="middle"/>
<pin name="C38" x="-15.24" y="-43.18" length="middle"/>
<pin name="C39" x="-15.24" y="-45.72" length="middle"/>
<pin name="C40" x="-15.24" y="-48.26" length="middle"/>
<pin name="D1" x="15.24" y="50.8" length="middle" rot="R180"/>
<pin name="D2" x="15.24" y="48.26" length="middle" rot="R180"/>
<pin name="D3" x="15.24" y="45.72" length="middle" rot="R180"/>
<pin name="D4" x="15.24" y="43.18" length="middle" rot="R180"/>
<pin name="D5" x="15.24" y="40.64" length="middle" rot="R180"/>
<pin name="D6" x="15.24" y="38.1" length="middle" rot="R180"/>
<pin name="D7" x="15.24" y="35.56" length="middle" rot="R180"/>
<pin name="D8" x="15.24" y="33.02" length="middle" rot="R180"/>
<pin name="D9" x="15.24" y="30.48" length="middle" rot="R180"/>
<pin name="D10" x="15.24" y="27.94" length="middle" rot="R180"/>
<pin name="D11" x="15.24" y="25.4" length="middle" rot="R180"/>
<pin name="D12" x="15.24" y="22.86" length="middle" rot="R180"/>
<pin name="D13" x="15.24" y="20.32" length="middle" rot="R180"/>
<pin name="D14" x="15.24" y="17.78" length="middle" rot="R180"/>
<pin name="D15" x="15.24" y="15.24" length="middle" rot="R180"/>
<pin name="D16" x="15.24" y="12.7" length="middle" rot="R180"/>
<pin name="D17" x="15.24" y="10.16" length="middle" rot="R180"/>
<pin name="D18" x="15.24" y="7.62" length="middle" rot="R180"/>
<pin name="D19" x="15.24" y="5.08" length="middle" rot="R180"/>
<pin name="D20" x="15.24" y="2.54" length="middle" rot="R180"/>
<pin name="D21" x="15.24" y="0" length="middle" rot="R180"/>
<pin name="D22" x="15.24" y="-2.54" length="middle" rot="R180"/>
<pin name="D23" x="15.24" y="-5.08" length="middle" rot="R180"/>
<pin name="D24" x="15.24" y="-7.62" length="middle" rot="R180"/>
<pin name="D25" x="15.24" y="-10.16" length="middle" rot="R180"/>
<pin name="D26" x="15.24" y="-12.7" length="middle" rot="R180"/>
<pin name="D27" x="15.24" y="-15.24" length="middle" rot="R180"/>
<pin name="D28" x="15.24" y="-17.78" length="middle" rot="R180"/>
<pin name="D29" x="15.24" y="-20.32" length="middle" rot="R180"/>
<pin name="D30" x="15.24" y="-22.86" length="middle" rot="R180"/>
<pin name="D31" x="15.24" y="-25.4" length="middle" rot="R180"/>
<pin name="D32" x="15.24" y="-27.94" length="middle" rot="R180"/>
<pin name="D33" x="15.24" y="-30.48" length="middle" rot="R180"/>
<pin name="D34" x="15.24" y="-33.02" length="middle" rot="R180"/>
<pin name="D35" x="15.24" y="-35.56" length="middle" rot="R180"/>
<pin name="D36" x="15.24" y="-38.1" length="middle" rot="R180"/>
<pin name="D37" x="15.24" y="-40.64" length="middle" rot="R180"/>
<pin name="D38" x="15.24" y="-43.18" length="middle" rot="R180"/>
<pin name="D39" x="15.24" y="-45.72" length="middle" rot="R180"/>
<pin name="D40" x="15.24" y="-48.26" length="middle" rot="R180"/>
<wire x1="-10.16" y1="53.34" x2="10.16" y2="53.34" width="0.254" layer="94"/>
<wire x1="10.16" y1="53.34" x2="10.16" y2="-50.8" width="0.254" layer="94"/>
<wire x1="10.16" y1="-50.8" x2="-10.16" y2="-50.8" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-50.8" x2="-10.16" y2="53.34" width="0.254" layer="94"/>
<text x="-10.16" y="53.848" size="1.27" layer="95">&gt;NAME</text>
<text x="-10.16" y="-52.578" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="BANK02">
<pin name="G1" x="-15.24" y="50.8" length="middle"/>
<pin name="G2" x="-15.24" y="48.26" length="middle"/>
<pin name="G3" x="-15.24" y="45.72" length="middle"/>
<pin name="G4" x="-15.24" y="43.18" length="middle"/>
<pin name="G5" x="-15.24" y="40.64" length="middle"/>
<pin name="G6" x="-15.24" y="38.1" length="middle"/>
<pin name="G7" x="-15.24" y="35.56" length="middle"/>
<pin name="G8" x="-15.24" y="33.02" length="middle"/>
<pin name="G9" x="-15.24" y="30.48" length="middle"/>
<pin name="G10" x="-15.24" y="27.94" length="middle"/>
<pin name="G11" x="-15.24" y="25.4" length="middle"/>
<pin name="G12" x="-15.24" y="22.86" length="middle"/>
<pin name="G13" x="-15.24" y="20.32" length="middle"/>
<pin name="G14" x="-15.24" y="17.78" length="middle"/>
<pin name="G15" x="-15.24" y="15.24" length="middle"/>
<pin name="G16" x="-15.24" y="12.7" length="middle"/>
<pin name="G17" x="-15.24" y="10.16" length="middle"/>
<pin name="G18" x="-15.24" y="7.62" length="middle"/>
<pin name="G19" x="-15.24" y="5.08" length="middle"/>
<pin name="G20" x="-15.24" y="2.54" length="middle"/>
<pin name="G21" x="-15.24" y="0" length="middle"/>
<pin name="G22" x="-15.24" y="-2.54" length="middle"/>
<pin name="G23" x="-15.24" y="-5.08" length="middle"/>
<pin name="G24" x="-15.24" y="-7.62" length="middle"/>
<pin name="G25" x="-15.24" y="-10.16" length="middle"/>
<pin name="G26" x="-15.24" y="-12.7" length="middle"/>
<pin name="G27" x="-15.24" y="-15.24" length="middle"/>
<pin name="G28" x="-15.24" y="-17.78" length="middle"/>
<pin name="G29" x="-15.24" y="-20.32" length="middle"/>
<pin name="G30" x="-15.24" y="-22.86" length="middle"/>
<pin name="G31" x="-15.24" y="-25.4" length="middle"/>
<pin name="G32" x="-15.24" y="-27.94" length="middle"/>
<pin name="G33" x="-15.24" y="-30.48" length="middle"/>
<pin name="G34" x="-15.24" y="-33.02" length="middle"/>
<pin name="G35" x="-15.24" y="-35.56" length="middle"/>
<pin name="G36" x="-15.24" y="-38.1" length="middle"/>
<pin name="G37" x="-15.24" y="-40.64" length="middle"/>
<pin name="G38" x="-15.24" y="-43.18" length="middle"/>
<pin name="G39" x="-15.24" y="-45.72" length="middle"/>
<pin name="G40" x="-15.24" y="-48.26" length="middle"/>
<pin name="H1" x="15.24" y="50.8" length="middle" rot="R180"/>
<pin name="H2" x="15.24" y="48.26" length="middle" rot="R180"/>
<pin name="H3" x="15.24" y="45.72" length="middle" rot="R180"/>
<pin name="H4" x="15.24" y="43.18" length="middle" rot="R180"/>
<pin name="H5" x="15.24" y="40.64" length="middle" rot="R180"/>
<pin name="H6" x="15.24" y="38.1" length="middle" rot="R180"/>
<pin name="H7" x="15.24" y="35.56" length="middle" rot="R180"/>
<pin name="H8" x="15.24" y="33.02" length="middle" rot="R180"/>
<pin name="H9" x="15.24" y="30.48" length="middle" rot="R180"/>
<pin name="H10" x="15.24" y="27.94" length="middle" rot="R180"/>
<pin name="H11" x="15.24" y="25.4" length="middle" rot="R180"/>
<pin name="H12" x="15.24" y="22.86" length="middle" rot="R180"/>
<pin name="H13" x="15.24" y="20.32" length="middle" rot="R180"/>
<pin name="H14" x="15.24" y="17.78" length="middle" rot="R180"/>
<pin name="H15" x="15.24" y="15.24" length="middle" rot="R180"/>
<pin name="H16" x="15.24" y="12.7" length="middle" rot="R180"/>
<pin name="H17" x="15.24" y="10.16" length="middle" rot="R180"/>
<pin name="H18" x="15.24" y="7.62" length="middle" rot="R180"/>
<pin name="H19" x="15.24" y="5.08" length="middle" rot="R180"/>
<pin name="H20" x="15.24" y="2.54" length="middle" rot="R180"/>
<pin name="H21" x="15.24" y="0" length="middle" rot="R180"/>
<pin name="H22" x="15.24" y="-2.54" length="middle" rot="R180"/>
<pin name="H23" x="15.24" y="-5.08" length="middle" rot="R180"/>
<pin name="H24" x="15.24" y="-7.62" length="middle" rot="R180"/>
<pin name="H25" x="15.24" y="-10.16" length="middle" rot="R180"/>
<pin name="H26" x="15.24" y="-12.7" length="middle" rot="R180"/>
<pin name="H27" x="15.24" y="-15.24" length="middle" rot="R180"/>
<pin name="H28" x="15.24" y="-17.78" length="middle" rot="R180"/>
<pin name="H29" x="15.24" y="-20.32" length="middle" rot="R180"/>
<pin name="H30" x="15.24" y="-22.86" length="middle" rot="R180"/>
<pin name="H31" x="15.24" y="-25.4" length="middle" rot="R180"/>
<pin name="H32" x="15.24" y="-27.94" length="middle" rot="R180"/>
<pin name="H33" x="15.24" y="-30.48" length="middle" rot="R180"/>
<pin name="H34" x="15.24" y="-33.02" length="middle" rot="R180"/>
<pin name="H35" x="15.24" y="-35.56" length="middle" rot="R180"/>
<pin name="H36" x="15.24" y="-38.1" length="middle" rot="R180"/>
<pin name="H37" x="15.24" y="-40.64" length="middle" rot="R180"/>
<pin name="H38" x="15.24" y="-43.18" length="middle" rot="R180"/>
<pin name="H39" x="15.24" y="-45.72" length="middle" rot="R180"/>
<pin name="H40" x="15.24" y="-48.26" length="middle" rot="R180"/>
<wire x1="-10.16" y1="53.34" x2="10.16" y2="53.34" width="0.254" layer="94"/>
<wire x1="10.16" y1="53.34" x2="10.16" y2="-50.8" width="0.254" layer="94"/>
<wire x1="10.16" y1="-50.8" x2="-10.16" y2="-50.8" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-50.8" x2="-10.16" y2="53.34" width="0.254" layer="94"/>
<text x="-10.16" y="53.848" size="1.27" layer="95">&gt;NAME</text>
<text x="-10.16" y="-52.832" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="ZED-BOARD" prefix="ZED">
<gates>
<gate name="-A" symbol="BANK01" x="-30.48" y="0"/>
<gate name="-B" symbol="BANK02" x="30.48" y="0"/>
</gates>
<devices>
<device name="" package="ASP-134604-01">
<connects>
<connect gate="-A" pin="C1" pad="C1"/>
<connect gate="-A" pin="C10" pad="C10"/>
<connect gate="-A" pin="C11" pad="C11"/>
<connect gate="-A" pin="C12" pad="C12"/>
<connect gate="-A" pin="C13" pad="C13"/>
<connect gate="-A" pin="C14" pad="C14"/>
<connect gate="-A" pin="C15" pad="C15"/>
<connect gate="-A" pin="C16" pad="C16"/>
<connect gate="-A" pin="C17" pad="C17"/>
<connect gate="-A" pin="C18" pad="C18"/>
<connect gate="-A" pin="C19" pad="C19"/>
<connect gate="-A" pin="C2" pad="C2"/>
<connect gate="-A" pin="C20" pad="C20"/>
<connect gate="-A" pin="C21" pad="C21"/>
<connect gate="-A" pin="C22" pad="C22"/>
<connect gate="-A" pin="C23" pad="C23"/>
<connect gate="-A" pin="C24" pad="C24"/>
<connect gate="-A" pin="C25" pad="C25"/>
<connect gate="-A" pin="C26" pad="C26"/>
<connect gate="-A" pin="C27" pad="C27"/>
<connect gate="-A" pin="C28" pad="C28"/>
<connect gate="-A" pin="C29" pad="C29"/>
<connect gate="-A" pin="C3" pad="C3"/>
<connect gate="-A" pin="C30" pad="C30"/>
<connect gate="-A" pin="C31" pad="C31"/>
<connect gate="-A" pin="C32" pad="C32"/>
<connect gate="-A" pin="C33" pad="C33"/>
<connect gate="-A" pin="C34" pad="C34"/>
<connect gate="-A" pin="C35" pad="C35"/>
<connect gate="-A" pin="C36" pad="C36"/>
<connect gate="-A" pin="C37" pad="C37"/>
<connect gate="-A" pin="C38" pad="C38"/>
<connect gate="-A" pin="C39" pad="C39"/>
<connect gate="-A" pin="C4" pad="C4"/>
<connect gate="-A" pin="C40" pad="C40"/>
<connect gate="-A" pin="C5" pad="C5"/>
<connect gate="-A" pin="C6" pad="C6"/>
<connect gate="-A" pin="C7" pad="C7"/>
<connect gate="-A" pin="C8" pad="C8"/>
<connect gate="-A" pin="C9" pad="C9"/>
<connect gate="-A" pin="D1" pad="D1"/>
<connect gate="-A" pin="D10" pad="D10"/>
<connect gate="-A" pin="D11" pad="D11"/>
<connect gate="-A" pin="D12" pad="D12"/>
<connect gate="-A" pin="D13" pad="D13"/>
<connect gate="-A" pin="D14" pad="D14"/>
<connect gate="-A" pin="D15" pad="D15"/>
<connect gate="-A" pin="D16" pad="D16"/>
<connect gate="-A" pin="D17" pad="D17"/>
<connect gate="-A" pin="D18" pad="D18"/>
<connect gate="-A" pin="D19" pad="D19"/>
<connect gate="-A" pin="D2" pad="D2"/>
<connect gate="-A" pin="D20" pad="D20"/>
<connect gate="-A" pin="D21" pad="D21"/>
<connect gate="-A" pin="D22" pad="D22"/>
<connect gate="-A" pin="D23" pad="D23"/>
<connect gate="-A" pin="D24" pad="D24"/>
<connect gate="-A" pin="D25" pad="D25"/>
<connect gate="-A" pin="D26" pad="D26"/>
<connect gate="-A" pin="D27" pad="D27"/>
<connect gate="-A" pin="D28" pad="D28"/>
<connect gate="-A" pin="D29" pad="D29"/>
<connect gate="-A" pin="D3" pad="D3"/>
<connect gate="-A" pin="D30" pad="D30"/>
<connect gate="-A" pin="D31" pad="D31"/>
<connect gate="-A" pin="D32" pad="D32"/>
<connect gate="-A" pin="D33" pad="D33"/>
<connect gate="-A" pin="D34" pad="D34"/>
<connect gate="-A" pin="D35" pad="D35"/>
<connect gate="-A" pin="D36" pad="D36"/>
<connect gate="-A" pin="D37" pad="D37"/>
<connect gate="-A" pin="D38" pad="D38"/>
<connect gate="-A" pin="D39" pad="D39"/>
<connect gate="-A" pin="D4" pad="D4"/>
<connect gate="-A" pin="D40" pad="D40"/>
<connect gate="-A" pin="D5" pad="D5"/>
<connect gate="-A" pin="D6" pad="D6"/>
<connect gate="-A" pin="D7" pad="D7"/>
<connect gate="-A" pin="D8" pad="D8"/>
<connect gate="-A" pin="D9" pad="D9"/>
<connect gate="-B" pin="G1" pad="G1"/>
<connect gate="-B" pin="G10" pad="G10"/>
<connect gate="-B" pin="G11" pad="G11"/>
<connect gate="-B" pin="G12" pad="G12"/>
<connect gate="-B" pin="G13" pad="G13"/>
<connect gate="-B" pin="G14" pad="G14"/>
<connect gate="-B" pin="G15" pad="G15"/>
<connect gate="-B" pin="G16" pad="G16"/>
<connect gate="-B" pin="G17" pad="G17"/>
<connect gate="-B" pin="G18" pad="G18"/>
<connect gate="-B" pin="G19" pad="G19"/>
<connect gate="-B" pin="G2" pad="G2"/>
<connect gate="-B" pin="G20" pad="G20"/>
<connect gate="-B" pin="G21" pad="G21"/>
<connect gate="-B" pin="G22" pad="G22"/>
<connect gate="-B" pin="G23" pad="G23"/>
<connect gate="-B" pin="G24" pad="G24"/>
<connect gate="-B" pin="G25" pad="G25"/>
<connect gate="-B" pin="G26" pad="G26"/>
<connect gate="-B" pin="G27" pad="G27"/>
<connect gate="-B" pin="G28" pad="G28"/>
<connect gate="-B" pin="G29" pad="G29"/>
<connect gate="-B" pin="G3" pad="G3"/>
<connect gate="-B" pin="G30" pad="G30"/>
<connect gate="-B" pin="G31" pad="G31"/>
<connect gate="-B" pin="G32" pad="G32"/>
<connect gate="-B" pin="G33" pad="G33"/>
<connect gate="-B" pin="G34" pad="G34"/>
<connect gate="-B" pin="G35" pad="G35"/>
<connect gate="-B" pin="G36" pad="G36"/>
<connect gate="-B" pin="G37" pad="G37"/>
<connect gate="-B" pin="G38" pad="G38"/>
<connect gate="-B" pin="G39" pad="G39"/>
<connect gate="-B" pin="G4" pad="G4"/>
<connect gate="-B" pin="G40" pad="G40"/>
<connect gate="-B" pin="G5" pad="G5"/>
<connect gate="-B" pin="G6" pad="G6"/>
<connect gate="-B" pin="G7" pad="G7"/>
<connect gate="-B" pin="G8" pad="G8"/>
<connect gate="-B" pin="G9" pad="G9"/>
<connect gate="-B" pin="H1" pad="H1"/>
<connect gate="-B" pin="H10" pad="H10"/>
<connect gate="-B" pin="H11" pad="H11"/>
<connect gate="-B" pin="H12" pad="H12"/>
<connect gate="-B" pin="H13" pad="H13"/>
<connect gate="-B" pin="H14" pad="H14"/>
<connect gate="-B" pin="H15" pad="H15"/>
<connect gate="-B" pin="H16" pad="H16"/>
<connect gate="-B" pin="H17" pad="H17"/>
<connect gate="-B" pin="H18" pad="H18"/>
<connect gate="-B" pin="H19" pad="H19"/>
<connect gate="-B" pin="H2" pad="H2"/>
<connect gate="-B" pin="H20" pad="H20"/>
<connect gate="-B" pin="H21" pad="H21"/>
<connect gate="-B" pin="H22" pad="H22"/>
<connect gate="-B" pin="H23" pad="H23"/>
<connect gate="-B" pin="H24" pad="H24"/>
<connect gate="-B" pin="H25" pad="H25"/>
<connect gate="-B" pin="H26" pad="H26"/>
<connect gate="-B" pin="H27" pad="H27"/>
<connect gate="-B" pin="H28" pad="H28"/>
<connect gate="-B" pin="H29" pad="H29"/>
<connect gate="-B" pin="H3" pad="H3"/>
<connect gate="-B" pin="H30" pad="H30"/>
<connect gate="-B" pin="H31" pad="H31"/>
<connect gate="-B" pin="H32" pad="H32"/>
<connect gate="-B" pin="H33" pad="H33"/>
<connect gate="-B" pin="H34" pad="H34"/>
<connect gate="-B" pin="H35" pad="H35"/>
<connect gate="-B" pin="H36" pad="H36"/>
<connect gate="-B" pin="H37" pad="H37"/>
<connect gate="-B" pin="H38" pad="H38"/>
<connect gate="-B" pin="H39" pad="H39"/>
<connect gate="-B" pin="H4" pad="H4"/>
<connect gate="-B" pin="H40" pad="H40"/>
<connect gate="-B" pin="H5" pad="H5"/>
<connect gate="-B" pin="H6" pad="H6"/>
<connect gate="-B" pin="H7" pad="H7"/>
<connect gate="-B" pin="H8" pad="H8"/>
<connect gate="-B" pin="H9" pad="H9"/>
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
<symbol name="A3L-LOC">
<wire x1="288.29" y1="3.81" x2="342.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="342.265" y1="3.81" x2="373.38" y2="3.81" width="0.1016" layer="94"/>
<wire x1="373.38" y1="3.81" x2="383.54" y2="3.81" width="0.1016" layer="94"/>
<wire x1="383.54" y1="3.81" x2="383.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="383.54" y1="8.89" x2="383.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="383.54" y1="13.97" x2="383.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="383.54" y1="19.05" x2="383.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="288.29" y1="3.81" x2="288.29" y2="24.13" width="0.1016" layer="94"/>
<wire x1="288.29" y1="24.13" x2="342.265" y2="24.13" width="0.1016" layer="94"/>
<wire x1="342.265" y1="24.13" x2="383.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="373.38" y1="3.81" x2="373.38" y2="8.89" width="0.1016" layer="94"/>
<wire x1="373.38" y1="8.89" x2="383.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="373.38" y1="8.89" x2="342.265" y2="8.89" width="0.1016" layer="94"/>
<wire x1="342.265" y1="8.89" x2="342.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="342.265" y1="8.89" x2="342.265" y2="13.97" width="0.1016" layer="94"/>
<wire x1="342.265" y1="13.97" x2="383.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="342.265" y1="13.97" x2="342.265" y2="19.05" width="0.1016" layer="94"/>
<wire x1="342.265" y1="19.05" x2="383.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="342.265" y1="19.05" x2="342.265" y2="24.13" width="0.1016" layer="94"/>
<text x="344.17" y="15.24" size="2.54" layer="94">&gt;DRAWING_NAME</text>
<text x="344.17" y="10.16" size="2.286" layer="94">&gt;LAST_DATE_TIME</text>
<text x="357.505" y="5.08" size="2.54" layer="94">&gt;SHEET</text>
<text x="343.916" y="4.953" size="2.54" layer="94">Sheet:</text>
<frame x1="0" y1="0" x2="387.35" y2="260.35" columns="8" rows="5" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="A3L-LOC" prefix="FRAME" uservalue="yes">
<description>&lt;b&gt;FRAME&lt;/b&gt;&lt;p&gt;
DIN A3, landscape with location and doc. field</description>
<gates>
<gate name="G$1" symbol="A3L-LOC" x="0" y="0"/>
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
<part name="ZED1" library="zed-board" deviceset="ZED-BOARD" device=""/>
<part name="FRAME1" library="frames" deviceset="A3L-LOC" device="" value="ZED FMC breakout"/>
<part name="AL422B" library="AL422B" deviceset="AL422B" device=""/>
<part name="U$2" library="AL422B" deviceset="AL422B" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="ZED1" gate="-A" x="68.58" y="68.58"/>
<instance part="ZED1" gate="-B" x="68.58" y="-55.88"/>
<instance part="FRAME1" gate="G$1" x="-2.54" y="-121.92"/>
<instance part="AL422B" gate="G$1" x="190.5" y="73.66"/>
<instance part="U$2" gate="G$1" x="190.5" y="-45.72"/>
</instances>
<busses>
</busses>
<nets>
<net name="DP0-C2M_P" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C2"/>
<wire x1="53.34" y1="116.84" x2="48.26" y2="116.84" width="0.1524" layer="91"/>
<label x="35.56" y="116.84" size="1.778" layer="95"/>
</segment>
</net>
<net name="DP0-C2M_N" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C3"/>
<wire x1="53.34" y1="114.3" x2="48.26" y2="114.3" width="0.1524" layer="91"/>
<label x="35.56" y="114.3" size="1.778" layer="95"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C1"/>
<wire x1="53.34" y1="119.38" x2="48.26" y2="119.38" width="0.1524" layer="91"/>
<label x="45.72" y="119.38" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C4"/>
<wire x1="53.34" y1="111.76" x2="48.26" y2="111.76" width="0.1524" layer="91"/>
<label x="45.72" y="111.76" size="1.778" layer="95"/>
<label x="45.72" y="111.76" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C40"/>
<wire x1="53.34" y1="20.32" x2="48.26" y2="20.32" width="0.1524" layer="91"/>
<label x="45.72" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C38"/>
<wire x1="48.26" y1="25.4" x2="53.34" y2="25.4" width="0.1524" layer="91"/>
<label x="45.72" y="25.4" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C36"/>
<wire x1="48.26" y1="30.48" x2="53.34" y2="30.48" width="0.1524" layer="91"/>
<label x="45.72" y="30.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C33"/>
<wire x1="48.26" y1="38.1" x2="53.34" y2="38.1" width="0.1524" layer="91"/>
<label x="45.72" y="38.1" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C32"/>
<wire x1="48.26" y1="40.64" x2="53.34" y2="40.64" width="0.1524" layer="91"/>
<label x="45.72" y="40.64" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C29"/>
<wire x1="48.26" y1="48.26" x2="53.34" y2="48.26" width="0.1524" layer="91"/>
<label x="45.72" y="48.26" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C28"/>
<wire x1="48.26" y1="50.8" x2="53.34" y2="50.8" width="0.1524" layer="91"/>
<label x="45.72" y="50.8" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C21"/>
<wire x1="48.26" y1="68.58" x2="53.34" y2="68.58" width="0.1524" layer="91"/>
<label x="45.72" y="68.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C24"/>
<wire x1="48.26" y1="60.96" x2="53.34" y2="60.96" width="0.1524" layer="91"/>
<label x="45.72" y="60.96" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C25"/>
<wire x1="48.26" y1="58.42" x2="53.34" y2="58.42" width="0.1524" layer="91"/>
<label x="45.72" y="58.42" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C20"/>
<wire x1="48.26" y1="71.12" x2="53.34" y2="71.12" width="0.1524" layer="91"/>
<label x="45.72" y="71.12" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C16"/>
<wire x1="48.26" y1="81.28" x2="53.34" y2="81.28" width="0.1524" layer="91"/>
<label x="45.72" y="81.28" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C17"/>
<wire x1="48.26" y1="78.74" x2="53.34" y2="78.74" width="0.1524" layer="91"/>
<label x="45.72" y="78.74" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C13"/>
<wire x1="48.26" y1="88.9" x2="53.34" y2="88.9" width="0.1524" layer="91"/>
<label x="45.72" y="88.9" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C12"/>
<wire x1="48.26" y1="91.44" x2="53.34" y2="91.44" width="0.1524" layer="91"/>
<label x="45.72" y="91.44" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C9"/>
<wire x1="48.26" y1="99.06" x2="53.34" y2="99.06" width="0.1524" layer="91"/>
<label x="45.72" y="99.06" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C8"/>
<wire x1="48.26" y1="101.6" x2="53.34" y2="101.6" width="0.1524" layer="91"/>
<label x="45.72" y="101.6" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C5"/>
<wire x1="53.34" y1="109.22" x2="48.26" y2="109.22" width="0.1524" layer="91"/>
<label x="45.72" y="109.22" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D2"/>
<wire x1="83.82" y1="116.84" x2="88.9" y2="116.84" width="0.1524" layer="91"/>
<label x="86.36" y="116.84" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D3"/>
<wire x1="83.82" y1="114.3" x2="88.9" y2="114.3" width="0.1524" layer="91"/>
<label x="86.36" y="114.3" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D6"/>
<wire x1="83.82" y1="106.68" x2="88.9" y2="106.68" width="0.1524" layer="91"/>
<label x="86.36" y="106.68" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D7"/>
<wire x1="83.82" y1="104.14" x2="88.9" y2="104.14" width="0.1524" layer="91"/>
<label x="86.36" y="104.14" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D10"/>
<wire x1="83.82" y1="96.52" x2="88.9" y2="96.52" width="0.1524" layer="91"/>
<label x="86.36" y="96.52" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D13"/>
<wire x1="83.82" y1="88.9" x2="88.9" y2="88.9" width="0.1524" layer="91"/>
<label x="86.36" y="88.9" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D16"/>
<wire x1="83.82" y1="81.28" x2="88.9" y2="81.28" width="0.1524" layer="91"/>
<label x="86.36" y="81.28" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D19"/>
<wire x1="83.82" y1="73.66" x2="88.9" y2="73.66" width="0.1524" layer="91"/>
<label x="86.36" y="73.66" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D22"/>
<wire x1="83.82" y1="66.04" x2="88.9" y2="66.04" width="0.1524" layer="91"/>
<label x="86.36" y="66.04" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D25"/>
<wire x1="83.82" y1="58.42" x2="88.9" y2="58.42" width="0.1524" layer="91"/>
<label x="86.36" y="58.42" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D28"/>
<wire x1="83.82" y1="50.8" x2="88.9" y2="50.8" width="0.1524" layer="91"/>
<label x="86.36" y="50.8" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D39"/>
<wire x1="83.82" y1="22.86" x2="88.9" y2="22.86" width="0.1524" layer="91"/>
<label x="86.36" y="22.86" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D37"/>
<wire x1="83.82" y1="27.94" x2="88.9" y2="27.94" width="0.1524" layer="91"/>
<label x="86.36" y="27.94" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G1"/>
<wire x1="53.34" y1="-5.08" x2="48.26" y2="-5.08" width="0.1524" layer="91"/>
<label x="45.72" y="-5.08" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G4"/>
<wire x1="48.26" y1="-12.7" x2="53.34" y2="-12.7" width="0.1524" layer="91"/>
<label x="45.72" y="-12.7" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G5"/>
<wire x1="48.26" y1="-15.24" x2="53.34" y2="-15.24" width="0.1524" layer="91"/>
<label x="45.72" y="-15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G8"/>
<wire x1="48.26" y1="-22.86" x2="53.34" y2="-22.86" width="0.1524" layer="91"/>
<label x="45.72" y="-22.86" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G11"/>
<wire x1="48.26" y1="-30.48" x2="53.34" y2="-30.48" width="0.1524" layer="91"/>
<label x="45.72" y="-30.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G14"/>
<wire x1="48.26" y1="-38.1" x2="53.34" y2="-38.1" width="0.1524" layer="91"/>
<label x="45.72" y="-38.1" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G17"/>
<wire x1="48.26" y1="-45.72" x2="53.34" y2="-45.72" width="0.1524" layer="91"/>
<label x="45.72" y="-45.72" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G20"/>
<wire x1="48.26" y1="-53.34" x2="53.34" y2="-53.34" width="0.1524" layer="91"/>
<label x="45.72" y="-53.34" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G23"/>
<wire x1="48.26" y1="-60.96" x2="53.34" y2="-60.96" width="0.1524" layer="91"/>
<label x="45.72" y="-60.96" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G26"/>
<wire x1="48.26" y1="-68.58" x2="53.34" y2="-68.58" width="0.1524" layer="91"/>
<label x="45.72" y="-68.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G29"/>
<wire x1="48.26" y1="-76.2" x2="53.34" y2="-76.2" width="0.1524" layer="91"/>
<label x="45.72" y="-76.2" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G32"/>
<wire x1="48.26" y1="-83.82" x2="53.34" y2="-83.82" width="0.1524" layer="91"/>
<label x="45.72" y="-83.82" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G35"/>
<wire x1="48.26" y1="-91.44" x2="53.34" y2="-91.44" width="0.1524" layer="91"/>
<label x="45.72" y="-91.44" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G38"/>
<wire x1="48.26" y1="-99.06" x2="53.34" y2="-99.06" width="0.1524" layer="91"/>
<label x="45.72" y="-99.06" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="H3"/>
<wire x1="83.82" y1="-10.16" x2="88.9" y2="-10.16" width="0.1524" layer="91"/>
<label x="86.36" y="-10.16" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="H6"/>
<wire x1="83.82" y1="-17.78" x2="88.9" y2="-17.78" width="0.1524" layer="91"/>
<label x="86.36" y="-17.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="H9"/>
<wire x1="83.82" y1="-25.4" x2="88.9" y2="-25.4" width="0.1524" layer="91"/>
<label x="86.36" y="-25.4" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="H12"/>
<wire x1="83.82" y1="-33.02" x2="88.9" y2="-33.02" width="0.1524" layer="91"/>
<label x="86.36" y="-33.02" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="H15"/>
<wire x1="83.82" y1="-40.64" x2="88.9" y2="-40.64" width="0.1524" layer="91"/>
<label x="86.36" y="-40.64" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="H18"/>
<wire x1="83.82" y1="-48.26" x2="88.9" y2="-48.26" width="0.1524" layer="91"/>
<label x="86.36" y="-48.26" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="H21"/>
<wire x1="83.82" y1="-55.88" x2="88.9" y2="-55.88" width="0.1524" layer="91"/>
<label x="86.36" y="-55.88" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="H24"/>
<wire x1="83.82" y1="-63.5" x2="88.9" y2="-63.5" width="0.1524" layer="91"/>
<label x="86.36" y="-63.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="H27"/>
<wire x1="83.82" y1="-71.12" x2="88.9" y2="-71.12" width="0.1524" layer="91"/>
<label x="86.36" y="-71.12" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="H30"/>
<wire x1="83.82" y1="-78.74" x2="88.9" y2="-78.74" width="0.1524" layer="91"/>
<label x="86.36" y="-78.74" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="H33"/>
<wire x1="83.82" y1="-86.36" x2="88.9" y2="-86.36" width="0.1524" layer="91"/>
<label x="86.36" y="-86.36" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="H36"/>
<wire x1="83.82" y1="-93.98" x2="88.9" y2="-93.98" width="0.1524" layer="91"/>
<label x="86.36" y="-93.98" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="H39"/>
<wire x1="83.82" y1="-101.6" x2="88.9" y2="-101.6" width="0.1524" layer="91"/>
<label x="86.36" y="-101.6" size="1.778" layer="95"/>
</segment>
</net>
<net name="DP0-M2C_P" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C6"/>
<wire x1="48.26" y1="106.68" x2="53.34" y2="106.68" width="0.1524" layer="91"/>
<label x="35.56" y="106.68" size="1.778" layer="95"/>
</segment>
</net>
<net name="DP0-M2C_N" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C7"/>
<wire x1="48.26" y1="104.14" x2="53.34" y2="104.14" width="0.1524" layer="91"/>
<label x="35.56" y="104.14" size="1.778" layer="95"/>
</segment>
</net>
<net name="L21" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C10"/>
<wire x1="48.26" y1="96.52" x2="53.34" y2="96.52" width="0.1524" layer="91"/>
<label x="45.72" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="3V3" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C39"/>
<wire x1="53.34" y1="22.86" x2="48.26" y2="22.86" width="0.1524" layer="91"/>
<label x="45.72" y="22.86" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D40"/>
<wire x1="83.82" y1="20.32" x2="88.9" y2="20.32" width="0.1524" layer="91"/>
<label x="86.36" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D38"/>
<wire x1="83.82" y1="25.4" x2="88.9" y2="25.4" width="0.1524" layer="91"/>
<label x="86.36" y="25.4" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D36"/>
<wire x1="83.82" y1="30.48" x2="88.9" y2="30.48" width="0.1524" layer="91"/>
<label x="86.36" y="30.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="D32"/>
<wire x1="83.82" y1="40.64" x2="88.9" y2="40.64" width="0.1524" layer="91"/>
<label x="86.36" y="40.64" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="AL422B" gate="G$1" pin="VDD"/>
<wire x1="190.5" y1="96.52" x2="190.5" y2="101.6" width="0.1524" layer="91"/>
<label x="193.04" y="99.06" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="VDD"/>
<wire x1="190.5" y1="-22.86" x2="190.5" y2="-17.78" width="0.1524" layer="91"/>
<label x="193.04" y="-20.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="12V" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C37"/>
<wire x1="48.26" y1="27.94" x2="53.34" y2="27.94" width="0.1524" layer="91"/>
<label x="45.72" y="27.94" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-A" pin="C35"/>
<wire x1="48.26" y1="33.02" x2="53.34" y2="33.02" width="0.1524" layer="91"/>
<label x="45.72" y="33.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="GA0" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C34"/>
<wire x1="48.26" y1="35.56" x2="53.34" y2="35.56" width="0.1524" layer="91"/>
<label x="45.72" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="SDA(U7)" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C31"/>
<wire x1="48.26" y1="43.18" x2="53.34" y2="43.18" width="0.1524" layer="91"/>
<label x="40.64" y="43.18" size="1.778" layer="95"/>
</segment>
</net>
<net name="SCL(R7)" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C30"/>
<wire x1="48.26" y1="45.72" x2="53.34" y2="45.72" width="0.1524" layer="91"/>
<label x="40.64" y="45.72" size="1.778" layer="95"/>
</segment>
</net>
<net name="D21" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C27"/>
<wire x1="48.26" y1="53.34" x2="53.34" y2="53.34" width="0.1524" layer="91"/>
<label x="45.72" y="53.34" size="1.778" layer="95"/>
</segment>
</net>
<net name="E21" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C26"/>
<wire x1="48.26" y1="55.88" x2="53.34" y2="55.88" width="0.1524" layer="91"/>
<label x="45.72" y="55.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="C20" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C23"/>
<wire x1="48.26" y1="63.5" x2="53.34" y2="63.5" width="0.1524" layer="91"/>
<label x="45.72" y="63.5" size="1.778" layer="95"/>
</segment>
</net>
<net name="D20" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C22"/>
<wire x1="48.26" y1="66.04" x2="53.34" y2="66.04" width="0.1524" layer="91"/>
<label x="45.72" y="66.04" size="1.778" layer="95"/>
</segment>
</net>
<net name="K20" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C19"/>
<wire x1="48.26" y1="73.66" x2="53.34" y2="73.66" width="0.1524" layer="91"/>
<label x="45.72" y="73.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="K19" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C18"/>
<wire x1="48.26" y1="76.2" x2="53.34" y2="76.2" width="0.1524" layer="91"/>
<label x="45.72" y="76.2" size="1.778" layer="95"/>
</segment>
</net>
<net name="T19" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C15"/>
<wire x1="48.26" y1="83.82" x2="53.34" y2="83.82" width="0.1524" layer="91"/>
<label x="45.72" y="83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="R19" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C14"/>
<wire x1="48.26" y1="86.36" x2="53.34" y2="86.36" width="0.1524" layer="91"/>
<label x="45.72" y="86.36" size="1.778" layer="95"/>
</segment>
</net>
<net name="L22" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="C11"/>
<wire x1="48.26" y1="93.98" x2="53.34" y2="93.98" width="0.1524" layer="91"/>
<label x="45.72" y="93.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="PS-POR-B" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D1"/>
<wire x1="83.82" y1="119.38" x2="88.9" y2="119.38" width="0.1524" layer="91"/>
<label x="86.36" y="119.38" size="1.778" layer="95"/>
</segment>
</net>
<net name="GBTCLK0-M2C_P" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D4"/>
<wire x1="83.82" y1="111.76" x2="88.9" y2="111.76" width="0.1524" layer="91"/>
<label x="86.36" y="111.76" size="1.778" layer="95"/>
</segment>
</net>
<net name="GBTCLK0-M2C_N" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D5"/>
<wire x1="83.82" y1="109.22" x2="88.9" y2="109.22" width="0.1524" layer="91"/>
<label x="86.36" y="109.22" size="1.778" layer="95"/>
</segment>
</net>
<net name="N19" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D8"/>
<wire x1="83.82" y1="101.6" x2="88.9" y2="101.6" width="0.1524" layer="91"/>
<label x="86.36" y="101.6" size="1.778" layer="95"/>
</segment>
</net>
<net name="N20" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D9"/>
<wire x1="83.82" y1="99.06" x2="88.9" y2="99.06" width="0.1524" layer="91"/>
<label x="86.36" y="99.06" size="1.778" layer="95"/>
</segment>
</net>
<net name="J18" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D11"/>
<wire x1="83.82" y1="93.98" x2="88.9" y2="93.98" width="0.1524" layer="91"/>
<label x="86.36" y="93.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="K18" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D12"/>
<wire x1="83.82" y1="91.44" x2="88.9" y2="91.44" width="0.1524" layer="91"/>
<label x="86.36" y="91.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="R20" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D14"/>
<wire x1="83.82" y1="86.36" x2="88.9" y2="86.36" width="0.1524" layer="91"/>
<label x="86.36" y="86.36" size="1.778" layer="95"/>
</segment>
</net>
<net name="R21" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D15"/>
<wire x1="83.82" y1="83.82" x2="88.9" y2="83.82" width="0.1524" layer="91"/>
<label x="86.36" y="83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="L17" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D17"/>
<wire x1="83.82" y1="78.74" x2="88.9" y2="78.74" width="0.1524" layer="91"/>
<label x="86.36" y="78.74" size="1.778" layer="95"/>
</segment>
</net>
<net name="M17" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D18"/>
<wire x1="83.82" y1="76.2" x2="88.9" y2="76.2" width="0.1524" layer="91"/>
<label x="86.36" y="76.2" size="1.778" layer="95"/>
</segment>
</net>
<net name="B19" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D20"/>
<wire x1="83.82" y1="71.12" x2="88.9" y2="71.12" width="0.1524" layer="91"/>
<label x="86.36" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="B20" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D21"/>
<wire x1="83.82" y1="68.58" x2="88.9" y2="68.58" width="0.1524" layer="91"/>
<label x="86.36" y="68.58" size="1.778" layer="95"/>
</segment>
</net>
<net name="E15" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D23"/>
<wire x1="83.82" y1="63.5" x2="88.9" y2="63.5" width="0.1524" layer="91"/>
<label x="86.36" y="63.5" size="1.778" layer="95"/>
</segment>
</net>
<net name="D15" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D24"/>
<wire x1="83.82" y1="60.96" x2="88.9" y2="60.96" width="0.1524" layer="91"/>
<label x="86.36" y="60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="F18" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D26"/>
<wire x1="83.82" y1="55.88" x2="88.9" y2="55.88" width="0.1524" layer="91"/>
<label x="86.36" y="55.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="E18" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D27"/>
<wire x1="83.82" y1="53.34" x2="88.9" y2="53.34" width="0.1524" layer="91"/>
<label x="86.36" y="53.34" size="1.778" layer="95"/>
</segment>
</net>
<net name="TCK" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D29"/>
<wire x1="83.82" y1="48.26" x2="88.9" y2="48.26" width="0.1524" layer="91"/>
<label x="86.36" y="48.26" size="1.778" layer="95"/>
</segment>
</net>
<net name="TDI" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D30"/>
<wire x1="83.82" y1="45.72" x2="88.9" y2="45.72" width="0.1524" layer="91"/>
<label x="86.36" y="45.72" size="1.778" layer="95"/>
</segment>
</net>
<net name="TDO" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D31"/>
<wire x1="83.82" y1="43.18" x2="88.9" y2="43.18" width="0.1524" layer="91"/>
<label x="86.36" y="43.18" size="1.778" layer="95"/>
</segment>
</net>
<net name="TMS" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D33"/>
<wire x1="83.82" y1="38.1" x2="88.9" y2="38.1" width="0.1524" layer="91"/>
<label x="86.36" y="38.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="TRST_L" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D34"/>
<wire x1="83.82" y1="35.56" x2="88.9" y2="35.56" width="0.1524" layer="91"/>
<label x="86.36" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="GA1" class="0">
<segment>
<pinref part="ZED1" gate="-A" pin="D35"/>
<wire x1="83.82" y1="33.02" x2="88.9" y2="33.02" width="0.1524" layer="91"/>
<label x="86.36" y="33.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="CLK1_P(D18)" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G2"/>
<wire x1="48.26" y1="-7.62" x2="53.34" y2="-7.62" width="0.1524" layer="91"/>
<label x="35.56" y="-7.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="CLK1_N(C19)" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G3"/>
<wire x1="48.26" y1="-10.16" x2="53.34" y2="-10.16" width="0.1524" layer="91"/>
<label x="35.56" y="-10.16" size="1.778" layer="95"/>
</segment>
</net>
<net name="M19" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G6"/>
<wire x1="48.26" y1="-17.78" x2="53.34" y2="-17.78" width="0.1524" layer="91"/>
<label x="45.72" y="-17.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="M20" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G7"/>
<wire x1="48.26" y1="-20.32" x2="53.34" y2="-20.32" width="0.1524" layer="91"/>
<label x="45.72" y="-20.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="N22" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G9"/>
<wire x1="48.26" y1="-25.4" x2="53.34" y2="-25.4" width="0.1524" layer="91"/>
<label x="45.72" y="-25.4" size="1.778" layer="95"/>
</segment>
</net>
<net name="P22" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G10"/>
<wire x1="48.26" y1="-27.94" x2="53.34" y2="-27.94" width="0.1524" layer="91"/>
<label x="45.72" y="-27.94" size="1.778" layer="95"/>
</segment>
</net>
<net name="J21" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G12"/>
<wire x1="48.26" y1="-33.02" x2="53.34" y2="-33.02" width="0.1524" layer="91"/>
<label x="45.72" y="-33.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="J22" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G13"/>
<wire x1="48.26" y1="-35.56" x2="53.34" y2="-35.56" width="0.1524" layer="91"/>
<label x="45.72" y="-35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="P20" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G15"/>
<wire x1="48.26" y1="-40.64" x2="53.34" y2="-40.64" width="0.1524" layer="91"/>
<label x="45.72" y="-40.64" size="1.778" layer="95"/>
</segment>
</net>
<net name="P21" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G16"/>
<wire x1="48.26" y1="-43.18" x2="53.34" y2="-43.18" width="0.1524" layer="91"/>
<label x="45.72" y="-43.18" size="1.778" layer="95"/>
</segment>
</net>
<net name="J20" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G18"/>
<wire x1="48.26" y1="-48.26" x2="53.34" y2="-48.26" width="0.1524" layer="91"/>
<label x="45.72" y="-48.26" size="1.778" layer="95"/>
</segment>
</net>
<net name="K21" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G19"/>
<wire x1="48.26" y1="-50.8" x2="53.34" y2="-50.8" width="0.1524" layer="91"/>
<label x="45.72" y="-50.8" size="1.778" layer="95"/>
</segment>
</net>
<net name="G20" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G21"/>
<wire x1="48.26" y1="-55.88" x2="53.34" y2="-55.88" width="0.1524" layer="91"/>
<label x="45.72" y="-55.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="G21" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G22"/>
<wire x1="48.26" y1="-58.42" x2="53.34" y2="-58.42" width="0.1524" layer="91"/>
<label x="45.72" y="-58.42" size="1.778" layer="95"/>
</segment>
</net>
<net name="G19" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G24"/>
<wire x1="48.26" y1="-63.5" x2="53.34" y2="-63.5" width="0.1524" layer="91"/>
<label x="45.72" y="-63.5" size="1.778" layer="95"/>
</segment>
</net>
<net name="F19" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G25"/>
<wire x1="48.26" y1="-66.04" x2="53.34" y2="-66.04" width="0.1524" layer="91"/>
<label x="45.72" y="-66.04" size="1.778" layer="95"/>
</segment>
</net>
<net name="D22" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G27"/>
<wire x1="48.26" y1="-71.12" x2="53.34" y2="-71.12" width="0.1524" layer="91"/>
<label x="45.72" y="-71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="C22" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G28"/>
<wire x1="48.26" y1="-73.66" x2="53.34" y2="-73.66" width="0.1524" layer="91"/>
<label x="45.72" y="-73.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="C17" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G30"/>
<wire x1="48.26" y1="-78.74" x2="53.34" y2="-78.74" width="0.1524" layer="91"/>
<label x="45.72" y="-78.74" size="1.778" layer="95"/>
</segment>
</net>
<net name="C18" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G31"/>
<wire x1="48.26" y1="-81.28" x2="53.34" y2="-81.28" width="0.1524" layer="91"/>
<label x="45.72" y="-81.28" size="1.778" layer="95"/>
</segment>
</net>
<net name="B16" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G33"/>
<wire x1="48.26" y1="-86.36" x2="53.34" y2="-86.36" width="0.1524" layer="91"/>
<label x="45.72" y="-86.36" size="1.778" layer="95"/>
</segment>
</net>
<net name="B17" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G34"/>
<wire x1="48.26" y1="-88.9" x2="53.34" y2="-88.9" width="0.1524" layer="91"/>
<label x="45.72" y="-88.9" size="1.778" layer="95"/>
</segment>
</net>
<net name="B21" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G36"/>
<wire x1="48.26" y1="-93.98" x2="53.34" y2="-93.98" width="0.1524" layer="91"/>
<label x="45.72" y="-93.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="B22" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G37"/>
<wire x1="48.26" y1="-96.52" x2="53.34" y2="-96.52" width="0.1524" layer="91"/>
<label x="45.72" y="-96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="SHIELD" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="G40"/>
<wire x1="48.26" y1="-104.14" x2="53.34" y2="-104.14" width="0.1524" layer="91"/>
<label x="40.64" y="-104.14" size="1.778" layer="95"/>
</segment>
</net>
<net name="FMC-VREF" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H1"/>
<wire x1="83.82" y1="-5.08" x2="88.9" y2="-5.08" width="0.1524" layer="91"/>
<label x="86.36" y="-5.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="FMC-PRSNT(AB14)" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H2"/>
<wire x1="83.82" y1="-7.62" x2="88.9" y2="-7.62" width="0.1524" layer="91"/>
<label x="86.36" y="-7.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="CLK0_P(L18)" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H4"/>
<wire x1="83.82" y1="-12.7" x2="88.9" y2="-12.7" width="0.1524" layer="91"/>
<label x="86.36" y="-12.7" size="1.778" layer="95"/>
</segment>
</net>
<net name="CLK0_N(L19)" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H5"/>
<wire x1="83.82" y1="-15.24" x2="88.9" y2="-15.24" width="0.1524" layer="91"/>
<label x="86.36" y="-15.24" size="1.778" layer="95"/>
</segment>
</net>
<net name="P17" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H7"/>
<wire x1="83.82" y1="-20.32" x2="88.9" y2="-20.32" width="0.1524" layer="91"/>
<label x="86.36" y="-20.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="P18" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H8"/>
<wire x1="83.82" y1="-22.86" x2="88.9" y2="-22.86" width="0.1524" layer="91"/>
<label x="86.36" y="-22.86" size="1.778" layer="95"/>
</segment>
</net>
<net name="M21" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H10"/>
<wire x1="83.82" y1="-27.94" x2="88.9" y2="-27.94" width="0.1524" layer="91"/>
<label x="86.36" y="-27.94" size="1.778" layer="95"/>
</segment>
</net>
<net name="M22" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H11"/>
<wire x1="83.82" y1="-30.48" x2="88.9" y2="-30.48" width="0.1524" layer="91"/>
<label x="86.36" y="-30.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="T16" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H13"/>
<wire x1="83.82" y1="-35.56" x2="88.9" y2="-35.56" width="0.1524" layer="91"/>
<label x="86.36" y="-35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="T17" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H14"/>
<wire x1="83.82" y1="-38.1" x2="88.9" y2="-38.1" width="0.1524" layer="91"/>
<label x="86.36" y="-38.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="N17" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H16"/>
<wire x1="83.82" y1="-43.18" x2="88.9" y2="-43.18" width="0.1524" layer="91"/>
<label x="86.36" y="-43.18" size="1.778" layer="95"/>
</segment>
</net>
<net name="N18" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H17"/>
<wire x1="83.82" y1="-45.72" x2="88.9" y2="-45.72" width="0.1524" layer="91"/>
<label x="86.36" y="-45.72" size="1.778" layer="95"/>
</segment>
</net>
<net name="J16" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H19"/>
<wire x1="83.82" y1="-50.8" x2="88.9" y2="-50.8" width="0.1524" layer="91"/>
<label x="86.36" y="-50.8" size="1.778" layer="95"/>
</segment>
</net>
<net name="J17" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H20"/>
<wire x1="83.82" y1="-53.34" x2="88.9" y2="-53.34" width="0.1524" layer="91"/>
<label x="86.36" y="-53.34" size="1.778" layer="95"/>
</segment>
</net>
<net name="G15" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H22"/>
<wire x1="83.82" y1="-58.42" x2="88.9" y2="-58.42" width="0.1524" layer="91"/>
<label x="86.36" y="-58.42" size="1.778" layer="95"/>
</segment>
</net>
<net name="G16" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H23"/>
<wire x1="83.82" y1="-60.96" x2="88.9" y2="-60.96" width="0.1524" layer="91"/>
<label x="86.36" y="-60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="E19" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H25"/>
<wire x1="83.82" y1="-66.04" x2="88.9" y2="-66.04" width="0.1524" layer="91"/>
<label x="86.36" y="-66.04" size="1.778" layer="95"/>
</segment>
</net>
<net name="E20" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H26"/>
<wire x1="83.82" y1="-68.58" x2="88.9" y2="-68.58" width="0.1524" layer="91"/>
<label x="86.36" y="-68.58" size="1.778" layer="95"/>
</segment>
</net>
<net name="A18" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H28"/>
<wire x1="83.82" y1="-73.66" x2="88.9" y2="-73.66" width="0.1524" layer="91"/>
<label x="86.36" y="-73.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="A19" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H29"/>
<wire x1="83.82" y1="-76.2" x2="88.9" y2="-76.2" width="0.1524" layer="91"/>
<label x="86.36" y="-76.2" size="1.778" layer="95"/>
</segment>
</net>
<net name="A16" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H31"/>
<wire x1="83.82" y1="-81.28" x2="88.9" y2="-81.28" width="0.1524" layer="91"/>
<label x="86.36" y="-81.28" size="1.778" layer="95"/>
</segment>
</net>
<net name="A17" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H32"/>
<wire x1="83.82" y1="-83.82" x2="88.9" y2="-83.82" width="0.1524" layer="91"/>
<label x="86.36" y="-83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="C15" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H34"/>
<wire x1="83.82" y1="-88.9" x2="88.9" y2="-88.9" width="0.1524" layer="91"/>
<label x="86.36" y="-88.9" size="1.778" layer="95"/>
</segment>
</net>
<net name="B15" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H35"/>
<wire x1="83.82" y1="-91.44" x2="88.9" y2="-91.44" width="0.1524" layer="91"/>
<label x="86.36" y="-91.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="A21" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H37"/>
<wire x1="83.82" y1="-96.52" x2="88.9" y2="-96.52" width="0.1524" layer="91"/>
<label x="86.36" y="-96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="A22" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H38"/>
<wire x1="83.82" y1="-99.06" x2="88.9" y2="-99.06" width="0.1524" layer="91"/>
<label x="86.36" y="-99.06" size="1.778" layer="95"/>
</segment>
</net>
<net name="VADJ" class="0">
<segment>
<pinref part="ZED1" gate="-B" pin="H40"/>
<wire x1="88.9" y1="-104.14" x2="83.82" y2="-104.14" width="0.1524" layer="91"/>
<label x="86.36" y="-104.14" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ZED1" gate="-B" pin="G39"/>
<wire x1="48.26" y1="-101.6" x2="53.34" y2="-101.6" width="0.1524" layer="91"/>
<label x="43.18" y="-101.6" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
