<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.5.1">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
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
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
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
<library name="pinhead" urn="urn:adsk.eagle:library:325">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X03" urn="urn:adsk.eagle:footprint:22340/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-3.8862" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
</package>
<package name="1X03/90" urn="urn:adsk.eagle:footprint:22341/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-4.445" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="5.715" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
</package>
<package name="1X04" urn="urn:adsk.eagle:footprint:22258/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-5.1562" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
</package>
<package name="1X04/90" urn="urn:adsk.eagle:footprint:22259/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-5.715" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="6.985" y="-4.445" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
</package>
<package name="2X05" urn="urn:adsk.eagle:footprint:22358/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-6.35" y1="-1.905" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-2.54" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-2.54" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-1.905" x2="-6.35" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="1.905" x2="-5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="-3.81" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-1.27" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.27" y2="1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="2.54" x2="3.81" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-2.54" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-2.54" x2="-4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-2.54" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.905" x2="4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="4.445" y1="2.54" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="2.54" x2="6.35" y2="1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-2.54" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-5.08" y="1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="-2.54" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="-2.54" y="1.27" drill="1.016" shape="octagon"/>
<pad name="5" x="0" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="0" y="1.27" drill="1.016" shape="octagon"/>
<pad name="7" x="2.54" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="8" x="2.54" y="1.27" drill="1.016" shape="octagon"/>
<pad name="9" x="5.08" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="10" x="5.08" y="1.27" drill="1.016" shape="octagon"/>
<text x="-6.35" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.35" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-5.334" y1="-1.524" x2="-4.826" y2="-1.016" layer="51"/>
<rectangle x1="-5.334" y1="1.016" x2="-4.826" y2="1.524" layer="51"/>
<rectangle x1="-2.794" y1="1.016" x2="-2.286" y2="1.524" layer="51"/>
<rectangle x1="-2.794" y1="-1.524" x2="-2.286" y2="-1.016" layer="51"/>
<rectangle x1="-0.254" y1="1.016" x2="0.254" y2="1.524" layer="51"/>
<rectangle x1="-0.254" y1="-1.524" x2="0.254" y2="-1.016" layer="51"/>
<rectangle x1="2.286" y1="1.016" x2="2.794" y2="1.524" layer="51"/>
<rectangle x1="2.286" y1="-1.524" x2="2.794" y2="-1.016" layer="51"/>
<rectangle x1="4.826" y1="1.016" x2="5.334" y2="1.524" layer="51"/>
<rectangle x1="4.826" y1="-1.524" x2="5.334" y2="-1.016" layer="51"/>
</package>
<package name="2X05/90" urn="urn:adsk.eagle:footprint:22359/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-6.35" y1="-1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.985" x2="-5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="6.985" x2="5.08" y2="1.27" width="0.762" layer="21"/>
<pad name="2" x="-5.08" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="4" x="-2.54" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="6" x="0" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="8" x="2.54" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="10" x="5.08" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="1" x="-5.08" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="3" x="-2.54" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="5" x="0" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="7" x="2.54" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="9" x="5.08" y="-6.35" drill="1.016" shape="octagon"/>
<text x="-6.985" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="8.255" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-5.461" y1="0.635" x2="-4.699" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="4.699" y1="0.635" x2="5.461" y2="1.143" layer="21"/>
<rectangle x1="-5.461" y1="-2.921" x2="-4.699" y2="-1.905" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-5.461" y1="-5.461" x2="-4.699" y2="-4.699" layer="21"/>
<rectangle x1="-5.461" y1="-4.699" x2="-4.699" y2="-2.921" layer="51"/>
<rectangle x1="-2.921" y1="-4.699" x2="-2.159" y2="-2.921" layer="51"/>
<rectangle x1="-2.921" y1="-5.461" x2="-2.159" y2="-4.699" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-5.461" x2="0.381" y2="-4.699" layer="21"/>
<rectangle x1="-0.381" y1="-4.699" x2="0.381" y2="-2.921" layer="51"/>
<rectangle x1="2.159" y1="-4.699" x2="2.921" y2="-2.921" layer="51"/>
<rectangle x1="2.159" y1="-5.461" x2="2.921" y2="-4.699" layer="21"/>
<rectangle x1="4.699" y1="-2.921" x2="5.461" y2="-1.905" layer="21"/>
<rectangle x1="4.699" y1="-5.461" x2="5.461" y2="-4.699" layer="21"/>
<rectangle x1="4.699" y1="-4.699" x2="5.461" y2="-2.921" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="1X03" urn="urn:adsk.eagle:package:22458/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X03"/>
</packageinstances>
</package3d>
<package3d name="1X03/90" urn="urn:adsk.eagle:package:22459/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X03/90"/>
</packageinstances>
</package3d>
<package3d name="1X04" urn="urn:adsk.eagle:package:22407/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X04"/>
</packageinstances>
</package3d>
<package3d name="1X04/90" urn="urn:adsk.eagle:package:22404/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X04/90"/>
</packageinstances>
</package3d>
<package3d name="2X05" urn="urn:adsk.eagle:package:22470/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="2X05"/>
</packageinstances>
</package3d>
<package3d name="2X05/90" urn="urn:adsk.eagle:package:22471/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="2X05/90"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="PINHD3" urn="urn:adsk.eagle:symbol:22339/1" library_version="4">
<wire x1="-6.35" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD4" urn="urn:adsk.eagle:symbol:22257/1" library_version="4">
<wire x1="-6.35" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINH2X5" urn="urn:adsk.eagle:symbol:22357/1" library_version="4">
<wire x1="-6.35" y1="-7.62" x2="8.89" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="8.89" y1="-7.62" x2="8.89" y2="7.62" width="0.4064" layer="94"/>
<wire x1="8.89" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="5.08" y="5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="3" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="5.08" y="2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="5" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="5.08" y="0" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="7" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="5.08" y="-2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="9" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="10" x="5.08" y="-5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X3" urn="urn:adsk.eagle:component:22524/4" prefix="JP" uservalue="yes" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD3" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X03">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22458/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="92" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="1X03/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22459/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="17" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X4" urn="urn:adsk.eagle:component:22499/5" prefix="JP" uservalue="yes" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X04">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22407/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="91" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="1X04/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22404/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="9" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-2X5" urn="urn:adsk.eagle:component:22531/4" prefix="JP" uservalue="yes" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINH2X5" x="0" y="0"/>
</gates>
<devices>
<device name="" package="2X05">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22470/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="35" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="2X05/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22471/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-leotronics" urn="urn:adsk.eagle:library:160">
<description>&lt;b&gt;Connectors from Leotronics&lt;/b&gt;&lt;p&gt;
www.leotronics.co.uk&lt;br&gt;</description>
<packages>
<package name="1365-40" urn="urn:adsk.eagle:footprint:7882/1" library_version="2">
<description>&lt;b&gt;DUAL ROW STRAIGHT HEADER&lt;/b&gt; 1364 SERIES. 1.27mm x 1.27mm. Without Fixing Post. SMT&lt;p&gt;
Source: http://www.leotronics.co.uk/Conexcon/Data%20Sheets/sec.%20A/1364ing.pdf</description>
<wire x1="-12.6" y1="1.63" x2="12.595" y2="1.63" width="0.2032" layer="21"/>
<wire x1="12.595" y1="1.63" x2="12.595" y2="-1.63" width="0.2032" layer="21"/>
<wire x1="12.595" y1="-1.63" x2="-12.6" y2="-1.63" width="0.2032" layer="21"/>
<wire x1="-12.6" y1="-1.63" x2="-12.6" y2="1.63" width="0.2032" layer="21"/>
<smd name="1" x="-12.065" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="2" x="-12.065" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="3" x="-10.795" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="4" x="-10.795" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="5" x="-9.525" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="6" x="-9.525" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="7" x="-8.255" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="8" x="-8.255" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="9" x="-6.985" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="10" x="-6.985" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="11" x="-5.715" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="12" x="-5.715" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="13" x="-4.445" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="14" x="-4.445" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="15" x="-3.175" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="16" x="-3.175" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="17" x="-1.905" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="18" x="-1.905" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="19" x="-0.635" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="20" x="-0.635" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="21" x="0.635" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="22" x="0.635" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="23" x="1.905" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="24" x="1.905" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="25" x="3.175" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="26" x="3.175" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="27" x="4.445" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="28" x="4.445" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="29" x="5.715" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="30" x="5.715" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="31" x="6.985" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="32" x="6.985" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="33" x="8.255" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="34" x="8.255" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="35" x="9.525" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="36" x="9.525" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="37" x="10.795" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="38" x="10.795" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="39" x="12.065" y="-2.95" dx="0.76" dy="2.4" layer="1"/>
<smd name="40" x="12.065" y="2.95" dx="0.76" dy="2.4" layer="1"/>
<text x="-13.335" y="-3.175" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="14.605" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-12.265" y1="1.725" x2="-11.865" y2="2.75" layer="51"/>
<rectangle x1="-12.265" y1="-2.75" x2="-11.865" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="-10.995" y1="1.725" x2="-10.595" y2="2.75" layer="51"/>
<rectangle x1="-10.995" y1="-2.75" x2="-10.595" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="-9.725" y1="1.725" x2="-9.325" y2="2.75" layer="51"/>
<rectangle x1="-9.725" y1="-2.75" x2="-9.325" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="-8.455" y1="1.725" x2="-8.055" y2="2.75" layer="51"/>
<rectangle x1="-8.455" y1="-2.75" x2="-8.055" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="-7.185" y1="1.725" x2="-6.785" y2="2.75" layer="51"/>
<rectangle x1="-7.185" y1="-2.75" x2="-6.785" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="-5.915" y1="1.725" x2="-5.515" y2="2.75" layer="51"/>
<rectangle x1="-5.915" y1="-2.75" x2="-5.515" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="-4.645" y1="1.725" x2="-4.245" y2="2.75" layer="51"/>
<rectangle x1="-4.645" y1="-2.75" x2="-4.245" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="-3.375" y1="1.725" x2="-2.975" y2="2.75" layer="51"/>
<rectangle x1="-3.375" y1="-2.75" x2="-2.975" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="-2.105" y1="1.725" x2="-1.705" y2="2.75" layer="51"/>
<rectangle x1="-2.105" y1="-2.75" x2="-1.705" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="-0.835" y1="1.725" x2="-0.435" y2="2.75" layer="51"/>
<rectangle x1="-0.835" y1="-2.75" x2="-0.435" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="0.435" y1="1.725" x2="0.835" y2="2.75" layer="51"/>
<rectangle x1="0.435" y1="-2.75" x2="0.835" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="1.705" y1="1.725" x2="2.105" y2="2.75" layer="51"/>
<rectangle x1="1.705" y1="-2.75" x2="2.105" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="2.975" y1="1.725" x2="3.375" y2="2.75" layer="51"/>
<rectangle x1="2.975" y1="-2.75" x2="3.375" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="4.245" y1="1.725" x2="4.645" y2="2.75" layer="51"/>
<rectangle x1="4.245" y1="-2.75" x2="4.645" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="5.515" y1="1.725" x2="5.915" y2="2.75" layer="51"/>
<rectangle x1="5.515" y1="-2.75" x2="5.915" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="6.785" y1="1.725" x2="7.185" y2="2.75" layer="51"/>
<rectangle x1="6.785" y1="-2.75" x2="7.185" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="8.055" y1="1.725" x2="8.455" y2="2.75" layer="51"/>
<rectangle x1="8.055" y1="-2.75" x2="8.455" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="9.325" y1="1.725" x2="9.725" y2="2.75" layer="51"/>
<rectangle x1="9.325" y1="-2.75" x2="9.725" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="10.595" y1="1.725" x2="10.995" y2="2.75" layer="51"/>
<rectangle x1="10.595" y1="-2.75" x2="10.995" y2="-1.725" layer="51" rot="R180"/>
<rectangle x1="11.865" y1="1.725" x2="12.265" y2="2.75" layer="51"/>
<rectangle x1="11.865" y1="-2.75" x2="12.265" y2="-1.725" layer="51" rot="R180"/>
</package>
</packages>
<packages3d>
<package3d name="1365-40" urn="urn:adsk.eagle:package:7973/1" type="box" library_version="2">
<description>DUAL ROW STRAIGHT HEADER 1364 SERIES. 1.27mm x 1.27mm. Without Fixing Post. SMT
Source: http://www.leotronics.co.uk/Conexcon/Data%20Sheets/sec.%20A/1364ing.pdf</description>
<packageinstances>
<packageinstance name="1365-40"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="MVAL" urn="urn:adsk.eagle:symbol:7864/1" library_version="2">
<wire x1="0" y1="0" x2="1.27" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="1.651" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M" urn="urn:adsk.eagle:symbol:7865/1" library_version="2">
<wire x1="0" y1="0" x2="1.27" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.778" layer="95">&gt;NAME</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="1365-40" urn="urn:adsk.eagle:component:8063/2" prefix="X" library_version="2">
<description>&lt;b&gt;DUAL ROW STRAIGHT HEADER&lt;/b&gt; 1364 SERIES. 1.27mm x 1.27mm. Without Fixing Post. SMT&lt;p&gt;
Source: http://www.leotronics.co.uk/Conexcon/Data%20Sheets/sec.%20A/1364ing.pdf</description>
<gates>
<gate name="-1" symbol="MVAL" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="MVAL" x="30.48" y="0" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="0" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M" x="30.48" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-5" symbol="M" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
<gate name="-6" symbol="M" x="30.48" y="-5.08" addlevel="always" swaplevel="1"/>
<gate name="-7" symbol="M" x="0" y="-7.62" addlevel="always" swaplevel="1"/>
<gate name="-8" symbol="M" x="30.48" y="-7.62" addlevel="always" swaplevel="1"/>
<gate name="-9" symbol="M" x="0" y="-10.16" addlevel="always" swaplevel="1"/>
<gate name="-10" symbol="M" x="30.48" y="-10.16" addlevel="always" swaplevel="1"/>
<gate name="-11" symbol="M" x="0" y="-12.7" addlevel="always" swaplevel="1"/>
<gate name="-12" symbol="M" x="30.48" y="-12.7" addlevel="always" swaplevel="1"/>
<gate name="-13" symbol="M" x="0" y="-15.24" addlevel="always" swaplevel="1"/>
<gate name="-14" symbol="M" x="30.48" y="-15.24" addlevel="always" swaplevel="1"/>
<gate name="-15" symbol="M" x="0" y="-17.78" addlevel="always" swaplevel="1"/>
<gate name="-16" symbol="M" x="30.48" y="-17.78" addlevel="always" swaplevel="1"/>
<gate name="-17" symbol="M" x="0" y="-20.32" addlevel="always" swaplevel="1"/>
<gate name="-18" symbol="M" x="30.48" y="-20.32" addlevel="always" swaplevel="1"/>
<gate name="-19" symbol="M" x="0" y="-22.86" addlevel="always" swaplevel="1"/>
<gate name="-20" symbol="M" x="30.48" y="-22.86" addlevel="always" swaplevel="1"/>
<gate name="-21" symbol="M" x="0" y="-25.4" addlevel="always" swaplevel="1"/>
<gate name="-22" symbol="M" x="30.48" y="-25.4" addlevel="always" swaplevel="1"/>
<gate name="-23" symbol="M" x="0" y="-27.94" addlevel="always" swaplevel="1"/>
<gate name="-24" symbol="M" x="30.48" y="-27.94" addlevel="always" swaplevel="1"/>
<gate name="-25" symbol="M" x="0" y="-30.48" addlevel="always" swaplevel="1"/>
<gate name="-26" symbol="M" x="30.48" y="-30.48" addlevel="always" swaplevel="1"/>
<gate name="-27" symbol="M" x="0" y="-33.02" addlevel="always" swaplevel="1"/>
<gate name="-28" symbol="M" x="30.48" y="-33.02" addlevel="always" swaplevel="1"/>
<gate name="-29" symbol="M" x="0" y="-35.56" addlevel="always" swaplevel="1"/>
<gate name="-30" symbol="M" x="30.48" y="-35.56" addlevel="always" swaplevel="1"/>
<gate name="-31" symbol="M" x="0" y="-38.1" addlevel="always" swaplevel="1"/>
<gate name="-32" symbol="M" x="30.48" y="-38.1" addlevel="always" swaplevel="1"/>
<gate name="-33" symbol="M" x="0" y="-40.64" addlevel="always" swaplevel="1"/>
<gate name="-34" symbol="M" x="30.48" y="-40.64" addlevel="always" swaplevel="1"/>
<gate name="-35" symbol="M" x="0" y="-43.18" addlevel="always" swaplevel="1"/>
<gate name="-36" symbol="M" x="30.48" y="-43.18" addlevel="always" swaplevel="1"/>
<gate name="-37" symbol="M" x="0" y="-45.72" addlevel="always" swaplevel="1"/>
<gate name="-38" symbol="M" x="30.48" y="-45.72" addlevel="always" swaplevel="1"/>
<gate name="-39" symbol="M" x="0" y="-48.26" addlevel="always" swaplevel="1"/>
<gate name="-40" symbol="M" x="30.48" y="-48.26" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="1365-40">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-11" pin="S" pad="11"/>
<connect gate="-12" pin="S" pad="12"/>
<connect gate="-13" pin="S" pad="13"/>
<connect gate="-14" pin="S" pad="14"/>
<connect gate="-15" pin="S" pad="15"/>
<connect gate="-16" pin="S" pad="16"/>
<connect gate="-17" pin="S" pad="17"/>
<connect gate="-18" pin="S" pad="18"/>
<connect gate="-19" pin="S" pad="19"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-20" pin="S" pad="20"/>
<connect gate="-21" pin="S" pad="21"/>
<connect gate="-22" pin="S" pad="22"/>
<connect gate="-23" pin="S" pad="23"/>
<connect gate="-24" pin="S" pad="24"/>
<connect gate="-25" pin="S" pad="25"/>
<connect gate="-26" pin="S" pad="26"/>
<connect gate="-27" pin="S" pad="27"/>
<connect gate="-28" pin="S" pad="28"/>
<connect gate="-29" pin="S" pad="29"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-30" pin="S" pad="30"/>
<connect gate="-31" pin="S" pad="31"/>
<connect gate="-32" pin="S" pad="32"/>
<connect gate="-33" pin="S" pad="33"/>
<connect gate="-34" pin="S" pad="34"/>
<connect gate="-35" pin="S" pad="35"/>
<connect gate="-36" pin="S" pad="36"/>
<connect gate="-37" pin="S" pad="37"/>
<connect gate="-38" pin="S" pad="38"/>
<connect gate="-39" pin="S" pad="39"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-40" pin="S" pad="40"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:7973/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
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
<part name="JP1" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X3" device="" package3d_urn="urn:adsk.eagle:package:22458/2" value="UART"/>
<part name="JP2" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X4" device="" package3d_urn="urn:adsk.eagle:package:22407/2" value="I2C"/>
<part name="JP3" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-2X5" device="" package3d_urn="urn:adsk.eagle:package:22470/2" value="PWR"/>
<part name="X1" library="con-leotronics" library_urn="urn:adsk.eagle:library:160" deviceset="1365-40" device="" package3d_urn="urn:adsk.eagle:package:7973/1"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="JP1" gate="A" x="33.02" y="78.74" smashed="yes">
<attribute name="NAME" x="26.67" y="84.455" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.67" y="71.12" size="1.778" layer="96"/>
</instance>
<instance part="JP2" gate="A" x="33.02" y="53.34" smashed="yes">
<attribute name="NAME" x="26.67" y="61.595" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.67" y="45.72" size="1.778" layer="96"/>
</instance>
<instance part="JP3" gate="A" x="86.36" y="76.2" smashed="yes">
<attribute name="NAME" x="80.01" y="84.455" size="1.778" layer="95"/>
<attribute name="VALUE" x="80.01" y="66.04" size="1.778" layer="96"/>
</instance>
<instance part="X1" gate="-1" x="99.06" y="55.88" smashed="yes">
<attribute name="NAME" x="101.6" y="55.118" size="1.778" layer="95"/>
<attribute name="VALUE" x="96.52" y="57.531" size="1.778" layer="96"/>
</instance>
<instance part="X1" gate="-2" x="63.5" y="55.88" smashed="yes">
<attribute name="NAME" x="66.04" y="55.118" size="1.778" layer="95"/>
<attribute name="VALUE" x="60.96" y="57.531" size="1.778" layer="96"/>
</instance>
<instance part="X1" gate="-3" x="99.06" y="53.34" smashed="yes">
<attribute name="NAME" x="101.6" y="52.578" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-4" x="63.5" y="53.34" smashed="yes">
<attribute name="NAME" x="66.04" y="52.578" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-5" x="99.06" y="50.8" smashed="yes">
<attribute name="NAME" x="101.6" y="50.038" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-6" x="63.5" y="50.8" smashed="yes">
<attribute name="NAME" x="66.04" y="50.038" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-7" x="99.06" y="48.26" smashed="yes">
<attribute name="NAME" x="101.6" y="47.498" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-8" x="63.5" y="48.26" smashed="yes">
<attribute name="NAME" x="66.04" y="47.498" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-9" x="99.06" y="45.72" smashed="yes">
<attribute name="NAME" x="101.6" y="44.958" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-10" x="63.5" y="45.72" smashed="yes">
<attribute name="NAME" x="66.04" y="44.958" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-11" x="99.06" y="43.18" smashed="yes">
<attribute name="NAME" x="101.6" y="42.418" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-12" x="63.5" y="43.18" smashed="yes">
<attribute name="NAME" x="66.04" y="42.418" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-13" x="99.06" y="40.64" smashed="yes">
<attribute name="NAME" x="101.6" y="39.878" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-14" x="63.5" y="40.64" smashed="yes">
<attribute name="NAME" x="66.04" y="39.878" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-15" x="99.06" y="38.1" smashed="yes">
<attribute name="NAME" x="101.6" y="37.338" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-16" x="63.5" y="38.1" smashed="yes">
<attribute name="NAME" x="66.04" y="37.338" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-17" x="99.06" y="35.56" smashed="yes">
<attribute name="NAME" x="101.6" y="34.798" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-18" x="63.5" y="35.56" smashed="yes">
<attribute name="NAME" x="66.04" y="34.798" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-19" x="99.06" y="33.02" smashed="yes">
<attribute name="NAME" x="101.6" y="32.258" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-20" x="63.5" y="33.02" smashed="yes">
<attribute name="NAME" x="66.04" y="32.258" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-21" x="99.06" y="30.48" smashed="yes">
<attribute name="NAME" x="101.6" y="29.718" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-22" x="63.5" y="30.48" smashed="yes">
<attribute name="NAME" x="66.04" y="29.718" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-23" x="99.06" y="27.94" smashed="yes">
<attribute name="NAME" x="101.6" y="27.178" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-24" x="63.5" y="27.94" smashed="yes">
<attribute name="NAME" x="66.04" y="27.178" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-25" x="99.06" y="25.4" smashed="yes">
<attribute name="NAME" x="101.6" y="24.638" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-26" x="63.5" y="25.4" smashed="yes">
<attribute name="NAME" x="66.04" y="24.638" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-27" x="99.06" y="22.86" smashed="yes">
<attribute name="NAME" x="101.6" y="22.098" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-28" x="63.5" y="22.86" smashed="yes">
<attribute name="NAME" x="66.04" y="22.098" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-29" x="99.06" y="20.32" smashed="yes">
<attribute name="NAME" x="101.6" y="19.558" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-30" x="63.5" y="20.32" smashed="yes">
<attribute name="NAME" x="66.04" y="19.558" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-31" x="99.06" y="17.78" smashed="yes">
<attribute name="NAME" x="101.6" y="17.018" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-32" x="63.5" y="17.78" smashed="yes">
<attribute name="NAME" x="66.04" y="17.018" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-33" x="99.06" y="15.24" smashed="yes">
<attribute name="NAME" x="101.6" y="14.478" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-34" x="63.5" y="15.24" smashed="yes">
<attribute name="NAME" x="66.04" y="14.478" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-35" x="99.06" y="12.7" smashed="yes">
<attribute name="NAME" x="101.6" y="11.938" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-36" x="63.5" y="12.7" smashed="yes">
<attribute name="NAME" x="66.04" y="11.938" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-37" x="99.06" y="10.16" smashed="yes">
<attribute name="NAME" x="101.6" y="9.398" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-38" x="63.5" y="10.16" smashed="yes">
<attribute name="NAME" x="66.04" y="9.398" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-39" x="99.06" y="7.62" smashed="yes">
<attribute name="NAME" x="101.6" y="6.858" size="1.778" layer="95"/>
</instance>
<instance part="X1" gate="-40" x="63.5" y="7.62" smashed="yes">
<attribute name="NAME" x="66.04" y="6.858" size="1.778" layer="95"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="VDD_5V" class="0">
<segment>
<pinref part="JP3" gate="A" pin="2"/>
<wire x1="91.44" y1="81.28" x2="99.06" y2="81.28" width="0.1524" layer="91"/>
<label x="99.06" y="81.28" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="JP3" gate="A" pin="4"/>
<wire x1="91.44" y1="78.74" x2="99.06" y2="78.74" width="0.1524" layer="91"/>
<label x="99.06" y="78.74" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="JP3" gate="A" pin="6"/>
<wire x1="91.44" y1="76.2" x2="99.06" y2="76.2" width="0.1524" layer="91"/>
<label x="99.06" y="76.2" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="JP3" gate="A" pin="8"/>
<wire x1="91.44" y1="73.66" x2="99.06" y2="73.66" width="0.1524" layer="91"/>
<label x="99.06" y="73.66" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="JP3" gate="A" pin="10"/>
<wire x1="91.44" y1="71.12" x2="99.06" y2="71.12" width="0.1524" layer="91"/>
<label x="99.06" y="71.12" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-1" pin="S"/>
<wire x1="96.52" y1="55.88" x2="93.98" y2="55.88" width="0.1524" layer="91"/>
<label x="93.98" y="55.88" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="X1" gate="-3" pin="S"/>
<wire x1="96.52" y1="53.34" x2="93.98" y2="53.34" width="0.1524" layer="91"/>
<label x="93.98" y="53.34" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="JP3" gate="A" pin="1"/>
<wire x1="83.82" y1="81.28" x2="76.2" y2="81.28" width="0.1524" layer="91"/>
<label x="76.2" y="81.28" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="JP3" gate="A" pin="3"/>
<wire x1="83.82" y1="78.74" x2="76.2" y2="78.74" width="0.1524" layer="91"/>
<label x="76.2" y="78.74" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="JP3" gate="A" pin="5"/>
<wire x1="83.82" y1="76.2" x2="76.2" y2="76.2" width="0.1524" layer="91"/>
<label x="76.2" y="76.2" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="JP3" gate="A" pin="7"/>
<wire x1="83.82" y1="73.66" x2="76.2" y2="73.66" width="0.1524" layer="91"/>
<label x="76.2" y="73.66" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="JP3" gate="A" pin="9"/>
<wire x1="83.82" y1="71.12" x2="76.2" y2="71.12" width="0.1524" layer="91"/>
<label x="76.2" y="71.12" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="JP1" gate="A" pin="1"/>
<wire x1="30.48" y1="81.28" x2="22.86" y2="81.28" width="0.1524" layer="91"/>
<label x="22.86" y="81.28" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="JP2" gate="A" pin="1"/>
<wire x1="30.48" y1="58.42" x2="22.86" y2="58.42" width="0.1524" layer="91"/>
<label x="22.86" y="58.42" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="X1" gate="-5" pin="S"/>
<wire x1="96.52" y1="50.8" x2="93.98" y2="50.8" width="0.1524" layer="91"/>
<label x="93.98" y="50.8" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="X1" gate="-13" pin="S"/>
<wire x1="96.52" y1="40.64" x2="93.98" y2="40.64" width="0.1524" layer="91"/>
<label x="93.98" y="40.64" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="X1" gate="-19" pin="S"/>
<wire x1="96.52" y1="33.02" x2="93.98" y2="33.02" width="0.1524" layer="91"/>
<label x="93.98" y="33.02" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="I2C3_SCL" class="0">
<segment>
<pinref part="JP2" gate="A" pin="4"/>
<wire x1="30.48" y1="50.8" x2="22.86" y2="50.8" width="0.1524" layer="91"/>
<label x="22.86" y="50.8" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="X1" gate="-7" pin="S"/>
<wire x1="96.52" y1="48.26" x2="93.98" y2="48.26" width="0.1524" layer="91"/>
<label x="93.98" y="48.26" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="I2C3_SDA" class="0">
<segment>
<pinref part="JP2" gate="A" pin="3"/>
<wire x1="30.48" y1="53.34" x2="22.86" y2="53.34" width="0.1524" layer="91"/>
<label x="22.86" y="53.34" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="X1" gate="-9" pin="S"/>
<wire x1="96.52" y1="45.72" x2="93.98" y2="45.72" width="0.1524" layer="91"/>
<label x="93.98" y="45.72" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="X1" gate="-12" pin="S"/>
<wire x1="60.96" y1="43.18" x2="58.42" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="X1" gate="-16" pin="S"/>
<wire x1="60.96" y1="38.1" x2="58.42" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="X1" gate="-24" pin="S"/>
<wire x1="60.96" y1="27.94" x2="58.42" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="X1" gate="-26" pin="S"/>
<wire x1="60.96" y1="25.4" x2="58.42" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="X1" gate="-28" pin="S"/>
<wire x1="60.96" y1="22.86" x2="58.42" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="X1" gate="-30" pin="S"/>
<wire x1="60.96" y1="20.32" x2="58.42" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="X1" gate="-32" pin="S"/>
<wire x1="60.96" y1="17.78" x2="58.42" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="X1" gate="-34" pin="S"/>
<wire x1="60.96" y1="15.24" x2="58.42" y2="15.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="X1" gate="-36" pin="S"/>
<wire x1="60.96" y1="12.7" x2="58.42" y2="12.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="X1" gate="-38" pin="S"/>
<wire x1="60.96" y1="10.16" x2="58.42" y2="10.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="X1" gate="-40" pin="S"/>
<wire x1="60.96" y1="7.62" x2="58.42" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<pinref part="X1" gate="-11" pin="S"/>
<wire x1="96.52" y1="43.18" x2="93.98" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$45" class="0">
<segment>
<pinref part="X1" gate="-15" pin="S"/>
<wire x1="96.52" y1="38.1" x2="93.98" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VCC3V3_SYS" class="0">
<segment>
<pinref part="JP2" gate="A" pin="2"/>
<wire x1="30.48" y1="55.88" x2="22.86" y2="55.88" width="0.1524" layer="91"/>
<label x="22.86" y="55.88" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="X1" gate="-18" pin="S"/>
<wire x1="60.96" y1="35.56" x2="58.42" y2="35.56" width="0.1524" layer="91"/>
<label x="58.42" y="35.56" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="UART_TX" class="0">
<segment>
<pinref part="JP1" gate="A" pin="3"/>
<wire x1="30.48" y1="76.2" x2="22.86" y2="76.2" width="0.1524" layer="91"/>
<label x="22.86" y="76.2" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="X1" gate="-20" pin="S"/>
<wire x1="60.96" y1="33.02" x2="58.42" y2="33.02" width="0.1524" layer="91"/>
<label x="58.42" y="33.02" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="UART_RX" class="0">
<segment>
<pinref part="JP1" gate="A" pin="2"/>
<wire x1="30.48" y1="78.74" x2="22.86" y2="78.74" width="0.1524" layer="91"/>
<label x="22.86" y="78.74" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="X1" gate="-22" pin="S"/>
<wire x1="60.96" y1="30.48" x2="58.42" y2="30.48" width="0.1524" layer="91"/>
<label x="58.42" y="30.48" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="N$50" class="0">
<segment>
<pinref part="X1" gate="-25" pin="S"/>
<wire x1="96.52" y1="25.4" x2="93.98" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$51" class="0">
<segment>
<pinref part="X1" gate="-27" pin="S"/>
<wire x1="96.52" y1="22.86" x2="93.98" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$52" class="0">
<segment>
<pinref part="X1" gate="-29" pin="S"/>
<wire x1="96.52" y1="20.32" x2="93.98" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$53" class="0">
<segment>
<pinref part="X1" gate="-31" pin="S"/>
<wire x1="96.52" y1="17.78" x2="93.98" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$54" class="0">
<segment>
<pinref part="X1" gate="-33" pin="S"/>
<wire x1="96.52" y1="15.24" x2="93.98" y2="15.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$55" class="0">
<segment>
<pinref part="X1" gate="-35" pin="S"/>
<wire x1="96.52" y1="12.7" x2="93.98" y2="12.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$56" class="0">
<segment>
<pinref part="X1" gate="-37" pin="S"/>
<wire x1="96.52" y1="10.16" x2="93.98" y2="10.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$57" class="0">
<segment>
<pinref part="X1" gate="-39" pin="S"/>
<wire x1="96.52" y1="7.62" x2="93.98" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="X1" gate="-8" pin="S"/>
<wire x1="60.96" y1="48.26" x2="58.42" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="X1" gate="-6" pin="S"/>
<wire x1="60.96" y1="50.8" x2="58.42" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="X1" gate="-4" pin="S"/>
<wire x1="60.96" y1="53.34" x2="58.42" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="X1" gate="-2" pin="S"/>
<wire x1="60.96" y1="55.88" x2="58.42" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="X1" gate="-14" pin="S"/>
<wire x1="60.96" y1="40.64" x2="58.42" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="X1" gate="-17" pin="S"/>
<wire x1="96.52" y1="35.56" x2="93.98" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="X1" gate="-21" pin="S"/>
<wire x1="96.52" y1="30.48" x2="93.98" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="X1" gate="-23" pin="S"/>
<wire x1="96.52" y1="27.94" x2="93.98" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="X1" gate="-10" pin="S"/>
<wire x1="60.96" y1="45.72" x2="58.42" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
