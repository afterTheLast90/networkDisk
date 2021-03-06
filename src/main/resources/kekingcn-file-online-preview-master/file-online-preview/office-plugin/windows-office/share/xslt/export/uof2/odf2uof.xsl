<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!--/************************************************************** *  
* Licensed to the Apache Software Foundation (ASF) under one 
* or more contributor license agreements.  See the NOTICE file 
* distributed with this work for additional information 
* regarding copyright ownership.  The ASF licenses this file 
* to you under the Apache License, Version 2.0 (the 
* "License"); you may not use this file except in compliance 
* with the License.  You may obtain a copy of the License at 
*  
*   http://www.apache.org/licenses/LICENSE-2.0 
*  
* Unless required by applicable law or agreed to in writing, 
* software distributed under the License is distributed on an 
* "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY 
* KIND, either express or implied.  See the License for the 
* specific language governing permissions and limitations 
* under the License.  *  
*************************************************************/-->
 <!--MARKER(update_precomp.py): autogen include statement, do not remove-->
 <!--This file is about the conversion of the UOF v2.0 and ODF document format-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:anim="urn:oasis:names:tc:opendocument:xmlns:animation:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dom="http://www.w3.org/2001/xml-events" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:html="http://www.w3.org/TR/REC-html40" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:of="urn:oasis:names:tc:opendocument:xmlns:of:1.2" xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:ooo="http://openoffice.org/2004/office" xmlns:oooc="http://openoffice.org/2004/calc" xmlns:ooow="http://openoffice.org/2004/writer" xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0" xmlns:pzip="urn:cleverage:xmlns:post-processings:zip" xmlns:rdfa="http://docs.oasis-open.org/opendocument/meta/rdfa#" xmlns:fun="http://NSO.com" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:smil="urn:oasis:names:tc:opendocument:xmlns:smil-compatible:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:uof="http://schemas.uof.org/cn/2009/uof" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:??????="http://schemas.uof.org/cn/2009/bookmarks" xmlns:???="http://schemas.uof.org/cn/2009/metadata" xmlns:??????="http://schemas.uof.org/cn/2009/equations" xmlns:???="http://schemas.uof.org/cn/2009/graph" xmlns:??????="http://schemas.uof.org/cn/2009/graphics" xmlns:??????="http://schemas.uof.org/cn/2009/chart" xmlns:???="http://schemas.uof.org/cn/2009/wordproc" xmlns:??????="http://schemas.uof.org/cn/2009/objects" xmlns:??????="http://schemas.uof.org/cn/2009/styles" xmlns:??????="http://schemas.uof.org/cn/2009/extend" xmlns:???="http://www.w3.org/1998/Math/MathML" xmlns:??????="http://schemas.uof.org/cn/2009/usd" xmlns:???="http://schemas.uof.org/cn/2009/presentation" xmlns:???="http://schemas.uof.org/cn/2009/spreadsheet" xmlns:??????="http://schemas.uof.org/cn/2009/rules" xmlns:??????="http://schemas.uof.org/cn/2009/hyperlinks" exclude-result-prefixes="office style text table draw xlink dc meta number presentation chart dr3d form script config ooo ooow oooc dom smil fun anim pzip fo svg math xforms" office:version="1.0" version="2.0">
	<xsl:output encoding="utf-8" indent="no" method="xml" omit-xml-declaration="no" standalone="no" version="1.0" name="xml"/>
	<xsl:variable name="documentType">
		<xsl:choose>
			<xsl:when test="contains(/office:document/@office:mimetype,'presentation')">presentation</xsl:when>
			<xsl:when test="contains(/office:document/@office:mimetype,'text')">text</xsl:when>
			<xsl:when test="contains(/office:document/@office:mimetype,'spreadsheet')">spreadsheet</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="contains(/office:document/office:body/.,'presentation')">presentation</xsl:when>
					<xsl:when test="contains(/office:document/office:body/.,'text')">text</xsl:when>
					<xsl:when test="contains(/office:document/office:body/.,'spreadsheet')">spreadsheet</xsl:when>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ooUnit">
		<xsl:variable name="ValueWithUnit">
			<xsl:value-of select="/office:document/office:automatic-styles/style:page-layout/style:page-layout-properties/@fo:page-width"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="contains($ValueWithUnit,'in')">in</xsl:when>
			<xsl:when test="contains($ValueWithUnit,'cm')">cm</xsl:when>
			<xsl:when test="contains($ValueWithUnit,'mm')">mm</xsl:when>
			<xsl:when test="contains($ValueWithUnit,'pt')">pt</xsl:when>
			<xsl:when test="contains($ValueWithUnit,'twip')">twip</xsl:when>
			<xsl:when test="contains($ValueWithUnit,'dpt')">dpt</xsl:when>
			<xsl:when test="contains($ValueWithUnit,'px')">px</xsl:when>
			<xsl:when test="contains($ValueWithUnit,'pica')">pica</xsl:when>
			<xsl:otherwise>pt</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="uofUnit">
		<xsl:choose>
			<xsl:when test="$ooUnit='twip'">pt</xsl:when>
			<xsl:when test="$ooUnit='pica'">pt</xsl:when>
			<xsl:when test="$ooUnit='dpt'">pt</xsl:when>
			<xsl:when test="$ooUnit='px'">pt</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$ooUnit"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="other-to-cm-conversion-factor">
		<xsl:choose>
			<xsl:when test="$ooUnit='cm'">1</xsl:when>
			<xsl:when test="$ooUnit='mm'">0.1</xsl:when>
			<xsl:when test="$ooUnit='pt'">0.03527</xsl:when>
			<xsl:when test="$ooUnit='in'">2.54</xsl:when>
			<xsl:when test="$ooUnit='pica'">0.42333333</xsl:when>
			<xsl:when test="$ooUnit='twip'">0.0017636684</xsl:when>
			<xsl:when test="$ooUnit='dpt'">0.0376065</xsl:when>
			<xsl:when test="$ooUnit='px'">0.02288288</xsl:when>
			<xsl:otherwise>1</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="isRCCellAddress">
		<xsl:choose>
			<xsl:when test="($documentType='spreadsheet') and (/office:document/office:meta/meta:user-defined[@meta:name='isRCCellAddress'] = 'true')">true</xsl:when>
			<xsl:otherwise>false</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:key match="/office:document/office:styles/style:style | /office:document/office:automatic-styles/style:style" name="Style" use="@style:name"/>
	<xsl:key match="/office:document/office:styles/style:style[@style:family='paragraph'] | /office:document/office:automatic-styles/style:style[@style:family='paragraph']" name="ParaStyle" use="@style:name"/>
	<xsl:key match="/office:document/office:styles/style:style[@style:family='graphic' or @style:family='presentation'] | /office:document/office:automatic-styles/style:style[@style:family='graphic' or @style:family='presentation']" name="GraphStyle" use="@style:name"/>
	<xsl:key match="/office:document/office:styles/style:style[@style:family='table'] | /office:document/office:automatic-styles/style:style[@style:family='table']" name="TableStyle" use="@style:name"/>
	<xsl:key match="/office:document/office:automatic-styles/style:style[@style:family='table-column']" name="ColStyle" use="@style:name"/>
	<xsl:key match="/office:document/office:automatic-styles/style:style[@style:family='table-row']" name="RowStyle" use="@style:name"/>
	<xsl:key match="/office:document/office:automatic-styles/style:style[@style:family='table-cell']" name="CellStyle" use="@style:name"/>
	<xsl:key match="/office:document/office:styles/number:number-style | /office:document/office:styles/number:currency-style | /office:document/office:styles/number:percentage-style | /office:document/office:styles/number:date-style | /office:document/office:styles/number:time-style | /office:document/office:styles/number:boolean-style | /office:document/office:styles/number:text-style | /office:document/office:automatic-styles/number:number-style | /office:document/office:automatic-styles/number:currency-style | /office:document/office:automatic-styles/number:percentage-style | /office:document/office:automatic-styles/number:date-style | /office:document/office:automatic-styles/number:time-style | /office:document/office:automatic-styles/number:boolean-style | /office:document/office:automatic-styles/number:text-style" name="AllNumberStyle" use="@style:name"/>
	<xsl:key match="/office:document/office:body//draw:* | /office:document/office:body//office:annotation | /office:document/office:master-styles//draw:*" name="findanchor" use="@draw:style-name"/>
	<xsl:key match="/office:document/office:body//draw:* | /office:document/office:master-styles//draw:*" name="findanchorP" use="@presentation:style-name"/>
	<xsl:key match="/office:document/office:body//table:table" name="findtable" use="@table:name"/>
	<xsl:key match="/office:document/office:master-styles/style:master-page" name="MasterPage" use="@draw:style-name"/>
	<xsl:key match="/office:document/office:styles/draw:marker" name="markerSize" use="@draw:name"/>
	<xsl:key match="/office:document/office:body//draw:custom-shape/draw:enhanced-geometry" name="expandcustomshapetype" use="@draw:type"/>
	<xsl:template match="office:document">
		<pzip:entry>
			<pzip:target pzip:path="uof.xml">
				<uof:UOF_0000 language_0002="cn" version_0003="2.0">
					<xsl:attribute name="mimetype_0001"><xsl:choose><xsl:when test="$documentType='presentation'">vnd.uof.presentation</xsl:when><xsl:when test="$documentType='spreadsheet'">vnd.uof.spreadsheet</xsl:when><xsl:otherwise>vnd.uof.text</xsl:otherwise></xsl:choose></xsl:attribute>
					
					<!--BEGIN "????????????"???"???????????????"?????????????????????-->
					<!--
				<xsl:attribute name="????????????"/>
				<xsl:attribute name="???????????????"/>
				-->
					<!--END-->
				</uof:UOF_0000>
			</pzip:target>
			<pzip:target pzip:path="_meta/meta.xml">
				<???:?????????_5200>
					<xsl:apply-templates select="office:meta"/>
				</???:?????????_5200>
			</pzip:target>
			<xsl:if test="/office:document/office:body/office:text/text:p/text:bookmark-start or /office:document/office:body/office:text/text:p/text:bookmark or /office:document/office:body/office:spreadsheet/table:named-expressions/table:named-range">
				<pzip:target pzip:path="bookmarks.xml">
					<??????:?????????_9104>
						<xsl:if test="$documentType='text'">
							<xsl:call-template name="sw-BookMarks"/>
						</xsl:if>
						<xsl:if test="$documentType='spreadsheet'">
							<xsl:call-template name="sc-BookMarks"/>
						</xsl:if>
					</??????:?????????_9104>
				</pzip:target>
			</xsl:if>
			<xsl:if test=".//draw:object[@*|*]">
				<xsl:if test=".//draw:object/math:math">
					<pzip:target pzip:path="equations.xml">
						<??????:?????????_C200>
							<xsl:call-template name="equations"/>
						</??????:?????????_C200>
					</pzip:target>
				</xsl:if>
			</xsl:if>
			<xsl:if test="//text:a | //draw:a">
				<pzip:target pzip:path="hyperlinks.xml">
					<??????:?????????_AA0B>
						<xsl:call-template name="Hyperlinks"/>
					</??????:?????????_AA0B>
				</pzip:target>
			</xsl:if>
			<xsl:if test="/office:document/office:styles/style:style[@style:family='graphic'] or /office:document/office:styles/style:style[@style:family='presentation'] or /office:document/office:automatic-styles/style:style[@style:family='graphic'] or /office:document/office:automatic-styles/style:style[@style:family='presentation'] or /office:document/office:master-styles//draw:g or /office:document/office:body//draw:g or /office:document/office:master-styles//draw:page-thumbnail[not(@draw:style-name) and not(@presentation:style-name)] or /office:document/office:styles/style:presentation-page-layout/presentation:placeholder or /office:document/office:body/office:presentation/draw:page//draw:page-thumbnail[not(@draw:style-name) and not(@presentation:style-name)] or /office:document/office:body/office:presentation/draw:page//draw:frame[not(@draw:style-name) and not(@presentation:style-name)] or /office:document/office:body//table:shapes/draw:frame[not(@draw:style-name)]">
				<pzip:target pzip:path="graphics.xml">
					<xsl:call-template name="ObjectSets"/>
				</pzip:target>
			</xsl:if>
			<xsl:if test=".//draw:image[@*|* and not(preceding-sibling::*)] or /office:document//style:background-image or /office:document//text:list-level-style-image or /office:document/office:styles/draw:fill-image or office:styles/style:style[@style:family='graphic'] or /office:document/office:styles/style:style[@style:family='presentation'] or /office:document/office:automatic-styles/style:style[@style:family='graphic'] or /office:document/office:automatic-styles/style:style[@style:family='presentation'] or /office:document/office:body/office:presentation/draw:page//draw:frame[not(@draw:style-name) and not(@presentation:style-name)] or //office:document/office:styles/draw:fill-image">
				<pzip:target pzip:path="objectdata.xml">
					<??????:???????????????_D700>
						<xsl:call-template name="ObjectData"/>
					</??????:???????????????_D700>
				</pzip:target>
			</xsl:if>
			<xsl:if test="$documentType='text' and /office:document/office:body/office:text//office:annotation[contains(dc:creator,'__@*Start@')]">
				<pzip:target pzip:path="app/userdata.xml">
					<??????:???????????????_6300>
						<xsl:call-template name="UserDataSet"/>
					</??????:???????????????_6300>
				</pzip:target>
			</xsl:if>
			<pzip:target pzip:path="styles.xml">
				<??????:?????????_990B>
					<xsl:choose>
						<xsl:when test="$documentType = 'presentation'">
							<xsl:call-template name="Fonts_presentation"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="Fonts"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:call-template name="AutoNumbers_text"/>
					<??????:????????????_990F>
						<xsl:call-template name="TextStyles"/>
						<xsl:if test="$documentType = 'presentation'">
							<xsl:call-template name="AnimationTextStyles"/>
						</xsl:if>
					</??????:????????????_990F>
					<??????:???????????????_9911>
						<xsl:call-template name="ParagraphStyles"/>
						<xsl:if test="$documentType = 'presentation'">
							<xsl:call-template name="PresentationParaStyles"/>
						</xsl:if>
					</??????:???????????????_9911>
					<xsl:if test="$documentType = 'presentation'">
						<??????:???????????????_9913>
							<xsl:for-each select="office:master-styles/style:master-page">
								<xsl:call-template name="TextStyleSet"/>
							</xsl:for-each>
						</??????:???????????????_9913>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="$documentType = 'spreadsheet'">
							<??????:??????????????????_9915>
								<xsl:call-template name="TableCellStyles"/>
							</??????:??????????????????_9915>
						</xsl:when>
						<xsl:otherwise>
							<??????:??????????????????_9917>
								<xsl:call-template name="TextTableStyles"/>
							</??????:??????????????????_9917>
						</xsl:otherwise>
					</xsl:choose>
				</??????:?????????_990B>
			</pzip:target>
			<pzip:target pzip:path="rules.xml">
				<??????:??????????????????_B665>
					<??????:????????????_B666>
						<xsl:choose>
							<xsl:when test="contains($uofUnit,'in')">
								<xsl:value-of select="'inch'"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$uofUnit"/>
							</xsl:otherwise>
						</xsl:choose>
					</??????:????????????_B666>
					<xsl:call-template name="GetUsers"/>
					<xsl:call-template name="GetAnnotations"/>
					<xsl:choose>
						<xsl:when test="$documentType='text'">
							<??????:????????????_B66B>
								<xsl:apply-templates select="office:settings"/>
								<xsl:call-template name="GetTrackChanges"/>
							</??????:????????????_B66B>
						</xsl:when>
						<xsl:when test="$documentType='spreadsheet'">
							<??????:????????????_B66C>
								<xsl:apply-templates select="table:tracked-changes"/>
								<xsl:call-template name="SpreadsheetCommonRule"/>
								<xsl:apply-templates select="table:data-pilot-tables"/>
								<xsl:apply-templates select="table:consolidation"/>
								<xsl:apply-templates select="table:dde-links"/>
							</??????:????????????_B66C>
						</xsl:when>
						<xsl:when test="$documentType='presentation'">
							<??????:????????????_B66D>
								<xsl:call-template name="PresentationCommonRule"/>
							</??????:????????????_B66D>
						</xsl:when>
					</xsl:choose>
				</??????:??????????????????_B665>
			</pzip:target>
			<pzip:target pzip:path="content.xml">
				<xsl:choose>
					<xsl:when test="$documentType='text'">
						<???:??????????????????_4225>
							<xsl:call-template name="TextBody"/>
						</???:??????????????????_4225>
					</xsl:when>
					<xsl:when test="$documentType='spreadsheet'">
						<???:??????????????????_E826>
							<xsl:call-template name="SpreadsheetBody"/>
						</???:??????????????????_E826>
					</xsl:when>
					<xsl:otherwise>
						<???:??????????????????_6C10>
							<xsl:call-template name="PresentationBody"/>
						</???:??????????????????_6C10>
					</xsl:otherwise>
				</xsl:choose>
			</pzip:target>
			<!--chart-->
			<xsl:if test="/office:document/office:body//draw:object/office:document[@office:mimetype = 'application/vnd.oasis.opendocument.chart']">
				<pzip:target pzip:path="chart.xml">
				<??????:?????????_E836>
					<xsl:call-template name="DrawFrameChart"/>
				</??????:?????????_E836>
				</pzip:target>
			</xsl:if>
			<xsl:if test="$documentType='presentation' and /office:document/office:settings/config:config-item-set/config:config-item-map-indexed/config:config-item-map-entry/config:config-item[@config:name = 'ColorScheme']">
				<pzip:target pzip:path="colorschemes.xml">
					<??????:???????????????_6C11>
						<xsl:call-template name="ColorschemesRO"/>
					</??????:???????????????_6C11>
				</pzip:target>
			</xsl:if>
			<pzip:target pzip:path="extend.xml">
				<??????:?????????_B200>
					<xsl:call-template name="ExpandText"/>
				</??????:?????????_B200>
			</pzip:target>
		</pzip:entry>
	</xsl:template>
<xsl:template match="office:meta">
		<xsl:if test="dc:title">
			<???:??????_5201>
				<xsl:value-of select="dc:title"/>
			</???:??????_5201>
		</xsl:if>
		<xsl:if test="dc:subject">
			<???:??????_5202>
				<xsl:value-of select="dc:subject"/>
			</???:??????_5202>
		</xsl:if>
		<xsl:if test="meta:initial-creator">
			<???:?????????_5203>
				<xsl:value-of select="meta:initial-creator"/>
			</???:?????????_5203>
		</xsl:if>
		<xsl:if test="dc:creator">
			<???:????????????_5205>
				<xsl:value-of select="dc:creator"/>
			</???:????????????_5205>
		</xsl:if>
		<xsl:if test="dc:description">
			<???:??????_5206>
				<xsl:value-of select="dc:description"/>
			</???:??????_5206>
		</xsl:if>
		<xsl:if test="meta:creation-date">
			<???:????????????_5207>
				<xsl:value-of select="meta:creation-date"/>
			</???:????????????_5207>
		</xsl:if>
		<xsl:if test="meta:editing-cycles">
			<???:????????????_5208>
				<xsl:value-of select="meta:editing-cycles"/>
			</???:????????????_5208>
		</xsl:if>
		<xsl:if test="meta:editing-duration">
			<???:????????????_5209>
				<xsl:value-of select="meta:editing-duration"/>
			</???:????????????_5209>
		</xsl:if>
		<xsl:if test="meta:generator">
			<???:??????????????????_520A>
				<xsl:value-of select="meta:generator"/>
			</???:??????????????????_520A>
		</xsl:if>
		<xsl:if test="meta:template/@xlink:title">
			<???:????????????_520C>
				<xsl:value-of select="meta:template/@xlink:title"/>
			</???:????????????_520C>
		</xsl:if>
		<xsl:if test="meta:keyword">
			<???:????????????_520D>
				<xsl:for-each select="meta:keyword">
					<???:?????????_520E>
						<xsl:value-of select="."/>
					</???:?????????_520E>
				</xsl:for-each>
			</???:????????????_520D>
		</xsl:if>
		<xsl:if test="dc:category">
			<???:??????_520B>
				<xsl:value-of select="dc:category"/>
			</???:??????_520B>
		</xsl:if>
		<xsl:if test="dc:company">
			<???:????????????_5213>
				<xsl:value-of select="dc:company"/>
			</???:????????????_5213>
		</xsl:if>
		<xsl:if test="dc:manager">
			<???:????????????_5214>
				<xsl:value-of select="dc:manager"/>
			</???:????????????_5214>
		</xsl:if>
		<xsl:if test="meta:document-statistic/@meta:page-count">
			<???:??????_5215>
				<xsl:value-of select="meta:document-statistic/@meta:page-count"/>
			</???:??????_5215>
		</xsl:if>
		<xsl:if test="meta:document-statistic/@meta:word-count">
			<???:??????_5216>
				<xsl:value-of select="meta:document-statistic/@meta:word-count"/>
			</???:??????_5216>
		</xsl:if>
		<xsl:if test="meta:document-statistic/@meta:row-count">
			<???:??????_5219>
				<xsl:value-of select="meta:document-statistic/@meta:row-count"/>
			</???:??????_5219>
		</xsl:if>
		<xsl:if test="meta:document-statistic/@meta:paragraph-count">
			<???:?????????_521A>
				<xsl:value-of select="meta:document-statistic/@meta:paragraph-count"/>
			</???:?????????_521A>
		</xsl:if>
		<xsl:if test="meta:document-statistic/@meta:object-count">
			<???:?????????_521B>
				<xsl:value-of select="meta:document-statistic/@meta:object-count"/>
			</???:?????????_521B>
		</xsl:if>
		<xsl:if test="meta:user-defined!=''">
			<xsl:for-each select="meta:user-defined">
				<xsl:choose>
					<xsl:when test="@meta:name = '??????'">
						<???:??????_5204>
							<xsl:value-of select="."/>
						</???:??????_5204>
					</xsl:when>
					<xsl:when test=".!=''">
						<???:???????????????????????????_520F>
							<???:????????????????????????_5210>
								<xsl:attribute name="??????_5211"><xsl:value-of select="@meta:name"/></xsl:attribute>
								<xsl:if test="@meta:type">
									<xsl:attribute name="??????_5212"><xsl:value-of select="@meta:type"/></xsl:attribute>
								</xsl:if>
								<xsl:value-of select="."/>
							</???:????????????????????????_5210>
						</???:???????????????????????????_520F>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Hyperlinks">
		<xsl:if test="//text:a |  //draw:a">
			<xsl:for-each select="//text:a |  //draw:a">
				<xsl:variable name="hyperStr" select="@xlink:href"/>
				<??????:????????????_AA0C>
					<xsl:attribute name="?????????_AA0A"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
					<xsl:variable name="ID" select="generate-id(.)"/>
					<xsl:element name="??????:??????_AA00">
						<xsl:value-of select="concat('hlnk', $ID)"/>
					</xsl:element>
					<!--xsl:attribute name="??????:?????????"><xsl:value-of select="generate-id(.)"/></xsl:attribute-->
					<xsl:if test="not(contains($hyperStr,'#'))">
						<xsl:element name="??????:??????_AA01">
							<xsl:value-of select="$hyperStr"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="./@text:style-name or ./@text:visited-style-name">
						<xsl:element name="??????:??????_AA02">
							<xsl:if test="./@text:style-name">
								<xsl:attribute name="?????????????????????_AA03"><xsl:value-of select="@text:style-name"/></xsl:attribute>
							</xsl:if>
							<xsl:if test="./@text:visited-style-name">
								<xsl:attribute name="?????????????????????_AA04"><xsl:value-of select="@text:visited-style-name"/></xsl:attribute>
							</xsl:if>
						</xsl:element>
					</xsl:if>
					<xsl:if test="not(contains($hyperStr,'#'))">
						<xsl:choose>
							<xsl:when test="contains($hyperStr,'@')">
								<xsl:element name="??????:??????_AA05">?????????????????????</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="??????:??????_AA05">
									<xsl:value-of select="$hyperStr"/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="contains($hyperStr,'#')">
						<xsl:choose>
							<xsl:when test="$documentType='spreadsheet' and /office:document/office:body/office:spreadsheet/table:named-expressions/table:named-range">
								<xsl:for-each select="/office:document/office:body/office:spreadsheet/table:named-expressions/table:named-range">
									<xsl:variable name="determineCell">
										<xsl:value-of select="substring-after($hyperStr,'#')"/>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="contains(@table:base-cell-address,$determineCell)">
											<xsl:variable name="bookmarkForCell" select="@table:name"/>
											<xsl:element name="??????:??????_AA01">
												<xsl:value-of select="$bookmarkForCell"/>
											</xsl:element>
											<xsl:element name="??????:??????_AA0D">
												<xsl:value-of select="$bookmarkForCell"/>
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
											<xsl:element name="??????:??????_AA01">
												<xsl:value-of select="$determineCell"/>
											</xsl:element>
											<xsl:element name="??????:??????_AA0D">
												<xsl:value-of select="$determineCell"/>
											</xsl:element>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</xsl:when>
							<xsl:when test="$documentType='spreadsheet'">
								<xsl:element name="??????:??????_AA01">
									<xsl:value-of select="$hyperStr"/>
								</xsl:element>
							</xsl:when>
							<xsl:otherwise>
								<xsl:element name="??????:??????_AA01">
									<xsl:choose>
										<xsl:when test="substring-before($hyperStr,'#') != ''">
											<xsl:value-of select="substring-before($hyperStr,'#')"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="substring-after($hyperStr,'#')"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:element>
								<xsl:element name="??????:??????_AA0D">
									<xsl:value-of select="substring-after($hyperStr,'#')"/>
								</xsl:element>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:element name="??????:??????_AA05">
							<xsl:value-of select="."/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="0">
						<xsl:element name="??????:??????_AA06">
							<xsl:attribute name="???????????????_C631"/>
							<xsl:attribute name="???????????????_C632"/>
							<xsl:attribute name="??????????????????_C633"/>
						</xsl:element>
					</xsl:if>
					<xsl:if test="0">
						<xsl:element name="??????:????????????_AA07">
							<xsl:attribute name="??????????????????_AA08"/>
							<xsl:attribute name="??????????????????_AA09"/>
						</xsl:element>
					</xsl:if>
				</??????:????????????_AA0C>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Fonts">
		<??????:?????????_990C>
			<??????:????????????_990D ??????_9903="Wingdings" ?????????_9902="Wingdings"/>
			<??????:????????????_990D ??????_9903="Vrinda" ?????????_9902="Vrinda"/>
			<??????:????????????_990D ??????_9903="Webdings" ?????????_9902="Webdings"/>
			<xsl:for-each select="office:font-face-decls/style:font-face">
				<xsl:if test="not(@style:name = 'Wingdings') and not(@style:name = 'Vrinda') and not(@style:name = 'Webdings')">
					<xsl:element name="??????:????????????_990D">
						<xsl:attribute name="?????????_9902"><xsl:value-of select="translate(@style:name,' ','_')"/></xsl:attribute>
						<xsl:attribute name="??????_9903"><xsl:variable name="ss">'</xsl:variable><xsl:choose><xsl:when test="contains(@svg:font-family,' ')"><xsl:value-of select="translate(@svg:font-family,$ss,'')"/></xsl:when><xsl:otherwise><xsl:value-of select="@svg:font-family"/></xsl:otherwise></xsl:choose></xsl:attribute>
						<!--????????????
						<xsl:if test="1">
							<xsl:attribute name="????????????_9904"/>
						</xsl:if-->
						<xsl:if test="@style:font-family-generic">
							<xsl:choose>
								<xsl:when test="@style:font-family-generic = 'swiss'">
									<xsl:element name="??????:?????????_9900">swiss</xsl:element>
								</xsl:when>
								<xsl:when test="@style:font-family-generic ='modern'">
									<xsl:element name="??????:?????????_9900">modern</xsl:element>
								</xsl:when>
								<xsl:when test="@style:font-family-generic='roman'">
									<xsl:element name="??????:?????????_9900">roman</xsl:element>
								</xsl:when>
								<xsl:when test="@style:font-family-generic ='script'">
									<xsl:element name="??????:?????????_9900">script</xsl:element>
								</xsl:when>
								<xsl:when test="@style:font-family-generic ='decorative'">
									<xsl:element name="??????:?????????_9900">decorative</xsl:element>
								</xsl:when>
								<xsl:when test="@style:font-family-generic ='system'">
									<xsl:element name="??????:?????????_9900">auto</xsl:element>
								</xsl:when>
								<xsl:otherwise>
									<xsl:element name="??????:?????????_9900">auto</xsl:element>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						<xsl:if test="0">
							<xsl:element name="??????:???????????????_9901"/>
						</xsl:if>
					</xsl:element>
				</xsl:if>
			</xsl:for-each>
		</??????:?????????_990C>
	</xsl:template>
	<xsl:template name="convert2cm">
		<xsl:param name="value"/>
		<xsl:param name="rounding-factor" select="10000"/>
		<xsl:param name="dpi" select="111"/>
		<xsl:param name="centimeter-in-mm" select="10"/>
		<xsl:param name="inch-in-mm" select="25.4"/>
		<xsl:param name="didot-point-in-mm" select="0.376065"/>
		<xsl:param name="pica-in-mm" select="4.2333333"/>
		<xsl:param name="point-in-mm" select="0.3527778"/>
		<xsl:param name="twip-in-mm" select="0.017636684"/>
		<xsl:param name="pixel-in-mm" select="$inch-in-mm div $dpi"/>
		<xsl:choose>
			<xsl:when test="contains($value, 'mm')">
				<xsl:value-of select="round($rounding-factor * number(number(substring-before($value, 'mm')) div $centimeter-in-mm)) div $rounding-factor"/>
			</xsl:when>
			<xsl:when test="contains($value, 'in')">
				<xsl:value-of select="round($rounding-factor * number(number(substring-before($value, 'in')) div $centimeter-in-mm * $inch-in-mm)) div $rounding-factor"/>
			</xsl:when>
			<xsl:when test="contains($value, 'pt')">
				<xsl:value-of select="round($rounding-factor * number(number(substring-before($value, 'pt')) div $centimeter-in-mm * $point-in-mm)) div $rounding-factor"/>
			</xsl:when>
			<xsl:when test="contains($value, 'dpt')">
				<xsl:value-of select="round($rounding-factor * number(number(substring-before($value, 'dpt')) div $centimeter-in-mm * $didot-point-in-mm)) div $rounding-factor"/>
			</xsl:when>
			<xsl:when test="contains($value, 'pica')">
				<xsl:value-of select="round($rounding-factor * number(number(substring-before($value, 'pica')) div $centimeter-in-mm * $pica-in-mm)) div $rounding-factor"/>
			</xsl:when>
			<xsl:when test="contains($value, 'twip')">
				<xsl:value-of select="round($rounding-factor * number(number(substring-before($value, 'twip')) div $centimeter-in-mm * $twip-in-mm)) div $rounding-factor"/>
			</xsl:when>
			<xsl:when test="contains($value, 'px')">
				<xsl:value-of select="round($rounding-factor * number(number(substring-before($value, 'px')) div $centimeter-in-mm * $pixel-in-mm)) div $rounding-factor"/>
			</xsl:when>
			<xsl:when test="contains($value, 'cm')">
				<xsl:value-of select="substring-before($value,'cm')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:message>measure_conversion.xsl: Find no conversion for <xsl:value-of select="$value"/> to 'cm'!</xsl:message>
				<xsl:value-of select="$value"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:function name="fun:Convert2uofUnit">
		<xsl:param name="value"/>
		<xsl:variable name="CurrentUnit">
			<xsl:choose>
				<xsl:when test="contains($value, 'cm')">cm</xsl:when>
				<xsl:when test="contains($value, 'mm')">mm</xsl:when>
				<xsl:when test="contains($value, 'in')">in</xsl:when>
				<xsl:when test="contains($value, 'dpt')">dpt</xsl:when>
				<xsl:when test="contains($value, 'pt')">pt</xsl:when>
				<xsl:when test="contains($value, 'pica')">pica</xsl:when>
				<xsl:when test="contains($value, 'twip')">twip</xsl:when>
				<xsl:when test="contains($value, 'px')">px</xsl:when>
				<xsl:otherwise>cm</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$CurrentUnit = $uofUnit">
				<xsl:value-of select="number(substring-before($value, $CurrentUnit))"/>
			</xsl:when>
			<xsl:when test="string($value) = '' or $value ='NAN'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="valuecm">
					<xsl:call-template name="convert2cm">
						<xsl:with-param name="value" select="$value"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="number($valuecm) div number($other-to-cm-conversion-factor)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<xsl:template name="OneBorderAttrLst">
		<xsl:param name="border"/>
		<xsl:param name="border-width"/>
		<xsl:param name="padding"/>
		<xsl:param name="shadow"/>
		<xsl:if test="$border != ''">
			<xsl:variable name="linetype">
				<xsl:choose>
					<xsl:when test="substring-before(substring-after($border,' '),' ')='solid'">single</xsl:when>
					<xsl:when test="substring-before(substring-after($border,' '),' ')='double'">
						<xsl:variable name="first" select="fun:Convert2uofUnit(substring-before($border-width,' '))"/>
						<xsl:variable name="last" select="fun:Convert2uofUnit(substring-after(substring-after($border-width,' '),' '))"/>
						<xsl:choose>
							<xsl:when test="$first &lt; $last">thin-thick</xsl:when>
							<xsl:when test="$first &gt; $last">thick-thin</xsl:when>
							<xsl:otherwise>double</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>none</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:attribute name="??????_C60D"><xsl:value-of select="$linetype"/></xsl:attribute>
			<xsl:if test="$border != 'none'">
				<xsl:variable name="linewidth" select="fun:Convert2uofUnit(substring-before($border,' '))"/>
				<xsl:attribute name="??????_C60F"><xsl:value-of select="$linewidth"/></xsl:attribute>
				<xsl:attribute name="??????_C611"><xsl:value-of select="substring-after(substring-after($border,' '),' ')"/></xsl:attribute>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$padding != ''">
			<xsl:variable name="uof_padding" select="fun:Convert2uofUnit($padding)"/>
			<xsl:attribute name="??????_C610"><xsl:value-of select="$uof_padding"/></xsl:attribute>
		</xsl:if>
		<!--xsl:if test="$shadow = 'true'">
			<xsl:attribute name="???????????????_C612">true</xsl:attribute>
		</xsl:if-->
	</xsl:template>
	<xsl:template name="LeftBorder">
		<xsl:variable name="border">
			<xsl:choose>
				<xsl:when test="@fo:border-left != ''">
					<xsl:value-of select="@fo:border-left"/>
				</xsl:when>
				<xsl:when test="@fo:border != ''">
					<xsl:value-of select="@fo:border"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<!--<xsl:if test="$border != '' and $border != 'none'">-->
		<!--?????????????????????none???????????????????????????????????????-->
		<xsl:if test="$border != ''">
			<xsl:element name="uof:???_C613">
				<xsl:variable name="border-width">
					<xsl:choose>
						<xsl:when test="@style:border-line-width-left != ''">
							<xsl:value-of select="@style:border-line-width-left"/>
						</xsl:when>
						<xsl:when test="@style:border-line-width != ''">
							<xsl:value-of select="@style:border-line-width"/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="padding">
					<xsl:choose>
						<xsl:when test="@fo:padding-left != ''">
							<xsl:value-of select="@fo:padding-left"/>
						</xsl:when>
						<xsl:when test="@fo:padding != ''">
							<xsl:value-of select="@fo:padding"/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<!--xsl:variable name="shadow">
					<xsl:if test="@style:shadow">
						<xsl:variable name="shadowhori" select="fun:Convert2uofUnit(substring-before(substring-after(@style:shadow,' '),' '))"/>
						<xsl:choose>
							<xsl:when test="$shadowhori &lt; 0">
								<xsl:value-of select="'true'"/>
							</xsl:when>
							<xsl:otherwise>false</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:variable-->
				<xsl:call-template name="OneBorderAttrLst">
					<xsl:with-param name="border" select="$border"/>
					<xsl:with-param name="border-width" select="$border-width"/>
					<xsl:with-param name="padding" select="$padding"/>
					<!--xsl:with-param name="shadow" select="$shadow"/-->
				</xsl:call-template>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="TopBorder">
		<xsl:variable name="border">
			<xsl:choose>
				<xsl:when test="@fo:border-top != ''">
					<xsl:value-of select="@fo:border-top"/>
				</xsl:when>
				<xsl:when test="@fo:border != ''">
					<xsl:value-of select="@fo:border"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<!--<xsl:if test="$border != '' and $border != 'none'">-->
		<!--?????????????????????none???????????????????????????????????????-->
		<xsl:if test="$border != ''">
			<xsl:element name="uof:???_C614">
				<xsl:variable name="border-width">
					<xsl:choose>
						<xsl:when test="@style:border-line-width-top != ''">
							<xsl:value-of select="@style:border-line-width-top"/>
						</xsl:when>
						<xsl:when test="@style:border-line-width != ''">
							<xsl:value-of select="@style:border-line-width"/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="padding">
					<xsl:choose>
						<xsl:when test="@fo:padding-top != ''">
							<xsl:value-of select="@fo:padding-top"/>
						</xsl:when>
						<xsl:when test="@fo:padding != ''">
							<xsl:value-of select="@fo:padding"/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<!--xsl:variable name="shadow">
					<xsl:if test="@style:shadow">
						<xsl:variable name="shadowvert" select="fun:Convert2uofUnit(substring-after(substring-after(@style:shadow,' '),' '))"/>
						<xsl:choose>
							<xsl:when test="$shadowvert &lt; 0">
								<xsl:value-of select="'true'"/>
							</xsl:when>
							<xsl:otherwise>false</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:variable-->
				<xsl:call-template name="OneBorderAttrLst">
					<xsl:with-param name="border" select="$border"/>
					<xsl:with-param name="border-width" select="$border-width"/>
					<xsl:with-param name="padding" select="$padding"/>
					<!--xsl:with-param name="shadow" select="$shadow"/-->
				</xsl:call-template>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RightBorder">
		<xsl:variable name="border">
			<xsl:choose>
				<xsl:when test="@fo:border-right != ''">
					<xsl:value-of select="@fo:border-right"/>
				</xsl:when>
				<xsl:when test="@fo:border != ''">
					<xsl:value-of select="@fo:border"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<!--<xsl:if test="$border != '' and $border != 'none'">-->
		<!--?????????????????????none???????????????????????????????????????-->
		<xsl:if test="$border != ''">
			<xsl:element name="uof:???_C615">
				<xsl:variable name="border-width">
					<xsl:choose>
						<xsl:when test="@style:border-line-width-right != ''">
							<xsl:value-of select="@style:border-line-width-right"/>
						</xsl:when>
						<xsl:when test="@style:border-line-width != ''">
							<xsl:value-of select="@style:border-line-width"/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="padding">
					<xsl:choose>
						<xsl:when test="@fo:padding-right != ''">
							<xsl:value-of select="@fo:padding-right"/>
						</xsl:when>
						<xsl:when test="@fo:padding != ''">
							<xsl:value-of select="@fo:padding"/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<!--xsl:variable name="shadow">
					<xsl:if test="@style:shadow">
						<xsl:variable name="shadowhori" select="fun:Convert2uofUnit(substring-before(substring-after(@style:shadow,' '),' '))"/>
						<xsl:choose>
							<xsl:when test="$shadowhori &gt; 0">
								<xsl:value-of select="'true'"/>
							</xsl:when>
							<xsl:otherwise>false</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:variable-->
				<xsl:call-template name="OneBorderAttrLst">
					<xsl:with-param name="border" select="$border"/>
					<xsl:with-param name="border-width" select="$border-width"/>
					<xsl:with-param name="padding" select="$padding"/>
					<!--xsl:with-param name="shadow" select="$shadow"/-->
				</xsl:call-template>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="BottomBorder">
		<xsl:variable name="border">
			<xsl:choose>
				<xsl:when test="@fo:border-bottom != ''">
					<xsl:value-of select="@fo:border-bottom"/>
				</xsl:when>
				<xsl:when test="@fo:border != ''">
					<xsl:value-of select="@fo:border"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<!--<xsl:if test="$border != '' and $border != 'none'">-->
		<!--?????????????????????none???????????????????????????????????????-->
		<xsl:if test="$border != ''">
			<xsl:element name="uof:???_C616">
				<xsl:variable name="border-width">
					<xsl:choose>
						<xsl:when test="@style:border-line-width-bottom != ''">
							<xsl:value-of select="@style:border-line-width-bottom"/>
						</xsl:when>
						<xsl:when test="@style:border-line-width != ''">
							<xsl:value-of select="@style:border-line-width"/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="padding">
					<xsl:choose>
						<xsl:when test="@fo:padding-bottom != ''">
							<xsl:value-of select="@fo:padding-bottom"/>
						</xsl:when>
						<xsl:when test="@fo:padding != ''">
							<xsl:value-of select="@fo:padding"/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<!--xsl:variable name="shadow">
					<xsl:if test="@style:shadow">
						<xsl:variable name="shadowvert" select="fun:Convert2uofUnit(substring-after(substring-after(@style:shadow,' '),' '))"/>
						<xsl:choose>
							<xsl:when test="$shadowvert &gt; 0">
								<xsl:value-of select="'true'"/>
							</xsl:when>
							<xsl:otherwise>false</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:variable-->
				<xsl:call-template name="OneBorderAttrLst">
					<xsl:with-param name="border" select="$border"/>
					<xsl:with-param name="border-width" select="$border-width"/>
					<xsl:with-param name="padding" select="$padding"/>
					<!--xsl:with-param name="shadow" select="$shadow"/-->
				</xsl:call-template>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="UOFDiagonal1">
		<xsl:variable name="border">
			<xsl:value-of select="@style:diagonal-tl-br"/>
		</xsl:variable>
		<!--<xsl:if test="$border != '' and $border != 'none'">-->
		<!--?????????????????????none???????????????????????????????????????-->
		<xsl:if test="$border != ''">
			<xsl:element name="uof:?????????1_C617">
				<xsl:variable name="border-width">
					<xsl:value-of select="@style:diagonal-tl-br-width"/>
				</xsl:variable>
				<xsl:call-template name="OneBorderAttrLst">
					<xsl:with-param name="border" select="$border"/>
					<xsl:with-param name="border-width" select="$border-width"/>
				</xsl:call-template>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="UOFDiagonal2">
		<xsl:variable name="border">
			<xsl:value-of select="@style:diagonal-bl-tr"/>
		</xsl:variable>
		<!--<xsl:if test="$border != '' and $border != 'none'">-->
		<!--?????????????????????none???????????????????????????????????????-->
		<xsl:if test="$border != ''">
			<xsl:element name="uof:?????????2_C618">
				<xsl:variable name="border-width">
					<xsl:value-of select="@style:diagonal-bl-tr-width"/>
				</xsl:variable>
				<xsl:call-template name="OneBorderAttrLst">
					<xsl:with-param name="border" select="$border"/>
					<xsl:with-param name="border-width" select="$border-width"/>
				</xsl:call-template>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Border">
		<xsl:call-template name="LeftBorder"/>
		<xsl:call-template name="TopBorder"/>
		<xsl:call-template name="RightBorder"/>
		<xsl:call-template name="BottomBorder"/>
		<xsl:call-template name="UOFDiagonal1"/>
		<xsl:call-template name="UOFDiagonal2"/>
	</xsl:template>
	<xsl:template name="UOFFill">
		<xsl:choose>
			<xsl:when test="style:background-image/office:binary-data or style:background-image/@xlink:href">
				<???:??????_8005>
					<xsl:attribute name="??????_8006"><xsl:choose><xsl:when test="style:background-image/@style:repeat = 'stretch'">stretch</xsl:when><xsl:when test="style:background-image/@style:repeat = 'no-repeat' and contains(style:background-image/@style:position,'center')">center</xsl:when><xsl:otherwise>tile</xsl:otherwise></xsl:choose></xsl:attribute>
					<xsl:attribute name="????????????_8007"><xsl:value-of select="generate-id(style:background-image)"/></xsl:attribute>
					<!--xsl:attribute name="????????????_8007"><xsl:choose><xsl:when test="style:background-image/@xlink:href"><xsl:value-of select="translate(style:background-image/@xlink:href,'Pictures','data')"/></xsl:when><xsl:otherwise><xsl:value-of select="generate-id(style:background-image)"/></xsl:otherwise></xsl:choose></xsl:attribute-->
					<xsl:attribute name="??????_8008"><xsl:choose><xsl:when test="ends-with(style:background-image/@xlink:href,'png')">png</xsl:when><xsl:when test="ends-with(style:background-image/@xlink:href,'bmp')">bmp</xsl:when><xsl:when test="ends-with(style:background-image/@xlink:href,'ras')">ras</xsl:when><xsl:when test="ends-with(style:background-image/@xlink:href,'gif')">gif</xsl:when><xsl:otherwise>jpg</xsl:otherwise></xsl:choose></xsl:attribute>
					<xsl:attribute name="??????_8009">background-image</xsl:attribute>
				</???:??????_8005>
			</xsl:when>
			<xsl:when test="@fo:background-color">
				<???:??????_8004>
					<xsl:choose>
						<xsl:when test="@fo:background-color='transparent' or @fo:background-color='transprent'">auto</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@fo:background-color"/>
						</xsl:otherwise>
					</xsl:choose>
				</???:??????_8004>
			</xsl:when>
			<xsl:when test="style:table-cell-properties/@fo:background-color">
				<???:??????_8004>
					<xsl:choose>
						<xsl:when test="style:table-cell-properties/@fo:background-color='transparent' or style:table-cell-properties/@fo:background-color='transprent'">auto</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="style:table-cell-properties/@fo:background-color"/>
						</xsl:otherwise>
					</xsl:choose>
				</???:??????_8004>
			</xsl:when>
			<xsl:otherwise>
				<???:??????_8004>auto</???:??????_8004>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="InMasterPage">
		<xsl:choose>
			<xsl:when test="$documentType = 'presentation'">
				<xsl:for-each select="..">
					<xsl:choose>
						<xsl:when test="name(.) = 'office:master-styles'">
							<xsl:value-of select="'true'"/>
						</xsl:when>
						<xsl:when test="name(.) = 'draw:page'">
							<xsl:value-of select="'false'"/>
						</xsl:when>
						<xsl:when test="name(.) = 'office:document'">
							<xsl:value-of select="'false'"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="InMasterPage"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'false'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="character-to-number">
		<xsl:param name="character"/>
		<xsl:choose>
			<xsl:when test="$character = 'A'">1</xsl:when>
			<xsl:when test="$character = 'B'">2</xsl:when>
			<xsl:when test="$character = 'C'">3</xsl:when>
			<xsl:when test="$character = 'D'">4</xsl:when>
			<xsl:when test="$character = 'E'">5</xsl:when>
			<xsl:when test="$character = 'F'">6</xsl:when>
			<xsl:when test="$character = 'G'">7</xsl:when>
			<xsl:when test="$character = 'H'">8</xsl:when>
			<xsl:when test="$character = 'I'">9</xsl:when>
			<xsl:when test="$character = 'J'">10</xsl:when>
			<xsl:when test="$character = 'K'">11</xsl:when>
			<xsl:when test="$character = 'L'">12</xsl:when>
			<xsl:when test="$character = 'M'">13</xsl:when>
			<xsl:when test="$character = 'N'">14</xsl:when>
			<xsl:when test="$character = 'O'">15</xsl:when>
			<xsl:when test="$character = 'P'">16</xsl:when>
			<xsl:when test="$character = 'Q'">17</xsl:when>
			<xsl:when test="$character = 'R'">18</xsl:when>
			<xsl:when test="$character = 'S'">19</xsl:when>
			<xsl:when test="$character = 'T'">20</xsl:when>
			<xsl:when test="$character = 'U'">21</xsl:when>
			<xsl:when test="$character = 'V'">22</xsl:when>
			<xsl:when test="$character = 'W'">23</xsl:when>
			<xsl:when test="$character = 'X'">24</xsl:when>
			<xsl:when test="$character = 'Y'">25</xsl:when>
			<xsl:when test="$character = 'Z'">26</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="calculate-square-numbers">
		<xsl:param name="base"/>
		<xsl:param name="exponent"/>
		<xsl:param name="return" select="1"/>
		<xsl:choose>
			<xsl:when test="$exponent &gt; 1">
				<xsl:call-template name="calculate-square-numbers">
					<xsl:with-param name="base" select="$base"/>
					<xsl:with-param name="exponent" select="$exponent - 1"/>
					<xsl:with-param name="return" select="$return * $base"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$exponent = 1">
				<xsl:value-of select="$return * $base"/>
			</xsl:when>
			<!-- if exponent is equal '0' -->
			<xsl:otherwise>
				<xsl:value-of select="1"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="decimal-to-hex">
		<xsl:param name="number"/>
		<xsl:choose>
			<xsl:when test="round($number)=0">0</xsl:when>
			<xsl:when test="round($number)=1">1</xsl:when>
			<xsl:when test="round($number)=2">2</xsl:when>
			<xsl:when test="round($number)=3">3</xsl:when>
			<xsl:when test="round($number)=4">4</xsl:when>
			<xsl:when test="round($number)=5">5</xsl:when>
			<xsl:when test="round($number)=6">6</xsl:when>
			<xsl:when test="round($number)=7">7</xsl:when>
			<xsl:when test="round($number)=8">8</xsl:when>
			<xsl:when test="round($number)=9">9</xsl:when>
			<xsl:when test="round($number)=10">a</xsl:when>
			<xsl:when test="round($number)=11">b</xsl:when>
			<xsl:when test="round($number)=12">c</xsl:when>
			<xsl:when test="round($number)=13">d</xsl:when>
			<xsl:when test="round($number)=14">e</xsl:when>
			<xsl:when test="round($number)=15">f</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="ExpandText">
		<xsl:for-each select="office:styles/draw:hatch">
			<xsl:call-template name="OneTextStyle">
				<xsl:with-param name="Type">
					<xsl:value-of select="string('default')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
		<xsl:variable name="customshapetype">fontwork-arch-up-curve fontwork-plain-text fontwork-wave fontwork-inflate fontwork-curve-up fontwork-slant-up fontwork-chevron-up fontwork-slant-up fontwork-triangle-down fontwork-curve-down fontwork-arch-down-pour fontwork-triangle-down fontwork-fade-down fontwork-triangle-up fontwork-fade-right fontwork-fade-down fontwork-fade-up fontwork-curve-up fontwork-stop fontwork-chevron-down fontwork-inflate fontwork-curve-down fontwork-arch-up-pour fontwork-arch-up-pour fontwork-plain-text fontwork-plain-text fontwork-plain-text fontwork-slant-up fontwork-wave fontwork-triangle-up fontwork-inflate round-callout fontwork-triangle-down fontwork-circle-pour mso-spt100 fontwork-fade-up-and-right fontwork-fade-up non-primitive block-arc frame col-60da8460 col-502ad400 flowchart-alternate-process rectangular-callout round-rectangular-callout round-callout cloud-callout line-callout-1 line-callout-2 line-callout-3</xsl:variable>
		<??????:??????_B201>
			<??????:????????????_B202>NSO</??????:????????????_B202>
			<??????:????????????_B203>v4.5</??????:????????????_B203>
		</??????:??????_B201>
		<xsl:if test="/office:document/office:automatic-styles/style:style/style:graphic-properties/@draw:marker-end or /office:document/office:automatic-styles/style:style/style:graphic-properties/@draw:marker-start">
			<xsl:for-each select="office:body//draw:*[@draw:style-name]">
				<xsl:variable name="drawStyleName" select="@draw:style-name"/>
				<xsl:if test="/office:document/office:automatic-styles/style:style[@style:name = $drawStyleName]/style:graphic-properties[@draw:marker-start] or /office:document/office:automatic-styles/style:style[@style:name = $drawStyleName]/style:graphic-properties[@draw:marker-end]">
					<xsl:variable name="styleName" select="/office:document/office:automatic-styles/style:style[@style:name = $drawStyleName]/style:graphic-properties/@draw:marker-start"/>
					<xsl:variable name="markerStart" select="/office:document/office:automatic-styles/style:style[@style:name = $drawStyleName]/style:graphic-properties/@draw:marker-start"/>
					<xsl:variable name="markerEnd" select="/office:document/office:automatic-styles/style:style[@style:name = $drawStyleName]/style:graphic-properties/@draw:marker-end"/>
					<??????:??????_B201>
						<??????:????????????_B202>NSO</??????:????????????_B202>
						<??????:????????????_B203>v4.5</??????:????????????_B203>
						<??????:????????????_B204>
							<??????:??????_B205>
								<xsl:choose>
									<xsl:when test="@draw:id">
										<xsl:value-of select="@draw:id"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="generate-id(.)"/>
									</xsl:otherwise>
								</xsl:choose>
							</??????:??????_B205>
							<??????:??????_B206 ??????="draw:marker">
								<xsl:if test="$markerStart != ''">
									<??????:????????????>
										<xsl:copy-of select="/office:document/office:styles/draw:marker[@draw:name = $markerStart]/@*"/>
										<xsl:attribute name="draw:marker-start-width"><xsl:value-of select="/office:document/office:automatic-styles/style:style[@style:name = $drawStyleName]/style:graphic-properties[@draw:marker-start]/@draw:marker-start-width"/></xsl:attribute>
									</??????:????????????>
								</xsl:if>
								<xsl:if test="$markerEnd != ''">
									<??????:????????????>
										<xsl:copy-of select="/office:document/office:styles/draw:marker[@draw:name = $markerEnd]/@*"/>
										<xsl:attribute name="draw:marker-end-width"><xsl:value-of select="/office:document/office:automatic-styles/style:style[@style:name = $drawStyleName]/style:graphic-properties[@draw:marker-end]/@draw:marker-end-width"/></xsl:attribute>
									</??????:????????????>
								</xsl:if>
							</??????:??????_B206>
						</??????:????????????_B204>
					</??????:??????_B201>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="office:styles/draw:hatch">
			<??????:??????_B201>
				<??????:????????????_B202>NSO</??????:????????????_B202>
				<??????:????????????_B203>v4.5</??????:????????????_B203>
				<??????:????????????_B204>
					<??????:??????_B205>????????????</??????:??????_B205>
					<??????:??????_B206 ??????="draw:hatch">
						<xsl:for-each select="office:styles/draw:hatch">
							<??????:????????????>
								<xsl:attribute name="uof:name" select="@draw:name"/>
								<xsl:attribute name="uof:display-name" select="@draw:display-name"/>
								<xsl:attribute name="uof:style" select="@draw:style"/>
								<xsl:attribute name="uof:color" select="@draw:color"/>
								<xsl:attribute name="uof:distance" select="@draw:distance"/>
								<xsl:attribute name="uof:rotation" select="@draw:rotation"/>
							</??????:????????????>
						</xsl:for-each>
					</??????:??????_B206>
				</??????:????????????_B204>
			</??????:??????_B201>
		</xsl:if>
		<xsl:if test="office:automatic-styles/style:style/style:graphic-properties/@draw:stroke-dash">
			<xsl:for-each select="office:body//draw:*[@draw:style-name]">
				<xsl:variable name="drawStyleName" select="@draw:style-name"/>
				<xsl:if test="/office:document/office:automatic-styles/style:style[@style:name = $drawStyleName]/style:graphic-properties[@draw:stroke-dash]">
					<xsl:variable name="styleName" select="/office:document/office:automatic-styles/style:style[@style:name = $drawStyleName]/style:graphic-properties/@draw:stroke-dash"/>
					<xsl:if test="/office:document/office:styles/draw:stroke-dash[@draw:name = $styleName]">
						<??????:??????_B201>
							<??????:????????????_B202>NSO</??????:????????????_B202>
							<??????:????????????_B203>v4.5</??????:????????????_B203>
							<??????:????????????_B204>
								<??????:??????_B205>
									<xsl:value-of select="generate-id(.)"/>
								</??????:??????_B205>
								<??????:??????_B206 ??????="draw:stroke-dash">
									<??????:????????????>
										<xsl:copy-of select="/office:document/office:styles/draw:stroke-dash[@draw:name = $styleName]/@*"/>
									</??????:????????????>
								</??????:??????_B206>
							</??????:????????????_B204>
						</??????:??????_B201>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:for-each select="office:body//draw:custom-shape[contains($customshapetype,draw:enhanced-geometry/@draw:type)]">
			<xsl:if test="contains($customshapetype,draw:enhanced-geometry/@draw:type)">
				<??????:??????_B201>
					<??????:????????????_B202>NSO</??????:????????????_B202>
					<??????:????????????_B203>v4.5</??????:????????????_B203>
					<??????:????????????_B204>
						<??????:??????_B205>
							<xsl:value-of select="generate-id(.)"/>
						</??????:??????_B205>
						<??????:??????_B206 ??????="draw:custom-shape">
							<??????:?????????????????????>
								<xsl:for-each select="draw:enhanced-geometry">
									<xsl:copy-of select="@*|node()"/>
								</xsl:for-each>
							</??????:?????????????????????>
						</??????:??????_B206>
					</??????:????????????_B204>
				</??????:??????_B201>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="$documentType!='spreadsheet' and office:body//office:document[office:body/office:chart/chart:chart/table:table/@table:name = 'local-table']">
			<xsl:for-each select="office:body//office:document[office:body/office:chart/chart:chart/table:table/@table:name = 'local-table']">
				<??????:??????_B201>
					<??????:????????????_B202>NSO</??????:????????????_B202>
					<??????:????????????_B203>v4.5</??????:????????????_B203>
					<??????:????????????_B204>
						<??????:??????_B205>
							<xsl:value-of select="generate-id(..)"/>
						</??????:??????_B205>
						<??????:??????_B206 ??????="chart">
							<??????:local-table>
								<xsl:for-each select="office:body/office:chart/chart:chart/table:table[@table:name = 'local-table']">
									<xsl:copy-of select="@*|node()"/>
								</xsl:for-each>
							</??????:local-table>
						</??????:??????_B206>
					</??????:????????????_B204>
				</??????:??????_B201>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-sentence">
		<xsl:if test="style:text-properties/@fo:font-family or style:text-properties/@style:font-name or style:text-properties/@style:font-family-asian or style:text-properties/@style:western-content or style:text-properties/@fo:color or style:text-properties/@fo:font-size">
			<xsl:element name="???:??????_4128">
				<xsl:if test="contains(@style:parent-style-name,'Header') or contains(@style:parent-style-name,'Foot') or contains(@style:parent-style-name,'Endnote')">
					<xsl:attribute name="??????_412D">9</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="style:text-properties/@fo:font-family = 'Bookshelf Symbol 7' or style:text-properties/@fo:font-family = 'MS Reference Specialty' or style:text-properties/@fo:font-family = 'Marlett' or style:text-properties/@fo:font-family = 'Wingdings' or style:text-properties/@fo:font-family = 'MT Extra' or style:text-properties/@fo:font-family = 'Webdings' or style:text-properties/@fo:font-family = 'Wingdings 2' or style:text-properties/@fo:font-family = 'Wingdings 3'">
						<xsl:variable name="ss">'</xsl:variable>
						<xsl:choose>
							<xsl:when test="contains(style:text-properties/@fo:font-family,$ss) and contains(style:text-properties/@fo:font-family,' ')">
								<xsl:attribute name="??????????????????_412B"><xsl:value-of select="translate(substring-before(substring-after(style:text-properties/@fo:font-family,$ss),$ss),' ','_')"/></xsl:attribute>
							</xsl:when>
							<xsl:when test="not(contains(style:text-properties/@fo:font-family,$ss)) and contains(style:text-properties/@fo:font-family,' ')">
								<xsl:attribute name="??????????????????_412B"><xsl:value-of select="translate(style:text-properties/@fo:font-family,' ','_')"/></xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="??????????????????_412B"><xsl:value-of select="style:text-properties/@fo:font-family"/></xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="style:text-properties/@style:font-name = 'Bookshelf Symbol 7' or style:text-properties/@style:font-name = 'MS Reference Specialty' or style:text-properties/@style:font-name = 'Marlett' or style:text-properties/@style:font-name = 'Wingdings' or style:text-properties/@style:font-name = 'MT Extra' or style:text-properties/@style:font-name = 'Webdings' or style:text-properties/@style:font-name = 'Wingdings 2' or style:text-properties/@style:font-name = 'Wingdings 3'">
						<xsl:variable name="ss">'</xsl:variable>
						<xsl:choose>
							<xsl:when test="contains(style:text-properties/@style:font-name,$ss) and contains(style:text-properties/@style:font-name,' ')">
								<xsl:attribute name="??????????????????_412B"><xsl:value-of select="translate(substring-before(substring-after(style:text-properties/@style:font-name,$ss),$ss),' ','_')"/></xsl:attribute>
							</xsl:when>
							<xsl:when test="not(contains(style:text-properties/@style:font-name,$ss)) and contains(style:text-properties/@style:font-name,' ')">
								<xsl:attribute name="??????????????????_412B"><xsl:value-of select="translate(style:text-properties/@style:font-name,' ','_')"/></xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="??????????????????_412B"><xsl:value-of select="style:text-properties/@style:font-name"/></xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="style:text-properties/@fo:font-family">
							<xsl:variable name="ss">'</xsl:variable>
							<xsl:choose>
								<xsl:when test="contains(style:text-properties/@fo:font-family,$ss) and contains(style:text-properties/@fo:font-family,' ')">
									<xsl:attribute name="??????????????????_4129"><xsl:value-of select="translate(substring-before(substring-after(style:text-properties/@fo:font-family,$ss),$ss),' ','_')"/></xsl:attribute>
								</xsl:when>
								<xsl:when test="not(contains(style:text-properties/@fo:font-family,$ss)) and contains(style:text-properties/@fo:font-family,' ')">
									<xsl:attribute name="??????????????????_4129"><xsl:value-of select="translate(style:text-properties/@fo:font-family,' ','_')"/></xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="??????????????????_4129"><xsl:value-of select="style:text-properties/@fo:font-family"/></xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						<xsl:if test="style:text-properties/@style:font-name">
							<xsl:variable name="ss">'</xsl:variable>
							<xsl:choose>
								<xsl:when test="contains(style:text-properties/@style:font-name,$ss) and contains(style:text-properties/@style:font-name,' ')">
									<xsl:attribute name="??????????????????_4129"><xsl:value-of select="translate(substring-before(substring-after(style:text-properties/@style:font-name,$ss),$ss),' ','_')"/></xsl:attribute>
								</xsl:when>
								<xsl:when test="not(contains(style:text-properties/@style:font-name,$ss)) and contains(style:text-properties/@style:font-name,' ')">
									<xsl:attribute name="??????????????????_4129"><xsl:value-of select="translate(style:text-properties/@style:font-name,' ','_')"/></xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="??????????????????_4129"><xsl:value-of select="style:text-properties/@style:font-name"/></xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="style:text-properties/@style:font-family-asian">
						<xsl:variable name="ss">'</xsl:variable>
						<xsl:choose>
							<xsl:when test="contains(style:text-properties/@style:font-family-asian,$ss) and contains(style:text-properties/@style:font-family-asian,' ')">
								<xsl:attribute name="??????????????????_412A"><xsl:value-of select="translate(substring-before(substring-after(style:text-properties/@style:font-family-asian,$ss),$ss),' ','_')"/></xsl:attribute>
							</xsl:when>
							<xsl:when test="not(contains(style:text-properties/@style:font-family-asian,$ss)) and contains(style:text-properties/@style:font-family-asian,' ')">
								<xsl:attribute name="??????????????????_412A"><xsl:value-of select="translate(style:text-properties/@style:font-family-asian,' ','_')"/></xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="??????????????????_412A"><xsl:value-of select="style:text-properties/@style:font-family-asian"/></xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="style:text-properties/@style:font-name-asian">
						<xsl:variable name="ss">'</xsl:variable>
						<xsl:choose>
							<xsl:when test="contains(style:text-properties/@style:font-name-asian,$ss) and contains(style:text-properties/@style:font-name-asian,' ')">
								<xsl:attribute name="??????????????????_412A"><xsl:value-of select="translate(substring-before(substring-after(style:text-properties/@style:font-name-asian,$ss),$ss),' ','_')"/></xsl:attribute>
							</xsl:when>
							<xsl:when test="not(contains(style:text-properties/@style:font-name-asian,$ss)) and contains(style:text-properties/@style:font-name-asian,' ')">
								<xsl:attribute name="??????????????????_412A"><xsl:value-of select="translate(style:text-properties/@style:font-name-asian,' ','_')"/></xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="??????????????????_412A"><xsl:value-of select="style:text-properties/@style:font-name-asian"/></xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
				</xsl:choose>
				<xsl:if test="style:text-properties/@fo:font-size or style:text-properties/@style:font-size-asian or  style:text-properties/@style:font-size-complex">
					<xsl:choose>
						<xsl:when test="contains(style:text-properties/@fo:font-size,'%') or contains(style:text-properties/@style:font-size-asian,'%')">
							<xsl:attribute name="????????????_412E"><xsl:choose><xsl:when test="style:text-properties/@fo:font-size"><xsl:value-of select="substring-before(style:text-properties/@fo:font-size,'%')"/></xsl:when><xsl:when test="style:text-properties/@style:font-size-asian"><xsl:value-of select="substring-before(style:text-properties/@style:font-size-asian,'%')"/></xsl:when></xsl:choose></xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:variable name="fontsize">
								<xsl:choose>
									<xsl:when test="style:text-properties/@style:font-size-asian">
										<xsl:value-of select="substring-before(style:text-properties/@style:font-size-asian,'pt')"/>
									</xsl:when>
									<xsl:when test="style:text-properties/@style:font-size-complex">
										<xsl:value-of select="substring-before(style:text-properties/@style:font-size-complex,'pt')"/>
									</xsl:when>
									<xsl:when test="style:text-properties/@fo:font-size">
										<xsl:value-of select="substring-before(style:text-properties/@fo:font-size,'pt')"/>
									</xsl:when>
								</xsl:choose>
							</xsl:variable>
							<xsl:attribute name="??????_412D"><xsl:value-of select="$fontsize"/></xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="style:text-properties/@fo:color">
					<xsl:attribute name="??????_412F"><xsl:value-of select="style:text-properties/@fo:color"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="contains(@style:name,'??????-outline') and style:text-properties/@style:use-window-font-color = 'true'">
					<xsl:attribute name="??????_412F">auto</xsl:attribute>
				</xsl:if>
				<xsl:if test="style:text-properties/@style:western-content">
					<xsl:choose>
						<xsl:when test="style:text-properties/@style:western-content = 'true'">
							<xsl:attribute name="??????????????????_412C">true</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="??????????????????_412C">false</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-sentence">
		<xsl:for-each select="style:text-properties">
			<xsl:if test="@fo:font-weight or @style:font-weight-asian">
				<xsl:element name="???:????????????_4130">
					<xsl:choose>
						<xsl:when test="@fo:font-weight ='normal' or @style:font-weight-asian ='normal' ">false</xsl:when>
						<xsl:otherwise>true</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
			</xsl:if>
		</xsl:for-each>
		<!--xsl:if test="contains(@style:name,'??????-outline') and style:text-properties/@fo:font-weight ='normal'">
			<xsl:element name="???:??????">
				<xsl:attribute name="uof:locID">t0089</xsl:attribute>
				<xsl:attribute name="uof:attrList">???</xsl:attribute>
				<xsl:attribute name="???:???">false</xsl:attribute>
			</xsl:element>
		</xsl:if-->
	</xsl:template>
	<xsl:template name="???:??????-sentence">
		<xsl:if test="style:text-properties/@fo:font-style or style:text-properties/@style:font-style-asian">
			<xsl:element name="???:????????????_4131">
				<xsl:choose>
					<xsl:when test="style:text-properties/@fo:font-style='italic' or style:text-properties/@style:font-style-asian='italic'">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-sentence">
		<xsl:if test="style:text-properties/@fo:background-color|style:text-properties/@style:text-background-color">
			<xsl:element name="???:??????????????????_4132">
				<xsl:choose>
					<xsl:when test="style:text-properties/@fo:background-color='transparent' or style:text-properties/@style:text-background-color='transparent'">auto</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="style:text-properties/@fo:background-color|style:text-properties/@style:text-background-color"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-sentence">
		<xsl:if test="style:text-properties/@fo:background-color and not(style:text-properties/@style:text-background-color='transparent')">
			<xsl:element name="???:??????_4134">
				<xsl:element name="???:??????_800A">
					<xsl:if test="style:text-properties/@fo:background-color">
						<xsl:attribute name="?????????_800B"><xsl:choose><xsl:when test="style:text-properties/@fo:background-color='transparent'">auto</xsl:when><xsl:otherwise><xsl:value-of select="style:text-properties/@fo:background-color"/></xsl:otherwise></xsl:choose></xsl:attribute>
					</xsl:if>
				</xsl:element>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:?????????-sentence">
		<xsl:if test="style:text-properties/@style:text-line-through-style">
			<xsl:element name="???:?????????_4135">
				<xsl:choose>
					<xsl:when test="style:text-properties/@style:text-line-through-style='solid' and not(style:text-properties/@style:text-line-through-type='double')">single</xsl:when>
					<xsl:when test="style:text-properties/@style:text-line-through-style='solid' and style:text-properties/@style:text-line-through-type='double'">double</xsl:when>
					<xsl:otherwise>none</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:?????????-sentence">
		<xsl:if test="style:text-properties/@style:text-underline-style or style:text-properties/@style:text-underline-type">
			<xsl:element name="???:?????????_4136">
				<xsl:variable name="lineType">
					<xsl:choose>
						<xsl:when test="style:text-properties/@style:text-underline-type='double'">double</xsl:when>
						<xsl:when test="style:text-properties/@style:text-underline-style != '' and style:text-properties/@style:text-underline-style != 'none'">single</xsl:when>
						<xsl:when test="style:text-properties/@style:text-underline-type = 'single'">single</xsl:when>
						<xsl:otherwise>none</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="lineStyle">
					<xsl:choose>
						<xsl:when test="style:text-properties/@style:text-underline-style='solid'">solid</xsl:when>
						<xsl:when test="style:text-properties/@style:text-underline-style='dotted'">round-dot</xsl:when>
						<xsl:when test="style:text-properties/@style:text-underline-style='dash'">dash</xsl:when>
						<xsl:when test="style:text-properties/@style:text-underline-style='dot-dash'">dash-dot</xsl:when>
						<xsl:when test="style:text-properties/@style:text-underline-style='dot-dot-dash'">dash-dot-dot</xsl:when>
						<xsl:when test="style:text-properties/@style:text-underline-style='long-dash'">long-dash</xsl:when>
						<xsl:otherwise>solid</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:attribute name="??????_4137"><xsl:value-of select="$lineType"/></xsl:attribute>
				<xsl:attribute name="??????_4138"><xsl:value-of select="$lineStyle"/></xsl:attribute>
				<xsl:if test="style:text-properties/@style:text-underline-color">
					<xsl:attribute name="??????_412F"><xsl:choose><xsl:when test="style:text-properties/@style:text-underline-color='font-color'">auto</xsl:when><xsl:otherwise><xsl:value-of select="style:text-properties/@style:text-underline-color"/></xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<xsl:attribute name="??????????????????_4139"><xsl:choose><xsl:when test="style:text-properties/@style:text-line-through-mode = 'skip-white-space'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:attribute>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:?????????-sentence">
		<xsl:if test="style:text-properties/@style:text-emphasize">
			<xsl:element name="???:?????????_413A">
				<xsl:attribute name="??????_413B"><xsl:choose><xsl:when test="style:text-properties/@style:text-emphasize='none'">none</xsl:when><xsl:otherwise>dot</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:if test="not(style:text-properties/@style:text-emphasize='none') and contains(style:text-properties/@style:text-emphasize,'space')">
					<xsl:attribute name="??????????????????_413C"><xsl:choose><xsl:when test="contains(style:text-properties/@style:text-emphasize,'spaceex')">true</xsl:when><xsl:when test="contains(style:text-properties/@style:text-emphasize,'spacein')">false</xsl:when></xsl:choose></xsl:attribute>
				</xsl:if>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-sentence">
		<xsl:if test="style:text-properties/@text:display">
			<xsl:element name="???:??????????????????_413D">true</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-sentence">
		<xsl:if test="style:text-properties/@style:text-outline">
			<xsl:element name="???:????????????_413E">
				<xsl:value-of select="style:text-properties/@style:text-outline"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-sentence">
		<xsl:if test="style:text-properties/@style:font-relief">
			<xsl:element name="???:??????_413F">
				<xsl:choose>
					<xsl:when test="style:text-properties/@style:font-relief='embossed'">emboss</xsl:when>
					<xsl:when test="style:text-properties/@style:font-relief='engraved'">engrave</xsl:when>
					<xsl:otherwise>none</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-sentence">
		<xsl:if test="style:text-properties/@fo:text-shadow">
			<xsl:element name="???:????????????_4140">
				<xsl:choose>
					<xsl:when test="style:text-properties/@fo:text-shadow='none'">false</xsl:when>
					<xsl:otherwise>true</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-sentence">
		<xsl:if test="style:text-properties/@fo:text-transform or style:text-properties/@fo:font-variant">
			<xsl:element name="???:??????????????????_4141">
				<xsl:choose>
					<xsl:when test="style:text-properties/@fo:text-transform='uppercase'">uppercase</xsl:when>
					<xsl:when test="style:text-properties/@fo:text-transform='lowercase'">lowercase</xsl:when>
					<xsl:when test="style:text-properties/@fo:text-transform='capitalize'">capital</xsl:when>
					<xsl:when test="style:text-properties/@fo:font-variant='small-caps'">small-caps</xsl:when>
					<xsl:otherwise>none</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="ODFGetCharSize">
		<xsl:choose>
			<xsl:when test="style:text-properties/@style:font-size-asian">
				<xsl:value-of select="substring-before(style:text-properties/@style:font-size-asian,'pt')"/>
			</xsl:when>
			<xsl:when test="style:text-properties/@fo:font-size">
				<xsl:value-of select="substring-before(style:text-properties/@fo:font-size,'pt')"/>
			</xsl:when>
			<xsl:when test="@style:parent-style-name != ''">
				<xsl:for-each select="key('ParaStyle',@style:parent-style-name)">
					<xsl:call-template name="ODFGetCharSize"/>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>10.5</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="???:?????????-sentence">
		<xsl:if test="style:text-properties/@style:text-position">
			<xsl:variable name="poffset" select="substring-before(style:text-properties/@style:text-position,' ')"/>
			<xsl:variable name="foffset" select="substring-before(substring-after(style:text-properties/@style:text-position,' '),'%')"/>
			<xsl:choose>
				<xsl:when test="$poffset ='sub' or $poffset = 'super' ">
					<xsl:element name="???:???????????????_4143">
						<xsl:choose>
							<xsl:when test="$poffset='sub'">sub</xsl:when>
							<xsl:when test="$poffset='super'">sup</xsl:when>
						</xsl:choose>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="???:??????_4142">
						<xsl:variable name="offset">
							<xsl:variable name="size">
								<xsl:call-template name="ODFGetCharSize"/>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="$poffset='sub'">
									<xsl:value-of select="-33 * $size div 100"/>
								</xsl:when>
								<xsl:when test="$poffset='super'">
									<xsl:value-of select="33 * $size div 100"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="string(number(substring-before($poffset,'%')) * number($size) div 100)"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:if test="$offset!=''">
							<???:?????????_4126>
								<xsl:value-of select="$offset"/>
							</???:?????????_4126>
						</xsl:if>
						<xsl:if test="$foffset != ''">
							<???:?????????_4127>
								<xsl:value-of select="$foffset"/>
							</???:?????????_4127>
						</xsl:if>
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-sentence">
		<xsl:if test="style:text-properties/@style:text-scale">
			<xsl:element name="???:??????_4144">
				<xsl:variable name="scale" select="style:text-properties/@style:text-scale"/>
				<xsl:choose>
					<xsl:when test="contains($scale,'%')">
						<xsl:value-of select="substring-before($scale,'%')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="style:text-properties/@style:text-scale"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-sentence">
		<xsl:if test="style:text-properties/@fo:letter-spacing and (not(style:text-properties/@fo:letter-spacing='normal'))">
			<xsl:element name="???:????????????_4145">
				<xsl:value-of select="fun:Convert2uofUnit(string(style:text-properties/@fo:letter-spacing))"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:???????????????-sentence">
		<xsl:if test="style:text-properties/@style:letter-kerning">
			<xsl:element name="???:???????????????_4146">
				<xsl:variable name="tt" select="style:text-properties/@style:letter-kerning"/>
				<xsl:choose>
					<xsl:when test="$tt='true'">
						<xsl:value-of select="fun:Convert2uofUnit(string(style:text-properties/@fo:letter-spacing))"/>
					</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="UOFTextStyle">
		<xsl:call-template name="???:??????-sentence"/>
		<xsl:call-template name="???:??????-sentence"/>
		<xsl:call-template name="???:??????-sentence"/>
		<xsl:call-template name="???:????????????-sentence"/>
		<xsl:call-template name="???:??????-sentence"/>
		<xsl:call-template name="???:?????????-sentence"/>
		<xsl:call-template name="???:?????????-sentence"/>
		<xsl:call-template name="???:?????????-sentence"/>
		<xsl:call-template name="???:????????????-sentence"/>
		<xsl:call-template name="???:??????-sentence"/>
		<xsl:call-template name="???:??????-sentence"/>
		<xsl:call-template name="???:??????-sentence"/>
		<xsl:call-template name="???:????????????-sentence"/>
		<xsl:call-template name="???:?????????-sentence"/>
		<xsl:call-template name="???:??????-sentence"/>
		<xsl:call-template name="???:????????????-sentence"/>
		<xsl:call-template name="???:???????????????-sentence"/>
		<!--????????????????????????  ODF????????????-->
		<!--xsl:call-template name="???:????????????-paragraph"/-->
	</xsl:template>
	<xsl:template name="OneTextStyle">
		<xsl:param name="Type"/>
		<xsl:element name="??????:?????????_9910">
			<xsl:choose>
				<xsl:when test="$Type='default'">
					<xsl:attribute name="?????????_4100"><xsl:value-of select="string('DefaultText')"/></xsl:attribute>
					<xsl:attribute name="??????_4101"><xsl:value-of select="string('DefaultText')"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="?????????_4100"><xsl:value-of select="@style:name"/></xsl:attribute>
					<xsl:attribute name="??????_4101"><xsl:value-of select="@style:name"/></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:attribute name="??????_4102"><xsl:value-of select="$Type"/></xsl:attribute>
			<xsl:if test="@style:display-name">
				<xsl:attribute name="??????_4103"><xsl:value-of select="@style:display-name"/></xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="@style:parent-style-name">
					<xsl:attribute name="???????????????_4104"><xsl:value-of select="@style:parent-style-name"/></xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<xsl:call-template name="UOFTextStyle"/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="TextStyles">
		<xsl:for-each select="office:styles/style:default-style[@style:family='text']">
			<xsl:call-template name="OneTextStyle">
				<xsl:with-param name="Type">
					<xsl:value-of select="string('default')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
		<xsl:for-each select="office:styles/style:style[@style:family='text']">
			<xsl:call-template name="OneTextStyle">
				<xsl:with-param name="Type">
					<xsl:value-of select="string('custom')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
		<xsl:for-each select="office:automatic-styles/style:style[@style:family='text']">
			<xsl:call-template name="OneTextStyle">
				<xsl:with-param name="Type">
					<xsl:value-of select="string('auto')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="???:????????????-paragraph">
		<xsl:param name="level"/>
		<xsl:choose>
			<xsl:when test="string($level) != ''">
				<xsl:element name="???:????????????_417C">
					<xsl:value-of select="$level"/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="substring-after(@style:display-name,'Heading')">
					<xsl:element name="???:????????????_417C">
						<xsl:value-of select="substring-after(@style:display-name,'Heading ')"/>
					</xsl:element>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="???:??????-paragraph">
		<xsl:if test="style:paragraph-properties/@fo:text-align or style:paragraph-properties/@style:vertical-align">
			<xsl:element name="???:??????_417D">
				<!--????????????UOF???ODF???????????????justified??????????????????-->
				<xsl:if test="style:paragraph-properties/@fo:text-align">
					<xsl:variable name="align">
						<xsl:choose>
							<xsl:when test="style:paragraph-properties/@fo:text-align='end'">right</xsl:when>
							<xsl:when test="style:paragraph-properties/@fo:text-align='center'">center</xsl:when>
							<xsl:when test="style:paragraph-properties/@fo:text-align='justify' and not(style:paragraph-properties/@fo:text-align-last='justify')">justified</xsl:when>
							<xsl:when test="style:paragraph-properties/@fo:text-align='justify' and style:paragraph-properties/@fo:text-align-last='justify'">distributed</xsl:when>
							<xsl:otherwise>left</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:attribute name="????????????_421D"><xsl:value-of select="$align"/></xsl:attribute>
				</xsl:if>
				<!--?????????????????????UOF???base???ODF???auto-->
				<xsl:variable name="textalign">
					<xsl:choose>
						<xsl:when test="style:paragraph-properties/@style:vertical-align='baseline'">base</xsl:when>
						<xsl:when test="style:paragraph-properties/@style:vertical-align='top'">top</xsl:when>
						<xsl:when test="style:paragraph-properties/@style:vertical-align='middle'">center</xsl:when>
						<xsl:when test="style:paragraph-properties/@style:vertical-align='bottom'">bottom</xsl:when>
						<xsl:otherwise>auto</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:attribute name="????????????_421E"><xsl:value-of select="$textalign"/></xsl:attribute>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-paragraph">
		<xsl:if test="style:paragraph-properties/@fo:margin-left or style:paragraph-properties/@fo:margin-right or style:paragraph-properties/@fo:text-indent">
			<xsl:element name="???:??????_411D">
				<xsl:for-each select="style:paragraph-properties">
					<xsl:if test="@text:space-before or @fo:margin-left">
						<xsl:choose>
							<xsl:when test="@fo:text-indent and substring(@fo:text-indent,1,1)='-'"/>
							<xsl:otherwise>
								<???:???_410E>
									<???:??????_4107>
										<xsl:if test="@text:space-before">
											<xsl:attribute name="???_410F"><xsl:value-of select="fun:Convert2uofUnit(@text:space-before)"/></xsl:attribute>
										</xsl:if>
										<xsl:if test="@fo:margin-left">
											<xsl:attribute name="???_410F"><xsl:value-of select="fun:Convert2uofUnit(@fo:margin-left)"/></xsl:attribute>
										</xsl:if>
									</???:??????_4107>
								</???:???_410E>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="@text:min-label-distance or @fo:margin-right">
						<???:???_4110>
							<???:??????_4107>
								<xsl:if test="@text:min-label-distance">
									<xsl:attribute name="???_410F"><xsl:value-of select="fun:Convert2uofUnit(@text:min-label-distance)"/></xsl:attribute>
								</xsl:if>
								<xsl:if test="@fo:margin-right">
									<xsl:attribute name="???_410F"><xsl:value-of select="fun:Convert2uofUnit(@fo:margin-right)"/></xsl:attribute>
								</xsl:if>
							</???:??????_4107>
						</???:???_4110>
					</xsl:if>
					<xsl:if test="@text:min-label-width or @fo:text-indent">
						<xsl:choose>
							<xsl:when test="substring(@fo:text-indent,1,1)='-' and @fo:text-indent != ''">
								<???:???_410E>
									<???:??????_4107>
										<xsl:attribute name="???_410F"><xsl:value-of select="fun:Convert2uofUnit(@fo:margin-left)"/></xsl:attribute>
									</???:??????_4107>
								</???:???_410E>
								<???:??????_4111>
									<???:??????_4107>
										<xsl:attribute name="???_410F"><xsl:value-of select="fun:Convert2uofUnit(@fo:text-indent)"/></xsl:attribute>
									</???:??????_4107>
								</???:??????_4111>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="@text:min-label-width or @fo:text-indent">
									<???:??????_4111>
										<???:??????_4107>
											<xsl:if test="@text:min-label-width">
												<xsl:attribute name="???_410F"><xsl:value-of select="fun:Convert2uofUnit(@text:min-label-width)"/></xsl:attribute>
											</xsl:if>
											<xsl:if test="@fo:text-indent">
												<xsl:attribute name="???_410F"><xsl:value-of select="fun:Convert2uofUnit(@fo:text-indent)"/></xsl:attribute>
											</xsl:if>
										</???:??????_4107>
									</???:??????_4111>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:for-each>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-paragraph">
		<xsl:if test="style:paragraph-properties/@fo:line-height or style:paragraph-properties/@style:line-height-at-least or style:paragraph-properties/@style:line-spacing">
			<xsl:element name="???:??????_417E">
				<xsl:choose>
					<xsl:when test="contains(style:paragraph-properties/@fo:line-height,$ooUnit)">
						<xsl:attribute name="??????_417F">fixed</xsl:attribute>
						<xsl:attribute name="???_4108"><xsl:value-of select="fun:Convert2uofUnit(style:paragraph-properties/@fo:line-height)"/></xsl:attribute>
					</xsl:when>
					<xsl:when test="style:paragraph-properties/@style:line-spacing">
						<xsl:attribute name="??????_417F">line-space</xsl:attribute>
						<xsl:attribute name="???_4108"><xsl:value-of select="fun:Convert2uofUnit(style:paragraph-properties/@style:line-spacing)"/></xsl:attribute>
					</xsl:when>
					<xsl:when test="style:paragraph-properties/@style:line-height-at-least">
						<xsl:attribute name="??????_417F">at-least</xsl:attribute>
						<xsl:attribute name="???_4108"><xsl:value-of select="fun:Convert2uofUnit(style:paragraph-properties/@style:line-height-at-least)"/></xsl:attribute>
					</xsl:when>
					<xsl:when test="contains(style:paragraph-properties/@fo:line-height,'%')">
						<xsl:attribute name="??????_417F">multi-lines</xsl:attribute>
						<xsl:attribute name="???_4108"><xsl:value-of select="number(substring-before(style:paragraph-properties/@fo:line-height,'%')) div 100"/></xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="??????_417F">multi-lines</xsl:attribute>
						<xsl:attribute name="???_4108">1.0</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:?????????-paragraph">
		<xsl:if test="style:paragraph-properties/@fo:margin-top or style:paragraph-properties/@fo:margin-bottom">
			<???:?????????_4180>
				<xsl:if test="style:paragraph-properties/@fo:margin-top != ''">
					<???:?????????_4181>
						<???:?????????_4183>
							<xsl:value-of select="fun:Convert2uofUnit(style:paragraph-properties/@fo:margin-top)"/>
						</???:?????????_4183>
					</???:?????????_4181>
				</xsl:if>
				<xsl:if test="style:paragraph-properties/@fo:margin-bottom != ''">
					<???:?????????_4185>
						<???:?????????_4183>
							<xsl:value-of select="fun:Convert2uofUnit(style:paragraph-properties/@fo:margin-bottom)"/>
						</???:?????????_4183>
					</???:?????????_4185>
				</xsl:if>
			</???:?????????_4180>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-paragraph">
		<xsl:if test="style:paragraph-properties/@fo:widows">
			<xsl:element name="???:????????????_418B">
				<xsl:value-of select="style:paragraph-properties/@fo:widows"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-paragraph">
		<xsl:if test="style:paragraph-properties/@fo:orphans">
			<xsl:element name="???:????????????_418A">
				<xsl:value-of select="style:paragraph-properties/@fo:orphans"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:???????????????-paragraph">
		<xsl:element name="???:?????????????????????_418C">
			<xsl:choose>
				<xsl:when test="style:paragraph-properties/@fo:keep-together='always'">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
	<xsl:template name="???:???????????????-paragraph">
		<xsl:if test="style:paragraph-properties/@fo:keep-with-next='always'">
			<xsl:element name="???:?????????????????????_418D">true</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-paragraph">
		<xsl:if test="style:paragraph-properties/@fo:break-before='page-paragraph'">
			<xsl:element name="???:??????????????????_418E">true</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="getShadowAngle">
		<xsl:param name="style_shadow"/>
		<xsl:variable name="value_1" select="substring-before(substring-before(substring-after($style_shadow,' '),' '),$uofUnit)"/>
		<xsl:variable name="value_2" select="substring-before(substring-after(substring-after($style_shadow,' '),' '),$uofUnit)"/>
		<xsl:choose>
			<xsl:when test="number($value_1) &gt; 0 and number($value_2) &gt; 0">right-bottom</xsl:when>
			<xsl:when test="number($value_1) &gt; 0 and number($value_2) &lt; 0">right-top</xsl:when>
			<xsl:when test="number($value_1) &lt; 0 and number($value_2) &gt; 0">left-bottom</xsl:when>
			<xsl:when test="number($value_1) &lt; 0 and number($value_2) &lt; 0">left-top</xsl:when>
			<xsl:otherwise>none</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="???:??????-paragraph">
		<xsl:if test="style:paragraph-properties/@fo:border != 'none' or style:paragraph-properties/@fo:border-top != '0pt' or style:paragraph-properties/@fo:border-bottom != '0pt' or style:paragraph-properties/@fo:border-left != '0pt' or style:paragraph-properties/@fo:border-right != '0pt' or style:paragraph-properties/@style:shadow[.!='none']">
			<xsl:element name="???:??????_4133">
				<xsl:if test="style:paragraph-properties/@style:shadow[.!='none']">
					<xsl:variable name="shadowAngle">
						<xsl:call-template name="getShadowAngle">
							<xsl:with-param name="style_shadow" select="style:paragraph-properties/@style:shadow"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:attribute name="????????????_C645" select="$shadowAngle"/>
				</xsl:if>
				<xsl:for-each select="style:paragraph-properties">
					<xsl:call-template name="Border"/>
				</xsl:for-each>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-paragraph">
		<xsl:if test="style:paragraph-properties/@fo:background-color or style:paragraph-properties/style:background-image">
			<xsl:element name="???:??????_4134">
				<xsl:for-each select="style:paragraph-properties">
					<xsl:call-template name="UOFFill"/>
				</xsl:for-each>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:???????????????-paragraph">
		<xsl:if test="style:paragraph-properties/style:tab-stops">
			<xsl:element name="???:???????????????_418F">
				<xsl:for-each select="style:paragraph-properties/style:tab-stops/style:tab-stop">
					<xsl:element name="???:?????????_4171">
						<xsl:attribute name="??????_4172"><xsl:value-of select="fun:Convert2uofUnit(@style:position)"/></xsl:attribute>
						<xsl:variable name="aa">
							<xsl:value-of select="@style:type"/>
						</xsl:variable>
						<xsl:variable name="zbflx">
							<xsl:choose>
								<xsl:when test="$aa='right'">right</xsl:when>
								<xsl:when test="$aa='center'">center</xsl:when>
								<xsl:when test="$aa='char'and @style:char!=''">decimal</xsl:when>
								<xsl:otherwise>left</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:attribute name="??????_4173"><xsl:value-of select="$zbflx"/></xsl:attribute>
						<xsl:if test="@style:leader-text">
							<xsl:attribute name="?????????_4174"><xsl:value-of select="@style:leader-text"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="@style:leader-style">
							<xsl:attribute name="???????????????_4175"><xsl:value-of select="@style:leader-style"/></xsl:attribute>
						</xsl:if>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-paragraph">
		<xsl:element name="???:??????????????????_4190">
			<xsl:choose>
				<xsl:when test="style:paragraph-properties/@style:snap-to-layout-grid='false'">false</xsl:when>
				<xsl:otherwise>true</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
	<xsl:template name="???:????????????-paragraph">
		<xsl:if test="style:paragraph-properties/style:drop-cap/@style:drop-type or style:paragraph-properties/style:drop-cap/@style:lines">
			<xsl:element name="???:????????????_4191">
				<xsl:attribute name="??????_413B"><xsl:choose><xsl:when test="style:paragraph-properties/style:drop-cap/@style:drop-type = 'dropped'">dropped</xsl:when><xsl:when test="style:paragraph-properties/style:drop-cap/@style:drop-type = 'margin'">margin</xsl:when><xsl:otherwise>dropped</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:if test="style:paragraph-properties/style:drop-cap/@style:style-name">
					<xsl:attribute name="????????????_4176"><xsl:choose><xsl:when test="contains(style:paragraph-properties/style:drop-cap/@style:style-name,' ')"><xsl:value-of select="translate(style:paragraph-properties/style:drop-cap/@style:style-name,' ','_')"/></xsl:when><xsl:otherwise><xsl:value-of select="style:paragraph-properties/style:drop-cap/@style:style-name"/></xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<xsl:attribute name="??????_4179"><xsl:choose><xsl:when test="style:paragraph-properties/style:drop-cap/@style:distance"><xsl:value-of select="fun:Convert2uofUnit(style:paragraph-properties/style:drop-cap/@style:distance)"/></xsl:when><xsl:otherwise>0.00</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:if test="style:paragraph-properties/style:drop-cap/@style:length">
					<xsl:attribute name="?????????_4177"><xsl:value-of select="style:paragraph-properties/style:drop-cap/@style:length"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="style:paragraph-properties/style:drop-cap/@style:lines">
					<xsl:attribute name="??????_4178"><xsl:value-of select="style:paragraph-properties/style:drop-cap/@style:lines"/></xsl:attribute>
				</xsl:if>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-paragraph">
		<!-- begin
		<xsl:element name="???:??????????????????_4192">
			<xsl:choose>
				<xsl:when test="style:paragraph-properties/@fo:hyphenate">
					<xsl:value-of select="style:paragraph-properties/@fo:hyphenate"/>
				</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:element>-->
		<xsl:if test="((style:paragraph-properties/@fo:hyphenation-ladder-count and string(style:paragraph-properties/@fo:hyphenation-ladder-count)='0') or not(style:paragraph-properties/@fo:hyphenation-ladder-count)) and (style:text-properties/@fo:hyphenate and string(style:text-properties/@fo:hyphenate)='true')">
			<xsl:element name="???:??????????????????_4192">false</xsl:element>
		</xsl:if>
		<!--end-->
	</xsl:template>
	<xsl:template name="???:????????????-paragraph">
		<xsl:if test="style:paragraph-properties/@text:number-lines">
			<xsl:element name="???:??????????????????_4193">
				<xsl:variable name="aa">
					<xsl:value-of select="style:paragraph-properties/@text:number-lines"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$aa='false'">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????????????????-paragraph">
		<!--begin
		<xsl:if test="style:paragraph-properties/@style:word-wrap">
			<xsl:element name="???:????????????????????????_4194">
				<xsl:variable name="boolean" select="style:paragraph-properties/@style:word-wrap"/>
				<xsl:choose>
					<xsl:when test="$boolean = 'true'">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>-->
		<xsl:if test="style:paragraph-properties/@fo:hyphenation-ladder-count and string(style:paragraph-properties/@fo:hyphenation-ladder-count)!='0'">
			<xsl:element name="???:????????????????????????_4194">true</xsl:element>
		</xsl:if>
		<!--end-->
	</xsl:template>
	<xsl:template name="???:?????????????????????-paragraph">
		<xsl:if test="style:paragraph-properties/@style:punctuation-wrap">
			<xsl:element name="???:???????????????????????????_4195">
				<xsl:choose>
					<xsl:when test="style:paragraph-properties/@style:punctuation-wrap='hanging'">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????????????????-paragraph">
		<xsl:if test="style:paragraph-properties/@style:punctuation-compress">
			<xsl:element name="???:????????????????????????_4196">
				<xsl:variable name="boolean" select="style:paragraph-properties/@style:punctuation-compress"/>
				<xsl:choose>
					<xsl:when test="$boolean = 'true'">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????????????????-paragraph">
		<xsl:if test="style:paragraph-properties/@style:line-break ">
			<xsl:element name="???:????????????????????????????????????_4197">
				<xsl:choose>
					<xsl:when test="style:paragraph-properties/@style:line-break='strict'">true</xsl:when>
					<xsl:when test="style:paragraph-properties/@style:line-break='normal'">false</xsl:when>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:?????????????????????????????????-paragraph">
		<xsl:if test="style:paragraph-properties/@style:text-autospace or style:paragraph-properties/@style:line-break">
			<xsl:element name="???:???????????????????????????????????????_4198">
				<xsl:choose>
					<xsl:when test="style:paragraph-properties/@style:text-autospace='ideograph-alpha' or style:paragraph-properties/@style:line-break='normal'">true</xsl:when>
					<xsl:when test="style:paragraph-properties/@style:text-autospace='none' or style:paragraph-properties/@style:line-break='strict'">false</xsl:when>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:?????????????????????????????????-paragraph">
		<xsl:if test="style:paragraph-properties/@style:text-autospace or style:paragraph-properties/@style:line-break">
			<xsl:element name="???:???????????????????????????????????????_4199">
				<xsl:choose>
					<xsl:when test="style:paragraph-properties/@style:text-autospace='ideograph-alpha' or style:paragraph-properties/@style:line-break='normal'">true</xsl:when>
					<xsl:when test="style:paragraph-properties/@style:text-autospace='none' or style:paragraph-properties/@style:line-break='strict'">false</xsl:when>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????????????????????????????-paragraph">
		<xsl:element name="???:????????????????????????????????????_419A">false</xsl:element>
	</xsl:template>
	<xsl:template name="???:??????????????????-paragraph">
		<xsl:param name="autonum"/>
		<xsl:param name="level"/>
		<xsl:if test="$autonum!=''">
			<???:??????????????????_4186>
				<xsl:attribute name="????????????_4187"><xsl:value-of select="concat($autonum,'_num')"/></xsl:attribute>
				<xsl:attribute name="????????????_4188"><xsl:value-of select="$level"/></xsl:attribute>
				<xsl:attribute name="??????????????????_4189">false</xsl:attribute>
				<xsl:attribute name="????????????_4152"><xsl:choose><xsl:when test="/office:document/office:styles/text:list-style[@style:name=$autonum]/text:list-level-style-number[1]/@text:start-value"><xsl:value-of select="/office:document/office:styles/text:list-style[@style:name=$autonum]/text:list-level-style-number[1]/@text:start-value"/></xsl:when><xsl:otherwise>1</xsl:otherwise></xsl:choose></xsl:attribute>
			</???:??????????????????_4186>
		</xsl:if>
	</xsl:template>
	<xsl:template name="UofParagraphStyle">
		<xsl:param name="autonum"/>
		<xsl:param name="level"/>
		<xsl:call-template name="???:????????????-paragraph">
			<xsl:with-param name="level" select="$level"/>
		</xsl:call-template>
		<xsl:call-template name="???:??????-paragraph"/>
		<xsl:call-template name="???:??????-paragraph"/>
		<xsl:call-template name="???:??????-paragraph"/>
		<xsl:call-template name="???:?????????-paragraph"/>
		<xsl:call-template name="???:????????????-paragraph"/>
		<xsl:call-template name="???:????????????-paragraph"/>
		<xsl:call-template name="???:???????????????-paragraph"/>
		<xsl:call-template name="???:???????????????-paragraph"/>
		<xsl:call-template name="???:????????????-paragraph"/>
		<xsl:call-template name="???:??????-paragraph"/>
		<xsl:call-template name="???:??????-paragraph"/>
		<xsl:call-template name="???:???????????????-paragraph"/>
		<xsl:call-template name="???:????????????-paragraph"/>
		<xsl:call-template name="???:????????????-paragraph"/>
		<xsl:call-template name="???:????????????-paragraph"/>
		<xsl:call-template name="???:????????????-paragraph"/>
		<xsl:call-template name="???:??????????????????-paragraph"/>
		<xsl:call-template name="???:?????????????????????-paragraph"/>
		<xsl:call-template name="???:????????????????????????-paragraph"/>
		<xsl:call-template name="???:????????????????????????-paragraph"/>
		<xsl:call-template name="???:?????????????????????????????????-paragraph"/>
		<xsl:call-template name="???:?????????????????????????????????-paragraph"/>
		<xsl:call-template name="???:??????????????????????????????-paragraph"/>
		<xsl:call-template name="???:??????????????????-paragraph">
			<xsl:with-param name="autonum" select="$autonum"/>
			<xsl:with-param name="level" select="$level"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="OneParagraphStyle">
		<xsl:param name="Type"/>
		<xsl:element name="??????:????????????_9912">
			<xsl:choose>
				<xsl:when test="$Type='default'">
					<xsl:attribute name="?????????_4100"><xsl:value-of select="string('DefaultParagraph')"/></xsl:attribute>
					<xsl:attribute name="??????_4101"><xsl:value-of select="string('DefaultParagraph')"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="?????????_4100"><xsl:value-of select="@style:name"/></xsl:attribute>
					<xsl:attribute name="??????_4101"><xsl:value-of select="@style:name"/></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:attribute name="??????_4102"><xsl:value-of select="$Type"/></xsl:attribute>
			<xsl:if test="@style:parent-style-name">
				<xsl:attribute name="???????????????_4104"><xsl:value-of select="@style:parent-style-name"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@style:display-name">
				<xsl:attribute name="??????_4103"><xsl:value-of select="@style:display-name"/></xsl:attribute>
			</xsl:if>
			<xsl:element name="???:?????????_4158">
				<xsl:call-template name="UOFTextStyle"/>
			</xsl:element>
			<xsl:call-template name="UofParagraphStyle"/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="ParagraphStyles">
		<xsl:for-each select="office:styles/style:default-style">
			<xsl:choose>
				<xsl:when test="$documentType='presentation' and @style:family='graphic'">
					<xsl:call-template name="OneParagraphStyle">
						<xsl:with-param name="Type">
							<xsl:value-of select="string('default')"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="not($documentType='presentation')and @style:family='paragraph'">
					<xsl:call-template name="OneParagraphStyle">
						<xsl:with-param name="Type">
							<xsl:value-of select="string('default')"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		<xsl:for-each select="office:styles/style:style[@style:family='paragraph']">
			<xsl:if test="not(contains(@style:name,'-outline') or contains(@style:name,'-title'))">
				<xsl:call-template name="OneParagraphStyle">
					<xsl:with-param name="Type">
						<xsl:value-of select="string('custom')"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="office:automatic-styles/style:style[@style:family='paragraph']">
			<xsl:if test="not(contains(@style:name,'-outline') or contains(@style:name,'-title'))">
				<xsl:call-template name="OneParagraphStyle">
					<xsl:with-param name="Type">
						<xsl:value-of select="string('auto')"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="PresentationParaStyles">
		<xsl:for-each select="office:styles/style:style[@style:family='presentation']">
			<xsl:if test="not(contains(@style:name,'-outline') or contains(@style:name,'-title'))">
				<xsl:if test="style:paragraph-properties or style:text-properties">
					<xsl:call-template name="OneParagraphStyle">
						<xsl:with-param name="Type">
							<xsl:value-of select="string('auto')"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="office:styles/style:style[@style:family='graphic']|office:automatic-styles/style:style[@style:family='graphic'or @style:family='presentation']">
			<xsl:if test="not(contains(@style:name,'-outline') or contains(@style:name,'-title'))">
				<xsl:if test="style:paragraph-properties or style:text-properties">
					<xsl:call-template name="OneParagraphStyle">
						<xsl:with-param name="Type">
							<xsl:value-of select="string('auto')"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="AnimationTextStyles">
		<xsl:for-each select="/office:document/office:body/office:presentation/draw:page/anim:par/anim:seq/anim:par/anim:par/anim:par">
			<xsl:if test="anim:set/@smil:attributeName">
				<xsl:element name="??????:?????????_9910">
					<xsl:attribute name="?????????_4100"><xsl:value-of select="generate-id()"/></xsl:attribute>
					<xsl:attribute name="??????_4101"><xsl:value-of select="generate-id()"/></xsl:attribute>
					<xsl:attribute name="??????_4102"><xsl:value-of select="'auto'"/></xsl:attribute>
					<xsl:for-each select="anim:set">
						<xsl:if test="@smil:attributeName = 'font-style' and @smil:to = 'italic'">
							<xsl:element name="???:????????????_4131">true</xsl:element>
						</xsl:if>
						<xsl:if test="@smil:attributeName = 'font-weight' and @smil:to = 'bold'">
							<xsl:element name="???:????????????_4130">true</xsl:element>
						</xsl:if>
						<xsl:if test="@smil:attributeName = 'text-underline' and @smil:to = 'solid'">
							<xsl:element name="???:?????????_4136">
								<xsl:attribute name="??????_4137"><xsl:value-of select="'single'"/></xsl:attribute>
								<xsl:attribute name="??????????????????_4139">false</xsl:attribute>
							</xsl:element>
						</xsl:if>
						<xsl:if test="@smil:attributeName = 'font-family'">
							<???:??????_4128>
								<xsl:attribute name="??????????????????_412A"><xsl:value-of select="@smil:to"/></xsl:attribute>
							</???:??????_4128>
						</xsl:if>
					</xsl:for-each>
				</xsl:element>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="???:????????????-list">
		<xsl:if test="@text:bullet-char">
			<xsl:element name="???:????????????_4115">
				<xsl:value-of select="@text:bullet-char"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-list">
		<xsl:if test="style:text-properties/@fo:font-family or @text:style-name">
			<xsl:element name="???:????????????_4116">
				<xsl:variable name="TextStyleName" select="@text:style-name"/>
				<xsl:if test="@text:style-name != ''">
					<xsl:attribute name="????????????_4247"><xsl:value-of select="@text:style-name"/></xsl:attribute>
				</xsl:if>
				<xsl:call-template name="UOFTextStyle"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-list">
		<xsl:if test="@style:num-format">
			<???:????????????_4119>
				<xsl:choose>
					<xsl:when test="string(@style:num-format)='a'">lower-letter</xsl:when>
					<xsl:when test="string(@style:num-format)='A'">upper-letter</xsl:when>
					<xsl:when test="string(@style:num-format)='i'">lower-roman</xsl:when>
					<xsl:when test="string(@style:num-format)='I'">upper-roman</xsl:when>
					<xsl:when test="string(@style:num-format)='???, ???, ???, ...'">decimal-enclosed-circle</xsl:when>
					<xsl:when test="string(@style:num-format)='???, ???, ???, ...'">ideograph-traditional</xsl:when>
					<xsl:when test="string(@style:num-format)='???, ???, ???, ...'">ideograph-zodiac</xsl:when>
					<xsl:when test="string(@style:num-format)='???, ???, ???, ...'">chinese-counting</xsl:when>
					<xsl:when test="string(@style:num-format)='???, ???, ???, ...'">chinese-legal-simplified</xsl:when>
					<xsl:when test="string(@style:num-format)='???, ???, ???, ...'">
						<xsl:choose>
							<xsl:when test="starts-with(@style:num-suffix,'.')">decimal-enclosed-fullstop</xsl:when>
							<xsl:otherwise>decimal-full-width</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="string(@style:num-format)='1st'">ordinal</xsl:when>
					<xsl:when test="string(@style:num-format)='one'">cardinal-text</xsl:when>
					<xsl:when test="@style:num-format='first'">ordinal-text</xsl:when>
					<xsl:when test="@style:num-format='???, ???, ???, ...'">ideograph-enclosed-circle</xsl:when>
					<xsl:when test="string(@style:num-format)='1' and ends-with(@style:num-prefix,'(') and starts-with(style:num-suffix,')')">decimal-enclosed-paren</xsl:when>
					<xsl:otherwise>decimal</xsl:otherwise>
				</xsl:choose>
			</???:????????????_4119>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????????????????-content">
		<xsl:param name="bubianjibie"/>
		<xsl:param name="jibie"/>
		<xsl:param name="xianshijibie"/>
		<xsl:param name="biaoshi"/>
		<xsl:choose>
			<xsl:when test="number($xianshijibie)= 1">
				<!--?????????????????????-->
				<xsl:choose>
					<xsl:when test="@style:num-format='???, ???, ???, ...' and starts-with(@style:num-suffix,'.')">
						<xsl:value-of select="concat(string(@style:num-prefix),$biaoshi,substring-after(@style:num-suffix,'.'))"/>
					</xsl:when>
					<xsl:when test="@style:num-format='1' and ends-with(@style:num-prefix,'(') and starts-with(style:num-suffix,')')">
						<xsl:value-of select="concat(substring-before(@style:num-prefix,'('),$biaoshi,substring-after(@style:num-suffix,')'))"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(string(@style:num-prefix),$biaoshi,string(@style:num-suffix))"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="???:??????????????????-content">
					<xsl:with-param name="bubianjibie" select="$bubianjibie"/>
					<xsl:with-param name="jibie" select="$jibie -1"/>
					<xsl:with-param name="xianshijibie" select="$xianshijibie -1"/>
					<xsl:with-param name="biaoshi" select="concat('%',number($jibie -1),'.',$biaoshi)"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		
	</xsl:template>
	<xsl:template name="???:??????????????????-list">
		<xsl:variable name="jibie">
			<xsl:value-of select="@text:level"/>
		</xsl:variable>
		<xsl:variable name="xianshijibie">
			<xsl:choose>
				<xsl:when test="@text:display-levels">
					<xsl:value-of select="@text:display-levels"/>
				</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:element name="???:??????????????????_411A">
			<xsl:call-template name="???:??????????????????-content">
				<xsl:with-param name="bubianjibie" select="$jibie"/>
				<xsl:with-param name="jibie" select="$jibie"/>
				<xsl:with-param name="xianshijibie" select="$xianshijibie"/>
				<!--xsl:with-param name="biaoshi" select="concat(string(@style:num-prefix),'%',$jibie,string(@style:num-suffix))"/-->
				<xsl:with-param name="biaoshi" select="concat('%',$jibie)"/>
			</xsl:call-template>
		</xsl:element>
	</xsl:template>
	<xsl:template name="???:??????????????????-list">
		<xsl:if test="office:binary-data or @xlink:href">
			<xsl:element name="???:????????????_411B">
				<xsl:if test="style:list-level-properties/@fo:width">
					<xsl:attribute name="???_C605"><xsl:value-of select="fun:Convert2uofUnit(style:list-level-properties/@fo:width)"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="style:list-level-properties/@fo:height">
					<xsl:attribute name="???_C604"><xsl:value-of select="fun:Convert2uofUnit(style:list-level-properties/@fo:height)"/></xsl:attribute>
				</xsl:if>
				<xsl:attribute name="??????_411C" select="generate-id(.)"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-list">
		<xsl:choose>
			<xsl:when test="style:list-level-properties/@text:list-level-position-and-space-mode = 'label-alignment'">
				<xsl:if test="style:list-level-properties/*/@fo:text-indent or style:list-level-properties/*/@fo:margin-left">
					<xsl:element name="???:??????_411D">
						<xsl:for-each select="style:list-level-properties/*">
							<xsl:if test="@fo:margin-left != ''">
								<xsl:choose>
									<xsl:when test="@fo:text-indent and substring(@fo:text-indent,1,1)='-'">
										<???:???_410E>
											<???:??????_4107>
												<xsl:variable name="marginLeft" select="fun:Convert2uofUnit(@fo:margin-left)"/>
												<xsl:variable name="textIndent" select="fun:Convert2uofUnit(@fo:text-indent)"/>
												<xsl:attribute name="???_410F"><xsl:value-of select="$marginLeft + $textIndent"/></xsl:attribute>
											</???:??????_4107>
										</???:???_410E>
									</xsl:when>
									<xsl:otherwise>
										<???:???_410E>
											<???:??????_4107>
												<xsl:attribute name="???_410F"><xsl:value-of select="fun:Convert2uofUnit(@fo:margin-left)"/></xsl:attribute>
											</???:??????_4107>
										</???:???_410E>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
							<xsl:if test="@fo:text-indent != ''">
								<???:??????_4111>
									<???:??????_4107>
										<xsl:attribute name="???_410F"><xsl:value-of select="fun:Convert2uofUnit(@fo:text-indent)"/></xsl:attribute>
									</???:??????_4107>
								</???:??????_4111>
							</xsl:if>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="style:list-level-properties">
					<xsl:element name="???:??????_411D">
						<xsl:if test="@text:space-before != ''">
							<xsl:choose>
								<xsl:when test="@text:min-label-width and substring(@text:min-label-width,1,1)='-'">
									<???:???_410E>
										<???:??????_4107>
											<xsl:variable name="marginLeft" select="fun:Convert2uofUnit(@text:space-before)"/>
											<xsl:variable name="textIndent" select="fun:Convert2uofUnit(@text:min-label-width)"/>
											<xsl:attribute name="???_410F"><xsl:value-of select="$marginLeft + $textIndent"/></xsl:attribute>
										</???:??????_4107>
									</???:???_410E>
								</xsl:when>
								<xsl:otherwise>
									<???:???_410E>
										<???:??????_4107>
											<xsl:attribute name="???_410F"><xsl:value-of select="fun:Convert2uofUnit(@text:space-before)"/></xsl:attribute>
										</???:??????_4107>
									</???:???_410E>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						<xsl:if test="@text:min-label-width != ''">
							<???:??????_4111>
								<???:??????_4107>
									<xsl:attribute name="???_410F"><xsl:value-of select="fun:Convert2uofUnit(@text:min-label-width)"/></xsl:attribute>
								</???:??????_4107>
							</???:??????_4111>
						</xsl:if>
					</xsl:element>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="???:???????????????-list">
		<xsl:if test="style:list-level-properties/*/@text:list-tab-stop-position">
			<xsl:element name="???:???????????????_411E">
				<xsl:variable name="pos" select="fun:Convert2uofUnit(style:list-level-properties/*/@text:list-tab-stop-position)"/>
				<xsl:value-of select="format-number(number($pos),'#.00')"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-list">
		<xsl:if test="@text:start-value">
			<xsl:element name="???:????????????_411F">
				<xsl:value-of select="@text:start-value"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-list">
		<xsl:if test="@text:num-regular-exp">
			<xsl:element name="???:????????????????????????_4120">
				<xsl:choose>
					<xsl:when test="@text:num-regular-exp='true'or @text:num-regular-exp='1'">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-list">
		<xsl:if test="not(number(@text:level)=10)">
			<xsl:element name="???:??????_4112">
				<xsl:attribute name="?????????_4121"><xsl:value-of select="number(@text:level)"/></xsl:attribute>
				<xsl:for-each select="style:list-level-properties/style:list-level-label-alignment">
					<xsl:if test="@text:label-followed-by">
						<xsl:element name="???:????????????_4114">
							<xsl:choose>
								<xsl:when test="@text:label-followed-by = 'listtab'">tab</xsl:when>
								<xsl:when test="@text:label-followed-by = 'space'">space</xsl:when>
								<xsl:otherwise>none</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="style:list-level-properties/@fo:text-align">
					<xsl:element name="???:??????????????????_4113">
						<xsl:variable name="vv">
							<xsl:value-of select="style:list-level-properties/@fo:text-align"/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$vv='center' ">center</xsl:when>
							<xsl:when test="$vv='end' ">right</xsl:when>
							<xsl:otherwise>left</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
				</xsl:if>
				<xsl:call-template name="???:????????????-list"/>
				<xsl:call-template name="???:????????????-list"/>
				<xsl:call-template name="???:????????????-list"/>
				<xsl:call-template name="???:??????????????????-list"/>
				<xsl:call-template name="???:??????????????????-list"/>
				<xsl:call-template name="???:??????-list"/>
				<xsl:call-template name="???:???????????????-list"/>
				<xsl:call-template name="???:????????????-list"/>
				<xsl:call-template name="???:????????????-list"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template match="text:list-level-style-bullet" mode="liststyle">
		<xsl:call-template name="???:??????-list"/>
	</xsl:template>
	<xsl:template match="text:list-level-style-image" mode="liststyle">
		<xsl:call-template name="???:??????-list"/>
	</xsl:template>
	<xsl:template match="text:list-level-style-number" mode="liststyle">
		<xsl:call-template name="???:??????-list"/>
	</xsl:template>
	<xsl:template match="text:list-style" mode="liststyle">
		<xsl:element name="???:????????????_4124">
			<xsl:attribute name="?????????_4100"><xsl:value-of select="concat(@style:name,'_num')"/></xsl:attribute>
			<xsl:if test=".//@text:style-name">
				<xsl:attribute name="??????_4122"><xsl:value-of select=".//@text:style-name"/></xsl:attribute>
			</xsl:if>
			<xsl:for-each select="*">
				<xsl:apply-templates mode="liststyle" select="."/>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="AutoNumbers_text">
		<xsl:element name="??????:???????????????_990E">
			<xsl:for-each select="/office:document//text:list-style">
				<xsl:apply-templates mode="liststyle" select="."/>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="???:??????-texttable">
		<xsl:if test="style:table-properties/@style:width or style:table-properties/@style:rel-width">
			<xsl:element name="???:??????_41A1">
				<xsl:if test="style:table-properties/@style:width">
					<xsl:attribute name="????????????_41BF"><xsl:value-of select="fun:Convert2uofUnit(style:table-properties/@style:width)"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="style:table-properties/@style:rel-width">
					<xsl:attribute name="????????????_41C0"><xsl:value-of select="number(substring-before(style:table-properties/@style:rel-width,'%'))"/></xsl:attribute>
				</xsl:if>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-texttable">
		<xsl:if test="style:table-properties/@table:align">
			<xsl:element name="???:??????_41C3">
				<xsl:choose>
					<xsl:when test="style:table-properties/@table:align='right'">right</xsl:when>
					<xsl:when test="style:table-properties/@table:align='center'">center</xsl:when>
					<xsl:otherwise>left</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:?????????-texttable">
		<xsl:if test="style:table-properties/@fo:margin-left">
			<xsl:element name="???:?????????_41C4">
				<xsl:value-of select="fun:Convert2uofUnit(style:table-properties/@fo:margin-left)"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-texttable">
		<xsl:param name="Type"/>
		<???:??????_41C5>
			<xsl:choose>
				<xsl:when test="@style:wrap= 'parallel'">around</xsl:when>
				<xsl:when test="$Type = 'parallel'">around</xsl:when>
				<xsl:otherwise>none</xsl:otherwise>
			</xsl:choose>
		</???:??????_41C5>
	</xsl:template>
	<xsl:template name="???:????????????-texttable">
		<xsl:if test="style:table-properties/@fo:margin-top or style:table-properties/@fo:margin-left or style:table-properties/@fo:margin-right or style:table-properties/@fo:margin-bottom">
			<xsl:element name="???:????????????_41C6">
				<xsl:if test="style:table-properties/@fo:margin-top">
					<xsl:attribute name="???_C609"><xsl:value-of select="fun:Convert2uofUnit(style:table-properties/@fo:margin-top)"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="style:table-properties/@fo:margin-left">
					<xsl:attribute name="???_C608"><xsl:value-of select="fun:Convert2uofUnit(style:table-properties/@fo:margin-left)"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="style:table-properties/@fo:margin-right">
					<xsl:attribute name="???_C60A"><xsl:value-of select="fun:Convert2uofUnit(style:table-properties/@fo:margin-right)"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="style:table-properties/@fo:margin-bottom">
					<xsl:attribute name="???_C60B"><xsl:value-of select="fun:Convert2uofUnit(style:table-properties/@fo:margin-bottom)"/></xsl:attribute>
				</xsl:if>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-texttable">
		<xsl:if test="style:table-properties/@style:horizontal-rel | style:table-properties/@style:vertical-rel">
			<xsl:variable name="horizontalRel">
				<xsl:value-of select="style:table-properties/@style:horizontal-rel"/>
			</xsl:variable>
			<xsl:variable name="verticalRel">
				<xsl:value-of select="style:table-properties/@style:vertical-rel"/>
			</xsl:variable>
			<???:??????_41C7>
				<uof:??????_4106>
					<xsl:attribute name="?????????_410C"><xsl:choose><xsl:when test="horizontalRel='page-content'">margin</xsl:when><xsl:when test="horizontalRel='page'">page</xsl:when><xsl:when test="horizontalRel='char'">char</xsl:when><xsl:when test="horizontalRel='paragraph' or horizontalRel='paragraph-content'">column</xsl:when><xsl:otherwise>column</xsl:otherwise></xsl:choose></xsl:attribute>
					<uof:??????_4109>
						<xsl:attribute name="?????????_410A"><xsl:choose><xsl:when test="style:table-properties/@style:horizontal-pos='from-left'">left</xsl:when><xsl:when test="style:table-properties/@style:horizontal-pos != ''"><xsl:value-of select="style:table-properties/@style:horizontal-pos"/></xsl:when><xsl:otherwise>left</xsl:otherwise></xsl:choose></xsl:attribute>
						<!--<xsl:if test="style:table-properties/@svg:x">
							<xsl:attribute name="???_410B"><xsl:value-of select="fun:Convert2uofUnit(style:table-properties/@svg:x)"/></xsl:attribute>
						</xsl:if>-->
					</uof:??????_4109>
				</uof:??????_4106>
				<uof:??????_410D>
					<xsl:attribute name="?????????_410C"><xsl:choose><xsl:when test="verticalRel='page-content'">margin</xsl:when><xsl:when test="verticalRel='line'">line</xsl:when><xsl:when test="verticalRel='page'">page</xsl:when><xsl:when test="verticalRel='paragraph' or verticalRel='paragraph-content'">paragraph</xsl:when><xsl:otherwise>paragraph</xsl:otherwise></xsl:choose></xsl:attribute>
					<uof:??????_4109>
						<xsl:attribute name="?????????_410A"><xsl:choose><xsl:when test="style:table-properties/@style:vertical-pos='from-top'">top</xsl:when><xsl:when test="style:table-properties/@style:vertical-pos != ''"><xsl:value-of select="style:table-properties/@style:vertical-pos"/></xsl:when><xsl:otherwise>top</xsl:otherwise></xsl:choose></xsl:attribute>
						<!--<xsl:if test="style:table-properties/@svg:y">
							<xsl:attribute name="???_410B"><xsl:value-of select="fun:Convert2uofUnit(style:table-properties/@svg:y)"/></xsl:attribute>
						</xsl:if>-->
					</uof:??????_4109>
				</uof:??????_410D>
			</???:??????_41C7>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-texttable">
		<xsl:element name="???:???????????????_4227">
			<xsl:for-each select="style:table-properties">
				<!-- only support shadow -->
				<xsl:if test="@style:shadow[.!='none']">
					<xsl:variable name="shadowAngle">
						<xsl:call-template name="getShadowAngle">
							<xsl:with-param name="style_shadow" select="@style:shadow"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:attribute name="????????????_C645" select="$shadowAngle"/>
				</xsl:if>
				<xsl:call-template name="Border"/>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="???:??????-texttable">
		<xsl:if test="style:table-properties/style:background-image/office:binary-data or style:table-properties/@fo:background-color  or style:page-layout-properties/@fo:background-color">
			<???:??????_4134>
				<xsl:for-each select="style:table-properties">
					<xsl:call-template name="UOFFill"/>
				</xsl:for-each>
			</???:??????_4134>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????????????????-texttable">
		<xsl:element name="???:????????????????????????_41C8">true</xsl:element>
	</xsl:template>
	<xsl:template name="???:?????????????????????-texttable">
		<xsl:element name="???:?????????????????????_41CA">
			<xsl:attribute name="???_C609">0.10</xsl:attribute>
			<xsl:attribute name="???_C608">0.10</xsl:attribute>
			<xsl:attribute name="???_C60A">0.10</xsl:attribute>
			<xsl:attribute name="???_C60B">0.10</xsl:attribute>
		</xsl:element>
	</xsl:template>
	<xsl:template name="???:?????????????????????-texttable">
		<xsl:if test="style:table-properties/@style:table-cell-spacing">
			<xsl:element name="???:?????????????????????_41CB">
				<xsl:value-of select="fun:Convert2uofUnit(style:table-properties/@style:table-cell-spacing)"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="TextTableAttribute">
		<xsl:param name="Type"/>
		<xsl:call-template name="???:??????-texttable"/>
		<xsl:call-template name="???:??????-texttable"/>
		<xsl:call-template name="???:?????????-texttable"/>
		<xsl:call-template name="???:??????-texttable">
			<xsl:with-param name="Type" select="$Type"/>
		</xsl:call-template>
		<xsl:call-template name="???:????????????-texttable"/>
		<xsl:call-template name="???:??????-texttable"/>
		<xsl:call-template name="???:??????-texttable"/>
		<xsl:call-template name="???:??????-texttable"/>
		<xsl:call-template name="???:??????????????????-texttable"/>
		<xsl:call-template name="???:?????????????????????-texttable"/>
		<xsl:call-template name="???:?????????????????????-texttable"/>
	</xsl:template>
	<xsl:template name="OneTextTableStyle">
		<xsl:param name="Type"/>
		<xsl:element name="??????:???????????????_9918">
			<xsl:choose>
				<xsl:when test="$Type='default'">
					<xsl:attribute name="?????????_4100"><xsl:value-of select="string('DefaultTable')"/></xsl:attribute>
					<xsl:attribute name="??????_4101"><xsl:value-of select="string('DefaultTable')"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="$Type='parallel'">
					<xsl:attribute name="?????????_4100"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="?????????_4100"><xsl:value-of select="@style:name"/></xsl:attribute>
					<xsl:attribute name="??????_4101"><xsl:value-of select="@style:name"/></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:attribute name="??????_4102"><xsl:choose><xsl:when test="$Type='parallel'"><xsl:value-of select="'auto'"/></xsl:when><xsl:otherwise><xsl:value-of select="$Type"/></xsl:otherwise></xsl:choose></xsl:attribute>
			<xsl:if test="@style:parent-style-name">
				<xsl:attribute name="???????????????_4104"><xsl:value-of select="@style:parent-style-name"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@style:display-name">
				<xsl:attribute name="??????_4103"><xsl:value-of select="@style:display-name"/></xsl:attribute>
			</xsl:if>
			<xsl:call-template name="TextTableAttribute">
				<xsl:with-param name="Type" select="$Type"/>
			</xsl:call-template>
		</xsl:element>
	</xsl:template>
	<xsl:template name="TextTableStyles">
		<xsl:for-each select="office:styles/style:default-style[@style:family='table']">
			<xsl:call-template name="OneTextTableStyle">
				<xsl:with-param name="Type">
					<xsl:value-of select="string('default')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
		<xsl:for-each select="office:styles/style:style[@style:family='table']">
			<xsl:call-template name="OneTextTableStyle">
				<xsl:with-param name="Type">
					<xsl:value-of select="string('custom')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
		<xsl:for-each select="office:automatic-styles/style:style[@style:family='table']">
			<xsl:call-template name="OneTextTableStyle">
				<xsl:with-param name="Type">
					<xsl:value-of select="string('auto')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
		<!--deal with the table:table's attribute style:wrap-->
		<xsl:for-each select="office:body/office:text/table:table[@style:wrap = 'parallel']">
			<xsl:variable name="styleName" select="@table:style-name"/>
			<xsl:for-each select="key('Style',$styleName)">
				<xsl:call-template name="OneTextTableStyle">
					<xsl:with-param name="Type">
						<xsl:value-of select="string('parallel')"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="???:??????????????????-tablecell">
		<xsl:variable name="horizontalTableCell">
			<xsl:choose>
				<xsl:when test="style:table-cell-properties/@style:text-align-source='value-type'">
					<xsl:value-of select="string('general')"/>
				</xsl:when>
				<xsl:when test="style:paragraph-properties/@fo:text-align = 'auto'">
					<xsl:value-of select="string('general')"/>
				</xsl:when>
				<xsl:when test="style:paragraph-properties/@fo:text-align = 'justify'">
					<xsl:value-of select="string('justify')"/>
				</xsl:when>
				<xsl:when test="style:paragraph-properties/@fo:text-align = 'left'">
					<xsl:value-of select="string('left')"/>
				</xsl:when>
				<xsl:when test="style:paragraph-properties/@fo:text-align = 'center'">
					<xsl:value-of select="string('center')"/>
				</xsl:when>
				<xsl:when test="style:paragraph-properties/@fo:text-align = 'right'">
					<xsl:value-of select="string('right')"/>
				</xsl:when>
				<xsl:when test="style:table-cell-properties/@style:repeat-content='true'">
					<xsl:value-of select="string('fill')"/>
				</xsl:when>
				<xsl:when test="style:paragraph-properties/@fo:text-align = 'start'">
					<xsl:value-of select="string('left')"/>
				</xsl:when>
				<xsl:when test="style:paragraph-properties/@fo:text-align = 'end'">
					<xsl:value-of select="string('right')"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="$horizontalTableCell != ''">
			<???:??????????????????_E700>
				<xsl:value-of select="$horizontalTableCell"/>
			</???:??????????????????_E700>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????????????????-tablecell">
		<xsl:variable name="verticalTableCell">
			<xsl:choose>
				<xsl:when test="style:table-cell-properties/@style:vertical-align='top'">
					<xsl:value-of select="string('top')"/>
				</xsl:when>
				<xsl:when test="style:table-cell-properties/@style:vertical-align='middle'">
					<xsl:value-of select="string('center')"/>
				</xsl:when>
				<xsl:when test="style:table-cell-properties/@style:vertical-align='bottom'">
					<xsl:value-of select="string('bottom')"/>
				</xsl:when>
				<xsl:when test="style:table-cell-properties/@style:vertical-align='auto'">
					<xsl:choose>
						<xsl:when test="style:table-cell-properties/@style:rotation-angle &gt;= 270">center</xsl:when>
						<xsl:otherwise>bottom</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="$verticalTableCell != ''">
			<???:??????????????????_E701>
				<xsl:value-of select="$verticalTableCell"/>
			</???:??????????????????_E701>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-tablecell">
		<!--UOF???????????????????????????????????????0~15???????????????-->
		<!--ODF?????????????????????????????????????????????????????????????????????-->
		<xsl:if test="style:paragraph-properties/@fo:margin-left and style:paragraph-properties/@fo:text-align = 'start'">
			<???:??????_E702>
				<xsl:variable name="margin" select="fun:Convert2uofUnit(style:paragraph-properties/@fo:margin-left)"/>
				<xsl:choose>
					<xsl:when test="$margin &gt; 15">15</xsl:when>
					<xsl:when test="$margin &lt; 0">0</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$margin"/>
					</xsl:otherwise>
				</xsl:choose>
			</???:??????_E702>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????????????????-tablecell">
		<xsl:if test="style:table-cell-properties/@style:direction">
			<???:??????????????????_E703>
				<xsl:choose>
					<xsl:when test="style:table-cell-properties/@style:direction = 'ttb'">r2l-t2b-0e-90w</xsl:when>
					<xsl:otherwise>t2b-l2r-0e-0w</xsl:otherwise>
				</xsl:choose>
			</???:??????????????????_E703>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????????????????-tablecell">
		<xsl:if test="style:table-cell-properties/@style:rotation-angle">
			<???:??????????????????_E704>
				<xsl:choose>
					<xsl:when test="style:table-cell-properties/@style:rotation-angle &lt;= 90">
						<xsl:value-of select="style:table-cell-properties/@style:rotation-angle"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="(style:table-cell-properties/@style:rotation-angle &lt; 360) and not(style:table-cell-properties/@style:rotation-angle &lt; 270)">
								<xsl:value-of select="style:table-cell-properties/@style:rotation-angle - 360"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="180 - style:table-cell-properties/@style:rotation-angle"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</???:??????????????????_E704>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-tablecell">
		<xsl:if test="style:table-cell-properties/@fo:wrap-option">
			<???:??????????????????_E705>
				<xsl:choose>
					<xsl:when test="style:table-cell-properties/@fo:wrap-option = 'wrap'">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</???:??????????????????_E705>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????????????????-tablecell">
		<xsl:if test="style:table-cell-properties/@style:shrink-to-fit">
			<???:????????????????????????_E706>
				<xsl:choose>
					<xsl:when test="style:table-cell-properties/@style:shrink-to-fit = 'true'">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</???:????????????????????????_E706>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-tablecell">
		<???:????????????_E7A8>
			<xsl:call-template name="???:??????????????????-tablecell"/>
			<xsl:call-template name="???:??????????????????-tablecell"/>
			<xsl:call-template name="???:??????-tablecell"/>
			<xsl:call-template name="???:??????????????????-tablecell"/>
			<xsl:call-template name="???:??????????????????-tablecell"/>
			<xsl:call-template name="???:????????????-tablecell"/>
			<xsl:call-template name="???:??????????????????-tablecell"/>
		</???:????????????_E7A8>
	</xsl:template>
	<xsl:template name="NumberElementAttribute">
		<xsl:if test="@number:transliteration-format='???' and @number:transliteration-style='short'">[NatNum1]</xsl:if>
		<xsl:if test="@number:transliteration-format='???' and @number:transliteration-style='medium'">[NatNum7]</xsl:if>
		<xsl:if test="@number:transliteration-format='???' and @number:transliteration-style='long'">[NatNum4]</xsl:if>
		<xsl:if test="@number:transliteration-format='???' and @number:transliteration-style='short'">[NatNum2]</xsl:if>
		<xsl:if test="@number:transliteration-format='???' and @number:transliteration-style='medium'">[NatNum8]</xsl:if>
		<xsl:if test="@number:transliteration-format='???' and @number:transliteration-style='long'">[NatNum5]</xsl:if>
		<xsl:if test="@number:transliteration-format='???' and @number:transliteration-style='short'">[NatNum3]</xsl:if>
		<xsl:if test="@number:transliteration-format='???' and @number:transliteration-style='medium'">[NatNum0]</xsl:if>
		<xsl:if test="@number:transliteration-format='???' and @number:transliteration-style='long'">[NatNum6]</xsl:if>
		<xsl:if test="@number:transliteration-format='1' and @number:transliteration-style='short'">[NatNum0]</xsl:if>
		<xsl:if test="@number:transliteration-format='1' and @number:transliteration-style='medium'">[NatNum0]</xsl:if>
		<xsl:if test="@number:transliteration-format='1' and @number:transliteration-style='long'">[NatNum0]</xsl:if>
		<xsl:if test="@number:transliteration-language='zh' and @number:transliteration-country='CN'">[$-804]</xsl:if>
	</xsl:template>
	<xsl:template name="GeneralCurrencyFormat">
		<xsl:choose>
			<xsl:when test="text()='???' and @number:language='zh' and @number:country='CN'">[$???-804]</xsl:when>
			<xsl:when test="text()='US$' and @number:language='zh' and @number:country='CN'">[$US$-804]</xsl:when>
			<xsl:when test="text()='$' and @number:language='en' and @number:country='US'">[$$-409]</xsl:when>
			<xsl:when test="text()='$' and @number:language='es' and @number:country='AR'">[$$-2C0A]</xsl:when>
			<xsl:when test="text()='$' and @number:language='fr' and @number:country='CA'">[$$-C0C]</xsl:when>
			<xsl:when test="text()='CNY'">[$CNY]</xsl:when>
			<xsl:when test="text()='AFA'">[$AFA]</xsl:when>
			<xsl:when test="text()='CCC'">CCC</xsl:when>
			<xsl:otherwise>???</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GeneralColorFormat">
		<xsl:choose>
			<xsl:when test="@fo:color='#000000'">[Black]</xsl:when>
			<xsl:when test="@fo:color='#0000ff'">[Blue]</xsl:when>
			<xsl:when test="@fo:color='#00ffff'">[Cyan]</xsl:when>
			<xsl:when test="@fo:color='#00ff00'">[Green]</xsl:when>
			<xsl:when test="@fo:color='#ff00ff'">[Magenta]</xsl:when>
			<xsl:when test="@fo:color='#ff0000'">[Red]</xsl:when>
			<xsl:when test="@fo:color='#ffffff'">[White]</xsl:when>
			<xsl:when test="@fo:color='#ffff00'">[Yellow]</xsl:when>
			<xsl:otherwise>[Black]</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GeneralNumberFormat">
		<xsl:choose>
			<xsl:when test="name(.)='style:text-properties'">
				<xsl:call-template name="GeneralColorFormat"/>
			</xsl:when>
			<xsl:when test="name(.)='number:text'">"<xsl:value-of select="text()"/>"</xsl:when>
			<xsl:when test="name(.)='number:text-content' ">@</xsl:when>
			<xsl:when test="name(.)='number:boolean'">boolean</xsl:when>
			<xsl:when test="name(.)='number:currency-symbol'">
				<xsl:call-template name="GeneralCurrencyFormat"/>
			</xsl:when>
			<xsl:when test="name(.)='number:fraction' or name(.)='number:number' or name(.)='number:scientific-number'">
				<xsl:if test="@number:min-integer-digits and not(@number:grouping)">
					<xsl:choose>
						<xsl:when test="@number:min-integer-digits='0'">#</xsl:when>
						<xsl:when test="@number:min-integer-digits='1'">0</xsl:when>
						<xsl:when test="@number:min-integer-digits='2'">00</xsl:when>
						<xsl:when test="@number:min-integer-digits='3'">000</xsl:when>
						<xsl:when test="@number:min-integer-digits='4'">0000</xsl:when>
						<xsl:when test="@number:min-integer-digits='5'">00000</xsl:when>
						<xsl:when test="@number:min-integer-digits='6'">000000</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="@number:min-integer-digits and @number:grouping">
					<xsl:choose>
						<xsl:when test="@number:min-integer-digits='0'">#,###</xsl:when>
						<xsl:when test="@number:min-integer-digits='1'">#,##0</xsl:when>
						<xsl:when test="@number:min-integer-digits='2'">#,#00</xsl:when>
						<xsl:when test="@number:min-integer-digits='3'">#,000</xsl:when>
						<xsl:when test="@number:min-integer-digits='4'">##0,000</xsl:when>
						<xsl:when test="@number:min-integer-digits='5'">#00,000</xsl:when>
						<xsl:when test="@number:min-integer-digits='6'">#,000,000</xsl:when>
						<xsl:when test="@number:min-integer-digits='7'">##0,000,000</xsl:when>
						<xsl:when test="@number:min-integer-digits='8'">#,#00,000,000</xsl:when>
						<xsl:otherwise>#,##0</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="@number:decimal-places and not(@number:decimal-replacement)">
					<xsl:choose>
						<xsl:when test="@number:decimal-places='0'"/>
						<xsl:when test="@number:decimal-places='1'">.0</xsl:when>
						<xsl:when test="@number:decimal-places='2'">.00</xsl:when>
						<xsl:when test="@number:decimal-places='3'">.000</xsl:when>
						<xsl:when test="@number:decimal-places='4'">.0000</xsl:when>
						<xsl:when test="@number:decimal-places='5'">.00000</xsl:when>
						<xsl:when test="@number:decimal-places='6'">.000000</xsl:when>
						<xsl:otherwise>.00</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="@number:decimal-places and @number:decimal-replacement">
					<xsl:choose>
						<xsl:when test="@number:decimal-places='0'"/>
						<xsl:when test="@number:decimal-places='1'">.#</xsl:when>
						<xsl:when test="@number:decimal-places='2'">.##</xsl:when>
						<xsl:when test="@number:decimal-places='3'">.###</xsl:when>
						<xsl:when test="@number:decimal-places='4'">.####</xsl:when>
						<xsl:when test="@number:decimal-places='5'">.#####</xsl:when>
						<xsl:when test="@number:decimal-places='6'">.######</xsl:when>
						<xsl:otherwise>.##</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="@number:display-factor">
					<xsl:choose>
						<xsl:when test="@number:display-factor='1000'">,</xsl:when>
						<xsl:when test="@number:display-factor='1000000'">,,</xsl:when>
						<xsl:when test="@number:display-factor='1000000000'">,,,</xsl:when>
						<xsl:when test="@number:display-factor='1000000000000000'">,,,,</xsl:when>
						<xsl:when test="@number:display-factor='1000000000000000000'">,,,,,</xsl:when>
						<xsl:when test="@number:display-factor='1000000000000000000000'">,,,,,</xsl:when>
						<xsl:otherwise/>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="@number:min-exponent-digits">
					<xsl:choose>
						<xsl:when test="@number:min-exponent-digits='1'">E+0</xsl:when>
						<xsl:when test="@number:min-exponent-digits='2'">E+00</xsl:when>
						<xsl:when test="@number:min-exponent-digits='3'">E+000</xsl:when>
						<xsl:when test="@number:min-exponent-digits='4'">E+0000</xsl:when>
						<xsl:when test="@number:min-exponent-digits='5'">E+00000</xsl:when>
						<xsl:when test="@number:min-exponent-digits='6'">E+000000</xsl:when>
						<xsl:otherwise>E+00</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="@number:min-numerator-digits">
					<xsl:choose>
						<xsl:when test="@number:min-numerator-digits='1' "> ?</xsl:when>
						<xsl:when test="@number:min-numerator-digits='2' "> ??</xsl:when>
						<xsl:when test="@number:min-numerator-digits='3' "> ???</xsl:when>
						<xsl:when test="@number:min-numerator-digits='4' "> ????</xsl:when>
						<xsl:when test="@number:min-numerator-digits='5' "> ?????</xsl:when>
						<xsl:when test="@number:min-numerator-digits='6' "> ??????</xsl:when>
						<xsl:otherwise> ???</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="@number:min-denominator-digits">
					<xsl:choose>
						<xsl:when test="@number:min-denominator-digits='1' ">/?</xsl:when>
						<xsl:when test="@number:min-denominator-digits='2' ">/??</xsl:when>
						<xsl:when test="@number:min-denominator-digits='3' ">/???</xsl:when>
						<xsl:when test="@number:min-denominator-digits='4' ">/????</xsl:when>
						<xsl:when test="@number:min-denominator-digits='5' ">/?????</xsl:when>
						<xsl:when test="@number:min-denominator-digits='6' ">/??????</xsl:when>
						<xsl:otherwise>/???</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:when>
			<xsl:when test="name(.)='number:year'">
				<xsl:choose>
					<xsl:when test="@number:style='long'">YYYY</xsl:when>
					<xsl:when test="@number:style='rolong'">KKKKRO</xsl:when>
					<xsl:otherwise>YY</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="name(.)='number:month'">
				<xsl:choose>
					<xsl:when test="@number:style='long' and ../@number:automatic-order='true' and ../@number:format-source='language'">M</xsl:when>
					<xsl:when test="@number:style='long' and @number:textual='true'">MMMM</xsl:when>
					<xsl:when test="not(@number:style='long') and @number:textual='true'">MMM</xsl:when>
					<xsl:when test="@number:style='long' and not(@number:textual)">MM</xsl:when>
					<xsl:when test="@number:style='rolong' and @number:textual='true'">MRO</xsl:when>
					<xsl:when test="not(@number:style='long') and not(@number:textual)">M</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="name(.)='number:day'">
				<xsl:choose>
					<xsl:when test="@number:style='long' and ../@number:automatic-order='true' and ../@number:format-source='language'">D</xsl:when>
					<xsl:when test="@number:style='long'">DD</xsl:when>
					<xsl:when test="@number:style='rolong'">DRO</xsl:when>
					<xsl:when test="@number:style='short'">D</xsl:when>
					<xsl:otherwise>D</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="name(.)='number:day-of-week'">
				<xsl:choose>
					<xsl:when test="@number:style='long'">NNNN</xsl:when>
					<xsl:otherwise>NNN</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="name(.)='number:quarter'">
				<xsl:choose>
					<xsl:when test="@number:style='rolong'">QQRO</xsl:when>
					<xsl:when test="@number:style='long'">QQ</xsl:when>
					<xsl:otherwise>Q</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="name(.)='number:hours'">
				<xsl:choose>
					<xsl:when test="@number:style='long' and ../@number:truncate-on-overflow='false'">[HH]</xsl:when>
					<xsl:when test="@number:style='long'">HH</xsl:when>
					<xsl:otherwise>H</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="name(.)='number:minutes'">
				<xsl:choose>
					<xsl:when test="@number:style='long'">MM</xsl:when>
					<xsl:otherwise>M</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="name(.)='number:seconds'">
				<xsl:choose>
					<xsl:when test="@number:style='long' and @number:decimal-places='2'">SS.00</xsl:when>
					<xsl:when test="@number:style='long'">SS</xsl:when>
					<xsl:otherwise>S</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="name(.)='number:am-pm'">
				<xsl:choose>
					<xsl:when test="../@number:language = 'en'">AM/PM</xsl:when>
					<xsl:otherwise>??????/??????</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="name(.)='number:week-of-year'">
				<xsl:choose>
					<xsl:when test="@number:style='long'">WW</xsl:when>
					<xsl:otherwise>WW</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="NumberFormat">
		<xsl:for-each select="key('AllNumberStyle', @style:data-style-name)">
			<xsl:variable name="class">
				<xsl:choose>
					<xsl:when test="name(.)='number:currency-style'">currency</xsl:when>
					<xsl:when test="name(.)='number:percentage-style'">percentage</xsl:when>
					<xsl:when test="name(.)='number:date-style'">date</xsl:when>
					<xsl:when test="name(.)='number:time-style'">time</xsl:when>
					<xsl:when test="name(.)='number:boolean-style'">custom</xsl:when>
					<xsl:when test="name(.)='number:text-style'">text</xsl:when>
					<xsl:when test="name(.)='number:number-style'">
						<xsl:choose>
							<xsl:when test="number:fraction">fraction</xsl:when>
							<xsl:when test="number:scientific-number">scientific</xsl:when>
							<xsl:otherwise>number</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>general</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="classcode">
				<xsl:call-template name="NumberElementAttribute"/>
				<xsl:for-each select="style:map">
					<xsl:variable name="apply-style" select="@style:apply-style-name"/>
					<xsl:for-each select="/office:document/office:styles/number:*[@style:name=$apply-style]/* | /office:document/office:automatic-styles/number:*[@style:name=$apply-style]/*">
						<xsl:call-template name="GeneralNumberFormat"/>
					</xsl:for-each>
					<xsl:text>;</xsl:text>
				</xsl:for-each>
				<xsl:for-each select="*[not(name(.)='style:map')]">
					<xsl:call-template name="GeneralNumberFormat"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:attribute name="????????????_E740"><xsl:value-of select="$class"/></xsl:attribute>
			<xsl:attribute name="?????????_E73F"><xsl:value-of select="$classcode"/></xsl:attribute>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="OneTableCellStyle">
		<xsl:param name="Type"/>
		<xsl:element name="??????:???????????????_9916">
			<xsl:choose>
				<xsl:when test="$Type='default'">
					<xsl:attribute name="?????????_E7AC"><xsl:value-of select="string('DefaultTableCell')"/></xsl:attribute>
					<xsl:attribute name="??????_E7AD"><xsl:value-of select="string('DefaultTableCell')"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="?????????_E7AC"><xsl:value-of select="@style:name"/></xsl:attribute>
					<xsl:attribute name="??????_E7AD"><xsl:value-of select="@style:name"/></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:attribute name="??????_E7AE"><xsl:value-of select="$Type"/></xsl:attribute>
			<xsl:if test="@style:parent-style-name">
				<xsl:attribute name="???????????????_E827"><xsl:value-of select="@style:parent-style-name"/></xsl:attribute>
			</xsl:if>
			<!--???:????????????-->
			<xsl:element name="???:????????????_E7A7">
				<xsl:call-template name="UOFTextStyle"/>
			</xsl:element>
			<!--???:????????????-->
			<xsl:call-template name="???:????????????-tablecell"/>
			<xsl:if test="@style:data-style-name">
				<???:????????????_E7A9>
					<xsl:call-template name="NumberFormat"/>
				</???:????????????_E7A9>
			</xsl:if>
			<!--???:??????-->
			<xsl:element name="???:??????_4133">
				<xsl:for-each select="style:table-cell-properties">
					<xsl:if test="@style:shadow[.!='none']">
						<xsl:variable name="shadowAngle">
							<xsl:call-template name="getShadowAngle">
								<xsl:with-param name="style_shadow" select="@style:shadow"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:attribute name="????????????_C645" select="$shadowAngle"/>
					</xsl:if>
					<xsl:call-template name="Border"/>
				</xsl:for-each>
			</xsl:element>
			<!--???:??????-->
			<xsl:if test="style:table-cell-properties/style:background-image/office:binary-data or (style:table-cell-properties/@fo:background-color and not(style:table-cell-properties/@fo:background-color = 'transparent'))">
				<xsl:element name="???:??????_E7A3">
					<xsl:call-template name="UOFFill"/>
				</xsl:element>
			</xsl:if>
			<xsl:call-template name="create-condition-format"/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="TableCellStyles">
		<!--uof??????????????????????????????????????????????????????????????????????????????-->
		<!--<xsl:for-each select="office:styles/style:default-style[@style:family='table-cell'or @style:family='table']">-->
		<xsl:for-each select="office:styles/style:default-style[@style:family='table-cell']">
			<xsl:call-template name="OneTableCellStyle">
				<xsl:with-param name="Type">
					<xsl:value-of select="string('default')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
		<!--uof??????????????????????????????????????????????????????????????????????????????-->
		<!--<xsl:for-each select="office:styles/style:style[@style:family='table-cell' or @style:family='table']">-->
		<xsl:for-each select="office:styles/style:style[@style:family='table-cell']">
			<xsl:call-template name="OneTableCellStyle">
				<xsl:with-param name="Type">
					<xsl:value-of select="string('custom')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
		<!--uof??????????????????????????????????????????????????????????????????????????????-->
		<!--<xsl:for-each select="office:automatic-styles/style:style[@style:family='table-cell' or @style:family='table']">-->
		<xsl:for-each select="office:automatic-styles/style:style[@style:family='table-cell']">
			<xsl:call-template name="OneTableCellStyle">
				<xsl:with-param name="Type">
					<xsl:value-of select="string('auto')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="???:??????-graph">
		<xsl:param name="graphproperty"/>
		<xsl:choose>
			<!--<xsl:when test="@draw:fill='solid' or (not(@draw:fill) and draw:fill-color">-->
			<xsl:when test="$graphproperty/@draw:fill='solid'">
				<!--??????????????????????????????-->
				<xsl:variable name="colorvalue">
					<xsl:choose>
						<xsl:when test="$graphproperty/@fo:background-color='transparent' or $graphproperty/@fo:background-color='transprent'">auto</xsl:when>
						<xsl:when test="$graphproperty/@draw:fill-color != ''">
							<xsl:value-of select="$graphproperty/@draw:fill-color"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$graphproperty/@fo:background-color"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<???:??????_8004>
					<xsl:value-of select="$colorvalue"/>
				</???:??????_8004>
			</xsl:when>
			<xsl:when test="$graphproperty/@draw:fill='hatch'">
				<!--??????????????????office:binary-data?????????-->
				<!--xsl:when test="/office:document/office:styles/draw:fill-image[@draw:name = $graphproperty/@draw:fill-image-name]/office:binary-data or $graphproperty/@draw:fill='hatch'"-->
				<???:??????_800A>
					<xsl:variable name="hatchStyleName" select="$graphproperty/@draw:fill-hatch-name"/>
					<xsl:variable name="imagename" select="$graphproperty/@draw:fill-image-name"/>
					<xsl:variable name="fillcolor" select="$graphproperty//@draw:fill-color"/>
					<xsl:choose>
						<xsl:when test="/office:document/office:styles/draw:hatch">
							<xsl:for-each select="/office:document/office:styles/draw:hatch[@draw:name = $hatchStyleName]">
								<xsl:attribute name="??????_8008"><xsl:value-of select="@draw:name"/></xsl:attribute>
								<!--xsl:attribute name="????????????_8007"/-->
								<xsl:if test="@draw:color">
									<xsl:attribute name="?????????_800B"><xsl:value-of select="@draw:color"/></xsl:attribute>
								</xsl:if>
								<xsl:attribute name="?????????_800C"><xsl:choose><xsl:when test="$fillcolor"><xsl:value-of select="$fillcolor"/></xsl:when><xsl:otherwise>#ffffff</xsl:otherwise></xsl:choose></xsl:attribute>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="/office:document/office:styles/draw:fill-image">
							<xsl:for-each select="/office:document/office:styles/draw:fill-image[@draw:name = $imagename]">
								<xsl:choose>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJElEQVR4nGNh+M/wn5EBE7BgFQVJYBcmVoIRyT4UCWT7SLcDAC48BiC0r93dAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn001'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#00ff00'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAI0lEQVR4nGP5//8/AzbAglUUvwQjAwM2w1iwipJpBzJAsg8AQFcGHZrs6e8AAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn001'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#ff78bd'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJElEQVR4nGNhYPjP8J+RAQOwYBUFS+AAREowIuxDlUCyj3Q7ACg9BiAi8rOrAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn001'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJklEQVR4nGP5z8DA8B9EoAEWrKJgCWTAyAhXhyqBpJsFWRWN7AAAOSsRFt141QcAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn002'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#ff0000'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKklEQVR4nGP5z8DACMRg8J8RwWaBsxiQVIAkMNVC2CyYaiFsFky1VLcDAOahGCD63ouBAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn003'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#ff0000'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAI0lEQVR4nGNhYPj//z8DBDAyMsDZLBAWRAiZzYIpBGEPqA4A/1o9AqgXatAAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn004'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKUlEQVR4nGNhYPj//z8DIyMDGskCZzEwMCCzWTDVInSgqYWw8eqgkh0A7ZVBDhySK7QAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn005'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKUlEQVR4nGNhYPj//z8DIyMDGsmCVRRIsmAVxaKDgYFUHcTZATcXmQQA8ftBGoRo5DEAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn006'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAHklEQVR4nGNhYPj//z8DIyMDGsmCVRRIsmAVHWgdAPL9QR46gf26AAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn007'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKklEQVR4nGNhYPjPAAb//zMwMjLA2SwQPibJAmcBATIbrw40tRA2Fe0AAP6iMSo4Vov8AAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn008'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAI0lEQVR4nGP5//8/IyMDBPz/zwBns0BYECFkNgumEIQ9oDoAnUwhPDtydwUAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn009'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAK0lEQVR4nGP5//8/IyMDBPz/zwBns8BZQIDMZsFUC2GzYKqFsFkw1VLdDgAA8xEwmsNKVwAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn010'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAALElEQVR4nGP5//+/icksBjA4cyYNzmaBs4AAmc2CqRbCZsFUC2GzYKqluh0ANq4hMPEukbMAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn010'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#ffffff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKklEQVR4nGNhYPjPAAb//zMwMjLAAQuchSyKIoEMgLqxSwB1syCropEdADipCSSSiwzsAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn011'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJElEQVR4nGNhYPjPgA2wYBUlWuL/fwZGRmwScFHy7EA2FxkAAOHDBSIH/WEvAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn012'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAALUlEQVR4nGNhYPj//z8DBDAyMsDZLEAWnI/MZkHjw9ksEI2YcixYzQHpoJ4dAOY1OQZM1tGbAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn013'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKElEQVR4nGP5//8/AxgwMjLAmCA2C1ZRIJsFqygQsGAVBUlgFaWuHQBj1iEg8vXVKAAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn014'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAMUlEQVR4nGNhYPjPAMQggoGRkQHOZgFSQD4QARnIbBaIEkw5Fky1EDYLxGhMOSraAQCLbjkg7ZCwuwAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn015'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJ0lEQVR4nGNhYPjPAMKMQJIRic2CVRTIZsEqCtWBKQpks2AVpa4dAI7FICCCNCzYAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn016'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
										<xsl:attribute name="?????????_800C"><xsl:value-of select="'#ff00ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKUlEQVR4nGNhYPjPAMQggoGRkQHOZsEqCmSzYBWF6sAUBbJZsIpS1w4AYkkhHuKbNUYAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn016'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAN0lEQVR4nGXOAQoAQARE0VH//lfenU2hpUheBOnI+UpHhKhumnucnm4jfRu1+xnz7rSGz9j/pF2YoB0gtk9UpQAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn017'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAMUlEQVR4nGNhYPj//z8DMmBkBJEsWEVBElhFgapZsIoidKCJQiUwRUESWEURRmG6DQAbfBEgGcS1uwAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn018'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAHElEQVR4nGNhYPj//z8DBDAyMsDZLAw4wOCUAADHvwUeDEtdDgAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn019'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAGklEQVR4nGP5/58BK2BhZMQhgV0YnwQd7AAAYJIEISB3Q/YAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn020'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#ffff00'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAIElEQVR4nGNhYPjPgA2w/McuzsCCXRifBCMjDgnq2QEAwAgFHjYAUNQAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn020'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAGklEQVR4nGNhYPj//z8DIyMDGsnCgAMMTgkApfgJHqRbf9cAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn021'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAHElEQVR4nGNhYPjPgA2w/McuzsDCyIhDYiB1AADmewkeUS/FOwAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn022'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAGElEQVR4nGNh+P+fARtgYWBgxCUxCHUAALvMBSC5rp57AAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn022'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#00ff00'"/></xsl:attribute>
										<xsl:attribute name="?????????_800C"><xsl:value-of select="'#00ffff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAF0lEQVR4nGNh+M+AFbAw4JABSjAOPh0AV88FH0+MxjkAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn022'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#00ff00'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAHElEQVR4nGNhYPjPAMQggoGRkQHOZmHAAQanBAC7ywUeNxfiogAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn023'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAIElEQVR4nGNhYPjPgA2wYBUFSfzHrgGPDkZGUnWQbAcAXGwFHqNw3RkAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn024'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAMklEQVR4nGP5//8/AzbAglUUJMHIyADXg8xmAbLgfGQ2CxofzobagSmHsBzZdQgdmAAAyBUhEFI1qLsAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn025'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAMElEQVR4nGP5//8/AzbAglUURYKRkQGuGchmwSoKZLNgFQUZhVUUJIHsKGQ2TlcBACh9FRy4as61AAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn026'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJUlEQVR4nGNhYPjPAAP/EUwGFmQOMmDBLkysBCMjDgkUy0m2AwAbsQccw3M/SgAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn027'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAIElEQVR4nGNhYPj//z8DJmDBIkauBLIFjIwMcC4V7QAAw/oHHGDxXvUAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn028'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAANUlEQVR4nGWNQQoAMAjDKuT/X+4OgpPqQUgNFsm27rDTKg2yeUsEj8f90/sfooxb2xKhj/EAW+UdErFnPgwAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn029'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAOUlEQVR4nGWO0QoAMAgCDfz/X3aOhoy6J08qIiAJVcBNaKyM/LhkUuhtDs8EhydzeOC+/jYs+zGXB++ZGRj0GfymAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn030'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAANElEQVR4nGNhYPj//z8DGmBkZGABigIpZDkIl4UBpAUhB2ewQFRB5CAMCGCBK0EzjYp2AABEjCcUaUAW6gAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn031'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAALElEQVR4nGP5//8/AzbAAmcxMoJIuDIWuChECMIAkixoCiEMIMmCwwpq2gEARxkdGBfi2AgAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn032'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAANklEQVR4nGNhYPjPgAH+MzCyYBVlZPiPLgERBTJYsIqiSABFkRWxoKlFMQrZBCADajmyKLIcAMprFiBoxxp5AAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn033'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#ff0000'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAANElEQVR4nGP5//8/AwZgZGRgwSoKVIwuAREFAhasoigSQFFkwIKmFsUoZBOADKjlyKLIcgBi7Bcg5WuxKQAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn033'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJklEQVR4nGNhYPjPgA2wAPF/bFIsWJUTkmBkxCaBbAFQBZxLuh0ALx0HHo+Ka1MAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn034'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAANUlEQVR4nGNhYPj/nwEKGIEcGJvlP4yPTIIkGFD5cDYLmglwfSyYohB9LJhqEXYw4LcDTQ4AMPkZGo5IQCMAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn035'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
										<xsl:attribute name="?????????_800C"><xsl:value-of select="'#ff00ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAN0lEQVR4nGVNQQ4AIAjCjf9/2WpsVOjBgYAQ6G5oqmDMjcTffQTg48aMD85xXpXj9N6O8GZHaAt21jEU9i1BlQAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn035'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAALElEQVR4nGNhYPj//z8DIyMDGsmCVRRIsmAVJaQDCCAkA8hCKMnCgAOQLgEA5O4lHgp+1OoAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn036'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAALUlEQVR4nGP5//8/AzbAAmcxMjIgq0FIAEWR5YjTgWIHmkKEBFZRoGrsOoAiAHAjFRgrzI7EAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn037'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJUlEQVR4nGNhYPj//z8DIyMDGskCxAwgSXSSBSKPCViwitJJBwC5tB0QWDyhJgAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn038'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAMElEQVR4nGMxNp7JgA2wAPGZM2kmJrMgfDgbJAEXRWazwIWQ9aFIIItSaAcyAOoDADXzFyjANSY3AAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn039'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#ffffff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAMElEQVR4nGNhYPj//z8DJmDBKgqSgFCMjAxwFRA2VAJZH4TNgqwdWR+KBLI+0u0AAFpvGRLKSkf3AAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn039'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAOUlEQVR4nG2NCwoAMAhCF3j/KzuHIAYTyuL1AcmzNfMyZI3SQpamh6AwcxHBlo3U6Ld9cIFgsQ+wLoWFGxgcGtpJAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn040'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAALElEQVR4nGNhYPjPgA2w/P/PwMgIYv0HK4CzWSAsuBCczYKpFiGBppbqdgAALSkVLK4WE5kAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn041'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAN0lEQVR4nHWNSQoAQAjDKvT/X+4UBBcYc4oHU0qKQCKhnDbfSbmF2PQHDji7/w3L3OPsrtS18QDeoxEoMtsKvAAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn042'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJUlEQVR4nGNhYPjPgA2wAPF/mBQjI4LNglU5IQmgCXAAZ1PRDgBm3wkgDXDgQQAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn043'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKklEQVR4nGN5YqosferOUzMVBjCAs1kYcADcEkC9EBPgQhA2C9BEWtsBAJwCGSIIxPtQAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn043'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#ffffff'"/></xsl:attribute>
										<xsl:attribute name="?????????_800C"><xsl:value-of select="'#ff0000'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAGklEQVR4nGNhYPjPgA2wAPF/bFIsWJUPtAQAJtwDHhoe2JQAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn044'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJklEQVR4nGN5YqosferOUzMVBlTAwoAD0EUC6CQgBSFRJDAdCgEAA0IJHu/iI/cAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn044'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#ffffff'"/></xsl:attribute>
										<xsl:attribute name="?????????_800C"><xsl:value-of select="'#ff0000'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKElEQVR4nGP5/5+BgZEBBP6DSRibBcRCFYKwWRhwABYGnEbh1EE1OwBLFQ4fojv/LgAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn045'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#ff0000'"/></xsl:attribute>
										<xsl:attribute name="?????????_800C"><xsl:value-of select="'#ffff00'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKUlEQVR4nGP5z8DAAMIMDIxgEsZmAbFQhSBsFgYcgAWkBLtROHVQzQ4A9OwNIMy7yHkAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn045'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#ff0000'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKklEQVR4nGNhYPj//z8DEDAygkg4mwXIQhOCsFkYcAAWoBLsRuHUQT07AB7YGSAdbcZUAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn045'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAH0lEQVR4nGNhYPjPAAP/EUwGFgYcgAwJZHMZGWliBwALswUeEhCN8AAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn046'"/></xsl:attribute>
										<xsl:attribute name="?????????_800B"><xsl:value-of select="'#0000ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = ' iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKElEQVR4nGNRZrhz57+yCuNdBjCAs1kgLEySBSIP58PZeHWgqaW6HQDkpk8sQd5vKgAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn005'"/></xsl:attribute>
										<xsl:attribute name="?????????_800C"><xsl:value-of select="'#333399'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAALElEQVR4nGP5//8/AxioqNy9c0cZzmZhgAG4KITNgqkWwmbBVAthIIyinR0Az50mQDmqEnoAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn010'"/></xsl:attribute>
										<xsl:attribute name="?????????_800C"><xsl:value-of select="'#333399'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAK0lEQVR4nGP5b2zMAAaMZ88is1ngfCCJzGZB48PZLJhqIWwWiKGYclS0AwACfUJCQU/IJQAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn013'"/></xsl:attribute>
										<xsl:attribute name="?????????_800C"><xsl:value-of select="'#ff3333'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAG0lEQVR4nGNh+P+fARtgUWZQwS5xl+HO4NMBAP+nCGbuOY6AAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn022'"/></xsl:attribute>
										<xsl:attribute name="?????????_800C"><xsl:value-of select="'#00ffff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAPUlEQVR4nGP5z/BfheEuAxjcYVAGsiEkC5wFlEBmsyCrgouCJDDVQsxkQTYH2SYWTLVQO5DNQXEVRCGm2wCx4C4nyqBe2QAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn035'"/></xsl:attribute>
										<xsl:attribute name="?????????_800C"><xsl:value-of select="'#ff00ff'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAMklEQVR4nGNRZrjDgA2wQKg7/5VVGO9ikUATBUkgq0VmsyCrRWazYFoL0YdFAqIPpx0A44IXKNx/AToAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn039'"/></xsl:attribute>
										<xsl:attribute name="?????????_800C"><xsl:value-of select="'#333399'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJUlEQVR4nGP5/58BCO6qgEjlOwg2CwMOwIKpFsLGrQNTLdXtAAD9VxEgnseUWAAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn045'"/></xsl:attribute>
										<xsl:attribute name="?????????_800C"><xsl:value-of select="'#ffff00'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = '   iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAIUlEQVR4nGP5//8/AzbAglUUrwQjIyNW01ioaAcyB9k+AAO9DBstSVK1AAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn001'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKUlEQVR4nGOZqeHDAANphVKz+p9B2CwMSAAuCpJAVoUMWLCKohtFIzsAN2YVaquFlH0AAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn002'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAALElEQVR4nGNRVr7DgA2w3BEIV/mwEsJBZrPAWUCAzGbBVAths2CqhbCpaAcAxPUjsSXviH8AAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn003'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAI0lEQVR4nGOR7OpK/1bGAAYzuRBsFggLIoTMZsEUgrAHVAcAq3dJq0qbe9YAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn004'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJElEQVR4nGNpaGAAQhABBnA2C4SFiVgg8nA+nI1XB5paqtsBAN6ENyG+vb1pAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn005'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKklEQVR4nGOR7Op6Xlom2Y1OsqDxGRgYIGwWTLXYdcBJvDrg5hKtA6scAIQYXcTwY7BfAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn006'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAHklEQVR4nGNh+M/A4O3FsHUbGsmCVRRIsmAVHWgdAJ1uP7UktXJ2AAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn007'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAMElEQVR4nGP5/z+NYRYDFKQxwNksIBaEj0qygGRnIamFsVkQJqDrwFALYVPNDgYGAHpeHCHJYPuMAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn008'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJklEQVR4nGOR7Op6xn9H6qMKAxjA2SxADGFBhOBsFkwhCHtAdQAAcSg9JIa+mA8AAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn009'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKklEQVR4nGNZd54BAtr7GSoLEWwWBhiAi0LYLJhqIWwWTLUQgDCKdnYAAK3RFxro9SLpAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn010'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJ0lEQVR4nGNpaGhgwAZYMIUkJX2eP9+CRQIoitABUYXFKDRR6toBAJq6FSc596YjAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn011'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAK0lEQVR4nGOR7OpiwAZY4KxnpaVS3d1YJJBFUSRwGkWUBNA+7BJA+3AaBQAC0Ah+yZWsQwAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn012'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAALUlEQVR4nGP5//8/AxgwMjLAmCA2C5wPJJHZLGh8OJsFUy2EzQIxFFOOinYAADx8OwaQ1VWOAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn013'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKUlEQVR4nGNhuPOfAQJUGBjuMMDZLFhFgWwWrKJAwIJVFCyBTZS6dgAAE3wRIDlgYu4AAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn014'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAMklEQVR4nGOZmXbm+awtDAwMkmk+QBLOZoFQQD4QARlwNgsaH85mgWjHlGPBag517QAAiLdV7DSstF0AAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn015'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAK0lEQVR4nGNZd54BCC5tlASSev7P4WwWrKJANgtWUagOTFEgmwWrKHXtAADkozA6i+VXKgAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn016'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAO0lEQVR4nGNhYPjPcOYsAzIwMQYSLFAWshyQbWLMglCFKscCkceUY4HrRZNjgetFk2OB60WTQ5JAlQMAcWQdIItfX/MAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn017'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAOUlEQVR4nGOZ4j6FgYHhkjwrAxjoPfwNYbBgFQVJYBWF6sAUBapmwSoK0oFVFGEUmihQNQtWUSAJAItIGZCmAj/UAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn018'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAHElEQVR4nGNh+M/A0NjAUN/AAAEwNgsDDjA4JQDARQUg8kU9AQAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn019'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAH0lEQVR4nGNhuPOfARtgwSoKllDBJXEHlwROo6hmBwAWYQP8EvqLCwAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn020'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAF0lEQVR4nGP5//8/IyMjJsnCgAMMTgkA6ywMIQCWenYAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn021'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAGElEQVR4nGNhwAFY/v//j12CkZFx8OkAAKXuDB5FnY15AAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn022'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAHklEQVR4nGP5//8/IyMjAwMDkAEk4WwWBhxgcEoAAKkECR7id7rEAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn023'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAHElEQVR4nGP5//8/AzbAglUUJMHIyEiiDjrYAQCF2QYhE3pd/wAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn024'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAL0lEQVR4nGP5//8/AxgwMjIis1kYYAAuCmEjJNAAGRJodsLZLEAWnI/MZkHjw9kAFogqDyFktcgAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn025'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKUlEQVR4nGP5//8/AzbAglWUQglGRka4fUA2C1ZRIJsFqyjIKKyiQAAA6fcYIfk0nh8AAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn026'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKElEQVR4nGP5//8/AzbAgsxhZGTELoGsG0UCp1EoEsjmohhFlKuQAQA9sAwbpfdUbgAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn027'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAIElEQVR4nGP5//8/AwwwMjLCuSwMOAAZEsjmIttHRTsAofAMG54pChoAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn028'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAANUlEQVR4nGWMQQoAQAgCDfz/l92Di0F2qnGSACShhofOjAnPHe8H/ccusbdBqA0eNwbb9f4AKKYqDJtlg60AAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn029'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAOUlEQVR4nG1NOQ4AMAjShP9/mZIwSGsZDHIoSFZVd2uaG5CUuyERZruHHbeHTF0/8m56n1NOTONJHNjRJBKMzS6qAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn030'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAL0lEQVR4nGP5//8/IyMjkGRgYIAzgIAFmYOsiAUuiiwHkoDwIRyIIqgOZKNpZAcAogk5DLqwhAsAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn031'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAMUlEQVR4nGNhYGD4//8/IyMjkASy4QwWCAWRgzAYwICFAQbgQugScADRygIxlKZ2AAD5kSoS/A+e7AAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn032'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAOElEQVR4nG2MQQoAQAgCE/r/l1ujkFjsEDqKWVURAYB/9FxKXboB6x/twNIOLGU7LTVTsj0lc0sPILchG3Z9PUUAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn033'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAKklEQVR4nGNhwAFY/v//D2ExMjLC2SAJnDpwSgBNgHOQ2SzI5hJnFC4JANNjCSHwZ+dOAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn034'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAPElEQVR4nGWOWwoAQAgCDbz/ld2HS7jUR0gNKgFIwp2q2tqbrUy0ZlJ9PY/J2pPpk0mc7MtIn6+VwdltAaKwTglQF5YxAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn035'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAALklEQVR4nGP5//8/IyMjJsmCVRRIsgAxAwMDhA9kQEggYGHAAciTgNgGt4mAqwCl+DMhMZsO5QAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn036'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAALklEQVR4nGP5//8/AwMDIyMjhAEHLFhFoRJAUew6IHJYdCADuFZ0CbixpOiAMADmpyEShMaewQAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn037'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAK0lEQVR4nGP5//8/AwMDIyMjhAEHLBAKTRQkAVGLSbJA1GKSUKNIsYNkHQC3qC0JDQzH4AAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn038'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAMElEQVR4nGP5//8/AzbAAqEYGRnRVEAlMPWxIKtFZrMgq0Vms2BaC9GHRQKiD6cdAA9EIRKBWkN+AAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn039'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAOElEQVR4nGWOUQoAMAhCF7z7X7nGBJHmR6mhRHefh6q60xK7skxIoYQk6eYNrWwXx9aKshr2Vz8GDzgwD2pvz7kAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn040'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAK0lEQVR4nGNhYGD4//8/kGRkZERms8CFIADOZgEqQVMLYbPAlaDpY6GDHQDLBh45l0dhygAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn041'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAOUlEQVR4nHWNQQoAMAzCWvD/X3aC1DHoPJQcbERNSBq6Wxf1CVJ3MQwbRAHzVeXjUS0bLu4b8cYpPr24ISf5W9S/AAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn042'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJklEQVR4nGP5//8/IyMjkGQAAzibhQEHwC0B1AsxAS4EYbPQwQ4A6J0SLfF/06kAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn043'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJElEQVR4nGP5//8/IyMjkGRABSwMOAALUDmQgpAoEqQbRT0JAHD2DCHlOvIhAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn044'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJUlEQVR4nGNhAIP///8DSUZGRjibhQEHYMFUC2Hj1oGplup2AAC9HBgeRnkBAgAAAABJRU5ErkJggg=='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn045'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAJklEQVR4nGP5//8/IyMjAwwAuRAGCwMOQIYE0AK4uUAAt4+KdgAAofcJIdNbiq8AAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn046'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAOElEQVR4nG2NQQoAMAjDFPr/L3eDjmzIbo1RK9tV1d0JZAV2CrNxxOuCV/wvYJxGM05jitPo5PMCryM5EtSyCSkAAAAASUVORK5CYII='">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn047'"/></xsl:attribute>
									</xsl:when>
									<xsl:when test="office:binary-data = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAANklEQVR4nG2N0QoAMAgCFfz/X3aBEG2rxzs12QZAEuMK6qchit8bj8u4Zqpc6CU6u4i9kR/tDmj1IRsmDqtoAAAAAElFTkSuQmCC'">
										<xsl:attribute name="??????_8008"><xsl:value-of select="'ptn048'"/></xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="??????_8008"><xsl:value-of select="@draw:name"/></xsl:attribute>
										<!--xsl:attribute name="????????????_8007"/-->
										<xsl:if test="@draw:color">
											<xsl:attribute name="?????????_800B"><xsl:value-of select="@draw:color"/></xsl:attribute>
										</xsl:if>
										<xsl:attribute name="?????????_800C"><xsl:choose><xsl:when test="$fillcolor"><xsl:value-of select="$fillcolor"/></xsl:when><xsl:otherwise>#ffffff</xsl:otherwise></xsl:choose></xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</xsl:when>
					</xsl:choose>
				</???:??????_800A>
			</xsl:when>
			<xsl:when test="$graphproperty/@draw:fill='bitmap'">
				<???:??????_8005>
					<xsl:if test="$graphproperty/@draw:fill-image-name">
						<xsl:attribute name="????????????_8007"><xsl:value-of select="$graphproperty/@draw:fill-image-name"/></xsl:attribute>
					</xsl:if>
					<xsl:variable name="position">
						<xsl:choose>
							<xsl:when test="$graphproperty/@style:repeat='no-repeat'">center</xsl:when>
							<xsl:when test="$graphproperty/@style:repeat='stretch'">stretch</xsl:when>
							<xsl:otherwise>tile</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:attribute name="??????_8006"><xsl:value-of select="$position"/></xsl:attribute>
					<xsl:attribute name="??????_8008"><xsl:variable name="imagename" select="$graphproperty/@draw:fill-image-name"/><xsl:variable name="fillimage" select="/office:document/office:styles/draw:fill-image[@draw:name = $imagename]/@xlink:href"/><xsl:if test="$fillimage!=''"><xsl:choose><xsl:when test="ends-with($fillimage,'.jpg')">jpg</xsl:when><xsl:when test="ends-with($fillimage,'.bmp')">bmp</xsl:when><xsl:when test="ends-with($fillimage,'.png')">png</xsl:when><xsl:when test="ends-with($fillimage,'.pbm')">pbm</xsl:when><xsl:when test="ends-with($fillimage,'.ras')">ras</xsl:when><xsl:when test="ends-with($fillimage,'.gif')">gif</xsl:when><xsl:otherwise>jpg</xsl:otherwise></xsl:choose></xsl:if></xsl:attribute>
					<xsl:attribute name="??????_8009">background-image</xsl:attribute>
				</???:??????_8005>
			</xsl:when>
			<xsl:when test="$graphproperty/@draw:fill='gradient'">
				<???:??????_800D>
					<xsl:variable name="gradientStyleName" select="$graphproperty/@draw:fill-gradient-name"/>
					<xsl:for-each select="/office:document/office:styles/draw:gradient[@draw:name = $gradientStyleName]">
						<xsl:attribute name="?????????_800E"><xsl:value-of select="@draw:start-color"/></xsl:attribute>
						<xsl:attribute name="?????????_800F"><xsl:value-of select="@draw:end-color"/></xsl:attribute>
						<xsl:attribute name="????????????_8010"><xsl:choose><xsl:when test="@draw:style='linear' or @draw:style='axial'">linear</xsl:when><xsl:when test="@draw:style='radial'">radar</xsl:when><xsl:when test="@draw:style='ellipsoid'">oval</xsl:when><xsl:when test="@draw:style='square'">square</xsl:when><xsl:when test="@draw:style='rectangular'">rectangle</xsl:when></xsl:choose></xsl:attribute>
						<xsl:variable name="start">
							<xsl:value-of select="substring-before(@draw:start-intensity,'%')"/>
						</xsl:variable>
						<xsl:variable name="end">
							<xsl:value-of select="substring-before(@draw:end-intensity,'%')"/>
						</xsl:variable>
						<xsl:attribute name="????????????_8011"><xsl:value-of select="$start"/></xsl:attribute>
						<xsl:attribute name="????????????_8012"><xsl:value-of select="$end"/></xsl:attribute>
						<xsl:variable name="angle">
							<xsl:value-of select="@draw:angle div 10"/>
						</xsl:variable>
						<xsl:attribute name="????????????_8013"><xsl:choose><xsl:when test="0 &lt; number($angle) and number($angle) &lt; 25">0</xsl:when><xsl:when test="25 &lt; number($angle) and number($angle) &lt; 70">45</xsl:when><xsl:when test="70 &lt; number($angle) and number($angle) &lt; 115">90</xsl:when><xsl:when test="115 &lt; number($angle) and number($angle) &lt; 160">135</xsl:when><xsl:when test="160 &lt; number($angle) and number($angle)&lt;205">180</xsl:when><xsl:when test="205&lt;number($angle) and number($angle)&lt;250">225</xsl:when><xsl:when test="250&lt;number($angle) and number($angle)&lt;295">270</xsl:when><xsl:when test="295&lt;number($angle) and number($angle)&lt;340">315</xsl:when><xsl:when test="340&lt;number($angle) and number($angle)&lt;360">360</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:attribute>
						<xsl:attribute name="??????_8014"><xsl:value-of select="substring-before(@draw:border,'%')"/></xsl:attribute>
						<xsl:if test="@draw:cx">
							<xsl:attribute name="??????X??????_8015"><xsl:value-of select="substring-before(@draw:cx,'%')"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="@draw:cy">
							<xsl:attribute name="??????Y??????_8016"><xsl:value-of select="substring-before(@draw:cy,'%')"/></xsl:attribute>
						</xsl:if>
						<xsl:attribute name="??????_8008"><xsl:value-of select="$gradientStyleName"/></xsl:attribute>
					</xsl:for-each>
				</???:??????_800D>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="($graphproperty/@draw:fill!='none'or not($graphproperty/@draw:fill))and $graphproperty/@draw:fill-color">
					<???:??????_8004>
						<xsl:choose>
							<xsl:when test="$graphproperty/@fo:background-color='transparent' or $graphproperty/@fo:background-color='transprent'">auto</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$graphproperty/@draw:fill-color"/>
							</xsl:otherwise>
						</xsl:choose>
					</???:??????_8004>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="???:?????????-graph">
		<xsl:param name="graphproperty"/>
		<xsl:choose>
			<xsl:when test="$graphproperty/@svg:stroke-color">
				<???:?????????_8058>
					<xsl:value-of select="$graphproperty/@svg:stroke-color"/>
				</???:?????????_8058>
			</xsl:when>
			<xsl:when test="@presentation:class!='' and $documentType = 'presentation'"/>
			<xsl:otherwise>
				<???:?????????_8058>#000000</???:?????????_8058>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="???:?????????-graph">
		<xsl:param name="graphproperty"/>
		<???:?????????_8059>
			<!--<xsl:attribute name="xml:id" select="$graphproperty/@draw:stroke-dash"/>-->
			<xsl:variable name="linetype" select="$graphproperty/@draw:stroke-dash"/>
			<xsl:variable name="uoflinetype">
				<xsl:choose>
					<xsl:when test="$graphproperty/@fo:border='none'">none</xsl:when>
					<xsl:when test="contains($graphproperty/@fo:border, 'double')">double</xsl:when>
					<xsl:when test="contains($graphproperty/@fo:border, 'solid')">single</xsl:when>
					<xsl:when test="not($graphproperty/@draw:stroke)">
						<xsl:choose>
							<xsl:when test="$documentType = 'presentation' and @presentation:class">none</xsl:when>
							<xsl:when test="not($graphproperty/@svg:stroke-width)">single</xsl:when>
							<xsl:otherwise>single</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="$graphproperty/@draw:stroke = 'none'">none</xsl:when>
					<xsl:when test="$graphproperty/@draw:stroke = 'solid' ">single</xsl:when>
					<xsl:when test="$graphproperty/@draw:marker-start or $graphproperty/@draw:marker-end">single</xsl:when>
					<xsl:when test="not($linetype or $graphproperty/@fo:border)">
						<xsl:variable name="mark" select="$graphproperty/@style:parent-style-name"/>
						<xsl:choose>
							<xsl:when test="not(/office:document/office:styles/style:style[@style:name=$mark]/@fo:border)">none</xsl:when>
							<xsl:otherwise>single</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>single</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:attribute name="??????_805A" select="$uoflinetype"/>
			<xsl:if test="not($graphproperty/@fo:border='none') and not($graphproperty/@draw:stroke = 'none')">
				<xsl:variable name="linedash">
					<xsl:choose>
						<xsl:when test="not($graphproperty/@draw:stroke-dash) or $graphproperty/@draw:stroke='solid'">solid</xsl:when>
						<xsl:when test="$linetype='round-dot'">round-dot</xsl:when>
						<xsl:when test="$linetype='square-dot'">square-dot</xsl:when>
						<xsl:when test="$linetype='dash'">dash</xsl:when>
						<xsl:when test="$linetype='dash-dot'">dash-dot</xsl:when>
						<xsl:when test="$linetype='long-dash'">long-dash</xsl:when>
						<xsl:when test="$linetype='long-dash-dot'">long-dash-dot</xsl:when>
						<xsl:when test="$linetype='dash-dot-dot'">dash-dot-dot</xsl:when>
						<xsl:otherwise>dash</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:attribute name="??????_805B" select="$linedash"/>
			</xsl:if>
		</???:?????????_8059>
	</xsl:template>
	<xsl:template name="???:?????????-graph">
		<xsl:param name="graphproperty"/>
		<xsl:choose>
			<xsl:when test="$graphproperty/@svg:stroke-width">
				<???:?????????_805C>
					<xsl:value-of select="fun:Convert2uofUnit($graphproperty/@svg:stroke-width)"/>
				</???:?????????_805C>
			</xsl:when>
			<xsl:when test="($graphproperty/@style:parent-style-name = 'Frame') and (not ($graphproperty/@fo:border = 'none'))">
				<xsl:choose>
					<xsl:when test="$graphproperty/@fo:border">
						<???:?????????_805C>
							<xsl:value-of select="fun:Convert2uofUnit($graphproperty/@fo:border)"/>
						</???:?????????_805C>
					</xsl:when>
					<xsl:when test="$graphproperty/@style:parent-style-name = 'Frame'">
						<xsl:if test="/office:document/office:styles/style:style[@style:name = 'Frame']/style:graphic-properties/@fo:border">
							<???:?????????_805C>
								<xsl:value-of select="fun:Convert2uofUnit(/office:document/office:styles/style:style[@style:name = 'Frame']/style:graphic-properties/@fo:border)"/>
							</???:?????????_805C>
						</xsl:if>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="linearrow">
		<xsl:param name="graphproperty"/>
		<???:??????_805D>
			<xsl:if test="$graphproperty/@draw:marker-start and string-length($graphproperty/@draw:marker-start)&gt;0 and contains($graphproperty/@draw:marker-start,'msArrow')">
				<???:????????????_805E>
					<xsl:variable name="marker_name">
						<xsl:value-of select="$graphproperty/@draw:marker-start"/>
					</xsl:variable>
					<!--<xsl:if test="not(contains($marker_name,'msArrow'))">
					<xsl:attribute name="xml:id"><xsl:value-of select="$marker_name"/></xsl:attribute>
				</xsl:if>-->
					<???:??????_8000>
						<xsl:variable name="drawMarkerStartStyle">
							<xsl:choose>
								<xsl:when test="contains($marker_name,'Open')">open</xsl:when>
								<xsl:when test="contains($marker_name,'Stealth')">stealth</xsl:when>
								<xsl:when test="contains($marker_name,'Oval')">oval</xsl:when>
								<xsl:when test="contains($marker_name,'Diamond')">diamond</xsl:when>
								<xsl:when test="$marker_name = 'Small Arrow' or $marker_name = 'Rounded short Arrow' or $marker_name = 'Symmetric Arrow' or $marker_name = 'Rounded large Arrow'">normal</xsl:when>
								<xsl:when test="$marker_name = 'Line Arrow'">open</xsl:when>
								<xsl:when test="$marker_name = 'Square 45'">diamond</xsl:when>
								<xsl:when test="$marker_name = 'Arrow concave'">stealth</xsl:when>
								<xsl:when test="contains($marker_name,'Arrow')">normal</xsl:when>
							</xsl:choose>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$drawMarkerStartStyle != ''">
								<xsl:value-of select="$drawMarkerStartStyle"/>
							</xsl:when>
							<xsl:when test="$graphproperty/@draw:marker-start='Arrow'">normal</xsl:when>
							<xsl:when test="$graphproperty/@draw:marker-start='Line Arrow'">open</xsl:when>
							<xsl:when test="$graphproperty/@draw:marker-start='Arrow concave'">stealth</xsl:when>
							<xsl:when test="$graphproperty/@draw:marker-start='Circle'">oval</xsl:when>
							<xsl:when test="$graphproperty/@draw:marker-start='Square 45'">diamond</xsl:when>
							<xsl:otherwise>normal</xsl:otherwise>
						</xsl:choose>
					</???:??????_8000>
					<???:??????_8001>
						<xsl:choose>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-start)/@svg:viewBox = '0 0 140 140'">1</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-start)/@svg:viewBox = '0 0 140 310'">2</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-start)/@svg:viewBox = '0 0 140 350'">3</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-start)/@svg:viewBox = '0 0 210 140'">4</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-start)/@svg:viewBox = '0 0 210 210'">5</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-start)/@svg:viewBox = '0 0 210 350'">6</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-start)/@svg:viewBox = '0 0 350 140'">7</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-start)/@svg:viewBox = '0 0 350 210'">8</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-start)/@svg:viewBox = '0 0 350 350'">9</xsl:when>
							<!--schema ??????????????????????????????-->
							<xsl:otherwise>10</xsl:otherwise>
						</xsl:choose>
					</???:??????_8001>
					<!--???:?????????>
					<xsl:value-of select="$graphproperty/@draw:stroke-linejoin"/>
				</???:?????????-->
				</???:????????????_805E>
			</xsl:if>
			<xsl:if test="$graphproperty/@draw:marker-end and string-length($graphproperty/@draw:marker-end)&gt;0 and contains($graphproperty/@draw:marker-end,'msArrow')">
				<???:????????????_805F>
					<xsl:variable name="marker_name">
						<xsl:value-of select="$graphproperty/@draw:marker-end"/>
					</xsl:variable>
					<!--<xsl:if test="not(contains($marker_name,'msArrow'))">
					<xsl:attribute name="xml:id"><xsl:value-of select="$marker_name"/></xsl:attribute>
				</xsl:if>-->
					<???:??????_8000>
						<xsl:variable name="drawMarkerEndStyle">
							<xsl:choose>
								<xsl:when test="contains($marker_name,'ArrowOpen')">open</xsl:when>
								<xsl:when test="contains($marker_name,'ArrowStealth')">stealth</xsl:when>
								<xsl:when test="contains($marker_name,'ArrowOval')">oval</xsl:when>
								<xsl:when test="contains($marker_name,'ArrowDiamond')">diamond</xsl:when>
								<xsl:when test="contains($marker_name,'Arrow')">normal</xsl:when>
								<xsl:when test="$marker_name = 'Small Arrow' or $marker_name = 'Rounded short Arrow' or $marker_name = 'Symmetric Arrow' or $marker_name = 'Rounded large Arrow'">normal</xsl:when>
								<xsl:when test="$marker_name = 'Line Arrow'">open</xsl:when>
								<xsl:when test="$marker_name = 'Square 45'">diamond</xsl:when>
								<xsl:when test="$marker_name = 'Arrow concave'">stealth</xsl:when>
							</xsl:choose>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$drawMarkerEndStyle != ''">
								<xsl:value-of select="$drawMarkerEndStyle"/>
							</xsl:when>
							<xsl:when test="$graphproperty/@draw:marker-end='Arrow'">normal</xsl:when>
							<xsl:when test="$graphproperty/@draw:marker-end='Line Arrow'">open</xsl:when>
							<xsl:when test="$graphproperty/@draw:marker-end='Arrow concave'">stealth</xsl:when>
							<xsl:when test="$graphproperty/@draw:marker-end='Circle'">oval</xsl:when>
							<xsl:when test="$graphproperty/@draw:marker-end='Square 45'">diamond</xsl:when>
							<xsl:otherwise>normal</xsl:otherwise>
						</xsl:choose>
					</???:??????_8000>
					<???:??????_8001>
						<xsl:choose>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-end)/@svg:viewBox = '0 0 140 140'">1</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-end)/@svg:viewBox = '0 0 140 310'">2</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-end)/@svg:viewBox = '0 0 140 350'">3</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-end)/@svg:viewBox = '0 0 210 140'">4</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-end)/@svg:viewBox = '0 0 210 210'">5</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-end)/@svg:viewBox = '0 0 210 350'">6</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-end)/@svg:viewBox = '0 0 350 140'">7</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-end)/@svg:viewBox = '0 0 350 210'">8</xsl:when>
							<xsl:when test="key('markerSize',$graphproperty/@draw:marker-end)/@svg:viewBox = '0 0 350 350'">9</xsl:when>
							<xsl:otherwise>1</xsl:otherwise>
						</xsl:choose>
					</???:??????_8001>
					<!--???:?????????>
					<xsl:value-of select="$graphproperty/@draw:stroke-linejoin"/>
				</???:?????????-->
				</???:????????????_805F>
			</xsl:if>
		</???:??????_805D>
	</xsl:template>
	<xsl:template name="graphsize">
		<xsl:variable name="graphic_width">
			<xsl:choose>
				<xsl:when test="@svg:x1">
					<xsl:variable name="svg_x1" select="fun:Convert2uofUnit(@svg:x1)"/>
					<xsl:variable name="svg_x2" select="fun:Convert2uofUnit(@svg:x2)"/>
					<xsl:choose>
						<xsl:when test="number($svg_x2) &gt; number($svg_x1)">
							<xsl:value-of select="number($svg_x2) - number($svg_x1)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="number($svg_x1) - number($svg_x2)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="@fo:min-width">
					<xsl:value-of select="fun:Convert2uofUnit(@fo:min-width)"/>
				</xsl:when>
				<xsl:when test="@svg:width">
					<xsl:value-of select="fun:Convert2uofUnit(@svg:width)"/>
				</xsl:when>
				<xsl:when test="@svg:x">
					<xsl:value-of select="fun:Convert2uofUnit(@svg:width)"/>
				</xsl:when>
				<xsl:when test="child::draw:text-box/@fo:min-width">
					<xsl:value-of select="fun:Convert2uofUnit(child::draw:text-box/@fo:min-width)"/>
				</xsl:when>
				<xsl:when test="@svg:height">
					<xsl:value-of select="fun:Convert2uofUnit(@svg:height)"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="not($graphic_width='')">
			<xsl:attribute name="???_C605"><xsl:value-of select="$graphic_width"/></xsl:attribute>
		</xsl:if>
		<xsl:variable name="graphic_height">
			<xsl:choose>
				<xsl:when test="@svg:x1">
					<xsl:variable name="svg_y1" select="fun:Convert2uofUnit(@svg:y1)"/>
					<xsl:variable name="svg_y2" select="fun:Convert2uofUnit(@svg:y2)"/>
					<xsl:choose>
						<xsl:when test="number($svg_y2) &gt; number($svg_y1)">
							<xsl:value-of select="number($svg_y2) - number($svg_y1)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="number($svg_y1) - number($svg_y2)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="@svg:height">
					<xsl:value-of select="fun:Convert2uofUnit(@svg:height)"/>
				</xsl:when>
				<xsl:when test="draw:text-box/@fo:min-height">
					<xsl:value-of select="fun:Convert2uofUnit(draw:text-box/@fo:min-height)"/>
				</xsl:when>
				<xsl:when test="@svg:x">
					<xsl:value-of select="fun:Convert2uofUnit(@svg:height)"/>
				</xsl:when>
				<xsl:when test="child::draw:text-box/@fo:min-height">
					<xsl:value-of select="fun:Convert2uofUnit(child::draw:text-box/@fo:min-height)"/>
				</xsl:when>
				<xsl:when test="@svg:width">
					<xsl:value-of select="fun:Convert2uofUnit(@svg:height)"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="not($graphic_height='')">
			<!--bug for title in masterpage-->
			<xsl:variable name="real_graphic_height">
				<xsl:choose>
					<xsl:when test="($documentType = 'presentation') and (name(.) = 'draw:frame') and (@presentation:class = 'title') and (name(..) = 'style:master-page')">
						<xsl:variable name="bug_height" select="0.254 div $other-to-cm-conversion-factor"/>
						<xsl:value-of select="number($graphic_height) - number($bug_height)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$graphic_height"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:attribute name="???_C604"><xsl:value-of select="$real_graphic_height"/></xsl:attribute>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-graph">
		<xsl:if test="@draw:transform">
			<???:????????????_804D>
				<xsl:choose>
					<xsl:when test="@draw:transform">
						<xsl:variable name="rotate-angle" select="@draw:transform"/>
						<xsl:variable name="rotate-temp" select="substring-before(substring-after($rotate-angle,'rotate ('),')')"/>
						<xsl:value-of select="round(number($rotate-temp) * 57.2957795)"/>
					</xsl:when>
					<xsl:otherwise>0.0</xsl:otherwise>
				</xsl:choose>
			</???:????????????_804D>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:?????????-graph">
		<xsl:param name="graphproperty"/>
		<xsl:if test="$graphproperty/@draw:opacity or $graphproperty/@draw:transparency or $graphproperty/@draw:fill or $graphproperty/@style:parent-style-name='Frame'">
			<xsl:choose>
				<!--xsl:when test="$graphproperty/@draw:fill='none'">
					<???:????????? uof:locID="g0038">
						<xsl:value-of select="100"/>
					</???:?????????>
				</xsl:when-->
				<xsl:when test="$graphproperty/@draw:transparency">
					<???:?????????_8050>
						<xsl:value-of select="substring-before($graphproperty/@draw:transparency,'%')"/>
					</???:?????????_8050>
				</xsl:when>
				<xsl:when test="$graphproperty/@draw:opacity">
					<???:?????????_8050>
						<xsl:value-of select="100 - number(substring-before($graphproperty/@draw:opacity,'%'))"/>
					</???:?????????_8050>
				</xsl:when>
				<xsl:when test="$graphproperty/@style:background-transparency">
					<???:?????????_8050>
						<xsl:value-of select="substring-before($graphproperty/@style:background-transparency,'%')"/>
					</???:?????????_8050>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-graph">
		<xsl:param name="graphproperty"/>
		<xsl:if test="$graphproperty/@draw:shadow">
			<xsl:element name="???:??????_8051">
				<xsl:attribute name="??????????????????_C61C"><xsl:choose><xsl:when test="$graphproperty/@draw:shadow='visible'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:attribute name="??????_C61D">perspective</xsl:attribute>
				<xsl:if test="$graphproperty/@draw:shadow-color != ''">
					<xsl:attribute name="??????_C61E"><xsl:value-of select="$graphproperty/@draw:shadow-color"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="$graphproperty/@draw:shadow-opacity !=''">
					<xsl:attribute name="?????????_C61F"><xsl:value-of select="100 - number(substring-before($graphproperty/@draw:shadow-opacity,'%'))"/></xsl:attribute>
				</xsl:if>
				<uof:?????????_C61B>
					<xsl:variable name="xpos">
						<xsl:choose>
							<xsl:when test="$graphproperty/@draw:shadow-offset-x">
								<xsl:variable name="X-off" select="fun:Convert2uofUnit($graphproperty/@draw:shadow-offset-x)"/>
								<xsl:value-of select="round($X-off)"/>
							</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:attribute name="x_C606"><xsl:value-of select="$xpos"/></xsl:attribute>
					<xsl:variable name="ypos">
						<xsl:choose>
							<xsl:when test="$graphproperty/@draw:shadow-offset-y">
								<xsl:variable name="Y-off" select="fun:Convert2uofUnit($graphproperty/@draw:shadow-offset-y)"/>
								<xsl:value-of select="round($Y-off)"/>
							</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:attribute name="y_C607"><xsl:value-of select="$ypos"/></xsl:attribute>
				</uof:?????????_C61B>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-graph">
		<xsl:param name="graphproperty"/>
		<???:??????_801D>
			<xsl:choose>
				<xsl:when test="not($graphproperty/@draw:fill)">
					<???:??????_804C>
						<???:??????_8004>auto</???:??????_8004>
					</???:??????_804C>
				</xsl:when>
				<!--???????????????????????????????????? xsl:when test="$graphproperty/@draw:fill != 'none' or $graphproperty/@draw:fill-color"-->
				<xsl:when test="$graphproperty/@draw:fill != 'none'">
					<???:??????_804C>
						<xsl:call-template name="???:??????-graph">
							<xsl:with-param name="graphproperty" select="$graphproperty"/>
						</xsl:call-template>
					</???:??????_804C>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
			<???:???_8057>
				<xsl:call-template name="???:?????????-graph">
					<xsl:with-param name="graphproperty" select="$graphproperty"/>
				</xsl:call-template>
				<xsl:call-template name="???:?????????-graph">
					<xsl:with-param name="graphproperty" select="$graphproperty"/>
				</xsl:call-template>
				<xsl:call-template name="???:?????????-graph">
					<xsl:with-param name="graphproperty" select="$graphproperty"/>
				</xsl:call-template>
			</???:???_8057>
			<xsl:call-template name="linearrow">
				<xsl:with-param name="graphproperty" select="$graphproperty"/>
			</xsl:call-template>
			<???:??????_8060>
				<xsl:call-template name="graphsize"/>
			</???:??????_8060>
			<xsl:call-template name="???:????????????-graph"/>
			<xsl:call-template name="???:?????????-graph">
				<xsl:with-param name="graphproperty" select="$graphproperty"/>
			</xsl:call-template>
			<xsl:call-template name="???:??????-graph">
				<xsl:with-param name="graphproperty" select="$graphproperty"/>
			</xsl:call-template>
			<???:???????????????????????????_8055>0</???:???????????????????????????_8055>
			<???:??????????????????_804E>
				<xsl:choose>
					<xsl:when test="$graphproperty/@draw:printprev-hide = 'true'">false</xsl:when>
					<xsl:otherwise>true</xsl:otherwise>
				</xsl:choose>
			</???:??????????????????_804E>
			<xsl:if test="svg:title">
				<???:Web??????_804F>
					<xsl:value-of select="svg:title"/>
				</???:Web??????_804F>
			</xsl:if>
			<xsl:if test="$graphproperty/@draw:color-mode!='' or $graphproperty/@draw:luminance!='' or $graphproperty/@draw:contrast!='' or $graphproperty/@fo:clip!=''">
				<???:????????????_801E>
					<xsl:if test="$graphproperty/@draw:color-mode!=''">
						<???:????????????_801F>
							<xsl:choose>
								<xsl:when test="$graphproperty/@draw:color-mode = 'mono'">monochrome</xsl:when>
								<xsl:when test="$graphproperty/@draw:color-mode = 'watermark'">erosion</xsl:when>
								<xsl:when test="$graphproperty/@draw:color-mode = 'standard'">auto</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$graphproperty/@draw:color-mode"/>
								</xsl:otherwise>
							</xsl:choose>
						</???:????????????_801F>
					</xsl:if>
					<!--UOFSchema?????? ??????&?????????????????????-->
					<xsl:if test="$graphproperty/@draw:luminance!=''">
						<???:??????_8020>
							<xsl:value-of select="substring-before($graphproperty/@draw:luminance,'%')"/>
						</???:??????_8020>
					</xsl:if>
					<xsl:if test="$graphproperty/@draw:contrast!=''">
						<???:?????????_8021>
							<xsl:value-of select="substring-before($graphproperty/@draw:contrast,'%')"/>
						</???:?????????_8021>
					</xsl:if>
					<???:????????????_8022>
						<xsl:variable name="clip">
							<xsl:value-of select="substring-after(substring-before($graphproperty/@fo:clip,')'),'(')"/>
						</xsl:variable>
						<???:???_8023>
							<xsl:value-of select="fun:Convert2uofUnit(subsequence(tokenize($clip,','),1,1))"/>
						</???:???_8023>
						<???:???_8024>
							<xsl:value-of select="fun:Convert2uofUnit(subsequence(tokenize($clip,','),3,1))"/>
						</???:???_8024>
						<???:???_8025>
							<xsl:value-of select="fun:Convert2uofUnit(subsequence(tokenize($clip,','),4,1))"/>
						</???:???_8025>
						<???:???_8026>
							<xsl:value-of select="fun:Convert2uofUnit(subsequence(tokenize($clip,','),2,1))"/>
						</???:???_8026>
					</???:????????????_8022>
				</???:????????????_801E>
			</xsl:if>
		</???:??????_801D>
	</xsl:template>
	<xsl:template name="FindType">
		<xsl:param name="graphproperty"/>
		<xsl:variable name="nodename">
			<xsl:value-of select="name(.)"/>
		</xsl:variable>
		<xsl:variable name="conArrowStart">
			<xsl:choose>
				<xsl:when test="$graphproperty/@draw:marker-start">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="pagethumbnail">
			<xsl:if test="$graphproperty='page-thumbnail'">true</xsl:if>
		</xsl:variable>
		<xsl:variable name="conArrowEnd">
			<xsl:choose>
				<xsl:when test="$graphproperty/@draw:marker-end">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="type">
			<xsl:value-of select="draw:enhanced-geometry/@draw:type"/>
		</xsl:variable>
		<???:??????_8019>
			<xsl:choose>
				<xsl:when test="$pagethumbnail='true'">11</xsl:when>
				<xsl:when test="$nodename='draw:frame'">11</xsl:when>
				<xsl:when test="$nodename='office:annotation'">11</xsl:when>
				<xsl:when test="$nodename='draw:rect'">11</xsl:when>
				<xsl:when test="$nodename='draw:line'">61</xsl:when>
				<xsl:when test="$nodename='draw:circle'">19</xsl:when>
				<xsl:when test="$nodename='draw:polygon'">65</xsl:when>
				<xsl:when test="$nodename='draw:polyline'">66</xsl:when>
				<xsl:when test="$nodename='draw:ellipse'">19</xsl:when>
				<xsl:when test="child::draw:text-box">11</xsl:when>
				<xsl:when test="$nodename='draw:caption'">51</xsl:when>
				<xsl:when test="$nodename='draw:connector'">
					<xsl:choose>
						<xsl:when test="@draw:type = 'line' and $conArrowStart = 'false' and $conArrowEnd = 'false'">71</xsl:when>
						<xsl:when test="@draw:type = 'line' and ($conArrowStart = 'true' or $conArrowEnd = 'true')">72</xsl:when>
						<xsl:when test="@draw:type = 'line' and $conArrowStart = 'true' and $conArrowEnd = 'true'">73</xsl:when>
						<xsl:when test="@draw:type = 'curve' and $conArrowStart = 'false' and $conArrowEnd = 'false'">74</xsl:when>
						<xsl:when test="@draw:type = 'curve' and ($conArrowStart = 'true' or $conArrowEnd = 'true')">75</xsl:when>
						<xsl:when test="@draw:type = 'curve' and $conArrowStart = 'true' and $conArrowEnd = 'true'">76</xsl:when>
						<xsl:when test="@draw:type = '' and $conArrowStart = 'false' and $conArrowEnd = 'false'">77</xsl:when>
						<xsl:when test="@draw:type = '' and ($conArrowStart = 'true' or $conArrowEnd = 'true')">78</xsl:when>
						<xsl:when test="@draw:type = '' and $conArrowStart = 'true' and $conArrowEnd = 'true'">79</xsl:when>
						<xsl:otherwise>71</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape'">
					<xsl:choose>
						<xsl:when test="$type = 'rectangle' or $type = 'mso-spt202'">11</xsl:when>
						<xsl:when test="$type='parallelogram'">12</xsl:when>
						<xsl:when test="$type='trapezoid'">13</xsl:when>
						<xsl:when test="$type='diamond'">14</xsl:when>
						<xsl:when test="$type = 'round-rectangle'">15</xsl:when>
						<xsl:when test="$type = 'octagon'">16</xsl:when>
						<xsl:when test="$type = 'isosceles-triangle'">17</xsl:when>
						<xsl:when test="$type = 'right-triangle'">18</xsl:when>
						<xsl:when test="$type = 'ellipse'">19</xsl:when>
						<xsl:when test="$type = 'right-arrow'">21</xsl:when>
						<xsl:when test="$type = 'left-arrow'">22</xsl:when>
						<xsl:when test="$type = 'up-arrow'">23</xsl:when>
						<xsl:when test="$type = 'down-arrow'">24</xsl:when>
						<xsl:when test="$type = 'left-right-arrow'">25</xsl:when>
						<xsl:when test="$type = 'up-down-arrow'">26</xsl:when>
						<xsl:when test="$type = 'quad-arrow'">27</xsl:when>
						<xsl:when test="$type = 'mso-spt182'">28</xsl:when>
						<xsl:when test="$type = 'flowchart-process'">31</xsl:when>
						<xsl:when test="$type = 'flowchart-decision'">33</xsl:when>
						<xsl:when test="$type = 'flowchart-data'">34</xsl:when>
						<xsl:when test="$type = 'flowchart-predefined-process'">35</xsl:when>
						<xsl:when test="$type = 'flowchart-internal-storage'">36</xsl:when>
						<xsl:when test="$type = 'flowchart-document'">37</xsl:when>
						<xsl:when test="$type = 'flowchart-multidocument'">38</xsl:when>
						<xsl:when test="$type = 'flowchart-terminator'">39</xsl:when>
						<xsl:when test="$type = 'mso-spt71'">41</xsl:when>
						<xsl:when test="$type = 'bang'">42</xsl:when>
						<xsl:when test="$type = 'star4'">43</xsl:when>
						<xsl:when test="$type = 'star5'">44</xsl:when>
						<xsl:when test="$type = 'star8'">45</xsl:when>
						<xsl:when test="$type = 'mso-spt59'">46</xsl:when>
						<xsl:when test="$type = 'star24'">47</xsl:when>
						<xsl:when test="$type = 'mso-spt60'">48</xsl:when>
						<xsl:when test="$type = 'mso-spt54'">49</xsl:when>
						<xsl:when test="$type = 'rectangular-callout'">51</xsl:when>
						<xsl:when test="$type = 'round-rectangular-callout'">52</xsl:when>
						<xsl:when test="$type = 'round-callout'">53</xsl:when>
						<xsl:when test="$type = 'cloud-callout'">54</xsl:when>
						<xsl:when test="$type = 'line-callout-1'">55</xsl:when>
						<xsl:when test="$type = 'line-callout-2'">56</xsl:when>
						<xsl:when test="$type = 'line-callout-3'">57</xsl:when>
						<xsl:when test="$type = 'hexagon'">110</xsl:when>
						<xsl:when test="$type = 'cross'">111</xsl:when>
						<xsl:when test="$type = 'pentagon'">112</xsl:when>
						<xsl:when test="$type = 'can'">113</xsl:when>
						<xsl:when test="$type = 'cube'">114</xsl:when>
						<xsl:when test="$type = 'quad-bevel'">115</xsl:when>
						<xsl:when test="$type = 'paper'">116</xsl:when>
						<xsl:when test="$type = 'smiley'">117</xsl:when>
						<xsl:when test="$type = 'ring'">118</xsl:when>
						<xsl:when test="$type = 'forbidden'">119</xsl:when>
						<xsl:when test="$type = 'heart'">121</xsl:when>
						<xsl:when test="$type = 'non-primitive'">122</xsl:when>
						<xsl:when test="$type = 'sun'">123</xsl:when>
						<xsl:when test="$type = 'moon'">124</xsl:when>
						<xsl:when test="$type = 'bracket-pair'">126</xsl:when>
						<xsl:when test="$type = 'brace-pair'">127</xsl:when>
						<xsl:when test="$type = 'mso-spt21'">128</xsl:when>
						<xsl:when test="$type = 'left-bracket'">129</xsl:when>
						<xsl:when test="$type = 'right-bracket'">130</xsl:when>
						<xsl:when test="$type = 'left-brace'">131</xsl:when>
						<xsl:when test="$type = 'right-brace'">132</xsl:when>
						<xsl:when test="$type = 'mso-spt89'">211</xsl:when>
						<!--xsl:when test="$type = 'non-primitive'">212</xsl:when-->
						<xsl:when test="$type = 'circular-arrow'">214</xsl:when>
						<xsl:when test="$type = 'circular-arrow'">216</xsl:when>
						<!--xsl:when test="$type = 'mso-spt100'">217</xsl:when-->
						<xsl:when test="$type = 'notched-right-arrow'">218</xsl:when>
						<xsl:when test="$type = 'pentagon-right'">219</xsl:when>
						<xsl:when test="$type = 'chevron'">220</xsl:when>
						<xsl:when test="$type = 'right-arrow-callout'">221</xsl:when>
						<xsl:when test="$type = 'left-arrow-callout'">222</xsl:when>
						<xsl:when test="$type = 'up-arrow-callout'">223</xsl:when>
						<xsl:when test="$type = 'down-arrow-callout'">224</xsl:when>
						<xsl:when test="$type = 'left-right-arrow-callout'">225</xsl:when>
						<xsl:when test="$type = 'up-down-arrow-callout'">226</xsl:when>
						<xsl:when test="$type = 'quad-arrow-callout'">227</xsl:when>
						<xsl:when test="$type = 'circular-arrow'">228</xsl:when>
						<xsl:when test="$type = 'flowchart-preparation'">310</xsl:when>
						<xsl:when test="$type = 'flowchart-manual-input'">311</xsl:when>
						<xsl:when test="$type = 'flowchart-manual-operation'">312</xsl:when>
						<xsl:when test="$type = 'flowchart-connector'">313</xsl:when>
						<xsl:when test="$type = 'flowchart-off-page-connector'">314</xsl:when>
						<xsl:when test="$type = 'flowchart-card'">315</xsl:when>
						<xsl:when test="$type = 'flowchart-punched-tape'">316</xsl:when>
						<xsl:when test="$type = 'flowchart-summing-junction'">317</xsl:when>
						<xsl:when test="$type = 'flowchart-or'">318</xsl:when>
						<xsl:when test="$type = 'flowchart-collate'">319</xsl:when>
						<xsl:when test="$type = 'flowchart-sort'">320</xsl:when>
						<xsl:when test="$type = 'flowchart-extract'">321</xsl:when>
						<xsl:when test="$type = 'flowchart-merge'">322</xsl:when>
						<xsl:when test="$type = 'flowchart-stored-data'">323</xsl:when>
						<xsl:when test="$type = 'flowchart-delay'">324</xsl:when>
						<xsl:when test="$type = 'flowchart-sequential-access'">325</xsl:when>
						<xsl:when test="$type = 'flowchart-magnetic-disk'">326</xsl:when>
						<xsl:when test="$type = 'flowchart-direct-access-storage'">327</xsl:when>
						<xsl:when test="$type = 'flowchart-display'">328</xsl:when>
						<xsl:when test="$type = 'vertical-scroll'">413</xsl:when>
						<xsl:when test="$type = 'horizontal-scroll'">414</xsl:when>
						<!--xsl:otherwise>11</xsl:otherwise-->
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</???:??????_8019>
		<???:??????_801A>
			<xsl:choose>
				<xsl:when test="$pagethumbnail='true'">Rectangle</xsl:when>
				<xsl:when test="$nodename='office:annotation'">Rectangle</xsl:when>
				<xsl:when test="$nodename='draw:rect' or ($nodename='draw:custom-shape' and $type='rectangle')">Rectangle</xsl:when>
				<xsl:when test="$nodename='draw:line'">Line</xsl:when>
				<xsl:when test="$nodename='draw:circle'">Oval</xsl:when>
				<xsl:when test="$nodename='draw:polygon'">Freeform</xsl:when>
				<xsl:when test="$nodename='draw:polyline'">Scribble</xsl:when>
				<xsl:when test="$nodename='draw:caption'">Rectangular Callout</xsl:when>
				<xsl:when test="$nodename='draw:connector'">
					<xsl:choose>
						<xsl:when test="@draw:type = 'line' and $conArrowStart = 'false' and $conArrowEnd = 'false'">Straight Connector</xsl:when>
						<xsl:when test="@draw:type = 'line' and ($conArrowStart = 'true' or $conArrowEnd = 'true')">Straight Arrow Connector</xsl:when>
						<xsl:when test="@draw:type = 'line' and $conArrowStart = 'true' and $conArrowEnd = 'true'">Straight Double-Arrow Connector</xsl:when>
						<xsl:when test="@draw:type = 'curve' and $conArrowStart = 'false' and $conArrowEnd = 'false'">Elbow Connector</xsl:when>
						<xsl:when test="@draw:type = 'curve' and ($conArrowStart = 'true' or $conArrowEnd = 'true')">Elbow Arrow Connector</xsl:when>
						<xsl:when test="@draw:type = 'curve' and $conArrowStart = 'true' and $conArrowEnd = 'true'">Elbow Double-Arrow Connector</xsl:when>
						<xsl:when test="@draw:type = '' and $conArrowStart = 'false' and $conArrowEnd = 'false'">Curved Connector</xsl:when>
						<xsl:when test="@draw:type = '' and ($conArrowStart = 'true' or $conArrowEnd = 'true')">Curved Arrow Connector</xsl:when>
						<xsl:when test="@draw:type = '' and $conArrowStart = 'true' and $conArrowEnd = 'true'">Curved Double-Arrow Connector</xsl:when>
						<xsl:otherwise>Straight Connector</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$nodename='draw:ellipse' or ($nodename='draw:custom-shape' and $type='ellipse')">Oval</xsl:when>
				<xsl:when test="$nodename='draw:frame' and  child::draw:text-box[@fo:min-height]">Rectangle</xsl:when>
				<xsl:when test="$nodename='draw:frame' and child::draw:text-box">Rectangle</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='smiley'">Smiley Face</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='parallelogram'">Paralleogram</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='diamond'">Diamond</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='trapezoid'">Trapezoid</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='paper'">Folded Corner</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='star5'">5-Point Star</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='mso-spt60'">32-Point Star</xsl:when>
				<!--xsl:when test="$nodename='draw:custom-shape' and $type='rectangular-callout'">Rectangular Callout</xsl:when-->
				<xsl:when test="$nodename='draw:custom-shape' and $type='right-triangle'">Right Triangle</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='right-arrow'">Right Arrow</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='left-arrow'">Left Arrow</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='up-arrow'">Up Arrow</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='down-arrow'">Down Arrow</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='left-right-arrow'">Left-Right Arrow</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='up-down-arrow'">Up-Down Arrow</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='star8'">8-Point Star</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='mso-spt59'">16-Point Star</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-process'">Process</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='isosceles-triangle'">Isosceles Triangle</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='mso-spt21'">Plaque</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='chevron'">Chevron Arrow</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='quad-bevel'">Beveled</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='up-arrow-callout'">Up Arrow Callout</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='cross'">Cross</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='heart'">Heart</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='pentagon'">Regual Pentagon</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='cube'">Cube</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='ring'">Donut</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='can'">Can</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='hexagon'">Hexagon</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='sun'">Sun</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='moon'">Moon</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='octagon'">Octagon</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='round-rectangle'">Rounded Rectangle</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='quad-arrow'">Quad Arrow</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='mso-spt182'">Left-Right-Up Arrow</xsl:when>
				<!--xsl:when test="$nodename='draw:custom-shape' and $type='cloud-callout'">Cloud Callout</xsl:when-->
				<xsl:when test="$nodename='draw:custom-shape' and $type='mso-spt71'">Explosion 1</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='bang'">Explosion 2</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='mso-spt54'">Up Ribbon</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-decision'">Decision</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-document'">Document</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-terminator'">Terminator</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='up-down-arrow-callout'">Up-Down Arrow Callout</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='quad-arrow-callout'">Quad Arrow Callout</xsl:when>
				<!--xsl:when test="$nodename='draw:custom-shape' and $type='mso-spt100'">Striped Right Arrow</xsl:when-->
				<xsl:when test="$nodename='draw:custom-shape' and $type='notched-right-arrow'">Notched Right Arrow</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='pentagon-right'">Pentagon Arrow</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='right-arrow-callout'">Right Arrow Callout</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='left-arrow-callout'">Left Arrow Callout</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='down-arrow-callout'">Down Arrow Callout</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='left-right-arrow-callout'">Left-Right Arrow Callout</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='circular-arrow'">Circular Arrow</xsl:when>
				<!--xsl:when test="$nodename='draw:custom-shape' and $type='non-primitive'">Bent-Up Arrow</xsl:when-->
				<xsl:when test="$nodename='draw:custom-shape' and $type='mso-spt89'">Left-Up Arrow</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-data'">Data</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-predefined-process'">Predefined Process</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-internal-storage'">Internal Storage</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='star4'">4-Point Star</xsl:when>
				<!--xsl:when test="$nodename='draw:custom-shape' and $type='round-rectangular-callout'">Rounded Rectangular Callout</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='round-callout'">Oval Callout</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='line-callout-1'">Line Callout1</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='line-callout-2'">Line Callout2</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='line-callout-3'">Line Callout3</xsl:when-->
				<xsl:when test="$nodename='draw:custom-shape' and $type='smiley'">Smiley Face</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='forbidden'">"No"  Symbol</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='non-primitive'">Lightning</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='bracket-pair'">Double Bracket</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-multidocument'">Multidocument</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='brace-pair'">Double Brace</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='left-bracket'">Left Bracket</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='right-bracket'">Right Bracket</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='left-brace'">Left Brace</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='right-brace'">Right Brace</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='circular-arrow'"/>
				<xsl:when test="$nodename='draw:custom-shape' and $type='circular-arrow'"/>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-preparation'">Preparation</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-manual-input'">Manual Input</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-manual-operation'">Manual Operation</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-connector'">Connector</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-off-page-connector'">Off-page Connector</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-card'">Card</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-punched-tape'">Punched Tape</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-summing-junction'">Summing Junction</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-or'">Or</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-collate'">Collate</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-sort'">Sort</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-extract'">Extract</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-merge'">Merge</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-stored-data'">Stored Data</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-delay'">Delay</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-sequential-access'">Sequential Access Storage</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-magnetic-disk'">Magnetic Disk</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-direct-access-storage'">Direct Access Storage</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='flowchart-display'">Display</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='vertical-scroll'">Vertical Scroll</xsl:when>
				<xsl:when test="$nodename='draw:custom-shape' and $type='horizontal-scroll'">Horizontal Scroll</xsl:when>
				<!--xsl:otherwise>Rectangle</xsl:otherwise-->
			</xsl:choose>
		</???:??????_801A>
	</xsl:template>
	<xsl:template name="draw:points">
		<xsl:param name="point"/>
		<xsl:param name="lujing"/>
		<xsl:choose>
			<xsl:when test="contains($point,' ' )">
				<xsl:variable name="first-point" select="substring-before($point,' ')"/>
				<xsl:variable name="other-point" select="substring-after($point,' ')"/>
				<xsl:variable name="xzuobiao">
					<xsl:value-of select="number(substring-before($first-point,',')) div 1000"/>
				</xsl:variable>
				<xsl:variable name="yzuobiao">
					<xsl:value-of select="number(substring-after($first-point,',')) div 1000"/>
				</xsl:variable>
				<xsl:call-template name="draw:points">
					<xsl:with-param name="point" select="$other-point"/>
					<xsl:with-param name="lujing" select="concat($lujing,$xzuobiao,' ',$yzuobiao,'lineto')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="xzuobiao">
					<xsl:value-of select="number(substring-before($point,',')) div 1000"/>
				</xsl:variable>
				<xsl:variable name="yzuobiao">
					<xsl:value-of select="number(substring-after($point,',')) div 1000"/>
				</xsl:variable>
				<xsl:value-of select="concat($lujing,$xzuobiao,' ',$yzuobiao)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="???:??????-graph">
		<xsl:variable name="path">
			<xsl:choose>
				<xsl:when test="@svg:d">
					<xsl:value-of select="@svg:d"/>
				</xsl:when>
				<xsl:when test="@draw:points">
					<xsl:call-template name="draw:points">
						<xsl:with-param name="point" select="@draw:points"/>
						<xsl:with-param name="lujing"/>
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="(./@draw:points or ./@svg:d) and ./@svg:viewBox">
			<???:??????_801C>
				<???:??????_806A>
					<xsl:element name="???:?????????_806B">
						<xsl:attribute name="x_C606"><xsl:value-of select="subsequence(tokenize(@svg:viewBox,' '),1,1)"/></xsl:attribute>
						<xsl:attribute name="y_C607"><xsl:value-of select="subsequence(tokenize(@svg:viewBox,' '),2,1)"/></xsl:attribute>
					</xsl:element>
					<xsl:element name="???:??????_806C">
						<xsl:attribute name="???_C604"><xsl:value-of select="subsequence(tokenize(@svg:viewBox,' '),4,1)"/></xsl:attribute>
						<xsl:attribute name="???_C605"><xsl:value-of select="subsequence(tokenize(@svg:viewBox,' '),3,1)"/></xsl:attribute>
					</xsl:element>
				</???:??????_806A>
				<xsl:element name="???:?????????_8069">
					<xsl:value-of select="$path"/>
				</xsl:element>
			</???:??????_801C>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:???????????????-graph">
		<xsl:if test="name(.)='draw:connector'">
			<???:???????????????_8027>
				<xsl:if test="@draw:style-name!=''">
					<xsl:attribute name="???????????????_8028"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="@draw:start-shape!=''">
					<xsl:attribute name="??????????????????_8029"><xsl:value-of select="@draw:start-shape"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="@draw:end-shape!=''">
					<xsl:attribute name="??????????????????_802A"><xsl:value-of select="@draw:end-shape"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="@draw:start-glue-point!=''">
					<xsl:attribute name="???????????????????????????_802B"><xsl:value-of select="@draw:start-glue-point"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="@draw:end-glue-point!=''">
					<xsl:attribute name="???????????????????????????_802C"><xsl:value-of select="@draw:end-glue-point"/></xsl:attribute>
				</xsl:if>
			</???:???????????????_8027>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:???????????????-graph">
		<xsl:param name="graphproperty"/>
		<???:???????????????_8018>
			<xsl:call-template name="FindType">
				<xsl:with-param name="graphproperty" select="$graphproperty"/>
			</xsl:call-template>
			<???:????????????_801B>NSO</???:????????????_801B>
			<xsl:call-template name="???:??????-graph"/>
			<xsl:call-template name="???:??????-graph">
				<xsl:with-param name="graphproperty" select="$graphproperty"/>
			</xsl:call-template>
			<xsl:call-template name="???:???????????????-graph"/>
		</???:???????????????_8018>
	</xsl:template>
	<xsl:template name="???:svg????????????-graph">
		<???:svg????????????_8017 svg:version="1.1" svg:xmlns_xlink="http://www.w3.org/1999/xlink">
			<xsl:variable name="width" select="fun:Convert2uofUnit(@svg:width)"/>
			<xsl:attribute name="svg:x"><xsl:value-of select="fun:Convert2uofUnit(@svg:x)"/></xsl:attribute>
			<xsl:attribute name="svg:y"><xsl:value-of select="fun:Convert2uofUnit(@svg:y)"/></xsl:attribute>
			<xsl:attribute name="svg:width"><xsl:value-of select="fun:Convert2uofUnit(@svg:width)"/></xsl:attribute>
			<xsl:attribute name="svg:height"><xsl:value-of select="fun:Convert2uofUnit(@svg:height)"/></xsl:attribute>
			<xsl:attribute name="svg:viewBox"><xsl:value-of select="fun:Convert2uofUnit(@svg:viewBox)"/></xsl:attribute>
			<svg:path>
				<xsl:attribute name="svg:d"><xsl:value-of select="@svg:d"/></xsl:attribute>
			</svg:path>
		</???:svg????????????_8017>
	</xsl:template>
	<xsl:template name="???:????????????-graph">
		<xsl:param name="graphproperty"/>
		<???:??????_803C>
			<xsl:if test="draw:text-box">
				<xsl:attribute name="??????????????????_8046">true</xsl:attribute>
			</xsl:if>
			<xsl:if test="$graphproperty/@fo:wrap-option = 'no-wrap'">
				<xsl:attribute name="??????????????????_8047">false</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="$graphproperty/@draw:auto-grow-height='true'">
					<xsl:attribute name="????????????????????????_8048">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????????????????_8048">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:variable name="parent-style">
				<xsl:choose>
					<xsl:when test="$graphproperty/@style:parent-style-name">
						<xsl:value-of select="$graphproperty/@style:parent-style-name"/>
					</xsl:when>
					<xsl:otherwise>notFrame</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:for-each select="$graphproperty">
				<xsl:if test="($parent-style != 'Frame' or $parent-style = 'notFrame') and (@fo:padding-left or @fo:padding-right or @fo:padding-top or @fo:padding-bottom)">
					<???:??????_803D>
						<xsl:if test="@fo:padding-left">
							<xsl:attribute name="???_C608"><xsl:value-of select="number(fun:Convert2uofUnit(@fo:padding-left))"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="@fo:padding-right">
							<xsl:attribute name="???_C60A"><xsl:value-of select="number(fun:Convert2uofUnit(@fo:padding-right))"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="@fo:padding-top">
							<xsl:attribute name="???_C609"><xsl:value-of select="number(fun:Convert2uofUnit(@fo:padding-top))"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="@fo:padding-bottom">
							<xsl:attribute name="???_C60B"><xsl:value-of select="number(fun:Convert2uofUnit(@fo:padding-bottom))"/></xsl:attribute>
						</xsl:if>
					</???:??????_803D>
				</xsl:if>
				<xsl:if test="@draw:textarea-horizontal-align or @draw:textarea-vertical-align">
					<???:??????_803E>
						<xsl:if test="@draw:textarea-horizontal-align">
							<xsl:attribute name="????????????_421D"><xsl:choose><xsl:when test="@draw:textarea-horizontal-align='justify'">justified</xsl:when><xsl:otherwise><xsl:value-of select="@draw:textarea-horizontal-align"/></xsl:otherwise></xsl:choose></xsl:attribute>
						</xsl:if>
						<xsl:if test="@draw:textarea-vertical-align">
							<xsl:variable name="verticalType">
								<xsl:choose>
									<xsl:when test="@draw:textarea-vertical-align = 'top'">top</xsl:when>
									<xsl:when test="@draw:textarea-vertical-align = 'middle'">center</xsl:when>
									<xsl:when test="@draw:textarea-vertical-align = 'bottom'">bottom</xsl:when>
									<xsl:when test="@draw:textarea-vertical-align = 'justify'">base</xsl:when>
									<xsl:otherwise>top</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:attribute name="????????????_421E"><xsl:value-of select="$verticalType"/></xsl:attribute>
						</xsl:if>
					</???:??????_803E>
				</xsl:if>
			</xsl:for-each>
			<xsl:variable name="textdirection">
				<xsl:variable name="styleName" select="draw:text-box/text:p/@text:style-name"/>
				<xsl:choose>
					<xsl:when test="$graphproperty/@style:writing-mode='tb-lr'">r2l-t2b-0e-90w</xsl:when>
					<xsl:when test="$graphproperty/@style:writing-mode='tb-rl'">l2r-b2t-270e-270w</xsl:when>
					<!--???????????????????????????????????????????????????-->
					<xsl:when test="../$graphproperty/style:paragraph-properties/@style:writing-mode='tb-lr'">r2l-t2b-0e-90w</xsl:when>
					<xsl:when test="../$graphproperty/style:paragraph-properties/@style:writing-mode='tb-rl'">l2r-b2t-270e-270w</xsl:when>
					<xsl:when test="key('ParaStyle',$styleName)/style:paragraph-properties/@style:writing-mode = 'rl-tb'">t2b-r2l-0e-0w</xsl:when>
					<!--xsl:when test="@draw:textarea-horizontal-align='right'">t2b-r2l-0e-0w</xsl:when-->
					<xsl:otherwise>t2b-l2r-0e-0w</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:if test="$textdirection != ''">
				<xsl:element name="???:??????????????????_8042">
					<xsl:value-of select="$textdirection"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="draw:text-box/@draw:chain-next-name">
				<xsl:variable name="secondName" select="draw:text-box/@draw:chain-next-name"/>
				<???:????????????_803F>
					<xsl:attribute name="????????????_8041" select="generate-id(/office:document/office:body/office:text/text:p/draw:frame[@draw:name = $secondName])"/>
				</???:????????????_803F>
			</xsl:if>
			<???:??????_8043>
				<xsl:choose>
					<xsl:when test="name(.)='draw:frame'">
						<xsl:for-each select="*">
							<xsl:choose>
								<xsl:when test="self::node()[name(.)='draw:text-box']">
									<xsl:call-template name="TextContent"/>
								</xsl:when>
								<xsl:when test="self::node()[name(.)='draw:image']">
									<xsl:call-template name="DrawContent"/>
								</xsl:when>
								<xsl:when test="self::node()[name(.)='table:table']">
									<xsl:apply-templates mode="text" select="."/>
								</xsl:when>
							</xsl:choose>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="DrawContent"/>
					</xsl:otherwise>
				</xsl:choose>
			</???:??????_8043>
		</???:??????_803C>
	</xsl:template>
	<xsl:template name="???:?????????">
		<xsl:variable name="modifiers" select="draw:enhanced-geometry/@draw:modifiers"/>
		<xsl:if test="$modifiers">
			<???:?????????_8039>
				<!--??????????????????draw:modifiers???????????????????????????????????????x????????????y???????????????????????????x?????????-->
				<xsl:attribute name="x_C606"><xsl:choose><xsl:when test="contains($modifiers,' ')"><xsl:value-of select="substring-before($modifiers,' ')"/></xsl:when><xsl:otherwise><xsl:value-of select="$modifiers"/></xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:if test="contains($modifiers,' ')">
					<xsl:attribute name="y_C607"><!--schema????????????--><xsl:value-of select="substring-before(substring-after($modifiers,' '),' ')"/></xsl:attribute>
				</xsl:if>
			</???:?????????_8039>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-graph">
		<xsl:variable name="svg_x1" select="fun:Convert2uofUnit(@svg:x1)"/>
		<xsl:variable name="svg_x2" select="fun:Convert2uofUnit(@svg:x2)"/>
		<xsl:variable name="svg_y1" select="fun:Convert2uofUnit(@svg:y1)"/>
		<xsl:variable name="svg_y2" select="fun:Convert2uofUnit(@svg:y2)"/>
		<xsl:if test="number($svg_x2) &lt; number($svg_x1) or number($svg_y2) &lt; number($svg_y1) or draw:enhanced-geometry/@draw:mirror-horizontal = 'true' or draw:enhanced-geometry/@draw:mirror-vertical = 'true'">
			<???:??????_803A>
				<xsl:choose>
					<xsl:when test="(number($svg_x2) &lt; number($svg_x1) and number($svg_y2) &lt; number($svg_y1)) or (draw:enhanced-geometry/@draw:mirror-horizontal = 'true' and draw:enhanced-geometry/@draw:mirror-vertical = 'true')">
						<xsl:value-of select="'xy'"/>
					</xsl:when>
					<xsl:when test="number($svg_x2) &lt; number($svg_x1) or draw:enhanced-geometry/@draw:mirror-horizontal = 'true'">
						<xsl:value-of select="'x'"/>
					</xsl:when>
					<xsl:when test="number($svg_y2) &lt; number($svg_y1) or draw:enhanced-geometry/@draw:mirror-vertical = 'true'">
						<xsl:value-of select="'y'"/>
					</xsl:when>
				</xsl:choose>
			</???:??????_803A>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-graph">
		<xsl:param name="IsinGroup"/>
		<xsl:if test="$IsinGroup='true'">
			<???:????????????_803B>
				<xsl:choose>
					<xsl:when test="@svg:x">
						<xsl:attribute name="x_C606"><xsl:value-of select="fun:Convert2uofUnit(@svg:x)"/></xsl:attribute>
						<xsl:if test="@svg:y">
							<xsl:attribute name="y_C607"><xsl:value-of select="fun:Convert2uofUnit(@svg:y)"/></xsl:attribute>
						</xsl:if>
					</xsl:when>
					<xsl:when test="@svg:x1">
						<xsl:variable name="svg_x1" select="fun:Convert2uofUnit(@svg:x1)"/>
						<xsl:variable name="svg_x2" select="fun:Convert2uofUnit(@svg:x2)"/>
						<xsl:variable name="svg_y1" select="fun:Convert2uofUnit(@svg:y1)"/>
						<xsl:variable name="svg_y2" select="fun:Convert2uofUnit(@svg:y2)"/>
						<xsl:choose>
							<xsl:when test="number($svg_x2) &gt; number($svg_x1)">
								<xsl:attribute name="x_C606"><xsl:value-of select="$svg_x1"/></xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="x_C606"><xsl:value-of select="$svg_x2"/></xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="number($svg_y2) &gt; number($svg_y1)">
								<xsl:attribute name="y_C607"><xsl:value-of select="$svg_y1"/></xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="y_C607"><xsl:value-of select="$svg_y2"/></xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
				</xsl:choose>
			</???:????????????_803B>
		</xsl:if>
	</xsl:template>
	<xsl:template name="frmobject">
		<xsl:if test="draw:image[@*|* and not(preceding-sibling::*)]">
			<??????:????????????_D701>
				<xsl:attribute name="?????????_D704"><xsl:value-of select="generate-id(draw:image)"/></xsl:attribute>
				<!--<xsl:choose>
					<xsl:when test="./draw:image/office:binary-data">
						<xsl:attribute name="????????????_D705">true</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="????????????_D705">false</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>-->
				<xsl:choose>
					<xsl:when test="contains(./draw:image/@xlink:href,'Pictures/')">
						<xsl:attribute name="????????????_D705">true</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="????????????_D705">false</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:variable name="pic">
					<xsl:choose>
						<xsl:when test="contains(./draw:image/@xlink:href,'.png')">png</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.jpg') or draw:image/office:binary-data">jpg</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.gif')">gif</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.bmp')">bmp</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.pbm')">pbm</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.ras')">ras</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.txt')">text</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.xml')">xml</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.htm')">html</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.html')">html</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.wav')">wav</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.mid')">midi</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.ra')">ra</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.au')">au</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.mp3')">mp3</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.snd')">snd</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.svg')">svg</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.avi')">avi</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.mpeg')">mpeg4</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.qt')">qt</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.rm')">rm</xsl:when>
						<xsl:when test="contains(./draw:image/@xlink:href,'.asf')">asf</xsl:when>
						<xsl:otherwise>??????</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$pic!='??????'">
						<xsl:attribute name="????????????_D706"><xsl:value-of select="$pic"/></xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="????????????_D707">??????</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="./draw:image/office:binary-data">
					<??????:??????_D702>
						<xsl:value-of select="./draw:image/office:binary-data"/>
					</??????:??????_D702>
				</xsl:if>
				<xsl:if test="./draw:image/@xlink:href != ''">
					<??????:??????_D703>
						<xsl:value-of select="replace(./draw:image/@xlink:href,'Pictures','/data')"/>
					</??????:??????_D703>
				</xsl:if>
				<xsl:if test="count(./draw:image/office:binary-data)=0 and count(./draw:image[@xlink:href!= ''])=0">
					<??????:??????_D702>
					</??????:??????_D702>
				</xsl:if>
			</??????:????????????_D701>
		</xsl:if>
		<xsl:if test="draw:object-ole[@*|*]">
			<??????:????????????_D701>
				<xsl:attribute name="?????????_D704"><xsl:value-of select="generate-id(draw:object-ole)"/></xsl:attribute>
				<xsl:choose>
					<xsl:when test="./draw:object-ole/office:binary-data">
						<xsl:attribute name="????????????_D705">true</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="????????????_D705">false</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:attribute name="????????????_D707">old??????</xsl:attribute>
				<xsl:if test="./draw:object-ole/office:binary-data">
					<??????:??????_D702>
						<xsl:value-of select="./draw:object-ole/office:binary-data"/>
					</??????:??????_D702>
				</xsl:if>
				<xsl:if test="./draw:object-ole/@xlink:href != ''">
					<??????:??????_D703>
						<xsl:value-of select="./draw:object-ole/@xlink:href"/>
					</??????:??????_D703>
				</xsl:if>
			</??????:????????????_D701>
		</xsl:if>
		<!--xsl:if test="draw:object[@*|*]">
			<xsl:if test="./draw:object/math:math">
				<uof:???????????? uof:locID="u0034" uof:attrList="?????????">
					<xsl:attribute name="uof:?????????"><xsl:value-of select="generate-id(draw:object)"/></xsl:attribute>
					<???:math>
						<xsl:copy-of select="draw:object/math:math/*"/>
					</???:math>
				</uof:????????????>
			</xsl:if>
		</xsl:if-->
	</xsl:template>
	<xsl:template name="equations">
		<xsl:if test=".//draw:object[@*|*]">
			<xsl:if test=".//draw:object/math:math">
				<??????:????????????_C201>
					<xsl:attribute name="?????????_C202"><xsl:value-of select="generate-id(draw:object)"/></xsl:attribute>
					<??????:math_C203>
						<xsl:copy-of select="draw:object/math:math/*"/>
					</??????:math_C203>
				</??????:????????????_C201>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="zuheliebiao">
		<xsl:param name="allnode"/>
		<xsl:choose>
			<xsl:when test="following-sibling::*[name()!='svg:title' and name()!='svg:desc' and name()!='office:eventlisteners' and name()!='draw:gluepoint']">
				<xsl:for-each select="following-sibling::*[name()!='svg:title' and name()!='svg:desc' and name()!='office:eventlisteners' and name()!='draw:gluepoint'][1]">
					<xsl:variable name="pic-name1">
						<xsl:choose>
							<xsl:when test="@draw:id">
								<xsl:value-of select="@draw:id"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="generate-id()"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="allnode1">
						<xsl:value-of select="concat($allnode,' ',$pic-name1)"/>
					</xsl:variable>
					<xsl:call-template name="zuheliebiao">
						<xsl:with-param name="allnode" select="$allnode1"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$allnode"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="AnchorToUofObject">
		<xsl:param name="graphproperty"/>
		<xsl:variable name="IsinGroup">
			<xsl:choose>
				<xsl:when test="name(..)='draw:g'">
					<xsl:value-of select="string('true')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="string('false')"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<???:??????_8062>
			<xsl:choose>
				<xsl:when test="@draw:id">
					<xsl:attribute name="?????????_804B"><xsl:value-of select="@draw:id"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="?????????_804B"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="name(.)='draw:g'">
				<xsl:variable name="grouplist">
					<xsl:for-each select="child::*[name()!='svg:title' and name()!='svg:desc' and name()!='office:eventlisteners' and name()!='draw:gluepoint'][1]">
						<xsl:variable name="pic-name">
							<xsl:choose>
								<xsl:when test="@draw:id">
									<xsl:value-of select="@draw:id"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="generate-id(.)"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:call-template name="zuheliebiao">
							<xsl:with-param name="allnode">
								<xsl:value-of select="$pic-name"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:variable>
				<xsl:attribute name="????????????_8064"><xsl:value-of select="$grouplist"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="$IsinGroup='false' and @draw:z-index">
				<xsl:attribute name="??????_8063"><xsl:value-of select="@draw:z-index"/></xsl:attribute>
			</xsl:if>
			<xsl:call-template name="???:???????????????-graph">
				<xsl:with-param name="graphproperty" select="$graphproperty"/>
			</xsl:call-template>
			<!--xsl:choose>
				<xsl:when test="name(.)='draw:path'">
					<xsl:call-template name="???:svg????????????-graph"/>
				</xsl:when-->
			<!-- test code, confirm draw:custom-shape
					<xsl:when test="name(.)='draw:custom-shape'">
						<???:svg???????????? svg:version="1.1" svg:xmlns_xlink="http://www.w3.org/1999/xlink">
							<xsl:attribute name="svg:x"><xsl:value-of select="@svg:x"/></xsl:attribute>
							<xsl:attribute name="svg:y"><xsl:value-of select="@svg:y"/></xsl:attribute>
							<xsl:attribute name="svg:width"><xsl:value-of select="@svg:width"/></xsl:attribute>
							<xsl:attribute name="svg:height"><xsl:value-of select="@svg:height"/></xsl:attribute>
							<xsl:attribute name="svg:viewBox"><xsl:value-of select="draw:enhanced-geometry/@svg:viewBox"/></xsl:attribute>
							<svg:path>
								<xsl:attribute name="svg:d"><xsl:value-of select="draw:enhanced-geometry/@draw:enhanced-path"/></xsl:attribute>
							</svg:path>
						</???:svg????????????>
					</xsl:when>	-->
			<!--xsl:otherwise>
					<xsl:call-template name="???:???????????????-graph">
						<xsl:with-param name="graphproperty" select="$graphproperty"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose-->
			<xsl:if test="name(.)='draw:frame'">
				<!--<xsl:if test="name(.)='draw:frame'">-->
				<xsl:if test="draw:image/office:binary-data">
					<xsl:element name="???:??????????????????_8037">
						<xsl:value-of select="generate-id(draw:image)"/>
					</xsl:element>
				</xsl:if>
				<!--
				<xsl:if test="key('Style',@draw:style-name)/style:graphic-properties/style:background-image/office:binary-data">
					<xsl:attribute name="???:????????????"><xsl:value-of select="generate-id(key('Style',@draw:style-name)/style:graphic-properties/style:background-image)"/></xsl:attribute>
				</xsl:if>
				-->
				<xsl:if test="$graphproperty/style:background-image/office:binary-data">
					<xsl:element name="???:??????????????????_8037">
						<xsl:value-of select="generate-id($graphproperty/style:background-image)"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="draw:image/@xlink:href and not(draw:object[@*|*])">
					<xsl:element name="???:??????????????????_8037">
						<xsl:value-of select="generate-id(draw:image)"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="draw:object-ole/office:binary-data">
					<xsl:element name="???:??????????????????_8038">
						<xsl:value-of select="generate-id(draw:object-ole)"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="draw:object[@*|*]">
					<xsl:element name="???:??????????????????_8065">
						<xsl:value-of select="generate-id(draw:object)"/>
					</xsl:element>
				</xsl:if>
			</xsl:if>
			<xsl:call-template name="???:?????????"/>
			<xsl:call-template name="???:??????-graph"/>
			<xsl:call-template name="???:????????????-graph">
				<xsl:with-param name="IsinGroup" select="$IsinGroup"/>
			</xsl:call-template>
			<xsl:call-template name="???:????????????-graph">
				<xsl:with-param name="graphproperty" select="$graphproperty"/>
			</xsl:call-template>
		</???:??????_8062>
	</xsl:template>
	<xsl:template name="printtest">
		<xsl:param name="graphproperty"/>
		<xsl:for-each select="$graphproperty/style:graphic-properties">
			<test1>
				<xsl:value-of select="@draw:stroke"/>
			</test1>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="ParentGraphicProp">
		<!--??????office:style??????????????????????????????????????????-->
		<xsl:for-each select="key('GraphStyle',@style:parent-style-name)[name(../..)='office:style']">
			<xsl:if test="@style:parent-style-name">
				<xsl:call-template name="ParentGraphicProp"/>
			</xsl:if>
			<!--ODF ??????????????????????????????????????????-->
			<xsl:copy-of select="style:paragraph-properties/@style:writing-mode"/>
			<xsl:copy-of select="style:graphic-properties/@*"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="OneGraphicStyle">
		<xsl:variable name="graphproperty-holder">
			<xsl:element name="style:graphic-properties">
				<xsl:if test="@style:parent-style-name">
					<xsl:attribute name="style:parent-style-name" select="@style:parent-style-name"/>
					<xsl:call-template name="ParentGraphicProp"/>
				</xsl:if>
				<!--ODF ??????????????????????????????????????????-->
				<xsl:copy-of select="style:paragraph-properties/@style:writing-mode"/>
				<xsl:copy-of select="style:graphic-properties/@*"/>
			</xsl:element>
		</xsl:variable>
		<!--<xsl:variable name="graphproperty" select="style:graphic-properties"/>
		<xsl:call-template name="printtest">
			<xsl:with-param name="graphproperty" select="$graphproperty"/>
		</xsl:call-template>-->
		<xsl:variable name="anchors" select="key('findanchor', @style:name)"/>
		<xsl:choose>
			<xsl:when test="$anchors">
				<xsl:for-each select="$anchors">
					<xsl:call-template name="AnchorToUofObject">
						<xsl:with-param name="graphproperty" select="$graphproperty-holder/style:graphic-properties"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="anchors2" select="key('findanchorP', @style:name)"/>
				<xsl:for-each select="$anchors2">
					<xsl:call-template name="AnchorToUofObject">
						<xsl:with-param name="graphproperty" select="$graphproperty-holder/style:graphic-properties"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="ObjectSets">
		<??????:?????????_7C00>
			<xsl:for-each select="office:styles/style:style[@style:family='graphic']">
				<xsl:call-template name="OneGraphicStyle"/>
			</xsl:for-each>
			<xsl:for-each select="office:styles/style:style[@style:family='presentation']">
				<xsl:call-template name="OneGraphicStyle"/>
			</xsl:for-each>
			<xsl:for-each select="office:automatic-styles/style:style[@style:family='graphic']">
				<xsl:call-template name="OneGraphicStyle"/>
			</xsl:for-each>
			<xsl:for-each select="office:automatic-styles/style:style[@style:family='presentation']">
				<xsl:call-template name="OneGraphicStyle"/>
			</xsl:for-each>
			<!--xsl:if test="$documentType='presentation'"??????????????????-->
			<xsl:for-each select="/office:document/office:master-styles//draw:g | /office:document/office:body//draw:g |/office:document/office:body//table:shapes/draw:frame">
				<xsl:if test="not(@draw:style-name)">
					<xsl:call-template name="AnchorToUofObject">
						<xsl:with-param name="graphproperty">
							<style:graphic-properties/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
			<!--/xsl:if-->
			<xsl:for-each select="office:master-styles//draw:page-thumbnail[not(@draw:style-name) and not(@presentation:style-name)]|office:styles/style:presentation-page-layout/presentation:placeholder | office:body/office:presentation/draw:page//draw:page-thumbnail[not(@draw:style-name) and not(@presentation:style-name)]|office:body/office:presentation/draw:page//draw:frame[not(@draw:style-name) and not(@presentation:style-name)]">
				<xsl:call-template name="AnchorToUofObject">
					<xsl:with-param name="graphproperty">
						<style:graphic-properties>page-thumbnail</style:graphic-properties>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
		</??????:?????????_7C00>
	</xsl:template>
	<xsl:template name="Graphic_ObjectData">
		<xsl:variable name="anchors" select="key('findanchor', @style:name)"/>
		<xsl:choose>
			<xsl:when test="$anchors">
				<xsl:for-each select="$anchors">
					<xsl:if test="name(.)='draw:frame'">
						<xsl:call-template name="frmobject"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="anchors2" select="key('findanchorP', @style:name)"/>
				<xsl:for-each select="$anchors2">
					<xsl:if test="name(.)='draw:frame'">
						<xsl:call-template name="frmobject"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="ObjectData">
		<xsl:for-each select="/office:document/office:styles/style:style[@style:family='graphic']">
			<xsl:call-template name="Graphic_ObjectData"/>
		</xsl:for-each>
		<xsl:for-each select="/office:document/office:styles/style:style[@style:family='presentation']">
			<xsl:call-template name="Graphic_ObjectData"/>
		</xsl:for-each>
		<xsl:for-each select="/office:document/office:automatic-styles/style:style[@style:family='graphic']">
			<xsl:call-template name="Graphic_ObjectData"/>
		</xsl:for-each>
		<xsl:for-each select="/office:document/office:automatic-styles/style:style[@style:family='presentation']">
			<xsl:call-template name="Graphic_ObjectData"/>
		</xsl:for-each>
		<xsl:for-each select="/office:document/office:body/office:presentation/draw:page//draw:frame[not(@draw:style-name) and not(@presentation:style-name)]">
			<xsl:if test="name(.)='draw:frame'">
				<xsl:call-template name="frmobject"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="(/office:document/office:styles/style:style/style:paragraph-properties/style:background-image) | (/office:document/office:automatic-styles/style:style/style:paragraph-properties/style:background-image) | (/office:document/office:automatic-styles/style:page-layout/style:page-layout-properties/style:background-image) | /office:document/office:automatic-styles/style:style/style:table-cell-properties/style:background-image | /office:document/office:automatic-styles/style:style/style:table-properties/style:background-image | /office:document/office:automatic-styles/style:style/style:graphic-properties/style:background-image">
			<xsl:if test="@xlink:href != '' or child::* or draw:image/@xlink:href != ''">
				<??????:????????????_D701>
					<xsl:attribute name="?????????_D704"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
					<xsl:attribute name="????????????_D706"><xsl:choose><xsl:when test="ends-with(@xlink:href,'png')">png</xsl:when><xsl:when test="ends-with(@xlink:href,'bmp')">bmp</xsl:when><xsl:when test="ends-with(@xlink:href,'ras')">ras</xsl:when><xsl:when test="ends-with(@xlink:href,'gif')">gif</xsl:when><xsl:otherwise>jpg</xsl:otherwise></xsl:choose></xsl:attribute>
					<xsl:attribute name="????????????_D705"><xsl:choose><xsl:when test="contains(@xlink:href,'Pictures/')">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:attribute>
					<xsl:if test="office:binary-data">
						<??????:??????_D702>
							<xsl:value-of select="office:binary-data"/>
						</??????:??????_D702>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="@xlink:href != '' and contains(@xlink:href,'Pictures/')">
							<??????:??????_D703>
								<xsl:value-of select="replace(@xlink:href,'Pictures','/data')"/>
							</??????:??????_D703>
						</xsl:when>
						<xsl:otherwise>
							<??????:??????_D703>
								<xsl:value-of select="@xlink:href"/>
							</??????:??????_D703>
						</xsl:otherwise>
					</xsl:choose>
				</??????:????????????_D701>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="(/office:document/office:styles/text:list-style/text:list-level-style-image) | (/office:document/office:automatic-styles/text:list-style/text:list-level-style-image)">
			<??????:????????????_D701>
				<xsl:attribute name="?????????_D704"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="????????????_D706">png</xsl:attribute>
				<xsl:attribute name="????????????_D705">true</xsl:attribute>
				<xsl:if test="office:binary-data">
					<??????:??????_D702>
						<xsl:value-of select="office:binary-data"/>
					</??????:??????_D702>
				</xsl:if>
				<xsl:if test="@xlink:href != ''">
					<??????:??????_D703>
						<xsl:value-of select="replace(@xlink:href,'Pictures','/data')"/>
					</??????:??????_D703>
				</xsl:if>
			</??????:????????????_D701>
		</xsl:for-each>
		<!--<xsl:for-each select="//office:document/office:styles/draw:fill-image[@draw:name != '']">
			<??????:????????????_D701>
				<xsl:attribute name="?????????_D704"><xsl:value-of select="@draw:name"/></xsl:attribute>
				<xsl:attribute name="????????????_D706">png</xsl:attribute>
				<xsl:attribute name="????????????_D705">true</xsl:attribute>
				<xsl:choose>
					<xsl:when test="office:binary-data">
						<??????:??????_D702>
							<xsl:value-of select="office:binary-data"/>
						</??????:??????_D702>
					</xsl:when>
					<xsl:when test="@xlink:href">
						<??????:??????_D703>
							<xsl:value-of select="replace(@xlink:href,'Pictures','data')"/>
						</??????:??????_D703>
					</xsl:when>
				</xsl:choose>
			</??????:????????????_D701>
		</xsl:for-each>-->
		<!--?????????????????????????????????????????????-->
		<xsl:for-each-group group-by="@draw:name" select="//office:document/office:styles/draw:fill-image[@draw:name != '']">
			<??????:????????????_D701>
				<xsl:attribute name="?????????_D704"><xsl:value-of select="@draw:name"/></xsl:attribute>
				<xsl:attribute name="????????????_D706">png</xsl:attribute>
				<xsl:attribute name="????????????_D705">true</xsl:attribute>
				<xsl:choose>
					<xsl:when test="office:binary-data">
						<??????:??????_D702>
							<xsl:value-of select="office:binary-data"/>
						</??????:??????_D702>
					</xsl:when>
					<xsl:when test="@xlink:href">
						<??????:??????_D703>
							<xsl:value-of select="replace(@xlink:href,'Pictures','/data')"/>
						</??????:??????_D703>
					</xsl:when>
				</xsl:choose>
			</??????:????????????_D701>
		</xsl:for-each-group>
	</xsl:template>
	<xsl:template name="addsect">
		<xsl:if test="$documentType = 'text'">
			<xsl:variable name="bs">
				<xsl:choose>
					<xsl:when test="./@text:style-name">
						<xsl:value-of select="./@text:style-name"/>
					</xsl:when>
					<xsl:when test="./@table:style-name">
						<xsl:value-of select="./@table:style-name"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="bs1" select="/office:document/office:automatic-styles/style:style[@style:name=$bs]/@style:master-page-name"/>
			<xsl:if test="$bs1 != ''">
				<xsl:variable name="mpage" select="/office:document/office:master-styles/style:master-page[@style:name=$bs1]"/>
				<xsl:call-template name="text-page-layout">
					<xsl:with-param name="master-page" select="$mpage"/>
					<xsl:with-param name="textstylename" select="$bs"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="ParaStyleNameFromShape">
		<xsl:param name="shapestyle"/>
		<xsl:for-each select="key('GraphStyle',string($shapestyle))">
			<xsl:choose>
				<xsl:when test="style:paragraph-properties or style:text-properties">
					<xsl:value-of select="$shapestyle"/>
				</xsl:when>
				<xsl:when test="@style:parent-style-name">
					<xsl:call-template name="ParaStyleNameFromShape">
						<xsl:with-param name="shapestyle" select="@style:parent-style-name"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>Null</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="PropFrmParaAttr">
		<xsl:param name="pstylename"/>
		<!--default-style ???????????????????????????????????????-->
		<xsl:for-each select="key('ParaStyle',string($pstylename))">
			<xsl:if test="@style:parent-style-name">
				<xsl:call-template name="PropFrmParaAttr">
					<xsl:with-param name="pstylename" select="@style:parent-style-name"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:copy-of select="style:paragraph-properties/@*"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="PropFrmParaElement">
		<xsl:param name="pstylename"/>
		<!--default-style ???????????????????????????????????????-->
		<xsl:for-each select="key('ParaStyle',string($pstylename))">
			<xsl:choose>
				<xsl:when test="style:paragraph-properties/*">
					<xsl:copy-of select="style:paragraph-properties/*"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="@style:parent-style-name">
						<xsl:call-template name="PropFrmParaElement">
							<xsl:with-param name="pstylename" select="@style:parent-style-name"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="PropFrmPara">
		<xsl:param name="pstylename"/>
		<xsl:call-template name="PropFrmParaAttr">
			<xsl:with-param name="pstylename" select="$pstylename"/>
		</xsl:call-template>
		<xsl:call-template name="PropFrmParaElement">
			<xsl:with-param name="pstylename" select="$pstylename"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="PropFrmTextPara">
		<xsl:param name="pstylename"/>
		<!--default-style ???????????????????????????????????????-->
		<xsl:for-each select="key('ParaStyle',string($pstylename))">
			<xsl:if test="@style:parent-style-name">
				<xsl:call-template name="PropFrmTextPara">
					<xsl:with-param name="pstylename" select="@style:parent-style-name"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:copy-of select="style:text-properties/@*"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="ParaPropAndStyleRef">
		<xsl:param name="currlistlvl"/>
		<xsl:param name="liststylename"/>
		<xsl:choose>
			<!--??? ??? ????????????????????????????????????????????????????????????????????? ?????? ?????????????????????-->
			<xsl:when test="$documentType = 'presentation' and not(ancestor::draw:frame/@presentation:class='outline')">
				<xsl:variable name="shapestyle">
					<xsl:for-each select="ancestor::draw:caption|ancestor::draw:circle|ancestor::draw:connector|ancestor::draw:custom-shape|ancestor::draw:ellipse|ancestor::draw:image|ancestor::draw:line|ancestor::draw:measure|ancestor::draw:path|ancestor::draw:polygon|ancestor::draw:polyline|ancestor::draw:rect|ancestor::draw:regular-polygon|ancestor::draw:frame">
						<xsl:choose>
							<xsl:when test="@presentation:style-name">
								<xsl:value-of select="@presentation:style-name"/>
							</xsl:when>
							<xsl:when test="@draw:style-name">
								<xsl:value-of select="@draw:style-name"/>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</xsl:variable>
				<xsl:variable name="Pstylenamefrmshape">
					<xsl:choose>
						<xsl:when test="$shapestyle!=''">
							<xsl:call-template name="ParaStyleNameFromShape">
								<xsl:with-param name="shapestyle" select="string($shapestyle)"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>Null</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$Pstylenamefrmshape='Null'">
						<xsl:if test="@text:style-name">
							<xsl:attribute name="????????????_419C"><xsl:value-of select="@text:style-name"/></xsl:attribute>
							<xsl:call-template name="???:????????????-paragraph">
								<xsl:with-param name="level" select="$currlistlvl"/>
							</xsl:call-template>
							<xsl:call-template name="???:??????????????????-paragraph">
								<xsl:with-param name="autonum" select="$liststylename"/>
								<xsl:with-param name="level" select="$currlistlvl"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<!--??????????????? ?????? ???????????????-->
						<xsl:attribute name="????????????_419C"><xsl:value-of select="$Pstylenamefrmshape"/></xsl:attribute>
						<xsl:choose>
							<xsl:when test="@text:style-name">
								<!--?????????????????????????????????????????????-->
								<xsl:variable name="stylefrmpara">
									<xsl:element name="style:style">
										<xsl:element name="style:paragraph-properties">
											<xsl:call-template name="PropFrmPara">
												<xsl:with-param name="pstylename" select="@text:style-name"/>
											</xsl:call-template>
										</xsl:element>
										<style:text-properties>
											<xsl:call-template name="PropFrmTextPara">
												<xsl:with-param name="pstylename" select="@text:style-name"/>
											</xsl:call-template>
										</style:text-properties>
										<!-- default-style ?????????????????? ?????????????????????
												<xsl:for-each select="/office:document/office:styles/style:default-style[@style:family='graphic']/style:text-properties">
													<xsl:copy-of select="."/>
													
												</xsl:for-each>
-->
									</xsl:element>
								</xsl:variable>
								<!--???????????????-->
								<xsl:variable name="stylefrmTextpara">
									<xsl:element name="style:style">
										<style:text-properties>
											<xsl:call-template name="PropFrmTextPara">
												<xsl:with-param name="pstylename" select="@text:style-name"/>
											</xsl:call-template>
										</style:text-properties>
									</xsl:element>
								</xsl:variable>
								<xsl:for-each select="$stylefrmpara/style:style">
									<xsl:call-template name="UofParagraphStyle">
										<xsl:with-param name="level" select="$currlistlvl"/>
										<xsl:with-param name="autonum" select="$liststylename"/>
									</xsl:call-template>
								</xsl:for-each>
								<xsl:for-each select="$stylefrmTextpara/style:style">
									<???:?????????_4158>
										<xsl:call-template name="UOFTextStyle"/>
									</???:?????????_4158>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="???:????????????-paragraph">
									<xsl:with-param name="level" select="$currlistlvl"/>
								</xsl:call-template>
								<xsl:call-template name="???:??????????????????-paragraph">
									<xsl:with-param name="autonum" select="$liststylename"/>
									<xsl:with-param name="level" select="$currlistlvl"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="@text:style-name">
					<xsl:attribute name="????????????_419C"><xsl:value-of select="@text:style-name"/></xsl:attribute>
				</xsl:if>
				<xsl:call-template name="???:????????????-paragraph">
					<xsl:with-param name="level" select="$currlistlvl"/>
				</xsl:call-template>
				<xsl:call-template name="???:??????????????????-paragraph">
					<xsl:with-param name="autonum" select="$liststylename"/>
					<xsl:with-param name="level" select="$currlistlvl"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text:p">
		<xsl:call-template name="addsect"/>
		<???:??????_416B>
			<xsl:if test="@text:id">
				<xsl:attribute name="?????????_4169"><xsl:value-of select="@text:id"/></xsl:attribute>
			</xsl:if>
			<xsl:element name="???:????????????_419B">
				<xsl:call-template name="ParaPropAndStyleRef"/>
			</xsl:element>
			<xsl:if test="@text:style-name">
				<xsl:variable name="Curstyle" select="key('Style', @text:style-name)"/>
				<xsl:choose>
					<xsl:when test="$Curstyle/style:paragraph-properties/@fo:break-before='page'">
						<???:???_419D>
							<???:?????????_4163/>
						</???:???_419D>
					</xsl:when>
					<xsl:when test="$Curstyle/style:paragraph-properties/@fo:break-before='column'">
						<???:???_419D>
							<???:?????????_4160/>
						</???:???_419D>
					</xsl:when>
				</xsl:choose>
			</xsl:if>
			<xsl:call-template name="paragraph_content"/>
			<xsl:if test="@text:style-name">
				<xsl:variable name="Curstyle" select="key('Style', @text:style-name)"/>
				<xsl:choose>
					<xsl:when test="$Curstyle/style:paragraph-properties/@fo:break-after='page'">
						<???:???_419D>
							<???:?????????_4163/>
						</???:???_419D>
					</xsl:when>
					<xsl:when test="$Curstyle/style:paragraph-properties/@fo:break-after='column'">
						<???:???_419D>
							<???:?????????_4160/>
						</???:???_419D>
					</xsl:when>
				</xsl:choose>
			</xsl:if>
		</???:??????_416B>
	</xsl:template>
	<xsl:template match="text:h">
		<xsl:call-template name="addsect"/>
		<???:??????_416B>
			<xsl:if test="@text:id">
				<xsl:attribute name="?????????_4169"><xsl:value-of select="@text:id"/></xsl:attribute>
			</xsl:if>
			<xsl:element name="???:????????????_419B">
				<xsl:call-template name="ParaPropAndStyleRef">
					<xsl:with-param name="currlistlvl" select="@text:outline-level"/>
				</xsl:call-template>
			</xsl:element>
			<xsl:call-template name="paragraph_content"/>
		</???:??????_416B>
	</xsl:template>
	<xsl:template match="text:number">
	</xsl:template>
	<xsl:template match="text:soft-page-break">
	</xsl:template>
	<xsl:template name="list-text-paragraph">
		<xsl:param name="currlistlvl"/>
		<xsl:param name="liststylename"/>
		<xsl:call-template name="addsect"/>
		<???:??????_416B>
			<xsl:if test="@text:id">
				<xsl:attribute name="?????????_4169"><xsl:value-of select="@text:id"/></xsl:attribute>
			</xsl:if>
			<xsl:element name="???:????????????_419B">
				<xsl:call-template name="ParaPropAndStyleRef">
					<xsl:with-param name="currlistlvl" select="$currlistlvl"/>
					<xsl:with-param name="liststylename" select="$liststylename"/>
				</xsl:call-template>
			</xsl:element>
			<xsl:call-template name="paragraph_content"/>
		</???:??????_416B>
	</xsl:template>
	<xsl:template name="list-item-content">
		<xsl:param name="currlistlvl"/>
		<xsl:param name="liststylename"/>
		<!--<xsl:for-each select="child::node( )[1]">-->
		<xsl:for-each select="text:number | text:h | text:p| text:list | text:soft-page-break">
			<xsl:if test="position() = 1">
				<xsl:choose>
					<xsl:when test="self::node()[name(.)='text:number']">
						<xsl:apply-templates select="."/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='text:h']">
						<xsl:call-template name="list-text-paragraph">
							<xsl:with-param name="currlistlvl" select="$currlistlvl"/>
							<xsl:with-param name="liststylename" select="$liststylename"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='text:p']">
						<xsl:call-template name="list-text-paragraph">
							<xsl:with-param name="currlistlvl" select="$currlistlvl"/>
							<xsl:with-param name="liststylename" select="$liststylename"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='text:list']">
						<xsl:call-template name="list-content">
							<xsl:with-param name="currlistlvl" select="$currlistlvl+1"/>
							<xsl:with-param name="liststylename" select="$liststylename"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='text:soft-page-break']">
						<xsl:apply-templates select="."/>
					</xsl:when>
				</xsl:choose>
			</xsl:if>
		</xsl:for-each>
		<!--<xsl:for-each select="node( )[position() > 1]">-->
		<xsl:for-each select="text:number | text:h | text:p| text:list | text:soft-page-break">
			<xsl:if test="position() &gt; 1">
				<xsl:choose>
					<xsl:when test="self::node()[name(.)='text:number']">
						<xsl:apply-templates select="."/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='text:h']">
						<xsl:apply-templates select="."/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='text:p']">
						<xsl:apply-templates select="."/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='text:list']">
						<xsl:call-template name="list-content">
							<xsl:with-param name="currlistlvl" select="$currlistlvl+1"/>
							<xsl:with-param name="liststylename" select="$liststylename"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='text:soft-page-break']">
						<xsl:apply-templates select="."/>
					</xsl:when>
				</xsl:choose>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="list-content">
		<xsl:param name="currlistlvl"/>
		<xsl:param name="liststylename"/>
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="self::node()[name(.)='text:list-header']">
					<xsl:call-template name="list-item-content">
						<xsl:with-param name="currlistlvl" select="0"/>
						<xsl:with-param name="liststylename" select="$liststylename"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:list-item']">
					<xsl:call-template name="list-item-content">
						<xsl:with-param name="currlistlvl" select="$currlistlvl"/>
						<xsl:with-param name="liststylename" select="$liststylename"/>
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="text:numbered-paragraph">
	</xsl:template>
	<xsl:template match="text:illustration-index">
	</xsl:template>
	<xsl:template match="text:table-index">
	</xsl:template>
	<xsl:template match="text:object-index">
	</xsl:template>
	<xsl:template match="text:user-index">
	</xsl:template>
	<xsl:template match="text:alphabetical-index">
		<xsl:element name="???:??????_416B">
			<xsl:element name="???:????????????_419B">
				<xsl:attribute name="????????????_419C"><xsl:value-of select="text:index-body/text:p/@text:style-name"/></xsl:attribute>
				<xsl:element name="???:???????????????_418F">
					<xsl:element name="???:?????????_4171">
						<xsl:variable name="aa" select="text:index-body/text:p/@text:style-name"/>
						<xsl:attribute name="??????_4172"><xsl:value-of select="fun:Convert2uofUnit(key('Style',$aa)/style:paragraph-properties/style:tab-stops/style:tab-stop/@style:position)"/></xsl:attribute>
						<xsl:attribute name="??????_4173"><xsl:value-of select="key('Style',$aa)/style:paragraph-properties/style:tab-stops/style:tab-stop/@style:type"/></xsl:attribute>
						<xsl:attribute name="???????????????_4175"><xsl:value-of select="key('Style',$aa)/style:paragraph-properties/style:tab-stops/style:tab-stop/@style:leader-text"/></xsl:attribute>
						<xsl:if test="key('Style',$aa)/style:paragraph-properties/style:tab-stops/style:tab-stop/@style:leader-style">
							<xsl:attribute name="?????????_4174"><xsl:value-of select="key('Style',$aa)/style:paragraph-properties/style:tab-stops/style:tab-stop/@style:leader-style"/></xsl:attribute>
						</xsl:if>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="???:?????????_419E">
				<xsl:attribute name="??????_416E"><xsl:value-of select="'INDEX'"/></xsl:attribute>
				<xsl:if test="@text:protected">
					<xsl:attribute name="????????????_416F"><xsl:value-of select="@text:protected"/></xsl:attribute>
				</xsl:if>
			</xsl:element>
			<xsl:element name="???:?????????_419F">
				<???:??????_416B>
					<???:???_419D>
						<???:?????????_415B>
							<xsl:value-of select="'TOC \o 1-10 \h \z'"/>
						</???:?????????_415B>
					</???:???_419D>
				</???:??????_416B>
				<!--  bug118  -->
				<xsl:for-each select="text:index-body/text:index-title/text:p">
					<???:??????_416B>
						<xsl:element name="???:????????????_419B">
							<xsl:call-template name="ParaPropAndStyleRef"/>
						</xsl:element>
						<???:???_419D>
							<???:?????????_4158>
								<xsl:attribute name="????????????_417B"><xsl:value-of select="@text:style-name"/></xsl:attribute>
							</???:?????????_4158>
							<xsl:element name="???:?????????_415B">
								<xsl:value-of select="self::node()"/>
							</xsl:element>
						</???:???_419D>
					</???:??????_416B>
				</xsl:for-each>
				<xsl:for-each select="text:index-body/text:p">
					<???:??????_416B>
						<xsl:element name="???:????????????_419B">
							<xsl:call-template name="ParaPropAndStyleRef"/>
							<!--xsl:element name="???:???????????????">
								<xsl:attribute name="uof:locID">t0067</xsl:attribute>
								<xsl:element name="???:?????????">
									<xsl:attribute name="uof:locID">t0068</xsl:attribute>
									<xsl:attribute name="uof:attrList">?????? ?????? ????????? ???????????????</xsl:attribute>
									<xsl:variable name="aa" select="@text:style-name"/>
									<xsl:attribute name="???:??????">
										<xsl:value-of select="fun:Convert2uofUnit(key('Style',$aa)/style:paragraph-properties/style:tab-stops/style:tab-stop/@style:position)"/>
									</xsl:attribute>
									<xsl:attribute name="???:??????">
										<xsl:value-of select="key('Style',$aa)/style:paragraph-properties/style:tab-stops/style:tab-stop/@style:type"/>
									</xsl:attribute>
									<xsl:attribute name="???:???????????????">
										<xsl:value-of select="key('Style',$aa)/style:paragraph-properties/style:tab-stops/style:tab-stop/@style:leader-text"/>
									</xsl:attribute>
									<xsl:if test="key('Style',$aa)/style:paragraph-properties/style:tab-stops/style:tab-stop/@style:leader-style">
										<xsl:attribute name="???:?????????">
											<xsl:value-of select="key('Style',$aa)/style:paragraph-properties/style:tab-stops/style:tab-stop/@style:leader-style"/>
										</xsl:attribute>
									</xsl:if>
								</xsl:element>
							</xsl:element-->
						</xsl:element>
						<xsl:for-each select="node()">
							<???:???_419D>
								<xsl:choose>
									<xsl:when test="name(.)='text:tab-stop' or name(.)='text:tab'">
										<xsl:element name="???:?????????_415E">
										</xsl:element>
									</xsl:when>
									<xsl:otherwise>
										<xsl:element name="???:?????????_415B">
											<xsl:value-of select="."/>
										</xsl:element>
									</xsl:otherwise>
								</xsl:choose>
							</???:???_419D>
						</xsl:for-each>
					</???:??????_416B>
				</xsl:for-each>
			</xsl:element>
			<xsl:element name="???:?????????_419F"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="text:bibliography">
	</xsl:template>
	<xsl:template name="ComputeCellWidth">
		<xsl:param name="CurrentPosition"/>
		<xsl:param name="ColumnSpanned"/>
		<xsl:param name="nCellWidth"/>
		<xsl:choose>
			<xsl:when test="$ColumnSpanned &gt; 0">
				<xsl:variable name="ColumnStyle">
					<xsl:choose>
						<xsl:when test="name(../..)='table:table-header-rows' and ../../../table:table-column[number($CurrentPosition)]/@table:style-name">
							<xsl:value-of select="../../../table:table-column[number($CurrentPosition)]/@table:style-name"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="../../table:table-column[number($CurrentPosition)]/@table:style-name"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="colwidth" select="fun:Convert2uofUnit(key('ColStyle',$ColumnStyle)/style:table-column-properties/@style:column-width)"/>
				<xsl:variable name="Widthnew" select="$nCellWidth + $colwidth"/>
				<xsl:call-template name="ComputeCellWidth">
					<xsl:with-param name="CurrentPosition" select="$CurrentPosition + 1"/>
					<xsl:with-param name="ColumnSpanned" select="$ColumnSpanned - 1"/>
					<xsl:with-param name="nCellWidth" select="$Widthnew"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="?????????_41A2"><xsl:value-of select="$nCellWidth"/></xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="execTableCellAttribute">
		<xsl:param name="CellPosition"/>
		<xsl:element name="???:???????????????_41B7">
			<xsl:variable name="StyleName" select="@table:style-name"/>
			<xsl:element name="???:??????_41A1">
				<xsl:variable name="sn">
					<xsl:number count="table:table-cell" format="1" from="/office:document/office:body/office:text" level="single"/>
				</xsl:variable>
				<xsl:variable name="sn1">
					<xsl:choose>
						<xsl:when test="../../table:table-column[number($sn)]/@table:style-name">
							<xsl:value-of select="$sn"/>
						</xsl:when>
						<xsl:when test=" name(../..)='table:table-header-rows' and ../../../table:table-column[number($sn)]/@table:style-name">
							<xsl:value-of select="$sn"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'1'"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="KuanDu">
					<xsl:choose>
						<xsl:when test=" name(../..)='table:table-header-rows' and ../../../table:table-column[number($sn)]/@table:style-name">
							<xsl:value-of select="../../../table:table-column[number($sn1)]/@table:style-name"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="../../table:table-column[number($sn1)]/@table:style-name"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<!-- ???????????????????????? -->
				<xsl:choose>
					<xsl:when test="@table:number-columns-spanned">
						<xsl:variable name="nColumnSpanned" select="@table:number-columns-spanned"/>
						<xsl:variable name="nCellWidth" select="number(0)"/>
						<xsl:call-template name="ComputeCellWidth">
							<xsl:with-param name="CurrentPosition" select="$CellPosition"/>
							<xsl:with-param name="ColumnSpanned" select="$nColumnSpanned"/>
							<xsl:with-param name="nCellWidth" select="$nCellWidth"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="key('ColStyle',../../table:table-column[number($CellPosition)]/@table:style-name)/style:table-column-properties/@style:column-width">
							<xsl:variable name="colwidth" select="fun:Convert2uofUnit(key('ColStyle',../../table:table-column[number($CellPosition)]/@table:style-name)[1]/style:table-column-properties/@style:column-width)"/>
							<xsl:attribute name="?????????_41A2"><xsl:value-of select="$colwidth"/></xsl:attribute>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
				<!-- end -->
				<xsl:if test="key('ColStyle',$KuanDu)/style:table-column-properties/@style:rel-column-width">
					<xsl:attribute name="?????????_41A3"><xsl:value-of select="substring-before(key('ColStyle',$KuanDu)[1]/style:table-column-properties/@style:rel-column-width,'*')"/></xsl:attribute>
				</xsl:if>
			</xsl:element>
			<!--??????UOF???ODF??????????????????????????????????????????????????????????????????uof2ootext?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????oo2uoftext????????????????????????????????????????????????-->
			<!--xsl:variable name="OffieceElectricDocumentDefaultStripBool">
				<xsl:choose>
					<xsl:when test="../../../../../draw:frame and contains(../../../../../draw:frame/@draw:name, 'Embeded_frame') and (count(../../../node()) = 1)">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:variable-->
			<xsl:for-each select="key('CellStyle',$StyleName)">
				<xsl:variable name="style_name">
					<xsl:variable name="bb">
						<xsl:for-each select="preceding-sibling::*[@style:family = 'table-cell']">
							<xsl:value-of select="@style:name"/>
						</xsl:for-each>
					</xsl:variable>
					<xsl:value-of select="concat($bb,'_')"/>
				</xsl:variable>
				<xsl:if test="not(contains($style_name,@style:name))">
					<xsl:element name="???:???????????????_41A4">
						<xsl:choose>
							<!--xsl:when test="$OffieceElectricDocumentDefaultStripBool = 'true'">
								<xsl:attribute name="???:???">0</xsl:attribute>
								<xsl:attribute name="???:???">0</xsl:attribute>
								<xsl:attribute name="???:???">0</xsl:attribute>
								<xsl:attribute name="???:???">0</xsl:attribute>
							</xsl:when-->
							<xsl:when test="style:table-cell-properties/@fo:padding">
								<xsl:attribute name="???_C609"><xsl:value-of select="fun:Convert2uofUnit(style:table-cell-properties/@fo:padding)"/></xsl:attribute>
								<xsl:attribute name="???_C608"><xsl:value-of select="fun:Convert2uofUnit(style:table-cell-properties/@fo:padding)"/></xsl:attribute>
								<xsl:attribute name="???_C60A"><xsl:value-of select="fun:Convert2uofUnit(style:table-cell-properties/@fo:padding)"/></xsl:attribute>
								<xsl:attribute name="???_C60B"><xsl:value-of select="fun:Convert2uofUnit(style:table-cell-properties/@fo:padding)"/></xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="???_C609"><xsl:value-of select="fun:Convert2uofUnit(style:table-cell-properties/@fo:padding-top)"/></xsl:attribute>
								<xsl:attribute name="???_C608"><xsl:value-of select="fun:Convert2uofUnit(style:table-cell-properties/@fo:padding-left)"/></xsl:attribute>
								<xsl:attribute name="???_C60A"><xsl:value-of select="fun:Convert2uofUnit(style:table-cell-properties/@fo:padding-right)"/></xsl:attribute>
								<xsl:attribute name="???_C60B"><xsl:value-of select="fun:Convert2uofUnit(style:table-cell-properties/@fo:padding-bottom)"/></xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
					<xsl:if test="style:table-cell-properties/@fo:border or style:table-cell-properties/@fo:border-top or style:table-cell-properties/@fo:border-bottom or style:table-cell-properties/@fo:border-left or style:table-cell-properties/@fo:border-right or style:table-cell-properties/@style:shadow">
						<xsl:element name="???:??????_4133">
							<xsl:for-each select="style:table-cell-properties">
								<xsl:call-template name="Border"/>
							</xsl:for-each>
						</xsl:element>
					</xsl:if>
					<xsl:if test="style:table-cell-properties/style:background-image/office:binary-data or style:table-cell-properties/@fo:background-color">
						<???:??????_4134>
							<xsl:for-each select="style:table-cell-properties">
								<xsl:call-template name="UOFFill"/>
							</xsl:for-each>
						</???:??????_4134>
					</xsl:if>
					<???:??????????????????_41A5>
						<xsl:choose>
							<xsl:when test="style:table-cell-properties/@style:vertical-align='middle'">center</xsl:when>
							<xsl:when test="style:table-cell-properties/@style:vertical-align='bottom'">bottom</xsl:when>
							<xsl:otherwise>top</xsl:otherwise>
						</xsl:choose>
					</???:??????????????????_41A5>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="@table:number-columns-spanned">
				<xsl:element name="???:??????_41A7">
					<xsl:value-of select="@table:number-columns-spanned"/>
				</xsl:element>
			</xsl:if>
			<xsl:if test="@table:number-rows-spanned">
				<xsl:element name="???:??????_41A6">
					<xsl:value-of select="@table:number-rows-spanned"/>
				</xsl:element>
			</xsl:if>
			<!--xsl:element name="???:??????????????????_41A8"/-->
		</xsl:element>
	</xsl:template>
	<xsl:template match="table:table-cell" mode="text">
		<xsl:element name="???:?????????_41BE">
			<xsl:variable name="nColumnSpannedallbefore" select="sum(preceding-sibling::table:table-cell/@table:number-columns-spanned) + count(preceding-sibling::table:table-cell[not(@table:number-columns-spanned)]) + 1"/>
			<xsl:call-template name="execTableCellAttribute">
				<xsl:with-param name="CellPosition">
					<xsl:choose>
						<xsl:when test="not(preceding-sibling::table:table-cell)">
							<xsl:value-of select="number(1)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$nColumnSpannedallbefore"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="TextContent"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="table:table-row" mode="text">
		<xsl:element name="???:???_41CD">
			<xsl:variable name="rowStyleName" select="./@table:style-name"/>
			<xsl:element name="???:????????????_41BD">
				<xsl:for-each select="key('RowStyle',$rowStyleName)/style:table-row-properties[@style:row-height or @style:min-row-height]">
					
					<xsl:variable name="style_name">
						<xsl:variable name="bb">
							<xsl:for-each select="../preceding-sibling::*[@style:family = 'table-row']">
								<xsl:value-of select="@style:name"/>
							</xsl:for-each>
						</xsl:variable>
						<xsl:value-of select="concat($bb,'_')"/>
					</xsl:variable>
					<xsl:if test="not(contains($style_name,../@style:name))">
						<xsl:element name="???:??????_41B8">
							<xsl:if test="@style:row-height">
								<xsl:attribute name="?????????_41B9"><xsl:value-of select="fun:Convert2uofUnit(@style:row-height)"/></xsl:attribute>
							</xsl:if>
							<xsl:if test="@style:min-row-height">
								<xsl:attribute name="?????????_41BA"><xsl:value-of select="fun:Convert2uofUnit(@style:min-row-height)"/></xsl:attribute>
							</xsl:if>
						</xsl:element>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="key('RowStyle',$rowStyleName)/style:table-row-properties[@style:keep-together]">
					<xsl:element name="???:????????????_41BB">
						<xsl:choose>
							<xsl:when test="key('RowStyle',$rowStyleName)/style:table-row-properties[@style:keep-together]/@style:keep-together='false'">false</xsl:when>
							<xsl:otherwise>true</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
				</xsl:if>
				<xsl:if test="name(..)='table:table-header-rows'">
					<xsl:element name="???:???????????????_41BC">true</xsl:element>
				</xsl:if>
			</xsl:element>
			<xsl:for-each select="node()">
				<xsl:choose>
					<xsl:when test="self::node()[name(.)='table:table-cell']">
						<xsl:apply-templates mode="text" select="."/>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="liekuan">
		<xsl:param name="count"/>
		<xsl:param name="width"/>
		<xsl:if test="$count &gt; 0">
			<???:??????_41C2>
				<xsl:value-of select="$width"/>
			</???:??????_41C2>
			<xsl:call-template name="liekuan">
				<xsl:with-param name="count" select="$count -1"/>
				<xsl:with-param name="width" select="$width"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="table:table" mode="text">
		<xsl:call-template name="addsect"/>
		<???:?????????_416C>
			<!--xsl:choose>
				<xsl:when test="@table:is-sub-table='true'">
					<xsl:attribute name="???:??????">sub-table</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="???:??????">table</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose-->
			<xsl:element name="???:???????????????_41CC">
				<xsl:attribute name="????????????_419C"><xsl:choose><xsl:when test="@style:wrap = 'parallel'"><xsl:value-of select="generate-id(key('Style',@table:style-name))"/></xsl:when><xsl:otherwise><xsl:value-of select="@table:style-name"/></xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:element name="???:?????????_41C1">
					<xsl:for-each select="table:table-column">
						<xsl:variable name="tableColName" select="@table:style-name"/>
						<xsl:variable name="colWidth" select="fun:Convert2uofUnit(//style:style[@style:name=$tableColName and @style:family='table-column'][1]/style:table-column-properties/@style:column-width)"/>
						<xsl:choose>
							<xsl:when test="@table:number-columns-repeated">
								<xsl:call-template name="liekuan">
									<xsl:with-param name="count" select="@table:number-columns-repeated"/>
									<xsl:with-param name="width" select="$colWidth"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<???:??????_41C2>
									<xsl:value-of select="$colWidth"/>
								</???:??????_41C2>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:element>
				<???:??????_41C5>
					<xsl:choose>
						<xsl:when test="@style:wrap= 'parallel'">around</xsl:when>
						<xsl:otherwise>none</xsl:otherwise>
					</xsl:choose>
				</???:??????_41C5>
			</xsl:element>
			<xsl:for-each select="*">
				<xsl:choose>
					<xsl:when test="self::node()[name(.)='table:title']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:desc']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-source']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='office:dde-source']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:scenario']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='office:forms']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:shapes']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-column-group']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-columns']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-column']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-header-columns']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-row-group']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-rows']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='text:soft-page-break']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-row']">
						<xsl:apply-templates mode="text" select="."/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-header-rows']">
						<xsl:apply-templates mode="text" select="table:table-row"/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:named-expressions']">

					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<!--
			<xsl:apply-templates select="table:table-header-rows/table:table-row"/>
			<xsl:apply-templates select="table:table-row"/>-->
		</???:?????????_416C>
	</xsl:template>
	<xsl:template name="TextContent">
		<xsl:for-each select="*">
			<xsl:choose>
				<!--<xsl:when test="self::node()[name(.)='text:h']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:p']">
					<xsl:apply-templates select="."/>
				</xsl:when>-->
				<xsl:when test="self::node()[name(.)='text:list']">
					<xsl:call-template name="list-content">
						<xsl:with-param name="currlistlvl" select="number('1')"/>
						<xsl:with-param name="liststylename" select="@text:style-name"/>
					</xsl:call-template>
				</xsl:when>
				<!--<xsl:when test="self::node()[name(.)='text:numbered-paragraph']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='table:table']">
					<xsl:apply-templates mode="text" select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:section']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:soft-page-break']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:table-of-content']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:illustration-index']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:table-index']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:object-index']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:user-index']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:alphabetical-index']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:bibliography']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:change']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:change-start']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:change-end']">
					<xsl:apply-templates select="."/>
				</xsl:when>-->
				<!--UOF?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????:???????????????:??????????????????-->
				<xsl:when test="self::node()[substring-before(name(.),':')='draw']">
					<xsl:element name="???:??????_416B">
						<xsl:element name="???:???_419D">
							<xsl:call-template name="textshape"/>
						</xsl:element>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="DrawContent">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="self::node()[name(.)='text:p']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:list']">
					<xsl:call-template name="list-content">
						<xsl:with-param name="currlistlvl" select="number('1')"/>
						<xsl:with-param name="liststylename" select="@text:style-name"/>
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:variable name="defectpage">
		<xsl:value-of select="/office:document/office:settings/config:config-item-set[@config:name='ooo:configuration-settings']/config:config-item[@config:name='CurrentDatabaseDataSource']"/>
	</xsl:variable>
	<xsl:template name="???:?????????-page">
		<xsl:param name="uof_top"/>
		<xsl:param name="uof_left"/>
		<xsl:param name="uof_bottom"/>
		<xsl:param name="uof_right"/>
		<xsl:element name="???:?????????_41EB">
			<xsl:attribute name="???_C609"><xsl:value-of select="$uof_top"/></xsl:attribute>
			<xsl:attribute name="???_C608"><xsl:value-of select="$uof_left"/></xsl:attribute>
			<xsl:attribute name="???_C60B"><xsl:value-of select="$uof_bottom"/></xsl:attribute>
			<xsl:attribute name="???_C60A"><xsl:value-of select="$uof_right"/></xsl:attribute>
		</xsl:element>
	</xsl:template>
	<xsl:template name="???:??????-page">
		<xsl:element name="???:??????_41EC">
			<xsl:attribute name="???_C605"><xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:page-width)"/></xsl:attribute>
			<xsl:attribute name="???_C604"><xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:page-height)"/></xsl:attribute>
			<xsl:variable name="height">
				<xsl:value-of select="style:page-layout-properties/@fo:page-height"/>
			</xsl:variable>
			<xsl:variable name="width">
				<xsl:value-of select="style:page-layout-properties/@fo:page-width"/>
			</xsl:variable>
			<xsl:if test="$width='297mm' or $width='210cm' or $width='148cm' or $width='176cm' or $width='125cm' or $width='216cm' or $width='184cm' or $width='130cm' or $width='140cm' or $width='184cm'">
				<!-- ????????????-->
				<!--xsl:attribute name="??????_C60C">
					<xsl:choose>
						<xsl:when test="$width='297mm' and $height='420cm'">A3</xsl:when>
						<xsl:when test="$width='210cm' and $height='297cm'">A4</xsl:when>
						<xsl:when test="$width='148mm' and $height='210mm'">A5</xsl:when>
						<xsl:when test="$width='176mm' and $height='250mm'">B4</xsl:when>
						<xsl:when test="$width='125mm' and $height='176mm'">B5</xsl:when>

						<xsl:when test="$width='216mm' and $height='279mm'">Letter</xsl:when>
						<xsl:when test="$width='184mm' and $height='260mm'">PRC-16K</xsl:when>
						<xsl:when test="$width='130mm' and $height='184mm'">PRC-32K</xsl:when>
						<xsl:when test="$width='140mm' and $height='203mm'">PRC-32K(Big)</xsl:when>
						<xsl:when test="$width='184mm' and $height='260mm'">letter-small</xsl:when>

						<xsl:otherwise>A4</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute-->
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template name="???:???????????????????????????-page">
		<xsl:for-each select="/office:document/office:master-styles/style:master-page">
			<xsl:if test="(style:header-left and style:header) or (style:footer-left and style:footer)">
				<xsl:element name="???:?????????????????????????????????_41ED">true</xsl:element>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="???:????????????-page">
		<xsl:if test="style:header-style/style:header-footer-properties">
			<xsl:element name="???:????????????_41EF">
				<xsl:attribute name="?????????_41F1"><xsl:value-of select="fun:Convert2uofUnit(style:header-style/style:header-footer-properties/@fo:margin-bottom)"/></xsl:attribute>
				<xsl:variable name="borderPaddingTop">
					<xsl:choose>
						<xsl:when test="style:page-layout-properties/@fo:padding or style:page-layout-properties/@fo:padding-top">
							<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:padding|style:page-layout-properties/@fo:padding-top)"/>
						</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="pageMarginTop" select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-top)"/>
				<xsl:attribute name="?????????_41F0"><xsl:value-of select="number($borderPaddingTop) + number($pageMarginTop)"/></xsl:attribute>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-page">
		<xsl:if test="style:footer-style/style:header-footer-properties">
			<xsl:element name="???:????????????_41F2">
				<xsl:attribute name="?????????_41F1"><xsl:value-of select="fun:Convert2uofUnit(style:footer-style/style:header-footer-properties/@fo:margin-top)"/></xsl:attribute>
				<xsl:variable name="borderPaddingBottom">
					<xsl:choose>
						<xsl:when test="style:page-layout-properties/@fo:padding or style:page-layout-properties/@fo:padding-bottom">
							<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:padding|style:page-layout-properties/@fo:padding-top)"/>
						</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="pageMarginBottom" select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-bottom)"/>
				<xsl:attribute name="?????????_41F0"><xsl:value-of select="number($borderPaddingBottom) + number($pageMarginBottom)"/></xsl:attribute>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:?????????-page">
		<xsl:if test="style:page-layout-properties/@style:gutter-location">
			<xsl:element name="???:?????????_41FB">
				<xsl:attribute name="??????_4150"><xsl:value-of select="style:page-layout-properties/@style:gutter-location"/></xsl:attribute>
				<xsl:if test="style:page-layout-properties/@style:gutter-margin">
					<xsl:attribute name="?????????_41FC"><xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@style:gutter-margin)"/></xsl:attribute>
				</xsl:if>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:???????????????-page">
		<xsl:if test="@style:page-usage">
			<???:?????????????????????_41FD>
				<xsl:choose>
					<xsl:when test="@style:page-usage='mirrored'">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</???:?????????????????????_41FD>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-page">
		<xsl:variable name="pinye">
			<xsl:value-of select="substring-before(substring-after($defectpage,'/'),'(')"/>
		</xsl:variable>
		<xsl:if test="@style:page-usage='mirrored' or not($pinye='')">
			<xsl:element name="???:????????????_41FE">true</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:?????????????????????-page">
		<xsl:element name="???:????????????_41FF">
			<xsl:value-of select="style:page-layout-properties/@style:print-orientation"/>
		</xsl:element>
		<xsl:if test="style:page-layout-properties/@style:paper-tray-name">
			<???:????????????_4200 ?????????_4202="style:page-layout-properties/@style:paper-tray-name" ??????_4201="false"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="oo????????????">
		<xsl:param name="oo_format"/>
		<xsl:choose>
			<xsl:when test="$oo_format='1'">decimal</xsl:when>
			<xsl:when test="$oo_format='I'">upper-roman</xsl:when>
			<xsl:when test="$oo_format='i'">lower-roman</xsl:when>
			<xsl:when test="$oo_format='A'">upper-letter</xsl:when>
			<xsl:when test="$oo_format='a'">lower-letter</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">decimal-full-width</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">decimal-enclosed-circle</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">chinese-counting</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">chinese-legal-simplified</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">ideograph-traditional</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">ideograph-zodiac</xsl:when>
			<xsl:otherwise>decimal</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="???:????????????-page">
		<xsl:param name="master-page"/>
		<xsl:param name="textstylename"/>
		<xsl:param name="page-layout-name"/>
		<xsl:param name="nextStyleName"/>
		<xsl:variable name="textPageNum">
			<xsl:choose>
				<xsl:when test="$master-page/@style:next-style-name != '' and /office:document/office:master-styles/style:master-page[@style:name = $nextStyleName]/style:footer//text:page-number">
					<xsl:value-of select="/office:document/office:master-styles/style:master-page[@style:name = $nextStyleName]/style:footer//text:page-number"/>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="$master-page/style:footer/text:p//text:page-number or (/office:document/office:automatic-styles/style:page-layout[@style:name = $page-layout-name]/style:page-layout-properties/@style:num-format and not (/office:document/office:automatic-styles/style:page-layout[@style:name = $page-layout-name]/style:footer-style)) or $textPageNum != '0'">
			<xsl:element name="???:????????????_4205">
				<!--<xsl:attribute name="???:????????????"><xsl:choose><xsl:when test="$master-page/@style:next-style-name">false</xsl:when><xsl:otherwise>true</xsl:otherwise></xsl:choose></xsl:attribute>-->
				<xsl:attribute name="??????_4151"><xsl:call-template name="oo????????????"><xsl:with-param name="oo_format" select="$master-page/style:footer/text:p/text:page-number/@style:num-format"/></xsl:call-template></xsl:attribute>
				<xsl:variable name="startPageNumber">
					<xsl:choose>
						<xsl:when test="/office:document/office:automatic-styles/style:style[@style:name = $textstylename]/style:paragraph-properties/@style:page-number = 'auto'">
							<xsl:value-of select="number(1)"/>
						</xsl:when>
						<xsl:when test="/office:document/office:automatic-styles/style:style[@style:name = $textstylename]/style:paragraph-properties/@style:page-number">
							<xsl:value-of select="/office:document/office:automatic-styles/style:style[@style:name = $textstylename]/style:paragraph-properties/@style:page-number"/>
						</xsl:when>
						<xsl:when test="$textPageNum != '0'">
							<xsl:value-of select="$textPageNum"/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:if test="$startPageNumber != ''">
					<xsl:attribute name="????????????_4152"><xsl:value-of select="$startPageNumber"/></xsl:attribute>
				</xsl:if>
				<xsl:attribute name="?????????????????????_4207">false</xsl:attribute>
				<xsl:variable name="pagesep">
					<xsl:value-of select="substring-before(substring-after($defectpage,'%'),'*')"/>
				</xsl:variable>
				<xsl:attribute name="?????????_4209"><xsl:choose><xsl:when test="not($pagesep='')"><xsl:value-of select="$pagesep"/></xsl:when><xsl:otherwise>hyphen</xsl:otherwise></xsl:choose></xsl:attribute>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:???????????????????????????-page">
		<xsl:if test="/office:document/office:styles/text:notes-configuration[@text:note-class='footnote']">
			<xsl:element name="???:????????????_4203">
				<xsl:for-each select="/office:document/office:styles/text:notes-configuration[@text:note-class='footnote']">
					<xsl:attribute name="??????_4150"><xsl:choose><xsl:when test="@text:footnotes-position='page'">page-bottom</xsl:when><xsl:when test="@text:footnotes-position='document'">below-text</xsl:when><xsl:otherwise>page-bottom</xsl:otherwise></xsl:choose></xsl:attribute>
					<xsl:attribute name="????????????_4153"><xsl:choose><xsl:when test="@text:start-numbering-at='document'">continuous</xsl:when><xsl:when test="@text:start-numbering-at='chapter'">section</xsl:when><xsl:when test="@text:start-numbering-at='page'">page</xsl:when><xsl:otherwise>continuous</xsl:otherwise></xsl:choose></xsl:attribute>
					<xsl:attribute name="????????????_4152"><xsl:choose><xsl:when test="@text:start-value"><xsl:value-of select="@text:start-value + 1"/></xsl:when><xsl:otherwise>1</xsl:otherwise></xsl:choose></xsl:attribute>
					<xsl:attribute name="??????_4151"><xsl:variable name="format"><xsl:value-of select="@style:num-format"/></xsl:variable><xsl:call-template name="oo????????????"><xsl:with-param name="oo_format" select="$format"/></xsl:call-template></xsl:attribute>
				</xsl:for-each>
			</xsl:element>
		</xsl:if>
		<xsl:if test="/office:document/office:styles/text:notes-configuration[@text:note-class='endnote']">
			<???:????????????_4204>
				<xsl:for-each select="/office:document/office:styles/text:notes-configuration[@text:note-class='endnote']">
					<xsl:attribute name="??????_4151"><xsl:variable name="format"><xsl:value-of select="@style:num-format"/></xsl:variable><xsl:call-template name="oo????????????"><xsl:with-param name="oo_format" select="$format"/></xsl:call-template></xsl:attribute>
					<xsl:attribute name="????????????_4152"><xsl:choose><xsl:when test="@text:start-value"><xsl:value-of select="@text:start-value + 1"/></xsl:when><xsl:otherwise>1</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:for-each>
			</???:????????????_4204>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????-page">
		<xsl:if test="/office:document/office:styles/text:linenumbering-configuration">
			<???:????????????_420A>
				<xsl:for-each select="/office:document/office:styles/text:linenumbering-configuration">
					<xsl:choose>
						<xsl:when test="@text:number-lines='false'">
							<xsl:attribute name="??????????????????_420B">false</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="??????????????????_420B">true</xsl:attribute>
							<xsl:attribute name="????????????_4153"><xsl:choose><xsl:when test="@text:count-in-floating-frames='true'">section</xsl:when><xsl:when test="@text:restart-on-page='true'">page</xsl:when><xsl:when test="@text:count-empty-lines='false'"/><xsl:otherwise>continuous</xsl:otherwise></xsl:choose></xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="@style:num-format">
						<xsl:attribute name="????????????_420C"><xsl:value-of select="@style:num-format"/></xsl:attribute>
					</xsl:if>
					<xsl:if test="@text:offset">
						<xsl:attribute name="?????????_41F0"><xsl:value-of select="fun:Convert2uofUnit(@text:offset)"/></xsl:attribute>
					</xsl:if>
					<xsl:if test="@text:increment">
						<xsl:attribute name="????????????_420D"><xsl:value-of select="@text:increment"/></xsl:attribute>
					</xsl:if>
				</xsl:for-each>
			</???:????????????_420A>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:???????????????????????????-page">
		<xsl:param name="uof_top"/>
		<xsl:param name="uof_left"/>
		<xsl:param name="uof_bottom"/>
		<xsl:param name="uof_right"/>
		<xsl:variable name="aa">
			<xsl:choose>
				<xsl:when test="style:page-layout-properties/@style:layout-grid-ruby-height">
					<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@style:layout-grid-ruby-height)"/>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="layoutGridBaseHeight" select="fun:Convert2uofUnit(style:page-layout-properties/@style:layout-grid-base-height)"/>
		<xsl:variable name="layoutGridRubyHeight" select="fun:Convert2uofUnit(style:page-layout-properties/@style:layout-grid-ruby-height)"/>
		<xsl:variable name="pageHeight" select="fun:Convert2uofUnit(style:page-layout-properties/@fo:page-height)"/>
		<xsl:variable name="layoutGridRubyWidth" select="fun:Convert2uofUnit(style:page-layout-properties/@style:layout-grid-base-width)"/>
		<xsl:variable name="pageWidth" select="fun:Convert2uofUnit(style:page-layout-properties/@fo:page-width)"/>
		<xsl:choose>
			<xsl:when test="style:page-layout-properties/@style:layout-grid-mode='line' and (style:page-layout-properties/@style:layout-grid-lines='10' or style:page-layout-properties/@style:layout-grid-lines='15' or style:page-layout-properties/@style:layout-grid-lines='20' or style:page-layout-properties/@style:layout-grid-lines='24') and style:page-layout-properties/@style:layout-grid-display = 'true'">
				<???:????????????_4216>
					<xsl:variable name="GridLine">
						<xsl:value-of select="style:page-layout-properties/@style:layout-grid-lines"/>
					</xsl:variable>
					<xsl:attribute name="??????_4173">letter-paper</xsl:attribute>
					<xsl:if test="style:page-layout-properties/@style:layout-grid-mode='line'">
						<xsl:choose>
							<xsl:when test="$GridLine='10'">
								<xsl:attribute name="??????_4217">first-gear</xsl:attribute>
							</xsl:when>
							<xsl:when test="$GridLine='15'">
								<xsl:attribute name="??????_4217">second-gear</xsl:attribute>
							</xsl:when>
							<xsl:when test="$GridLine='20'">
								<xsl:attribute name="??????_4217">third-gear</xsl:attribute>
							</xsl:when>
							<xsl:when test="$GridLine='24'">
								<xsl:attribute name="??????_4217">fourth-gear</xsl:attribute>
							</xsl:when>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="style:page-layout-properties/@style:layout-grid-ruby-height">
						<xsl:attribute name="??????_4218"><xsl:choose><xsl:when test="$layoutGridRubyHeight='0'">single-line</xsl:when><xsl:otherwise>double-line</xsl:otherwise></xsl:choose></xsl:attribute>
					</xsl:if>
					<xsl:if test="style:page-layout-properties/@style:layout-grid-color">
						<xsl:attribute name="??????_4219"><xsl:value-of select="style:page-layout-properties/@style:layout-grid-color"/></xsl:attribute>
					</xsl:if>
					<xsl:attribute name="??????_421A"><xsl:call-template name="LetterTypeSet"/></xsl:attribute>
				</???:????????????_4216>
			</xsl:when>
			<xsl:when test="$aa='0'">
				<xsl:if test="style:page-layout-properties/@style:layout-grid-mode">
					<???:????????????_420E>
						<xsl:if test="style:page-layout-properties/@style:layout-grid-mode">
							<xsl:attribute name="????????????_420F"><xsl:choose><xsl:when test="style:page-layout-properties/@style:layout-grid-mode='both' and style:page-layout-properties/@style:layout-grid-snap-to-characters = 'false'">line-char</xsl:when><xsl:when test="style:page-layout-properties/@style:layout-grid-mode='both' and style:page-layout-properties/@style:layout-grid-snap-to-characters = 'true'">char</xsl:when><xsl:when test="style:page-layout-properties/@style:layout-grid-mode='line'">line</xsl:when><xsl:when test="style:page-layout-properties/@style:layout-grid-mode='none'">none</xsl:when></xsl:choose></xsl:attribute>
						</xsl:if>
						<xsl:if test="style:page-layout-properties/@style:layout-grid-base-width and (style:page-layout-properties/@style:layout-grid-mode = 'both' or style:page-layout-properties/@style:layout-grid-mode = 'both-nosnap')">
							<xsl:attribute name="?????????_4228"><xsl:value-of select="floor((number($pageWidth) - $uof_left - $uof_right) div number($layoutGridRubyWidth) * 1.003)"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="style:page-layout-properties/@style:layout-grid-base-height">
							<xsl:attribute name="??????_4210"><xsl:value-of select="floor((number($pageHeight) - $uof_top - $uof_bottom) div number($layoutGridBaseHeight))"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="style:page-layout-properties/@style:layout-grid-display">
							<xsl:attribute name="??????????????????_4211"><xsl:choose><xsl:when test="style:page-layout-properties/@style:layout-grid-display='true'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:attribute>
						</xsl:if>
						<xsl:if test="style:page-layout-properties/@style:layout-grid-print">
							<xsl:attribute name="??????????????????_4212"><xsl:choose><xsl:when test="style:page-layout-properties/@style:layout-grid-print='true'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:attribute>
						</xsl:if>
					</???:????????????_420E>
				</xsl:if>
			</xsl:when>
			<xsl:when test="style:page-layout-properties/@style:layout-grid-mode='both' and number($layoutGridRubyHeight) != 0">
				<???:????????????_4216>
					<xsl:variable name="cell_width">
						<xsl:choose>
							<xsl:when test="style:page-layout-properties/@style:layout-grid-base-width">
								<xsl:value-of select="$layoutGridRubyWidth"/>
							</xsl:when>
							<xsl:when test="style:page-layout-properties/@style:layout-grid-base-height">
								<xsl:value-of select="$layoutGridBaseHeight"/>
							</xsl:when>
							<xsl:otherwise>1</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:attribute name="??????_4173"><xsl:choose><xsl:when test="style:page-layout-properties/@style:layout-grid-mode='line'">letter-paper</xsl:when><xsl:when test="style:page-layout-properties/@style:layout-grid-mode='both'">draft-paper</xsl:when><xsl:otherwise>none</xsl:otherwise></xsl:choose></xsl:attribute>
					<xsl:variable name="length">
						<xsl:variable name="direction">
							<xsl:call-template name="LetterTypeSet"/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$direction = 't2b-l2r-0e-0w'">
								<xsl:value-of select="$pageWidth"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$pageHeight"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="column" select="(number($length) - number($uof_left) - number($uof_right)) div number($cell_width)"/>
					<xsl:variable name="girdType">
						<xsl:choose>
							<xsl:when test="style:page-layout-properties/@style:layout-grid-lines = 10">first-gear</xsl:when>
							<xsl:when test="style:page-layout-properties/@style:layout-grid-lines = 15">second-gear</xsl:when>
							<xsl:when test="style:page-layout-properties/@style:layout-grid-lines = 20">
								<xsl:choose>
									<xsl:when test="contains(string($column),'20')">third-gear</xsl:when>
									<xsl:when test="contains(string($column),'25') or ($column &gt; 25)">fourth-gear</xsl:when>
									<xsl:otherwise>fourth-gear</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
						</xsl:choose>
					</xsl:variable>
					<xsl:if test="$girdType != ''">
						<xsl:attribute name="??????_4217"><xsl:value-of select="$girdType"/></xsl:attribute>
					</xsl:if>
					<xsl:if test="style:page-layout-properties/@style:layout-grid-color">
						<xsl:attribute name="??????_4219"><xsl:value-of select="style:page-layout-properties/@style:layout-grid-color"/></xsl:attribute>
					</xsl:if>
					<xsl:attribute name="??????_421A"><xsl:call-template name="LetterTypeSet"/></xsl:attribute>
				</???:????????????_4216>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="LetterTypeSet">
		<xsl:choose>
			<xsl:when test="style:page-layout-properties/@style:writing-mode = 'lr-tb'">hori-l2r</xsl:when>
			<xsl:when test="style:page-layout-properties/@style:writing-mode = 'tb-lr'">hori-r2l</xsl:when>
			<xsl:when test="style:page-layout-properties/@style:writing-mode = 'tb-rl'">vert-r2l</xsl:when>
			<xsl:otherwise>hori-l2r</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="???:??????????????????-page">
		<xsl:if test="style:page-layout-properties/@style:vertical-align">
			<???:??????????????????_4213>
				<xsl:value-of select="style:page-layout-properties/@style:vertical-align"/>
			</???:??????????????????_4213>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????????????????-page">
		<???:??????????????????_4214>
			<xsl:variable name="writing_mode">
				<xsl:value-of select="style:page-layout-properties/@style:writing-mode"/>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="$writing_mode='lr-tb' or $writing_mode='lr'">t2b-l2r-0e-0w</xsl:when>
				<xsl:when test="$writing_mode='rl-tb' or $writing_mode='rl'">t2b-r2l-0e-0w</xsl:when>
				<xsl:when test="$writing_mode='tb-rl'">r2l-t2b-0e-90w</xsl:when>
				<xsl:when test="$writing_mode='tb-lr'">l2r-b2t-270e-270w</xsl:when>
				<xsl:otherwise>t2b-l2r-0e-0w</xsl:otherwise>
			</xsl:choose>
		</???:??????????????????_4214>
	</xsl:template>
	<xsl:template name="???:??????-page">
		<xsl:if test="style:page-layout-properties/@fo:border or style:page-layout-properties/@fo:border-top or style:page-layout-properties/@fo:border-bottom or style:page-layout-properties/@fo:border-left or style:page-layout-properties/@fo:border-right or style:page-layout-properties/@style:shadow[.!='none']">
			<xsl:element name="???:??????_4133">
				<xsl:if test="style:page-layout-properties/@style:shadow[.!='none']">
					<xsl:variable name="shadowAngle">
						<xsl:call-template name="getShadowAngle">
							<xsl:with-param name="style_shadow" select="style:page-layout-properties/@style:shadow"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:attribute name="????????????_C645" select="$shadowAngle"/>
				</xsl:if>
				<xsl:for-each select="style:page-layout-properties">
					<xsl:call-template name="Border"/>
				</xsl:for-each>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-page">
		<xsl:if test="style:page-layout-properties/@fo:background-color or style:page-layout-properties/style:background-gradient or style:page-layout-properties/style:background-image">
			<xsl:element name="???:??????_4134">
				<xsl:for-each select="style:page-layout-properties">
					<xsl:call-template name="UOFFill"/>
				</xsl:for-each>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-page">
		<xsl:if test="style:page-layout-properties/style:columns">
			<xsl:element name="???:??????_4215">
				<xsl:element name="???:????????????_41E9">
					<xsl:choose>
						<xsl:when test="style:page-layout-properties/style:columns/@fo:column-gap">true</xsl:when>
						<xsl:otherwise>false</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
				<xsl:if test="style:page-layout-properties/style:columns/style:column-sep">
					<xsl:element name="???:?????????_41E3">
						<xsl:attribute name="???????????????_41E6"><xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/style:columns/style:column-sep/@style:width)"/></xsl:attribute>
						<xsl:attribute name="???????????????_41E7"><xsl:value-of select="style:page-layout-properties/style:columns/style:column-sep/@style:color"/></xsl:attribute>
						<xsl:attribute name="???????????????_41E4">single</xsl:attribute>
					</xsl:element>
				</xsl:if>
				<xsl:if test="style:page-layout-properties/style:columns/@fo:column-count">
					<xsl:element name="???:??????_41E8">
						<xsl:value-of select="style:page-layout-properties/style:columns/@fo:column-count"/>
					</xsl:element>
				</xsl:if>
				<xsl:for-each select="style:page-layout-properties/style:columns/style:column">
					<xsl:element name="???:???_41E0">
						<xsl:variable name="left" select="fun:Convert2uofUnit(@fo:start-indent)"/>
						<xsl:variable name="right" select="fun:Convert2uofUnit(@fo:end-indent)"/>
						<xsl:if test="@style:rel-width">
							<xsl:variable name="width">
								<xsl:variable name="rel-width">
									<xsl:value-of select="substring-before(@style:rel-width,'*')"/>
								</xsl:variable>
								<xsl:value-of select="number($rel-width div 1440 * 2.54 div $other-to-cm-conversion-factor )"/>
							</xsl:variable>
							<xsl:attribute name="??????_41E1"><xsl:value-of select="$width - $left - $right"/></xsl:attribute>
						</xsl:if>
						<xsl:attribute name="??????_41E2"><xsl:value-of select="2 * $right"/></xsl:attribute>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:????????????????????????-page">
		<xsl:param name="master-page"/>
		<xsl:param name="firstPageHeader"/>
		<xsl:param name="firstPageFooter"/>
		<xsl:param name="secondPageHeader"/>
		<xsl:param name="secondPageFooter"/>
		<xsl:if test="$firstPageHeader != $secondPageHeader or $firstPageFooter != $secondPageFooter">
			<???:??????????????????????????????_41EE>true</???:??????????????????????????????_41EE>
		</xsl:if>
	</xsl:template>
	<xsl:template name="????????????-page">
		<xsl:param name="master-page"/>
		<xsl:param name="firstPageHeader"/>
		<xsl:param name="firstPageFooter"/>
		<xsl:param name="secondPageHeader"/>
		<xsl:param name="secondPageFooter"/>
		<xsl:param name="nextStyleName"/>
		<xsl:param name="firstPageNum"/>
		<xsl:choose>
			<xsl:when test="$firstPageHeader != $secondPageHeader">
				<???:??????_41F3>
					<xsl:for-each select="/office:document/office:master-styles/style:master-page[@style:name = $nextStyleName]/style:header">
						<???:???????????????_41F4>
							<xsl:call-template name="TextContent"/>
						</???:???????????????_41F4>
					</xsl:for-each>
					<xsl:for-each select="/office:document/office:master-styles/style:master-page[@style:name = $nextStyleName]/style:header-left">
						<???:???????????????_41F5>
							<xsl:call-template name="TextContent"/>
						</???:???????????????_41F5>
					</xsl:for-each>
					<xsl:for-each select="$master-page/style:header">
						<???:????????????_41F6>
							<xsl:call-template name="TextContent"/>
						</???:????????????_41F6>
					</xsl:for-each>
				</???:??????_41F3>
			</xsl:when>
			<xsl:when test="$master-page/style:header-left or $master-page/style:header">
				<???:??????_41F3>
					<xsl:for-each select="$master-page/style:header">
						<???:???????????????_41F4>
							<xsl:call-template name="TextContent"/>
						</???:???????????????_41F4>
					</xsl:for-each>
					<xsl:for-each select="$master-page/style:header-left">
						<???:???????????????_41F5>
							<xsl:call-template name="TextContent"/>
						</???:???????????????_41F5>
					</xsl:for-each>
				</???:??????_41F3>
			</xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="$firstPageFooter != $secondPageFooter or $firstPageNum != ''">
				<???:??????_41F7>
					<xsl:for-each select="/office:document/office:master-styles/style:master-page[@style:name = $nextStyleName]/style:footer">
						<???:???????????????_41F8>
							<xsl:call-template name="TextContent"/>
						</???:???????????????_41F8>
					</xsl:for-each>
					<xsl:for-each select="/office:document/office:master-styles/style:master-page[@style:name = $nextStyleName]/style:footer-left">
						<???:???????????????_41F9>
							<xsl:call-template name="TextContent"/>
						</???:???????????????_41F9>
					</xsl:for-each>
					<xsl:for-each select="$master-page/style:footer">
						<???:????????????_41FA>
							<xsl:call-template name="TextContent"/>
						</???:????????????_41FA>
					</xsl:for-each>
				</???:??????_41F7>
			</xsl:when>
			<xsl:when test="$master-page/style:footer-left or $master-page/style:footer">
				<???:??????_41F7>
					<xsl:for-each select="$master-page/style:footer">
						<???:???????????????_41F8>
							<xsl:call-template name="TextContent"/>
						</???:???????????????_41F8>
					</xsl:for-each>
					<xsl:for-each select="$master-page/style:footer-left">
						<???:???????????????_41F9>
							<xsl:call-template name="TextContent"/>
						</???:???????????????_41F9>
					</xsl:for-each>
					<xsl:for-each select="/office:document/office:master-styles/style:master-page[@style:name = $nextStyleName]/style:footer">
						<???:????????????_41FA>
							<xsl:call-template name="TextContent"/>
						</???:????????????_41FA>
					</xsl:for-each>
				</???:??????_41F7>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="text-page-layout">
		<xsl:param name="master-page"/>
		<xsl:param name="textstylename"/>
		<xsl:variable name="page-layout-name" select="$master-page/@style:page-layout-name"/>
		<xsl:if test="$page-layout-name != ''">
			<???:??????_416A>
				<xsl:attribute name="??????_4166"><xsl:value-of select="$master-page/@style:name"/></xsl:attribute>
				<???:?????????_421B>
					<???:?????????_41EA>
						<xsl:choose>
							<xsl:when test="$master-page/@style:page-section-name = '?????????'">odd-page</xsl:when>
							<xsl:when test="$master-page/@style:page-section-name = '?????????'">even-page</xsl:when>
							<xsl:otherwise>new-page</xsl:otherwise>
						</xsl:choose>
					</???:?????????_41EA>
					<xsl:variable name="nextStyleName" select="$master-page/@style:next-style-name"/>
					<xsl:variable name="firstPageHeader" select="$master-page/style:header/text:p"/>
					<xsl:variable name="firstPageFooter" select="$master-page/style:footer/text:p"/>
					<xsl:variable name="secondPageHeader" select="/office:document/office:master-styles/style:master-page[@style:name = $nextStyleName]/style:header/text:p"/>
					<xsl:variable name="secondPageFooter" select="/office:document/office:master-styles/style:master-page[@style:name = $nextStyleName]/style:footer/text:p"/>
					<xsl:variable name="firstPageNum" select="/office:document/office:master-styles/style:master-page[@style:name = $nextStyleName]/style:footer/text:p/text:page-number"/>
					<xsl:call-template name="????????????-page">
						<xsl:with-param name="master-page" select="$master-page"/>
						<xsl:with-param name="firstPageHeader" select="$firstPageHeader"/>
						<xsl:with-param name="firstPageFooter" select="$firstPageFooter"/>
						<xsl:with-param name="secondPageHeader" select="$secondPageHeader"/>
						<xsl:with-param name="secondPageFooter" select="$secondPageFooter"/>
						<xsl:with-param name="nextStyleName" select="$nextStyleName"/>
						<xsl:with-param name="firstPageNum" select="$firstPageNum"/>
					</xsl:call-template>
					<xsl:for-each select="/office:document/office:automatic-styles/style:page-layout[@style:name = $page-layout-name]">
						<xsl:variable name="margin_top" select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-top)"/>
						<xsl:variable name="min_height_top">
							<xsl:choose>
								<xsl:when test="style:header-style/style:header-footer-properties/@fo:min-height">
									<xsl:value-of select="fun:Convert2uofUnit(style:header-style/style:header-footer-properties/@fo:min-height)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'0'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="padding_top">
							<xsl:choose>
								<xsl:when test="style:page-layout-properties/@fo:padding-top">
									<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:padding-top)"/>
								</xsl:when>
								<xsl:when test="style:page-layout-properties/@fo:padding">
									<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:padding)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'0'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="margin_left" select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-left)"/>
						<xsl:variable name="padding_left">
							<xsl:choose>
								<xsl:when test="style:page-layout-properties/@fo:padding-left">
									<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:padding-left)"/>
								</xsl:when>
								<xsl:when test="style:page-layout-properties/@fo:padding">
									<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:padding)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="number('0')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="margin_bottom" select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-bottom)"/>
						<xsl:variable name="min_height_bottom">
							<xsl:choose>
								<xsl:when test="style:footer-style/style:header-footer-properties/@fo:min-height">
									<xsl:value-of select="fun:Convert2uofUnit(style:footer-style/style:header-footer-properties/@fo:min-height)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'0'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="padding_bottom">
							<xsl:choose>
								<xsl:when test="style:page-layout-properties/@fo:padding-bottom">
									<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:padding-bottom)"/>
								</xsl:when>
								<xsl:when test="style:page-layout-properties/@fo:padding">
									<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:padding)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'0'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="padding_right">
							<xsl:choose>
								<xsl:when test="style:page-layout-properties/@fo:padding-right">
									<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:padding-right)"/>
								</xsl:when>
								<xsl:when test="style:page-layout-properties/@fo:padding">
									<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:padding)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'0'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="margin_right" select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-right)"/>
						<xsl:variable name="uof_top" select="number($margin_top) + number($min_height_top) + number($padding_top)"/>
						<xsl:variable name="uof_left" select="$margin_left + $padding_left"/>
						<xsl:variable name="uof_bottom" select="number($margin_bottom) + number($min_height_bottom) + number($padding_bottom)"/>
						<xsl:variable name="uof_right" select="number($margin_right) + number($padding_right)"/>
						<xsl:call-template name="???:?????????-page">
							<xsl:with-param name="uof_top" select="$uof_top"/>
							<xsl:with-param name="uof_left" select="$uof_left"/>
							<xsl:with-param name="uof_bottom" select="$uof_bottom"/>
							<xsl:with-param name="uof_right" select="$uof_right"/>
						</xsl:call-template>
						<xsl:call-template name="???:??????-page"/>
						<xsl:call-template name="???:???????????????????????????-page"/>
						<xsl:call-template name="???:????????????-page"/>
						<xsl:call-template name="???:????????????-page"/>
						<xsl:call-template name="???:?????????-page"/>
						<xsl:call-template name="???:???????????????-page"/>
						<xsl:call-template name="???:??????-page"/>
						<xsl:call-template name="???:?????????????????????-page"/>
						<xsl:call-template name="???:???????????????????????????-page"/>
						<xsl:call-template name="???:????????????-page"/>
						<xsl:call-template name="???:???????????????????????????-page">
							<xsl:with-param name="uof_top" select="$uof_top"/>
							<xsl:with-param name="uof_left" select="$uof_left"/>
							<xsl:with-param name="uof_bottom" select="$uof_bottom"/>
							<xsl:with-param name="uof_right" select="$uof_right"/>
						</xsl:call-template>
						<xsl:call-template name="???:??????????????????-page"/>
						<xsl:call-template name="???:??????????????????-page"/>
						<xsl:call-template name="???:??????-page"/>
						<xsl:call-template name="???:??????-page"/>
						<xsl:call-template name="???:??????-page"/>
					</xsl:for-each>
					<xsl:call-template name="???:????????????-page">
						<xsl:with-param name="master-page" select="$master-page"/>
						<xsl:with-param name="textstylename" select="$textstylename"/>
						<xsl:with-param name="page-layout-name" select="$page-layout-name"/>
						<xsl:with-param name="nextStyleName" select="$nextStyleName"/>
					</xsl:call-template>
					<xsl:call-template name="???:????????????????????????-page">
						<xsl:with-param name="master-page" select="$master-page"/>
						<xsl:with-param name="firstPageHeader" select="$firstPageHeader"/>
						<xsl:with-param name="firstPageFooter" select="$firstPageFooter"/>
						<xsl:with-param name="secondPageHeader" select="$secondPageHeader"/>
						<xsl:with-param name="secondPageFooter" select="$secondPageFooter"/>
					</xsl:call-template>
				</???:?????????_421B>
			</???:??????_416A>
		</xsl:if>
	</xsl:template>
	<xsl:template match="text:s">
		<xsl:choose>
			<xsl:when test="not(@text:c)">
				<???:?????????_4161 ??????_4162="1"/>
			</xsl:when>
			<xsl:otherwise>
				<???:?????????_4161 ??????_4162="{@text:c}"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text:tab">
		<xsl:element name="???:?????????_415E">
		
		</xsl:element>
	</xsl:template>
	<xsl:template match="text:line-break">
		<xsl:element name="???:?????????_415F">
		
		</xsl:element>
	</xsl:template>
	<xsl:template match="text:use-soft-page-breaks">
	</xsl:template>
	<xsl:template match="text:span">
		<xsl:variable name="Count" select="count(child::node())"/>
		<xsl:choose>
			<xsl:when test="$Count=0">
				<???:???_419D>
					<xsl:if test="@text:style-name!=''">
						<???:?????????_4158>
							<xsl:attribute name="????????????_417B"><xsl:value-of select="@text:style-name"/></xsl:attribute>
						</???:?????????_4158>
					</xsl:if>
				</???:???_419D>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="FirstName">
					<xsl:for-each select="child::node()[1]">
						<xsl:value-of select="name(.)"/>
					</xsl:for-each>
				</xsl:variable>
				<xsl:variable name="FirstSentence">
					<xsl:call-template name="IsNewSentect">
						<xsl:with-param name="CurrName">
							<xsl:value-of select="$FirstName"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:if test="($FirstSentence='1')">
					<xsl:text disable-output-escaping="yes">&lt;???:???_419D&gt;</xsl:text>
					<xsl:if test="@text:style-name!=''">
						<???:?????????_4158>
							<xsl:attribute name="????????????_417B"><xsl:value-of select="@text:style-name"/></xsl:attribute>
						</???:?????????_4158>
					</xsl:if>
				</xsl:if>
				<xsl:for-each select="node()">
					<xsl:variable name="NewSentence">
						<xsl:call-template name="IsNewSentect">
							<xsl:with-param name="CurrName">
								<xsl:value-of select="name(.)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:variable>
					<xsl:if test="position()&gt;1">
						<xsl:variable name="PrevName">
							<xsl:for-each select="preceding-sibling::node()[1]">
								<xsl:value-of select="name(.)"/>
							</xsl:for-each>
						</xsl:variable>
						<xsl:variable name="PrevNewSentence">
							<xsl:call-template name="IsNewSentect">
								<xsl:with-param name="CurrName">
									<xsl:value-of select="$PrevName"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="($PrevNewSentence ='0')">
								<xsl:if test="($NewSentence='1')">
									<xsl:text disable-output-escaping="yes">&lt;???:???_419D&gt;</xsl:text>
									<xsl:if test="name(.)!='' and @text:style-name!=''">
										<???:?????????_4158>
											<xsl:attribute name="????????????_417B"><xsl:value-of select="@text:style-name"/></xsl:attribute>
										</???:?????????_4158>
									</xsl:if>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="($NewSentence='0')">
									<xsl:text disable-output-escaping="yes">&lt;/???:???_419D&gt;</xsl:text>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:call-template name="one_paragraph_content"/>
					<xsl:if test="position()=last() and $NewSentence='1'">
						<xsl:text disable-output-escaping="yes">&lt;/???:???_419D&gt;</xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text:meta">
	</xsl:template>
	<xsl:template match="text:bookmark">
		<???:????????????_4165 ??????_4166="{@text:name}" ?????????_4100="{@text:name}" ??????_413B="bookmark"/>
		<???:????????????_4167 ???????????????_4168="{@text:name}"/>
	</xsl:template>
	<xsl:template match="text:bookmark-start">
		<???:????????????_4165>
			<xsl:attribute name="??????_4166"><xsl:value-of select="@text:name"/></xsl:attribute>
			<xsl:attribute name="??????_413B">bookmark</xsl:attribute>
			<xsl:attribute name="?????????_4100"><xsl:value-of select="@text:name"/></xsl:attribute>
		</???:????????????_4165>
	</xsl:template>
	<xsl:template match="text:bookmark-end">
		<???:????????????_4167>
			<xsl:attribute name="???????????????_4168"><xsl:value-of select="@text:name"/></xsl:attribute>
		</???:????????????_4167>
	</xsl:template>
	<xsl:template match="text:reference-mark">
	</xsl:template>
	<xsl:template match="text:reference-mark-start">
	</xsl:template>
	<xsl:template match="text:reference-mark-end">
	</xsl:template>
	<xsl:template match="text:note">
		<xsl:choose>
			<xsl:when test="@text:note-class='footnote'">
				<???:??????_4159>
					<xsl:attribute name="?????????_4157"><xsl:value-of select="text:note-citation"/></xsl:attribute>
					<xsl:for-each select="text:note-body">
						<xsl:call-template name="TextContent"/>
					</xsl:for-each>
				</???:??????_4159>
			</xsl:when>
			<xsl:when test="@text:note-class='endnote'">
				<???:??????_415A>
					<xsl:attribute name="?????????_4157"><xsl:value-of select="text:note-citation"/></xsl:attribute>
					<xsl:for-each select="text:note-body">
						<xsl:call-template name="TextContent"/>
					</xsl:for-each>
				</???:??????_415A>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text:ruby">
	</xsl:template>
	<xsl:template match="office:annotation">
		<xsl:variable name="ID" select="generate-id(.)"/>
		<xsl:if test="not(contains(./dc:creator,'__@*Start@')) and not(contains(./dc:creator,'__@*End@'))">
			<xsl:element name="???:????????????_4165">
				<xsl:attribute name="?????????_4100"><xsl:value-of select="concat('cmt', $ID)"/></xsl:attribute>
				<xsl:attribute name="??????_4166">Comment</xsl:attribute>
				<xsl:attribute name="??????_413B">annotation</xsl:attribute>
			</xsl:element>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="contains(./dc:creator,'__@*Start@')">
				<xsl:element name="???:????????????_4165">
					<xsl:attribute name="?????????_4100"><xsl:value-of select="concat('cmt',$ID)"/></xsl:attribute>
					<xsl:attribute name="??????_413B">user-data</xsl:attribute>
				</xsl:element>
			</xsl:when>
			<xsl:when test="contains(./dc:creator,'__@*End@')">
				<!--<xsl:variable name="IDEnd">
					<xsl:choose>
						<xsl:when test="name(preceding-sibling::*[1]) = 'office:annotation'">
							<xsl:value-of select="generate-id(preceding-sibling::*[1])"/>
						</xsl:when>
						<xsl:when test="name(..) = 'text:span'">
							<xsl:value-of select="generate-id(../preceding-sibling::*[office:annotation][1]/office:annotation)"/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>-->
				<xsl:variable name="IDEnd">
					<xsl:choose>
						<xsl:when test="preceding-sibling::*[name() = 'office:annotation']">
							<xsl:value-of select="generate-id(preceding-sibling::*[name() = 'office:annotation'][1])"/>
						</xsl:when>
						<xsl:when test="preceding-sibling::*[office:annotation]">
							<xsl:value-of select="generate-id(preceding-sibling::*[office:annotation][1]/office:annotation)"/>
						</xsl:when>
						<xsl:when test="name(..) = 'text:span' and ../preceding-sibling::*[office:annotation]">
							<xsl:value-of select="generate-id(../preceding-sibling::*[office:annotation][1]/office:annotation)"/>
						</xsl:when>
						<xsl:when test="name(..) = 'text:span'">
							<xsl:value-of select="generate-id(../preceding-sibling::*[name() = 'office:annotation'][1])"/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:element name="???:????????????_4167">
					<xsl:attribute name="???????????????_4168"><xsl:value-of select="concat('cmt',$IDEnd)"/></xsl:attribute>
				</xsl:element>
			</xsl:when>
			<xsl:when test="not(./@office:name)">
				<xsl:element name="???:????????????_4167">
					<xsl:attribute name="???????????????_4168"><xsl:value-of select="concat('cmt', $ID)"/></xsl:attribute>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="HasEnd">
					<xsl:for-each select="following::node()[name(.)=office:annotation_end]">
						<xsl:if test="@office:name=./@office:name">
							<xsl:value-of select="1"/>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:if test="$HasEnd != '1'">
					<xsl:element name="???:????????????_4167">
						<xsl:attribute name="???????????????_4168"><xsl:value-of select="concat('cmt', $ID)"/></xsl:attribute>
					</xsl:element>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="office:annotation_end">
		<xsl:for-each select="preceding::node()[name(.)=office:annotation]">
			<xsl:if test="@office:name = ./@office:name">
				<xsl:variable name="ID" select="generate-id(.)"/>
				<xsl:element name="???:????????????_4167">
					<xsl:attribute name="???????????????_4168">concat("cmt", $ID)</xsl:attribute>
				</xsl:element>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="text:change">
	</xsl:template>
	<xsl:template match="text:change-start">
		<xsl:variable name="changeID">
			<xsl:value-of select="@text:change-id"/>
		</xsl:variable>
		<xsl:element name="???:????????????_421F">
			<xsl:attribute name="?????????_4220"><xsl:value-of select="$changeID"/></xsl:attribute>
			<xsl:for-each select="/office:document/office:body/office:text/text:tracked-changes/text:changed-region[@text:id = $changeID]">
				<xsl:choose>
					<xsl:when test="text:insertion">
						<xsl:attribute name="??????_4221">insert</xsl:attribute>
					</xsl:when>
					<xsl:when test="text:format-change">
						<xsl:attribute name="??????_4221">format</xsl:attribute>
					</xsl:when>
					<xsl:when test="text:deletion">
						<xsl:attribute name="??????_4221">delete</xsl:attribute>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<xsl:attribute name="??????????????????_4222"><xsl:value-of select="$changeID"/></xsl:attribute>
		</xsl:element>
	</xsl:template>
	<xsl:template match="text:change-end">
		<xsl:variable name="changeendID">
			<xsl:value-of select="@text:change-id"/>
		</xsl:variable>
		<xsl:for-each select="/office:document/office:body/office:text/text:tracked-changes/text:changed-region[@text:id = $changeendID]">
			<xsl:choose>
				<xsl:when test="text:insertion">
					<xsl:element name="???:????????????_4223">
						<xsl:attribute name="??????????????????_4224"><xsl:value-of select="@text:id"/></xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:when test="text:deletion">
					<xsl:element name="???:????????????_4223">
						<xsl:attribute name="??????????????????_4224"><xsl:value-of select="@text:id"/></xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:when test="text:format-change">
					<xsl:element name="???:????????????_4223">
						<xsl:attribute name="??????????????????_4224"><xsl:value-of select="@text:id"/></xsl:attribute>
					</xsl:element>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="text:a">
		<xsl:variable name="ID" select="generate-id(.)"/>
		<???:???_419D>
			<xsl:element name="???:????????????_4165">
				<xsl:attribute name="?????????_4100"><xsl:value-of select="concat('hlnk', $ID)"/></xsl:attribute>
				<xsl:attribute name="??????_4166">Hyperlink</xsl:attribute>
				<xsl:attribute name="??????_413B">hyperlink</xsl:attribute>
			</xsl:element>
		</???:???_419D>
		<xsl:call-template name="paragraph_content"/>
		<???:???_419D>
			<xsl:element name="???:????????????_4167">
				<xsl:attribute name="???????????????_4168"><xsl:value-of select="concat('hlnk', $ID)"/></xsl:attribute>
			</xsl:element>
		</???:???_419D>
	</xsl:template>
	<!--
	<xsl:template match="text:a">
		<xsl:variable name="ID" select="generate-id(.)"/>
		<xsl:element name="???:????????????_4165">
			<xsl:attribute name="???:?????????"><xsl:value-of select="concat('hlnk', $ID)"/></xsl:attribute>
			<xsl:attribute name="???:??????">Hyperlink</xsl:attribute>
			<xsl:attribute name="???:??????">hyperlink</xsl:attribute>
		</xsl:element>
		<xsl:for-each select="node( )">
			<xsl:call-template name="one_paragraph_content"/>
		</xsl:for-each>
		<xsl:element name="???:????????????">
			<xsl:attribute name="???:???????????????"><xsl:value-of select="concat('hlnk', $ID)"/></xsl:attribute>
		</xsl:element>
	</xsl:template>-->
	<xsl:preserve-space elements="*"/>
	<xsl:template name="one_paragraph_content">
		<xsl:choose>
			<xsl:when test="self::node()[name(.)='text:date']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:creation-date']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:modification-date']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:time']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:creation-time']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:modification-time']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:page-number']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:page-continuation']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-firstname']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-lastname']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-initials']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-title']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-position']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-email']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-phone-private']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-fax']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-company']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-phone-work']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-street']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-city']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-postal-code']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-country']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sender-state-or-province']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:author-name']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:author-initials']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:chapter']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:file-name']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:template-name']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sheet-name']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:variable-set']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:variable-get']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:variable-input']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:user-field-get']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:user-field-input']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sequence']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:expression']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:text-input']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:initial-creator']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:description']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:user-defined']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:print-time']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:print-date']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:printed-by']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:title']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:subject']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:keywords']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:editing-cycles']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:editing-duration']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:creator']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:page-count']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:paragraph-count']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:word-count']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:character-count']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:table-count']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:image-count']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:object-count']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:database-display']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:database-next']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:database-row-select']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:database-row-number']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:database-name']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:page-variable-set']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:page-variable-get']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:placeholder']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:conditional-text']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:hidden-text']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:reference-ref']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:bookmark-ref']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:note-ref']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:sequence-ref']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:script']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:execute-macro']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:hidden-paragraph']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:dde-connection']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:measure']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:table-formula']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:meta-field']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:toc-mark-start']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:toc-mark-end']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:toc-mark']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:user-index-mark-start']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:user-index-mark-end']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:user-index-mark']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:alphabetical-index-mark-start']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:alphabetical-index-mark-end']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:alphabetical-index-mark']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:bibliography-mark']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='presentation:date-time']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='presentation:header']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='presentation:footer']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:s']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:tab']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:line-break']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:soft-page-break']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:span']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:meta']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:bookmark']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:bookmark-start']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:bookmark-end']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:reference-mark']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:reference-mark-start']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:reference-mark-end']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:note']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:ruby']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='office:annotation']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='office:annotation_end']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:change']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:change-start']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:change-end']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test="self::node()[substring-before(name(.),':')='draw']">
				<xsl:call-template name="textshape"/>
			</xsl:when>
			<xsl:when test="self::node()[name(.)='text:a']">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="???:?????????_415B">
					<xsl:value-of select="string(.)"/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="IsNewSentect">
		<xsl:param name="CurrName"/>
		<xsl:choose>
			<xsl:when test="$CurrName=''">
				<xsl:value-of select="1"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:span'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:a'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:date'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:creation-date'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:modification-date'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:time'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='creation-time'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='modification-time'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:page-number'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:page-continuation'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-firstname'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-lastname'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-initials'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-title'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-position'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-email'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-phone-private'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-fax'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-company'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-phone-work'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-street'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-city'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-postal-code'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-country'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sender-state-or-province'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:author-name'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:author-initials'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:chapter'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:file-name'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:template-name'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sheet-name'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:variable-set'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:variable-get'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:variable-input'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:user-field-get'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:user-field-input'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sequence'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:expression'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:text-input'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:initial-creator'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:description'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:text:user-defined'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:print-time'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:print-date'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:printed-by'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:title'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:subject'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:keywords'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:editing-cycles'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:editing-duration'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:creator'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:page-count'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:paragraph-count'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:word-count'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:character-count'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:table-count'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:image-count'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:object-count'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:database-display'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:database-next'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:database-row-select'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:database-row-number'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:database-name'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:page-variable-set'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:page-variable-get'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:placeholder'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:conditional-text'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:hidden-text'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:reference-ref'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:bookmark-ref'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:note-ref'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:sequence-ref'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:script'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:execute-macro'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:hidden-paragraph'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:dde-connection'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:measure'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:table-formula'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:meta-field'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:toc-mark-start'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:toc-mark-end'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:toc-mark'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:user-index-mark-start'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:user-index-mark-end'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:user-index-mark'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:alphabetical-index-mark-start'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:alphabetical-index-mark-end'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:alphabetical-index-mark'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="$CurrName='text:bibliography-mark'">
				<xsl:value-of select="0"/>
			</xsl:when>
			<xsl:when test="substring-before($CurrName,':')='draw'">
				<xsl:value-of select="1"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="1"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="paragraph_content">
		<xsl:variable name="Count" select="count(child::node())"/>
		<xsl:choose>
			<xsl:when test="$Count=0">
				<???:???_419D/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="FirstName">
					<xsl:for-each select="child::node()[1]">
						<xsl:value-of select="name(.)"/>
					</xsl:for-each>
				</xsl:variable>
				<xsl:variable name="FirstSentence">
					<xsl:call-template name="IsNewSentect">
						<xsl:with-param name="CurrName">
							<xsl:value-of select="$FirstName"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:if test="($FirstSentence='1')">
					<xsl:text disable-output-escaping="yes">&lt;???:???_419D&gt;</xsl:text>
				</xsl:if>
				<xsl:for-each select="node()">
					<xsl:variable name="NewSentence">
						<xsl:call-template name="IsNewSentect">
							<xsl:with-param name="CurrName">
								<xsl:value-of select="name(.)"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:variable>
					<xsl:if test="position()&gt;1">
						<xsl:variable name="PrevName">
							<xsl:for-each select="preceding-sibling::node()[1]">
								<xsl:value-of select="name(.)"/>
							</xsl:for-each>
						</xsl:variable>
						<xsl:variable name="PrevNewSentence">
							<xsl:call-template name="IsNewSentect">
								<xsl:with-param name="CurrName">
									<xsl:value-of select="$PrevName"/>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="($PrevNewSentence ='0')">
								<xsl:if test="($NewSentence='1')">
									<xsl:text disable-output-escaping="yes">&lt;???:???_419D&gt;</xsl:text>
									<xsl:if test="name(.)!='' and @text:style-name != ''">
										<???:?????????_4158>
											<xsl:attribute name="????????????_417B"><xsl:value-of select="@text:style-name"/></xsl:attribute>
										</???:?????????_4158>
									</xsl:if>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="($NewSentence='0')">
									<xsl:text disable-output-escaping="yes">&lt;/???:???_419D&gt;</xsl:text>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:call-template name="one_paragraph_content"/>
					<xsl:if test="position()=last() and $NewSentence='1'">
						<xsl:text disable-output-escaping="yes">&lt;/???:???_419D&gt;</xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text:section">
		<xsl:element name="???:??????_416B">
			<xsl:element name="???:?????????_419E">
				<xsl:attribute name="??????_416E"><xsl:value-of select="'section'"/></xsl:attribute>
				<xsl:if test="@text:protected">
					<xsl:attribute name="????????????_416F"><xsl:value-of select="@text:protected"/></xsl:attribute>
				</xsl:if>
			</xsl:element>
			<xsl:element name="???:?????????_419F">
				<xsl:call-template name="TextContent"/>
			</xsl:element>
			<xsl:element name="???:?????????_41A0">
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="index-content-main">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="self::node()[name(.)='text:index-title']">
					<xsl:call-template name="index-content-main"/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:h']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:p']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:list']">
					<xsl:call-template name="list-content">
						<xsl:with-param name="currlistlvl" select="number('1')"/>
						<xsl:with-param name="liststylename" select="@text:style-name"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:numbered-paragraph']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='table:table']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:section']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:soft-page-break']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:table-of-content']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:illustration-index']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:table-index']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:object-index']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:user-index']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:alphabetical-index']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:bibliography']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:change']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:change-start']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:change-end']">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<!--
				<xsl:when test="self::node()[substring-before(name(.),':')='draw']">
					<xsl:call-template name="textshape"/>
				</xsl:when>-->
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="FieldCodeContent">
		<xsl:param name="text"/>
		<???:??????_416B>
			<xsl:for-each select="../../@text:style-name">
				<xsl:element name="???:????????????_419B">
					<xsl:attribute name="????????????_419C"><xsl:value-of select="."/></xsl:attribute>
				</xsl:element>
			</xsl:for-each>
			<???:???_419D>
				<???:?????????_4158>
					<xsl:for-each select="../@text:style-name">
						<xsl:attribute name="????????????_417B"><xsl:value-of select="."/></xsl:attribute>
					</xsl:for-each>
				</???:?????????_4158>
				<???:?????????_415B>
					<xsl:value-of select="$text"/>
				</???:?????????_415B>
			</???:???_419D>
		</???:??????_416B>
	</xsl:template>
	<xsl:template match="text:table-of-content">
		<xsl:element name="???:??????_416B">
			<xsl:element name="???:????????????_419B">
				<xsl:attribute name="????????????_419C"><xsl:value-of select="text:index-body/text:p/@text:style-name"/></xsl:attribute>
			</xsl:element>
			<xsl:element name="???:?????????_419E">
				<xsl:attribute name="??????_416E"><xsl:value-of select="'REF'"/></xsl:attribute>
				<xsl:if test="@text:protected">
					<xsl:attribute name="????????????_416F"><xsl:value-of select="@text:protected"/></xsl:attribute>
				</xsl:if>
			</xsl:element>
			<xsl:element name="???:?????????_419F">
				<xsl:call-template name="FieldCodeContent">
					<xsl:with-param name="text" select="'TOC \o 1-10 \h \z'"/>
				</xsl:call-template>
				<xsl:for-each select="text:index-body">
					<xsl:call-template name="index-content-main"/>
				</xsl:for-each>
			</xsl:element>
			<xsl:element name="???:?????????_41A0">
      </xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="TimeDateFormat">
		<xsl:choose>
			<xsl:when test="@number:style='rolong'">
				<xsl:variable name="format">
					<xsl:if test="self::node( )[name(.)='number:year']">yyyy</xsl:if>
					<xsl:if test="self::node( )[name(.)='number:month']">M</xsl:if>
					<xsl:if test="self::node( )[name(.)='number:day']">d</xsl:if>
					<xsl:if test="self::node( )[name(.)='number:am-pm']">AM/PM</xsl:if>
					<xsl:if test="self::node( )[name(.)='number:hours']">h</xsl:if>
					<xsl:if test="self::node( )[name(.)='number:minutes']">m</xsl:if>
					<xsl:if test="self::node( )[name(.)='number:seconds']">s</xsl:if>
				</xsl:variable>
				<xsl:value-of select="concat('[DBNum1]',$format)"/>
			</xsl:when>
			<xsl:when test="@number:style='long' ">
				<xsl:if test="self::node( )[name(.)='number:year']">yyyy</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:month' and (not(@number:textual) or @number:textual != 'true')]">MM</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:month' and @number:textual = 'true']">MMMM</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:day']">dd</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:hours']">hh</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:minutes']">mm</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:seconds']">ss</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:quarter']">???QQ??????</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:day-of-week']">dddd</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:week-of-year']">WW</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="self::node( )[name(.)='number:text']">
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:year']">yy</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:month']">M</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:day']">d</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:hours']">h</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:minutes']">m</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:seconds']">s</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:quarter']">Q???</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:day-of-week']">??????N</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:week-of-year']">WW</xsl:if>
				<xsl:if test="self::node( )[name(.)='number:am-pm']">am/pm</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text:date | text:creation-date |text:modification-date">
		<!-- add 'text:modification-date' maj20080115 -->
		<!--createdate???date-->
		<xsl:element name="???:?????????_419E">
			<!--xsl:attribute name="??????_416E"><xsl:value-of select="'date'"/></xsl:attribute-->
			<xsl:if test="name(.)='text:date'">
				<xsl:attribute name="??????_416E"><xsl:value-of select="'date'"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="name(.)='text:creation-date'">
				<xsl:attribute name="??????_416E"><xsl:value-of select="'createdate'"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="name(.)='text:modification-date'">
				<xsl:attribute name="??????_416E"><xsl:value-of select="'modificationdate'"/></xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<xsl:variable name="datefmt">
				<xsl:variable name="bb" select="@style:data-style-name"/>
				<xsl:for-each select="key('AllNumberStyle',$bb)/number:year | key('AllNumberStyle',$bb)/number:month | key('AllNumberStyle',$bb)/number:day |  key('AllNumberStyle',$bb)/number:hours |  key('AllNumberStyle',$bb)/number:minutes | key('AllNumberStyle',$bb)/number:seconds | key('AllNumberStyle',$bb)/number:quarter | key('AllNumberStyle',$bb)/number:day-of-week | key('AllNumberStyle',$bb)/number:week-of-year |  key('AllNumberStyle',$bb)/number:text | key('AllNumberStyle',$bb)/number:am-pm">
					<xsl:call-template name="TimeDateFormat"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="quote">"</xsl:variable>
			<xsl:variable name="text">
				<!--xsl:value-of select="concat('CREATEDATE \@ ',$quote,$datefmt,$quote)"/-->
				<xsl:choose>
					<xsl:when test="name(.)='text:date'">
						<xsl:value-of select="concat('DATE \@ ',$quote,$datefmt,$quote)"/>
					</xsl:when>
					<xsl:when test="name(.)='text:modification-date'">
						<xsl:value-of select="concat('MODIFICATIONDATE \@ ',$quote,$datefmt,$quote)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('CREATEDATE \@ ',$quote,$datefmt,$quote)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:call-template name="FieldCodeContent">
				<xsl:with-param name="text" select="$text"/>
			</xsl:call-template>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<!--xsl:value-of select="string(.)"/-->
				<!-- ????????????date-value??????(??????????????????fixed????????????????????????????????????)-->
				<xsl:choose>
					<xsl:when test="@text:date-value">
						<!--xsl:value-of select="@text:date-value"/-->
						<!--  ??????????????????-->
						<xsl:choose>
							<xsl:when test="@text:date-adjust">
								<xsl:value-of select="concat(@text:date-value,',',@text:date-adjust)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@text:date-value"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="string(.)"/>
					</xsl:otherwise>
				</xsl:choose>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template match="text:time | text:creation-time |text:modification-time">
		<!--??? creation-time?????????time??????-->
		<xsl:element name="???:?????????_419E">
			<!--xsl:attribute name="??????_416E"><xsl:value-of select="'time'"/></xsl:attribute-->
			<xsl:if test="name(.)='text:time'">
				<xsl:attribute name="??????_416E"><xsl:value-of select="'time'"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="name(.)='text:creation-time'">
				<xsl:attribute name="??????_416E"><xsl:value-of select="'createtime'"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="name(.)='text:modification-time'">
				<xsl:attribute name="??????_416E"><xsl:value-of select="'modificationtime'"/></xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<xsl:variable name="timefmt">
				<!--xsl:variable name="aa" select="@style:data-style-name"/>
						<xsl:for-each select="key('AllNumberStyle',$aa)/number:hours | key('AllNumberStyle',$aa)/number:minutes | key('AllNumberStyle',$aa)/number:am-pm | key('AllNumberStyle',$aa)/number:seconds | key('AllNumberStyle',$aa)/number:text">
							<xsl:choose>
								<xsl:when test="@number:style='long' ">
									<xsl:if test="self::node( )[name(.)='number:hours']">HH</xsl:if>
									<xsl:if test="self::node( )[name(.)='number:minutes']">MM</xsl:if>
									<xsl:if test="self::node( )[name(.)='number:seconds']">SS</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:if test="self::node( )[name(.)='number:text']">
										<xsl:value-of select="."/>
									</xsl:if>
									<xsl:if test="self::node( )[name(.)='number:hours']">H</xsl:if>
									<xsl:if test="self::node( )[name(.)='number:minutes']">M</xsl:if>
									<xsl:if test="self::node( )[name(.)='number:seconds']">S</xsl:if>
									<xsl:if test="self::node( )[name(.)='number:am-pm']">am/pm</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each-->
				<xsl:variable name="bb" select="@style:data-style-name"/>
				<xsl:for-each select="key('AllNumberStyle',$bb)/number:year | key('AllNumberStyle',$bb)/number:month | key('AllNumberStyle',$bb)/number:day |  key('AllNumberStyle',$bb)/number:hours |  key('AllNumberStyle',$bb)/number:minutes | key('AllNumberStyle',$bb)/number:seconds | key('AllNumberStyle',$bb)/number:quarter | key('AllNumberStyle',$bb)/number:day-of-week | key('AllNumberStyle',$bb)/number:week-of-year |  key('AllNumberStyle',$bb)/number:text | key('AllNumberStyle',$bb)/number:am-pm">
					<xsl:call-template name="TimeDateFormat"/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="quote">"</xsl:variable>
			<xsl:variable name="text">
				<!--xsl:value-of select="concat('TIME \@ ',$quote,$timefmt,$quote)"/-->
				<xsl:choose>
					<xsl:when test="name(.)='text:time'">
						<xsl:value-of select="concat('TIME \@ ',$quote,$timefmt,$quote)"/>
					</xsl:when>
					<xsl:when test="name(.)='text:modification-time'">
						<xsl:value-of select="concat('MODIFICATIONTIME \@ ',$quote,$timefmt,$quote)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('CREATETIME \@ ',$quote,$timefmt,$quote)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:call-template name="FieldCodeContent">
				<xsl:with-param name="text" select="$text"/>
			</xsl:call-template>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<!--xsl:value-of select="string(.)"/-->
				<!--????????????time-value??????(??????????????????fixed????????????????????????????????????)-->
				<xsl:choose>
					<xsl:when test="@text:time-value">
						<!--xsl:value-of select="@text:time-value"/-->
						<!-- ??????????????????-->
						<xsl:choose>
							<xsl:when test="@text:time-adjust">
								<xsl:value-of select="concat(@text:time-value,',',@text:time-adjust)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@text:time-value"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="string(.)"/>
					</xsl:otherwise>
				</xsl:choose>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template name="oo?????????????????????">
		<xsl:param name="oo_format"/>
		<xsl:choose>
			<xsl:when test="$oo_format='1'">Arabic</xsl:when>
			<xsl:when test="$oo_format='I'">ROMAN</xsl:when>
			<xsl:when test="$oo_format='i'">roman</xsl:when>
			<xsl:when test="$oo_format='A'">ALPHABETIC</xsl:when>
			<xsl:when test="$oo_format='a'">alphabetic</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">GB1</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">GB3</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">CHINESENUM3</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">CHINESENUM2</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">ZODIAC1</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">ZODIAC2</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">GB4</xsl:when>
			<xsl:otherwise>Arabic</xsl:otherwise>
			<!--xsl:when test="$oo_format='1., 2., 3., ...'">GB1</xsl:when>
			<xsl:when test="$oo_format='(1),(2),(3), ...'">GB2</xsl:when>
			<xsl:when test="$oo_format='???, ???, ???, ...'">GB3</xsl:when>
			<xsl:when test="$oo_format='(???), (???), (???), ...'">GB4</xsl:when-->
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text:page-number">
		<xsl:variable name="IsInMasterPage">
			<xsl:call-template name="InMasterPage"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$IsInMasterPage = 'true'">
				<???:???_419D>
					<xsl:if test="parent::text:span/@text:style-name">
						<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
					</xsl:if>
					<???:?????????_415B>&lt;#&gt;</???:?????????_415B>
				</???:???_419D>
			</xsl:when>
			<xsl:otherwise>
				<!--???????????????-->
				<xsl:element name="???:?????????_419E">
					<xsl:attribute name="??????_416E"><xsl:value-of select="'page'"/></xsl:attribute>
					<xsl:choose>
						<xsl:when test="@text:fixed='1' or @text:fixed='true'">
							<xsl:attribute name="????????????_416F">true</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="????????????_416F">false</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
				<xsl:element name="???:?????????_419F">
					<xsl:variable name="fmt">
						<xsl:call-template name="oo?????????????????????">
							<xsl:with-param name="oo_format" select="@style:num-format"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="text">
						<xsl:choose>
							<xsl:when test="@style:num-format">
								<xsl:value-of select="concat('PAGE \* ',$fmt)"/>
							</xsl:when>
							<xsl:otherwise>PAGE</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:call-template name="FieldCodeContent">
						<xsl:with-param name="text" select="$text"/>
					</xsl:call-template>
				</xsl:element>
				<???:???_419D>
					<xsl:if test="parent::text:span/@text:style-name">
						<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
					</xsl:if>
					<???:?????????_415B>
						<xsl:if test="@text:page-adjust">
							<xsl:value-of select="string(.)"/>
						</xsl:if>
					</???:?????????_415B>
				</???:???_419D>
				<xsl:element name="???:?????????_41A0">
        </xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text:page-continuation">
  </xsl:template>
	<xsl:template match="text:sender-firstname">
  </xsl:template>
	<xsl:template match="text:sender-lastname">
  </xsl:template>
	<xsl:template match="text:sender-initials">
  </xsl:template>
	<xsl:template match="text:sender-title">
  </xsl:template>
	<xsl:template match="text:sender-position">
  </xsl:template>
	<xsl:template match="text:sender-email">
  </xsl:template>
	<xsl:template match="text:sender-phone-private">
  </xsl:template>
	<xsl:template match="text:sender-fax">
  </xsl:template>
	<xsl:template match="text:sender-company">
  </xsl:template>
	<xsl:template match="text:sender-phone-work">
  </xsl:template>
	<xsl:template match="text:sender-street">
  </xsl:template>
	<xsl:template match="text:sender-city">
  </xsl:template>
	<xsl:template match="text:sender-postal-code">
  </xsl:template>
	<xsl:template match="text:sender-country">
  </xsl:template>
	<xsl:template match="text:sender-state-or-province">
  </xsl:template>
	<xsl:template match="text:author-name">
		<xsl:param name="tStyle"/>
		<xsl:element name="???:?????????_419E">
			<xsl:attribute name="??????_416E"><xsl:value-of select="'author'"/></xsl:attribute>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<???:??????_416B>
				<???:???_419D>
					<xsl:if test="$tStyle!=''">
						<???:?????????_4158 ????????????_417B="{$tStyle}"/>
					</xsl:if>
					<???:?????????_415B>AUTHOR</???:?????????_415B>
				</???:???_419D>
			</???:??????_416B>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<xsl:value-of select="."/>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template match="text:author-initials">
		<xsl:param name="tStyle"/>
		<xsl:element name="???:?????????_419E">
			<xsl:attribute name="??????_416E"><xsl:value-of select="'userinitials'"/></xsl:attribute>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<???:??????_416B>
				<???:???_419D>
					<xsl:if test="$tStyle!=''">
						<???:?????????_4158 ????????????_417B="{$tStyle}"/>
					</xsl:if>
					<!--???:?????????_415B uof:locID="t0109" uof:attrList="?????????">AUTHOR</???:?????????_415B-->
					<xsl:value-of select="concat('AUTHORINITIALS',' \* Upper')"/>
				</???:???_419D>
			</???:??????_416B>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<xsl:value-of select="."/>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template match="text:chapter">
  </xsl:template>
	<xsl:template match="text:file-name">
		<xsl:element name="???:?????????_419E">
			<xsl:attribute name="??????_416E"><xsl:value-of select="'filename'"/></xsl:attribute>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<xsl:variable name="text">
				<!--xsl:value-of select="concat('FILENAME \* ','Caps',' \* MERGEFORMAT')"/-->
				<xsl:value-of select="concat('FILENAME',' \p')"/>
			</xsl:variable>
			<xsl:call-template name="FieldCodeContent">
				<xsl:with-param name="text" select="$text"/>
			</xsl:call-template>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<xsl:value-of select="."/>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template match="text:template-name">
  </xsl:template>
	<xsl:template match="text:sheet-name">
  </xsl:template>
	<xsl:template match="text:variable-set">
  </xsl:template>
	<xsl:template match="text:variable-get">
  </xsl:template>
	<xsl:template match="text:variable-input">
  </xsl:template>
	<xsl:template match="text:user-field-get">
  </xsl:template>
	<xsl:template match="text:user-field-input">
  </xsl:template>
	<xsl:template match="text:sequence">
		<xsl:param name="tStyle"/>
		<xsl:if test="@text:name='Illustration'  or @text:name='Text'  or @text:name='Drawing'  or @text:name='Table'">
			<xsl:element name="???:?????????_419E">
				<xsl:attribute name="??????_416E"><xsl:value-of select="'SEQ'"/></xsl:attribute>
			</xsl:element>
			<xsl:element name="???:?????????_419F">
				<???:??????_416B>
					<???:???_419D>
						<xsl:if test="$tStyle!=''">
							<???:?????????_4158 ????????????_417B="{$tStyle}"/>
						</xsl:if>
						<xsl:variable name="fmt">
							<xsl:call-template name="oo?????????????????????">
								<xsl:with-param name="oo_format" select="@style:num-format"/>
							</xsl:call-template>
						</xsl:variable>
						<???:?????????_415B>
							<xsl:value-of select="concat('SEQ ',@text:name,' \* ',$fmt,' \f ',@text:formula)"/>
						</???:?????????_415B>
					</???:???_419D>
				</???:??????_416B>
			</xsl:element>
			<???:???_419D>
				<???:?????????_415B>
					<xsl:value-of select="string(.)"/>
				</???:?????????_415B>
			</???:???_419D>
			<xsl:element name="???:?????????_41A0">
      </xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template match="text:expression">
  </xsl:template>
	<xsl:template match="text:text-input">
  </xsl:template>
	<!--<xsl:template match="text:creator">
	</xsl:template>	-->
	<xsl:template match="text:initial-creator | text:creator">
		<xsl:element name="???:?????????_419E">
			<xsl:attribute name="??????_416E"><xsl:value-of select="'author'"/></xsl:attribute>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<xsl:variable name="text">
				<!--xsl:value-of select="concat('AUTHOR \* ','Caps',' \* MERGEFORMAT')"/-->
				<!--xsl:value-of select="'AUTHOR'"/-->
				<xsl:if test="name(.)='text:initial-creator'">
					<xsl:value-of select="concat('INITIALCREATOR',' \* Upper')"/>
				</xsl:if>
				<xsl:if test="name(.)='text:creator'">
					<xsl:value-of select="concat('MODIFICATIONAUTHOR',' \* Upper')"/>
				</xsl:if>
			</xsl:variable>
			<xsl:call-template name="FieldCodeContent">
				<xsl:with-param name="text" select="$text"/>
			</xsl:call-template>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<xsl:value-of select="string(.)"/>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template match="text:description">
		<xsl:element name="???:?????????_419E">
			<xsl:attribute name="??????_416E"><xsl:value-of select="'comments'"/></xsl:attribute>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<xsl:variable name="text">
				<xsl:value-of select="concat('COMMENTS',' \* Upper')"/>
			</xsl:variable>
			<xsl:call-template name="FieldCodeContent">
				<xsl:with-param name="text" select="$text"/>
			</xsl:call-template>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<xsl:value-of select="."/>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template match="text:user-defined">
  </xsl:template>
	<xsl:template match="text:print-time">
  </xsl:template>
	<xsl:template match="text:print-date">
  </xsl:template>
	<xsl:template match="text:printed-by">
  </xsl:template>
	<xsl:template match="text:title">
		<xsl:element name="???:?????????_419E">
			<xsl:attribute name="??????_416E"><xsl:value-of select="'title'"/></xsl:attribute>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<xsl:variable name="titlename" select="/office:document/office:meta/dc:title"/>
			<xsl:variable name="text">
				<xsl:value-of select="concat('TITLE',' \* Upper')"/>
			</xsl:variable>
			<xsl:call-template name="FieldCodeContent">
				<xsl:with-param name="text" select="$text"/>
			</xsl:call-template>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<xsl:value-of select="."/>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template match="text:subject">
		<xsl:element name="???:?????????_419E">
			<xsl:attribute name="??????_416E"><xsl:value-of select="'subject'"/></xsl:attribute>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<xsl:variable name="text">
				<xsl:value-of select="concat('SUBJECT \* ','Caps',' \* MERGEFORMAT')"/>
			</xsl:variable>
			<xsl:call-template name="FieldCodeContent">
				<xsl:with-param name="text" select="$text"/>
			</xsl:call-template>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<xsl:value-of select="."/>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template match="text:keywords">
		<xsl:element name="???:?????????_419E">
			<xsl:attribute name="??????_416E"><xsl:value-of select="'keywords'"/></xsl:attribute>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<xsl:variable name="text">
				<xsl:value-of select="concat('KEYWORDS',' \* Upper')"/>
			</xsl:variable>
			<xsl:call-template name="FieldCodeContent">
				<xsl:with-param name="text" select="$text"/>
			</xsl:call-template>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<xsl:value-of select="."/>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template match="text:editing-cycles">
		<xsl:element name="???:?????????_419E">
			<xsl:attribute name="??????_416E"><xsl:value-of select="'revnum'"/></xsl:attribute>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<xsl:variable name="text">
				<xsl:value-of select="concat('REVNUM',' \* Upper')"/>
			</xsl:variable>
			<xsl:call-template name="FieldCodeContent">
				<xsl:with-param name="text" select="$text"/>
			</xsl:call-template>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<xsl:value-of select="."/>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template match="text:editing-duration">
		<xsl:element name="???:?????????_419E">
			<xsl:attribute name="??????_416E"><xsl:value-of select="'edittime'"/></xsl:attribute>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<!--xsl:if test="@style:data-style-name">
				<xsl:attribute name="???:????????????"><xsl:value-of select="@style:data-style-name"/></xsl:attribute>
			</xsl:if-->
			<!-- del 3.28  lvxg(no definition in the schema)-->
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<xsl:variable name="timefmt">
				<xsl:variable name="aa" select="@style:data-style-name"/>
				<xsl:for-each select="key('AllNumberStyle',$aa)/number:hours | key('AllNumberStyle',$aa)/number:minutes | key('AllNumberStyle',$aa)/number:am-pm | key('AllNumberStyle',$aa)/number:seconds | key('AllNumberStyle',$aa)/number:text">
					<xsl:choose>
						<xsl:when test="@number:style='long' ">
							<xsl:if test="self::node( )[name(.)='number:hours']">HH</xsl:if>
							<xsl:if test="self::node( )[name(.)='number:minutes']">MM</xsl:if>
							<xsl:if test="self::node( )[name(.)='number:seconds']">SS</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="self::node( )[name(.)='number:text']">
								<xsl:value-of select="."/>
							</xsl:if>
							<xsl:if test="self::node( )[name(.)='number:hours']">H</xsl:if>
							<xsl:if test="self::node( )[name(.)='number:minutes']">M</xsl:if>
							<xsl:if test="self::node( )[name(.)='number:seconds']">S</xsl:if>
							<xsl:if test="self::node( )[name(.)='number:am-pm']">am/pm</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="quote">"</xsl:variable>
			<xsl:variable name="text">
				<xsl:value-of select="concat('EDITTIME \@ ',$quote,$timefmt,$quote,' \* MERGEFORMAT ')"/>
			</xsl:variable>
			<xsl:call-template name="FieldCodeContent">
				<xsl:with-param name="text" select="$text"/>
			</xsl:call-template>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<xsl:value-of select="."/>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template match="text:page-count">
		<!--???????????????-->
		<xsl:element name="???:?????????_419E">
			<xsl:attribute name="??????_416E"><xsl:value-of select="'numpages'"/></xsl:attribute>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<xsl:variable name="fmt">
				<xsl:call-template name="oo?????????????????????">
					<xsl:with-param name="oo_format" select="@style:num-format"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="text">
				<xsl:choose>
					<xsl:when test="@style:num-format">
						<!--xsl:value-of select="concat('NumPages \* ',$fmt,' \* MERGEFORMAT')"/-->
						<!--<xsl:value-of select="concat('NumPages \* ',$fmt,' \* Upper')"/> -->
						<xsl:value-of select="concat('NumPages \* ',$fmt)"/>
						<!--???????????????????????????????????????-->
					</xsl:when>
					<xsl:otherwise>NumPages</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:call-template name="FieldCodeContent">
				<xsl:with-param name="text" select="$text"/>
			</xsl:call-template>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<xsl:value-of select="string(.)"/>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template match="text:paragraph-count">
  </xsl:template>
	<xsl:template match="text:word-count">
  </xsl:template>
	<xsl:template match="text:character-count">
		<xsl:element name="???:?????????_419E">
			<xsl:attribute name="??????_416E"><xsl:value-of select="'numchars'"/></xsl:attribute>
			<xsl:choose>
				<xsl:when test="@text:fixed='1' or @text:fixed='true'">
					<xsl:attribute name="????????????_416F">true</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="????????????_416F">false</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<xsl:variable name="quote" select="'&quot;'"/>
			<xsl:variable name="fmt">
				<xsl:call-template name="oo?????????????????????">
					<xsl:with-param name="oo_format" select="@style:num-format"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="text">
				<xsl:value-of select="concat('NUMCHARS \* ',$fmt,' \# ',$quote,0,$quote)"/>
			</xsl:variable>
			<xsl:call-template name="FieldCodeContent">
				<xsl:with-param name="text" select="$text"/>
			</xsl:call-template>
		</xsl:element>
		<???:???_419D>
			<???:?????????_415B>
				<xsl:value-of select="."/>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
    </xsl:element>
	</xsl:template>
	<xsl:template match="text:table-count">
  </xsl:template>
	<xsl:template match="text:image-count">
  </xsl:template>
	<xsl:template match="text:object-count">
  </xsl:template>
	<xsl:template match="text:database-display">
  </xsl:template>
	<xsl:template match="text:database-next">
  </xsl:template>
	<xsl:template match="text:database-row-select">
  </xsl:template>
	<xsl:template match="text:database-row-number">
  </xsl:template>
	<xsl:template match="text:database-name">
  </xsl:template>
	<xsl:template match="text:page-variable-set">
  </xsl:template>
	<xsl:template match="text:page-variable-get">
  </xsl:template>
	<xsl:template match="text:placeholder">
		<xsl:element name="???:?????????_419E">
			<xsl:variable name="type">
				<xsl:value-of select="@text:placeholder-type"/>
			</xsl:variable>
			<xsl:attribute name="??????_416E"><xsl:value-of select="concat($type,'placeholder')"/></xsl:attribute>
		</xsl:element>
		<xsl:element name="???:?????????_419F">
			<xsl:variable name="text">
				<xsl:value-of select="@text:description"/>
			</xsl:variable>
			<xsl:call-template name="FieldCodeContent">
				<xsl:with-param name="text" select="$text"/>
			</xsl:call-template>
		</xsl:element>
		<???:???_419D>
			<xsl:if test="parent::text:span/@text:style-name">
				<???:?????????_4158 ????????????_417B="{parent::text:span/@text:style-name}"/>
			</xsl:if>
			<???:?????????_415B>
				<xsl:value-of select="string(.)"/>
			</???:?????????_415B>
		</???:???_419D>
		<xsl:element name="???:?????????_41A0">
		</xsl:element>
	</xsl:template>
	<xsl:template match="text:conditional-text">
	</xsl:template>
	<xsl:template match="text:hidden-text">
	</xsl:template>
	<xsl:template match="text:reference-ref">
	</xsl:template>
	<xsl:template match="text:bookmark-ref">
	</xsl:template>
	<xsl:template match="text:note-ref">
	</xsl:template>
	<xsl:template match="text:sequence-ref">
	</xsl:template>
	<xsl:template match="text:script">
	</xsl:template>
	<xsl:template match="text:execute-macro">
	</xsl:template>
	<xsl:template match="text:hidden-paragraph">
	</xsl:template>
	<xsl:template match="text:dde-connection">
	</xsl:template>
	<xsl:template match="text:measure">
	</xsl:template>
	<xsl:template match="text:table-formula">
	</xsl:template>
	<xsl:template match="text:meta-field">
	</xsl:template>
	<xsl:template match="text:toc-mark-start">
	</xsl:template>
	<xsl:template match="text:toc-mark-end">
	</xsl:template>
	<xsl:template match="text:toc-mark">
	</xsl:template>
	<xsl:template match="text:user-index-mark-start">
	</xsl:template>
	<xsl:template match="text:user-index-mark-end">
	</xsl:template>
	<xsl:template match="text:user-index-mark">
	</xsl:template>
	<xsl:template match="text:alphabetical-index-mark-start">
	</xsl:template>
	<xsl:template match="text:alphabetical-index-mark-end">
	</xsl:template>
	<xsl:template match="text:alphabetical-index-mark">
	</xsl:template>
	<xsl:template match="text:bibliography-mark">
	</xsl:template>
	<xsl:template match="presentation:date-time">
		<???:?????????_415B>&lt;??????/??????&gt;</???:?????????_415B>
	</xsl:template>
	<xsl:template match="presentation:header">
		<???:?????????_415B>&lt;??????&gt;</???:?????????_415B>
	</xsl:template>
	<xsl:template match="presentation:footer">
		<???:?????????_415B>&lt;??????&gt;</???:?????????_415B>
	</xsl:template>
	<xsl:template name="UOFAnchor">
		<!--xsl:param name="anchor_name1"/-->
		<xsl:if test="not(name(.)='draw:glue-point')">
			<!--xsl:variable name="anchor_name">
				<xsl:choose>
					<xsl:when test="$documentType='presentation'">
						<xsl:value-of select="concat('???:','??????_6B19')"/>
					</xsl:when>
					<xsl:when test="$documentType='spreadsheet'">
						<xsl:value-of select="concat('???:','??????_E81C')"/>
					</xsl:when>
					<xsl:when test="$documentType='text'">
						<xsl:value-of select="concat('???:','??????_415D')"/>
					</xsl:when>
				</xsl:choose>
			</xsl:variable-->
			<xsl:choose>
				<xsl:when test="name(.) = 'draw:a'">
					<xsl:for-each select="child::node( )">
						<xsl:call-template name="UOFAnchor">
							<!--xsl:with-param name="anchor_name1" select="$anchor_name1"/-->
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<!--<xsl:when test="name(.) = 'draw:frame' and (./draw:object/office:document[@office:mimetype = 'application/vnd.oasis.opendocument.chart'])">
					<xsl:call-template name="DrawFrameChart"/>
				</xsl:when>-->
				<xsl:otherwise>
					<xsl:element name="uof:??????_C644">
						<xsl:choose>
							<xsl:when test="@draw:id">
								<xsl:attribute name="????????????_C62E"><xsl:value-of select="@draw:id"/></xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="????????????_C62E"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:attribute name="?????????????????????_C630"><xsl:choose><xsl:when test="name(.)='draw:page-thumbnail'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:attribute>
						<xsl:if test="$documentType = 'spreadsheet'">
							<xsl:for-each select="key('GraphStyle',@draw:style-name)/style:graphic-properties">
								<xsl:if test="key('GraphStyle',@draw:style-name)/style:graphic-properties/@style:protect != ''">
									<uof:??????_C62A>
										<xsl:choose>
											<xsl:when test="@style:protect='size'">
												<xsl:attribute name="??????????????????"><xsl:value-of select="'true'"/></xsl:attribute>
											</xsl:when>
											<xsl:when test="@style:protect='position'">
												<xsl:attribute name="??????????????????"><xsl:value-of select="'true'"/></xsl:attribute>
											</xsl:when>
											<xsl:when test="@style:protect='position size'">
												<xsl:attribute name="??????????????????"><xsl:value-of select="'true'"/></xsl:attribute>
												<xsl:attribute name="??????????????????"><xsl:value-of select="'true'"/></xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</uof:??????_C62A>
								</xsl:if>
								<xsl:variable name="refpicname">
									<xsl:choose>
										<xsl:when test="./@draw:style-name">
											<xsl:value-of select="@draw:style-name"/>
										</xsl:when>
										<xsl:when test="./@table:end-cell-address">
											<xsl:value-of select="@table:end-cell-address"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="./@draw:id"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:attribute name="????????????_C62F"><xsl:choose><xsl:when test="name(..)='table:shapes'">none</xsl:when><xsl:when test="key('GraphStyle',$refpicname)/style:graphic-properties/@style:protect and name(..)='table:table-cell'">move</xsl:when><xsl:when test="name(..)='table:table-cell'">movesize</xsl:when><xsl:otherwise>none</xsl:otherwise></xsl:choose></xsl:attribute>
							</xsl:for-each>
						</xsl:if>
						<xsl:call-template name="??????-anchor"/>
						<uof:??????_C621>
							<xsl:variable name="object_width">
								<xsl:call-template name="??????-anchor"/>
							</xsl:variable>
							<xsl:if test="$object_width !=''">
								<xsl:attribute name="???_C605"><xsl:value-of select="$object_width"/></xsl:attribute>
							</xsl:if>
							<xsl:variable name="object_height">
								<xsl:call-template name="??????-anchor"/>
							</xsl:variable>
							<xsl:if test="$object_height !=''">
								<xsl:attribute name="???_C604"><xsl:value-of select="$object_height"/></xsl:attribute>
							</xsl:if>
							<!--bug for title in masterpage-->
							<xsl:if test="($documentType = 'presentation') and (name(.) = 'draw:frame') and (@presentation:class = 'title') and (name(..) = 'style:master-page')">
								<xsl:variable name="bug-height" select="0.254 div $other-to-cm-conversion-factor"/>
								<xsl:attribute name="???_C604"><xsl:value-of select="number($object_height) - number($bug-height)"/></xsl:attribute>
							</xsl:if>
						</uof:??????_C621>
						<xsl:call-template name="graphic-properties-anchor"/>
						<xsl:if test="key('GraphStyle',@draw:style-name)/style:graphic-properties/@style:allowoverlap">
							<uof:??????????????????_C62B>
								<xsl:for-each select="key('GraphStyle',@draw:style-name)/style:graphic-properties">
									<xsl:value-of select="@style:allowoverlap"/>
								</xsl:for-each>
							</uof:??????????????????_C62B>
						</xsl:if>
						<xsl:variable name="presentationType">
							<xsl:choose>
								<xsl:when test="@presentation:object">
									<xsl:value-of select="@presentation:object"/>
								</xsl:when>
								<xsl:when test="@presentation:class">
									<xsl:value-of select="@presentation:class"/>
								</xsl:when>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="presentationClass">
							<xsl:choose>
								<xsl:when test="$presentationType = 'date-time'">date</xsl:when>
								<xsl:when test="$presentationType = 'page-number'">number</xsl:when>
								<xsl:when test="$presentationType = 'page'">notes</xsl:when>
								<xsl:when test="$presentationType = 'subtitle'">subtitle</xsl:when>
								<xsl:when test="$presentationType = 'text'">text</xsl:when>
								<xsl:when test="$presentationType = 'graphic'">graphics</xsl:when>
								<xsl:when test="$presentationType = 'object'">object</xsl:when>
								<xsl:when test="$presentationType = 'header'">header</xsl:when>
								<xsl:when test="$presentationType = 'footer'">footer</xsl:when>
								<xsl:when test="$presentationType = 'table'">table</xsl:when>
								<xsl:when test="$presentationType = 'outline'">outline</xsl:when>
								<xsl:when test="$presentationType = 'handout'">handout</xsl:when>
								<xsl:when test="$presentationType = 'notes'">notes</xsl:when>
								<xsl:when test="$presentationType = 'chart'">chart</xsl:when>
								<xsl:when test="$presentationType = 'title'">
									<xsl:variable name="IsInMasterPage">
										<xsl:call-template name="InMasterPage"/>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="$IsInMasterPage = 'true'">
											<xsl:choose>
												<xsl:when test="draw:text-box/text:p//presentation:date-time">date</xsl:when>
												<xsl:when test="draw:text-box/text:p//presentation:header">header</xsl:when>
												<xsl:when test="draw:text-box/text:p//presentation:footer">footer</xsl:when>
												<xsl:when test="draw:text-box/text:p//text:page-number">number</xsl:when>
												<xsl:otherwise>title</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>title</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
							</xsl:choose>
						</xsl:variable>
						<xsl:if test="@presentation:object or @presentation:class">
							<uof:?????????_C626>
								<xsl:attribute name="??????_C627"><xsl:value-of select="$presentationClass"/></xsl:attribute>
							</uof:?????????_C626>
						</xsl:if>
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="??????-anchor">
		<xsl:choose>
			<xsl:when test="name()='draw:g'">
				<xsl:choose>
					<xsl:when test="child::*[1]/@svg:width and child::*[last()]/@svg:width">
						<xsl:value-of select="number(fun:Convert2uofUnit(child::*[last()]/@svg:width)) - number(fun:Convert2uofUnit(child::*[1]/@svg:width))"/>
					</xsl:when>
					<xsl:when test="child::*[1]/@svg:x1 and child::*[last()]/@svg:x2">
						<xsl:value-of select="number(fun:Convert2uofUnit(child::*[last()]/@svg:x2)) - number(fun:Convert2uofUnit(child::*[1]/@svg:x1))"/>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="@svg:width">
						<xsl:value-of select="fun:Convert2uofUnit(@svg:width)"/>
					</xsl:when>
					<xsl:when test="@fo:min-width">
						<xsl:value-of select="fun:Convert2uofUnit(@fo:min-width)"/>
					</xsl:when>
					<xsl:when test="@svg:x1">
						<xsl:variable name="svg_x1">
							<xsl:value-of select="fun:Convert2uofUnit(@svg:x1)"/>
						</xsl:variable>
						<xsl:variable name="svg_x2">
							<xsl:value-of select="fun:Convert2uofUnit(@svg:x2)"/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="number($svg_x2) &gt; number($svg_x1)">
								<xsl:value-of select="$svg_x2 - $svg_x1"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$svg_x1 - $svg_x2"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="??????-anchor">
		<xsl:choose>
			<xsl:when test="name()='draw:g'">
				<xsl:choose>
					<xsl:when test="child::*[1]/@svg:height and child::*[last()]/@svg:height">
						<xsl:value-of select="number(fun:Convert2uofUnit(child::*[last()]/@svg:height)) - number(fun:Convert2uofUnit(child::*[1]/@svg:height))"/>
					</xsl:when>
					<xsl:when test="child::*[1]/@svg:y1 and child::*[last()]/@svg:y2">
						<xsl:value-of select="number(fun:Convert2uofUnit(child::*[last()]/@svg:y2)) - number(fun:Convert2uofUnit(child::*[1]/@svg:y1))"/>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="@svg:height">
						<xsl:value-of select="fun:Convert2uofUnit(@svg:height)"/>
					</xsl:when>
					<xsl:when test="@svg:y1">
						<xsl:variable name="svg_y1">
							<xsl:value-of select="fun:Convert2uofUnit(@svg:y1)"/>
						</xsl:variable>
						<xsl:variable name="svg_y2">
							<xsl:value-of select="fun:Convert2uofUnit(@svg:y2)"/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="number($svg_y2) &gt; number($svg_y1)">
								<xsl:value-of select="$svg_y2 - $svg_y1"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$svg_y1 - $svg_y2"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="child::draw:text-box/@fo:min-height">
						<xsl:value-of select="fun:Convert2uofUnit(child::draw:text-box/@fo:min-height)"/>
					</xsl:when>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="self_definition_x2">
		<xsl:param name="draw_transform"/>
		<xsl:choose>
			<xsl:when test="contains($draw_transform, 'translate')">
				<xsl:value-of select="fun:Convert2uofUnit(normalize-space(substring-before(substring-after(substring-after($draw_transform, 'translate'), '('), ' ')))"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="self_definition_y2">
		<xsl:param name="draw_transform"/>
		<xsl:choose>
			<xsl:when test="contains($draw_transform, 'translate')">
				<!--xsl:value-of select="normalize-space(substring-before(substring-after($draw_transform, $uofUnit), $uofUnit))"/-->
				<xsl:value-of select="fun:Convert2uofUnit(normalize-space(substring-before(substring-after(substring-after($draw_transform, 'translate '), ' '), ')')))"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="??????X-anchor">
		<xsl:choose>
			<xsl:when test="@draw:transform">
				<xsl:variable name="arc">
					<xsl:call-template name="arc">
						<xsl:with-param name="draw_transform">
							<xsl:value-of select="@draw:transform"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="x2">
					<xsl:call-template name="self_definition_x2">
						<xsl:with-param name="draw_transform">
							<xsl:value-of select="@draw:transform"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="y2">
					<xsl:call-template name="self_definition_y2">
						<xsl:with-param name="draw_transform">
							<xsl:value-of select="@draw:transform"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="width">
					<xsl:value-of select="fun:Convert2uofUnit(@svg:width)"/>
				</xsl:variable>
				<xsl:variable name="hight">
					<xsl:value-of select="fun:Convert2uofUnit(@svg:height)"/>
				</xsl:variable>
				<xsl:variable name="cos">
					<xsl:call-template name="cos">
						<xsl:with-param name="arc">
							<xsl:value-of select="$arc"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="sin">
					<xsl:call-template name="sin">
						<xsl:with-param name="arc">
							<xsl:value-of select="$arc"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="position_x">
					<xsl:value-of select="number($x2) - number($width) div 2 + (number($width) div 2) * $cos + (number($hight) div 2) * $sin"/>
				</xsl:variable>
				<xsl:value-of select="$position_x"/>
			</xsl:when>
			<xsl:when test="@svg:x or @svg:x1">
				<xsl:variable name="position_x">
					<xsl:choose>
						<xsl:when test="@svg:x">
							<xsl:value-of select="fun:Convert2uofUnit(@svg:x)"/>
						</xsl:when>
						<xsl:when test="@svg:x1">
							<xsl:variable name="svg_x1">
								<xsl:value-of select="fun:Convert2uofUnit(@svg:x1)"/>
							</xsl:variable>
							<xsl:variable name="svg_x2">
								<xsl:value-of select="fun:Convert2uofUnit(@svg:x2)"/>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="number($svg_x1) &lt; number($svg_x2)">
									<xsl:value-of select="$svg_x1"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$svg_x2"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:value-of select="$position_x"/>
			</xsl:when>
			<xsl:when test="name()='draw:g' and (./*[1]/@svg:x or ./*[1]/@svg:x1)">
				<xsl:choose>
					<xsl:when test="./*[1]/@svg:x">
						<xsl:value-of select="fun:Convert2uofUnit(./*[1]/@svg:x)"/>
					</xsl:when>
					<xsl:when test="./*[1]/@svg:x1">
						<xsl:value-of select="fun:Convert2uofUnit(./*[1]/@svg:x1)"/>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="??????Y-anchor">
		<xsl:choose>
			<xsl:when test="@draw:transform">
				<xsl:variable name="arc">
					<xsl:call-template name="arc">
						<xsl:with-param name="draw_transform">
							<xsl:value-of select="@draw:transform"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="x2">
					<xsl:call-template name="self_definition_x2">
						<xsl:with-param name="draw_transform">
							<xsl:value-of select="@draw:transform"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="y2">
					<xsl:call-template name="self_definition_y2">
						<xsl:with-param name="draw_transform">
							<xsl:value-of select="@draw:transform"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="width" select="fun:Convert2uofUnit(@svg:width)"/>
				<xsl:variable name="hight" select="fun:Convert2uofUnit(@svg:height)"/>
				<xsl:variable name="cos">
					<xsl:call-template name="cos">
						<xsl:with-param name="arc">
							<xsl:value-of select="$arc"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="sin">
					<xsl:call-template name="sin">
						<xsl:with-param name="arc">
							<xsl:value-of select="$arc"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="position_y">
					<xsl:value-of select="number($y2) - number($hight) div 2 - (number($width) div 2) * $sin + (number($hight) div 2) * $cos"/>
				</xsl:variable>
				<xsl:value-of select="$position_y"/>
			</xsl:when>
			<xsl:when test="@svg:y or @svg:y1">
				<xsl:variable name="position_y">
					<xsl:choose>
						<xsl:when test="@svg:y">
							<xsl:value-of select="fun:Convert2uofUnit(@svg:y)"/>
						</xsl:when>
						<xsl:when test="@svg:y1">
							<xsl:variable name="svg_y1">
								<xsl:value-of select="fun:Convert2uofUnit(@svg:y1)"/>
							</xsl:variable>
							<xsl:variable name="svg_y2">
								<xsl:value-of select="fun:Convert2uofUnit(@svg:y2)"/>
							</xsl:variable>
							<xsl:choose>
								<xsl:when test="number($svg_y1) &lt; number($svg_y2)">
									<xsl:value-of select="$svg_y1"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$svg_y2"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:value-of select="$position_y"/>
			</xsl:when>
			<xsl:when test="name()='draw:g' and (./*[1]/@svg:y or ./*[1]/@svg:y1)">
				<xsl:choose>
					<xsl:when test="./*[1]/@svg:y">
						<xsl:value-of select="fun:Convert2uofUnit(./*[1]/@svg:y)"/>
					</xsl:when>
					<xsl:when test="./*[1]/@svg:y1">
						<xsl:value-of select="fun:Convert2uofUnit(./*[1]/@svg:y1)"/>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="??????-anchor">
		<uof:??????_C620>
			<xsl:variable name="anchor_type">
				<xsl:choose>
					<xsl:when test="@text:anchor-type = 'paragraph'">paragraph</xsl:when>
					<xsl:when test="@text:anchor-type = 'char'">char</xsl:when>
					<xsl:when test="@text:anchor-type = 'as-char'">as-char</xsl:when>
					<xsl:when test="@text:anchor-type = 'page'">page</xsl:when>
					<xsl:when test="@text:anchor-type = 'frame'">textbox</xsl:when>
					<xsl:otherwise>paragraph</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<!--Schema 100520 ???????????????????????????-?????????-->
			<xsl:if test="$documentType = 'text'">
				<xsl:attribute name="??????_C646"><xsl:value-of select="$anchor_type"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="not(@text:anchor-type='as-char')">
				<uof:??????_4106>
					<xsl:if test="$documentType = 'text'">
						<xsl:for-each select="key('GraphStyle',@draw:style-name)/style:graphic-properties">
							<xsl:attribute name="?????????_410C"><xsl:choose><xsl:when test="@style:horizontal-rel='page'">page</xsl:when><xsl:when test="@style:horizontal-rel='paragraph'">column</xsl:when><xsl:when test="@style:horizontal-rel='page-content'">margin</xsl:when><xsl:when test="@style:horizontal-rel='paragraph-content'">column</xsl:when><xsl:when test="@style:horizontal-rel='char'">char</xsl:when><xsl:otherwise>column</xsl:otherwise></xsl:choose></xsl:attribute>
						</xsl:for-each>
					</xsl:if>
					<xsl:variable name="position_x">
						<xsl:call-template name="??????X-anchor"/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="$position_x != '' and (key('GraphStyle',@draw:style-name)/style:graphic-properties/@style:horizontal-pos='from-left' or not(key('GraphStyle',@draw:style-name)/style:graphic-properties/@style:horizontal-pos)) and $documentType = 'text'">
							<uof:??????_4107>
								<xsl:attribute name="???_4108"><xsl:value-of select="$position_x"/></xsl:attribute>
							</uof:??????_4107>
						</xsl:when>
						<xsl:when test="$position_x != '' and $documentType != 'text'">
							<uof:??????_4107>
								<xsl:attribute name="???_4108"><xsl:value-of select="$position_x"/></xsl:attribute>
							</uof:??????_4107>
						</xsl:when>
						<xsl:otherwise>
							<uof:??????_4109>
								<xsl:for-each select="key('GraphStyle',@draw:style-name)/style:graphic-properties">
									<xsl:attribute name="?????????_410A"><xsl:choose><xsl:when test="@style:horizontal-pos='right'">right</xsl:when><xsl:when test="@style:horizontal-pos='center'">center</xsl:when><xsl:otherwise>left</xsl:otherwise></xsl:choose></xsl:attribute>
								</xsl:for-each>
							</uof:??????_4109>
						</xsl:otherwise>
					</xsl:choose>
				</uof:??????_4106>
				<uof:??????_410D>
					<xsl:if test="$documentType = 'text'">
						<xsl:for-each select="key('GraphStyle',@draw:style-name)/style:graphic-properties">
							<xsl:attribute name="?????????_410C"><xsl:choose><xsl:when test="@style:vertical-rel='page'">page</xsl:when><xsl:when test="@style:vertical-rel='paragraph'">paragraph</xsl:when><xsl:when test="@style:vertical-rel='page-content'">margin</xsl:when><xsl:when test="@style:vertical-rel='line'">line</xsl:when><xsl:otherwise>paragraph</xsl:otherwise></xsl:choose></xsl:attribute>
						</xsl:for-each>
					</xsl:if>
					<xsl:variable name="position_y">
						<xsl:call-template name="??????Y-anchor"/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="$position_y != '' and $documentType != 'text'">
							<uof:??????_4107>
								<xsl:attribute name="???_4108"><xsl:value-of select="$position_y"/></xsl:attribute>
							</uof:??????_4107>
						</xsl:when>
						<!--<xsl:when test="$position_y != '' and (key('GraphStyle',@draw:style-name)/style:graphic-properties/@style:vertical-pos='from-top' or key('GraphStyle',@draw:style-name)/style:graphic-properties/@style:vertical-pos='bottom') and key('GraphStyle',@draw:style-name)/style:graphic-properties/@style:vertical-rel='line'">-->
						<xsl:when test="$position_y != '' and key('GraphStyle',@draw:style-name)/style:graphic-properties/@style:vertical-pos='from-top' and key('GraphStyle',@draw:style-name)/style:graphic-properties/@style:vertical-rel='line' and $documentType = 'text'">
							<uof:??????_4107>
								<xsl:attribute name="???_4108"><xsl:value-of select="$position_y"/></xsl:attribute>
							</uof:??????_4107>
						</xsl:when>
						<xsl:when test="$position_y != '' and key('GraphStyle',@draw:style-name)/style:graphic-properties/@style:vertical-pos = 'from-top' and $documentType = 'text'">
							<uof:??????_4107>
								<xsl:attribute name="???_4108"><xsl:value-of select="$position_y"/></xsl:attribute>
							</uof:??????_4107>
						</xsl:when>
						<xsl:otherwise>
							<uof:??????_4109>
								<xsl:for-each select="key('GraphStyle',@draw:style-name)/style:graphic-properties">
									<xsl:attribute name="?????????_410A"><xsl:choose><xsl:when test="@style:vertical-pos='bottom'">bottom</xsl:when><xsl:when test="@style:vertical-pos='middle'">center</xsl:when><xsl:when test="@style:vertical-pos='below'">inside</xsl:when><xsl:otherwise>top</xsl:otherwise></xsl:choose></xsl:attribute>
								</xsl:for-each>
							</uof:??????_4109>
						</xsl:otherwise>
					</xsl:choose>
				</uof:??????_410D>
			</xsl:if>
		</uof:??????_C620>
	</xsl:template>
	<xsl:template name="???:??????-anchor">
		<xsl:variable name="wrap_type1">
			<xsl:value-of select="@style:wrap"/>
		</xsl:variable>
		<xsl:variable name="wrap_type2">
			<xsl:value-of select="@style:run-through"/>
		</xsl:variable>
		<xsl:variable name="wrap_type3">
			<xsl:value-of select="@style:wrap-contour-mode"/>
		</xsl:variable>
		<xsl:variable name="wrap_place">
			<xsl:value-of select="@style:wrap-contour"/>
		</xsl:variable>
		<xsl:if test="$wrap_type1 or $wrap_type2 or $wrap_type3 or $wrap_place">
			<uof:??????_C622>
				<xsl:choose>
					<xsl:when test="$wrap_type1='run-through' and $wrap_type2='background' ">
						<xsl:attribute name="????????????_C623">behind-text</xsl:attribute>
					</xsl:when>
					<xsl:when test="$wrap_type1='run-through'">
						<xsl:attribute name="????????????_C623">infront-of-text</xsl:attribute>
					</xsl:when>
					<xsl:when test="$wrap_place='false'">
						<xsl:attribute name="????????????_C623">square</xsl:attribute>
					</xsl:when>
					<xsl:when test="$wrap_type3='outside' and $wrap_place='true'">
						<xsl:attribute name="????????????_C623">tight</xsl:attribute>
					</xsl:when>
					<xsl:when test="$wrap_type3='full' and $wrap_place='true'">
						<xsl:attribute name="????????????_C623">through</xsl:attribute>
					</xsl:when>
					<xsl:when test="$wrap_type1='none' ">
						<xsl:attribute name="????????????_C623">top-bottom</xsl:attribute>
					</xsl:when>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="$wrap_type1='right'">
						<xsl:attribute name="????????????_C624">right</xsl:attribute>
					</xsl:when>
					<xsl:when test="$wrap_type1='left'">
						<xsl:attribute name="????????????_C624">left</xsl:attribute>
					</xsl:when>
					<xsl:when test="$wrap_type1='parallel'">
						<xsl:attribute name="????????????_C624">both</xsl:attribute>
					</xsl:when>
					<xsl:when test="$wrap_type1='dynamic'">
						<xsl:attribute name="????????????_C624">largest</xsl:attribute>
					</xsl:when>
				</xsl:choose>
			</uof:??????_C622>
		</xsl:if>
	</xsl:template>
	<xsl:template name="???:??????-anchor">
		<uof:??????_C628>
			<xsl:choose>
				<xsl:when test="@fo:margin-top">
					<xsl:attribute name="???_C609"><xsl:value-of select="fun:Convert2uofUnit(@fo:margin-top)"/></xsl:attribute>
					<xsl:attribute name="???_C60B"><xsl:value-of select="fun:Convert2uofUnit(@fo:margin-bottom)"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="../@style:parent-style-name = 'Frame'">
					<xsl:attribute name="???_C609"><xsl:value-of select="fun:Convert2uofUnit(/office:document/office:styles/style:style[@style:name = 'Frame']/style:graphic-properties/@fo:margin-top)"/></xsl:attribute>
					<xsl:attribute name="???_C60B"><xsl:value-of select="fun:Convert2uofUnit(/office:document/office:styles/style:style[@style:name = 'Frame']/style:graphic-properties/@fo:margin-bottom)"/></xsl:attribute>
				</xsl:when>
				<!--xsl:otherwise>
					<xsl:attribute name="???_C609">0.0</xsl:attribute>
					<xsl:attribute name="???_C60B">0.0</xsl:attribute>
				</xsl:otherwise-->
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="@fo:margin-right">
					<xsl:attribute name="???_C60A"><xsl:value-of select="fun:Convert2uofUnit(@fo:margin-right)"/></xsl:attribute>
					<xsl:attribute name="???_C608"><xsl:value-of select="fun:Convert2uofUnit(@fo:margin-left)"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="../@style:parent-style-name = 'Frame'">
					<xsl:attribute name="???_C60A"><xsl:value-of select="fun:Convert2uofUnit(/office:document/office:styles/style:style[@style:name = 'Frame']/style:graphic-properties/@fo:margin-right)"/></xsl:attribute>
					<xsl:attribute name="???_C608"><xsl:value-of select="fun:Convert2uofUnit(/office:document/office:styles/style:style[@style:name = 'Frame']/style:graphic-properties/@fo:margin-left)"/></xsl:attribute>
				</xsl:when>
				<!--xsl:otherwise>
					<xsl:attribute name="???_C60A">0.0</xsl:attribute>
					<xsl:attribute name="???_C608">0.0</xsl:attribute>
				</xsl:otherwise-->
			</xsl:choose>
		</uof:??????_C628>
	</xsl:template>
	<xsl:template name="???:??????-anchor">
		<uof:????????????_C629>
			<xsl:choose>
				<xsl:when test="@draw:move-protect='false'">false</xsl:when>
				<xsl:otherwise>true</xsl:otherwise>
			</xsl:choose>
		</uof:????????????_C629>
	</xsl:template>
	<xsl:template name="???:??????-anchor">
		<xsl:param name="objectname"/>
		<uof:??????_C62A>
			<xsl:choose>
				<xsl:when test="$objectname='draw:image' or $objectname='draw:text-box'">
					<xsl:attribute name="??????_C643"><xsl:choose><xsl:when test="@style:protect = 'content size position' or @style:protect = 'content' or @style:protect = 'content size'  or @style:protect = 'size position' or @style:protect = 'size' or @style:protect = 'position' or @style:protect = 'content position' and @draw:size-protect= 'true'and @draw:move-protect= 'true'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="??????_C643"><xsl:choose><xsl:when test="@style:protect = 'position size'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</uof:??????_C62A>
	</xsl:template>
	<xsl:template name="graphic-properties-anchor">
		<xsl:variable name="objectname">
			<xsl:value-of select="name(.)"/>
		</xsl:variable>
		<xsl:for-each select="key('GraphStyle',@draw:style-name)/style:graphic-properties">
			<xsl:call-template name="???:??????-anchor"/>
			<xsl:call-template name="???:??????-anchor"/>
			<xsl:call-template name="???:??????-anchor"/>
			<xsl:call-template name="???:??????-anchor">
				<xsl:with-param name="objectname" select="$objectname"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="textshape">
		<xsl:if test="not(name(.)='draw:glue-point')">
			<xsl:choose>
				<xsl:when test="name(.) = 'draw:a'">
					<xsl:for-each select="child::node( )">
						<xsl:call-template name="textshape"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<!--uof:??????_C644>
						<xsl:choose>
							<xsl:when test="@draw:id">
								<xsl:attribute name="????????????_C62E"><xsl:value-of select="@draw:id"/></xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="????????????_C62E"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
						<uof:??????_C621>
							<xsl:variable name="object_width">
								<xsl:call-template name="??????-anchor"/>
							</xsl:variable>
							<xsl:if test="$object_width !=''">
								<xsl:attribute name="???_C605"><xsl:value-of select="$object_width"/></xsl:attribute>
							</xsl:if>
							<xsl:variable name="object_height">
								<xsl:call-template name="??????-anchor"/>
							</xsl:variable>
							<xsl:if test="$object_height !=''">
								<xsl:attribute name="???_C604"><xsl:value-of select="$object_height"/></xsl:attribute>
							</xsl:if>
						</uof:??????_C621>
						<xsl:call-template name="???:??????-anchor"/>
						<xsl:call-template name="graphic-properties-anchor"/>
						<xsl:if test="key('GraphStyle',@draw:style-name)/style:graphic-properties/@style:allowoverlap">
							<uof:??????????????????_C62B>
								<xsl:for-each select="key('GraphStyle',@draw:style-name)/style:graphic-properties">
									<xsl:value-of select="@style:allowoverlap"/>
								</xsl:for-each>
							</uof:??????????????????_C62B>
						</xsl:if>
					</uof:??????_C644-->
					<xsl:call-template name="UOFAnchor">
						<!--xsl:with-param name="anchor_name1" select="'uof:??????_C644'"/-->
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="arc">
		<xsl:param name="draw_transform"/>
		<xsl:value-of select="substring-before(substring-after($draw_transform, 'rotate ('), ')')"/>
	</xsl:template>
	<!--?????????????????????????????????sin(x)???-->
	<!--x?????????????????????????????????????????????????????????-->
	<!--????????????????????????sin(x) = x - x^3 / 3! + x^5 / 5! - ... +(-1)^(n-1) * x^(2 * n - 1) / (2 * n - 1) + ...-->
	<xsl:template name="sin">
		<xsl:param name="arc"/>
		<xsl:param name="n">
			<xsl:value-of select="'1'"/>
		</xsl:param>
		<xsl:param name="result"/>
		<xsl:choose>
			<xsl:when test="$n = '1'">
				<xsl:call-template name="sin">
					<xsl:with-param name="arc">
						<xsl:value-of select="$arc"/>
					</xsl:with-param>
					<xsl:with-param name="n">
						<xsl:value-of select="$n + 1"/>
					</xsl:with-param>
					<xsl:with-param name="result">
						<xsl:value-of select="$arc"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="($n mod 2) = 0">
				<xsl:variable name="NPowerOfArc">
					<xsl:call-template name="power">
						<xsl:with-param name="x">
							<xsl:value-of select="$arc"/>
						</xsl:with-param>
						<xsl:with-param name="n">
							<xsl:value-of select="2 * $n - 1"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="NFactorial">
					<xsl:call-template name="factorial">
						<xsl:with-param name="n">
							<xsl:value-of select="2 * $n - 1"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="factor">
					<xsl:value-of select="$NPowerOfArc div $NFactorial"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$factor &gt; -0.0000001 and $factor &lt; 0.0000001">
						<xsl:value-of select="$result - $factor"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="sin">
							<xsl:with-param name="arc">
								<xsl:value-of select="$arc"/>
							</xsl:with-param>
							<xsl:with-param name="n">
								<xsl:value-of select="$n + 1"/>
							</xsl:with-param>
							<xsl:with-param name="result">
								<xsl:value-of select="$result - $factor"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="($n mod 2) = 1">
				<xsl:variable name="NPowerOfArc">
					<xsl:call-template name="power">
						<xsl:with-param name="x">
							<xsl:value-of select="$arc"/>
						</xsl:with-param>
						<xsl:with-param name="n">
							<xsl:value-of select="2 * $n - 1"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="NFactorial">
					<xsl:call-template name="factorial">
						<xsl:with-param name="n">
							<xsl:value-of select="2 * $n - 1"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="factor">
					<xsl:value-of select="$NPowerOfArc div $NFactorial"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$factor &gt; -0.0000001 and $factor &lt; 0.0000001">
						<xsl:value-of select="$result + $factor"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="sin">
							<xsl:with-param name="arc">
								<xsl:value-of select="$arc"/>
							</xsl:with-param>
							<xsl:with-param name="n">
								<xsl:value-of select="$n + 1"/>
							</xsl:with-param>
							<xsl:with-param name="result">
								<xsl:value-of select="$result + $factor"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!--?????????????????????????????????cos(x)???-->
	<!--x?????????????????????????????????????????????????????????-->
	<!--????????????????????????cos(x) = 1 - x^2 / 2! + x^4 / 4! - ... + (-1)^n * x^(2 * n) / (2 * n)! + ...-->
	<xsl:template name="cos">
		<xsl:param name="arc"/>
		<xsl:param name="n">
			<xsl:value-of select="'0'"/>
		</xsl:param>
		<xsl:param name="result"/>
		<xsl:choose>
			<xsl:when test="$n = '0'">
				<xsl:call-template name="cos">
					<xsl:with-param name="arc">
						<xsl:value-of select="$arc"/>
					</xsl:with-param>
					<xsl:with-param name="n">
						<xsl:value-of select="$n + 1"/>
					</xsl:with-param>
					<xsl:with-param name="result">
						<xsl:value-of select="1"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="($n mod 2) = 0">
				<xsl:variable name="NPowerOfArc">
					<xsl:call-template name="power">
						<xsl:with-param name="x">
							<xsl:value-of select="$arc"/>
						</xsl:with-param>
						<xsl:with-param name="n">
							<xsl:value-of select="2 * $n"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="NFactorial">
					<xsl:call-template name="factorial">
						<xsl:with-param name="n">
							<xsl:value-of select="2 * $n"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="factor">
					<xsl:value-of select="$NPowerOfArc div $NFactorial"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$factor &gt; -0.0000001 and $factor &lt; 0.0000001">
						<xsl:value-of select="$result + $factor"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="cos">
							<xsl:with-param name="arc">
								<xsl:value-of select="$arc"/>
							</xsl:with-param>
							<xsl:with-param name="n">
								<xsl:value-of select="$n + 1"/>
							</xsl:with-param>
							<xsl:with-param name="result">
								<xsl:value-of select="$result + $factor"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="($n mod 2) = 1">
				<xsl:variable name="NPowerOfArc">
					<xsl:call-template name="power">
						<xsl:with-param name="x">
							<xsl:value-of select="$arc"/>
						</xsl:with-param>
						<xsl:with-param name="n">
							<xsl:value-of select="2 * $n"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="NFactorial">
					<xsl:call-template name="factorial">
						<xsl:with-param name="n">
							<xsl:value-of select="2 * $n"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="factor">
					<xsl:value-of select="$NPowerOfArc div $NFactorial"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$factor &gt; -0.0000001 and $factor &lt; 0.0000001 ">
						<xsl:value-of select="$result - $factor"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="cos">
							<xsl:with-param name="arc">
								<xsl:value-of select="$arc"/>
							</xsl:with-param>
							<xsl:with-param name="n">
								<xsl:value-of select="$n + 1"/>
							</xsl:with-param>
							<xsl:with-param name="result">
								<xsl:value-of select="$result - $factor"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="power">
		<xsl:param name="x"/>
		<xsl:param name="n"/>
		<xsl:param name="i">
			<xsl:value-of select="1"/>
		</xsl:param>
		<xsl:param name="result">
			<xsl:value-of select="1"/>
		</xsl:param>
		<xsl:choose>
			<xsl:when test="$n = 0">
				<xsl:value-of select="1"/>
			</xsl:when>
			<xsl:when test="$i = 1">
				<xsl:choose>
					<xsl:when test="$n = 1">
						<xsl:value-of select="$x"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="power">
							<xsl:with-param name="x">
								<xsl:value-of select="$x"/>
							</xsl:with-param>
							<xsl:with-param name="n">
								<xsl:value-of select="$n"/>
							</xsl:with-param>
							<xsl:with-param name="i">
								<xsl:value-of select="$i + 1"/>
							</xsl:with-param>
							<xsl:with-param name="result">
								<xsl:value-of select="$x"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$i = $n">
				<xsl:value-of select="$result * $x"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="power">
					<xsl:with-param name="x">
						<xsl:value-of select="$x"/>
					</xsl:with-param>
					<xsl:with-param name="n">
						<xsl:value-of select="$n"/>
					</xsl:with-param>
					<xsl:with-param name="i">
						<xsl:value-of select="$i + 1"/>
					</xsl:with-param>
					<xsl:with-param name="result">
						<xsl:value-of select="$result * $x"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--???????????????????????????n!-->
	<xsl:template name="factorial">
		<xsl:param name="n"/>
		<xsl:param name="i">
			<xsl:value-of select="1"/>
		</xsl:param>
		<xsl:param name="result">
			<xsl:value-of select="1"/>
		</xsl:param>
		<xsl:choose>
			<xsl:when test="$n = 0">
				<xsl:value-of select="1"/>
			</xsl:when>
			<xsl:when test="$i = 1">
				<xsl:choose>
					<xsl:when test="$n = 1">
						<xsl:value-of select="1"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="factorial">
							<xsl:with-param name="n">
								<xsl:value-of select="$n"/>
							</xsl:with-param>
							<xsl:with-param name="i">
								<xsl:value-of select="$i + 1"/>
							</xsl:with-param>
							<xsl:with-param name="result">
								<xsl:value-of select="1"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$i = $n">
				<xsl:value-of select="$result * $i"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="factorial">
					<xsl:with-param name="n">
						<xsl:value-of select="$n"/>
					</xsl:with-param>
					<xsl:with-param name="i">
						<xsl:value-of select="$i + 1"/>
					</xsl:with-param>
					<xsl:with-param name="result">
						<xsl:value-of select="$result * $i"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="sw-BookMarks">
		<xsl:if test="/office:document/office:body/office:text/text:p/text:bookmark-start|/office:document/office:body/office:text/text:p/text:bookmark">
			<xsl:for-each select="/office:document/office:body/office:text/text:p/text:bookmark-start|/office:document/office:body/office:text/text:p/text:bookmark">
				<??????:??????_9105>
					<xsl:attribute name="??????_9103"><xsl:value-of select="@text:name"/></xsl:attribute>
					<??????:??????_9100>
						<xsl:attribute name="????????????_41CE"><xsl:value-of select="@text:name"/></xsl:attribute>
					</??????:??????_9100>
				</??????:??????_9105>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="UserDataSet">
		<uof:???????????????>
			<uof:????????????>
				<xsl:for-each select="/office:document/office:body/office:text//office:annotation[contains(dc:creator,'__@*Start@')]">
					<xsl:call-template name="UOFRelation"/>
				</xsl:for-each>
			</uof:????????????>
		</uof:???????????????>
	</xsl:template>
	<!--????????????????????????????????????????????????????????????????????????uof:?????????-->
	<xsl:template name="UOFRelation">
		<uof:?????? uof:??????="{text:p}">
			<xsl:variable name="fieldPath">
				<xsl:call-template name="UOF_docFieldNodePath">
					<xsl:with-param name="aName" select="text:p"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:if test="$fieldPath">
				<uof:??????XML uof:????????????="{$fieldPath}"/>
			</xsl:if>
			<uof:UOF uof:??????????????????="{concat('cmt',generate-id(.))}"/>
		</uof:??????>
	</xsl:template>
	<xsl:template name="UOF_docFieldNodePath">
		<xsl:param name="aName"/>
		<xsl:param name="i"/>
		<xsl:choose>
			<xsl:when test="$aName='fenshuxuhao' or $aName='h_count' or $aName='????????????'">/?????????/??????/????????????</xsl:when>
			<xsl:when test="$aName='mimidengji' or $aName='h_sLevel' or $aName='????????????'">/?????????/??????/????????????</xsl:when>
			<xsl:when test="$aName='baomiqixian' or $aName='h_sTime' or $aName='????????????'">/?????????/??????/????????????</xsl:when>
			<xsl:when test="$aName='jinjiqixian' or $aName='h_eDegree' or $aName='????????????'">/?????????/??????/????????????</xsl:when>
			<xsl:when test="starts-with($aName,'fawenjiguanmingcheng') or $aName='h_oName' or starts-with($aName,'??????????????????')">/?????????/??????/??????????????????/??????????????????<xsl:if test="substring-after($aName,'fawenjiguanmingcheng_')">
					<xsl:value-of select="concat('[',substring-after($aName,'fawenjiguanmingcheng_'),']')"/>
				</xsl:if>
				<xsl:if test="substring-after($aName,'??????????????????_')">
					<xsl:value-of select="concat('[',substring-after($aName,'??????????????????_'),']')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$aName='biaoshihouzhuei' or $aName='h_idSuffix' or $aName='????????????????????????'">/?????????/??????/??????????????????/????????????</xsl:when>
			<xsl:when test="$aName='fawenjiguandaizi' or $aName='h_sender' or $aName='??????????????????'">/?????????/??????/????????????/??????????????????</xsl:when>
			<xsl:when test="$aName='fawennianhao' or $aName='h_oYear' or $aName='????????????'">/?????????/??????/????????????/????????????</xsl:when>
			<xsl:when test="$aName='fawenxuhao' or $aName='h_oSequence' or $aName='????????????'">/?????????/??????/????????????/????????????</xsl:when>
			<xsl:when test="starts-with($aName,'qianfaren') or $aName='h_signer' or starts-with($aName,'?????????')">/?????????/??????/?????????<xsl:if test="substring-after($aName,'qianfaren_')">
					<xsl:value-of select="concat('[',substring-after($aName,'qianfaren_'),']')"/>
				</xsl:if>
				<xsl:if test="substring-after($aName,'?????????_')">
					<xsl:value-of select="concat('[',substring-after($aName,'?????????_'),']')"/>
				</xsl:if>
			</xsl:when>
			<!--end of header-->
			<!--??????"??????"-->
			<xsl:when test="starts-with($aName,'biaotizhu')">?????????/??????/??????<xsl:if test="substring-before(substring-after($aName,'biaotizhu_'),'_')">
					<xsl:value-of select="concat('[',substring-before(substring-after($aName,'biaotizhu_'),'_'),']')"/>
				</xsl:if>/??????<xsl:if test="substring-after(substring-after($aName,'biaotizhu_'),'_')">
					<xsl:value-of select="concat('[',substring-after(substring-after($aName,'biaotizhu_'),'_'),']')"/>
				</xsl:if>/?????????/??????</xsl:when>
			<xsl:when test="$aName='biaoti' or $aName='b_title' or $aName='??????'">/?????????/??????/??????</xsl:when>
			<xsl:when test="starts-with($aName,'zhusongjiguan') or $aName='b_sender' or starts-with($aName,'????????????')">/?????????/??????/????????????<xsl:if test="substring-after($aName,'zhusongjiguan_')">
					<xsl:value-of select="substring-after($aName,'zhusongjiguan_')"/>
				</xsl:if>
				<xsl:if test="substring-after($aName,'????????????_')">
					<xsl:value-of select="substring-after($aName,'????????????_')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="starts-with($aName,'ziranduan') or starts-with($aName,'b_paragraph') or starts-with($aName,'????????????')">/?????????/??????/??????<xsl:if test="substring-before(substring-after($aName,'ziranduan_'),'_')">
					<xsl:value-of select="concat('[',substring-before(substring-after($aName,'ziranduan_'),'_'),']')"/>
				</xsl:if>/?????????<xsl:if test="substring-after(substring-after($aName,'ziranduan_'),'_')">
					<xsl:value-of select="concat('[',substring-after(substring-after($aName,'ziranduan_'),'_'),']')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="starts-with($aName,'biaoge') or starts-with($aName,'b_table') or starts-with($aName,'????????????')">/?????????/??????/??????<xsl:if test="substring-before(substring-after($aName,'biaoge_'),'_')">
					<xsl:value-of select="concat('[',substring-before(substring-after($aName,'biaoge_'),'_'),']')"/>
				</xsl:if>/??????<xsl:if test="substring-after(substring-after($aName,'biaoge_'),'_')">
					<xsl:value-of select="concat('[',substring-after(substring-after($aName,'biaoge_'),'_'),']')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="starts-with($aName,'biaogeziranduan')">?????????/??????/??????<xsl:if test="substring-before(substring-after($aName,'biaogeziranduan_'),'_')">
					<xsl:value-of select="concat('[',substring-before(substring-after($aName,'biaogeziranduan_'),'_'),']')"/>
				</xsl:if>/??????<xsl:if test="substring-before(substring-after(substring-after($aName,'biaogeziranduan_'),'_'),'_')">
					<xsl:value-of select="concat('[',substring-before(substring-after(substring-after($aName,'biaogeziranduan_'),'_'),'_'),']')"/>
				</xsl:if>/??????<xsl:if test="substring-before(substring-after(substring-after(substring-after($aName,'biaogeziranduan_'),'_'),'_'),'_')">
					<xsl:value-of select="concat('[',substring-before(substring-after(substring-after(substring-after($aName,'biaogeziranduan_'),'_'),'_'),'_'),']')"/>
				</xsl:if>/????????????<xsl:if test="substring-before(substring-after(substring-after(substring-after(substring-after($aName,'biaogeziranduan_'),'_'),'_'),'_'),'_')">
					<xsl:value-of select="concat('[',substring-before(substring-after(substring-after(substring-after(substring-after($aName,'biaogeziranduan_'),'_'),'_'),'_'),'_'),']')"/>
				</xsl:if>/?????????<xsl:if test="substring-after(substring-after(substring-after(substring-after(substring-after($aName,'biaogeziranduan_'),'_'),'_'),'_'),'_')">
					<xsl:value-of select="concat('[',substring-after(substring-after(substring-after(substring-after(substring-after($aName,'biaogeziranduan_'),'_'),'_'),'_'),'_'),']')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="starts-with($aName,'tu') or starts-with($aName,'b_picture') or starts-with($aName,'?????????')">/?????????/??????/??????<xsl:if test="substring-before(substring-after($aName,'tu_'),'_')">
					<xsl:value-of select="concat('[',substring-before(substring-after($aName,'tu_'),'_'),']')"/>
				</xsl:if>/???<xsl:if test="substring-after(substring-after($aName,'tu_'),'_')">
					<xsl:value-of select="concat('[',substring-after(substring-after($aName,'tu_'),'_'),']')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="starts-with($aName,'biaoxu')">?????????/??????/??????<xsl:if test="substring-before(substring-after($aName,'biaoxu_'),'_')">
					<xsl:value-of select="concat('[',substring-before(substring-after($aName,'biaoxu_'),'_'),']')"/>
				</xsl:if>/??????<xsl:if test="substring-after(substring-after($aName,'biaoxu_'),'_')">
					<xsl:value-of select="concat('[',substring-after(substring-after($aName,'biaoxu_'),'_'),']')"/>
				</xsl:if>/?????????/??????</xsl:when>
			<xsl:when test="starts-with($aName,'tuxu')">?????????/??????/??????<xsl:if test="substring-before(substring-after($aName,'tuxu_'),'_')">
					<xsl:value-of select="concat('[',substring-before(substring-after($aName,'tuxu_'),'_'),']')"/>
				</xsl:if>/???<xsl:if test="substring-after(substring-after($aName,'tuxu_'),'_')">
					<xsl:value-of select="concat('[',substring-after(substring-after($aName,'tuxu_'),'_'),']')"/>
				</xsl:if>/?????????/??????</xsl:when>
			<xsl:when test="starts-with($aName,'tutizhu')">?????????/??????/??????<xsl:if test="substring-before(substring-after($aName,'tutizhu_'),'_')">
					<xsl:value-of select="concat('[',substring-before(substring-after($aName,'tutizhu_'),'_'),']')"/>
				</xsl:if>/???<xsl:if test="substring-after(substring-after($aName,'tutizhu_'),'_')">
					<xsl:value-of select="concat('[',substring-after(substring-after($aName,'tutizhu_'),'_'),']')"/>
				</xsl:if>/?????????/??????</xsl:when>
			<xsl:when test="starts-with($aName,'fujianwenjianming') or starts-with($aName,'b_attach') or starts-with($aName,'??????')">/?????????/??????/??????<xsl:if test="substring-after($aName,'fujianwenjianming_')">
					<xsl:value-of select="concat('[',substring-after($aName,'fujianwenjianming_'),']')"/>
				</xsl:if>/?????????</xsl:when>
			<xsl:when test="starts-with($aName,'awenjiguanshuming') or starts-with($aName,'b_oName') or starts-with($aName,'??????????????????')">/?????????/??????/??????????????????/??????????????????<xsl:if test="substring-after($aName,'fawenjiguanshuming_')">
					<xsl:value-of select="concat('[',substring-after($aName,'fawenjiguanshuming_'),']')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="starts-with($aName,'fawenjiguanyinzhang') or starts-with($aName,'b_oSeal') or starts-with($aName,'??????????????????')">/?????????/??????/??????????????????/??????????????????<xsl:if test="substring-after($aName,'fawenjiguanyinzhang_')">
					<xsl:value-of select="concat('[',substring-after($aName,'fawenjiguanyinzhang_'),']')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="starts-with($aName,'qianfarenzhiwu') or starts-with($aName,'b_sTitle') or starts-with($aName,'???????????????')">/?????????/??????/??????????????????/???????????????<xsl:if test="substring-after($aName,'qianfarenzhiwu_')">
					<xsl:value-of select="concat('[',substring-after($aName,'qianfarenzhiwu_'),']')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="starts-with($aName,'qianfarenmingzhang') or starts-with($aName,'b_sSeal') or starts-with($aName,'???????????????')">/?????????/??????/??????????????????/???????????????<xsl:if test="substring-after($aName,'qianfarenmingzhang_')">
					<xsl:value-of select="concat('[',substring-after($aName,'qianfarenmingzhang_'),']')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$aName='chengwenriqi' or $aName='b_pDate' or $aName='????????????'">/?????????/??????/????????????</xsl:when>
			<xsl:when test="$aName='yinfachuandafanwei' or $aName='b_scope' or $aName='??????????????????'">/?????????/??????/??????????????????</xsl:when>
			<xsl:when test="$aName='fuzhu' or $aName='b_annotations' or $aName='??????'">/?????????/??????/??????</xsl:when>
			<!--end of body-->
			<xsl:when test="starts-with($aName,'cimu') or starts-with($aName,'e_subject') or starts-with($aName,'?????????')">/?????????/??????/?????????/??????<xsl:if test="substring-after($aName,'cimu_')">
					<xsl:value-of select="concat('[',substring-after($aName,'cimu_'),']')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="starts-with($aName,'chaosongjiguan') or starts-with($aName,'e_dOrg') or starts-with($aName,'????????????')">/?????????/??????/????????????<xsl:if test="substring-after($aName,'chaosongjiguan_')">
					<xsl:value-of select="concat('[',substring-after($aName,'chaosongjiguan_'),']')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="starts-with($aName,'chaosongleibie')">/?????????/??????/????????????/@????????????</xsl:when>
			<xsl:when test="starts-with($aName,'yinfajiguan') or starts-with($aName,'e_pOrg') or starts-with($aName,'????????????')">/?????????/??????/????????????/????????????<xsl:if test="substring-after($aName,'yinfajiguan_')">
					<xsl:value-of select="concat('[',substring-after($aName,'yinfajiguan_'),']')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="starts-with($aName,'yinfariqi') or starts-with($aName,'e_pDate') or starts-with($aName,'????????????')">/?????????/??????/????????????/????????????<xsl:if test="substring-after($aName,'yinfariqi_')">
					<xsl:value-of select="concat('[',substring-after($aName,'yinfariqi_'),']')"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$aName='yinfafenshu' or $aName='e_pCount' or $aName='????????????'">/?????????/??????/????????????/????????????</xsl:when>
			<!--end of layout-->
			<!--????????????????????????????-->
			<xsl:when test="starts-with($aName,'meishoukuozhanyaosu_')">?????????/??????/????????????<xsl:value-of select="substring-after($aName,'meishoukuozhanyaosu_')"/>
			</xsl:when>
			<xsl:when test="starts-with($aName,'zhutikuozhanyaosu_')">?????????/??????/????????????<xsl:value-of select="substring-after($aName,'zhutikuozhanyaosu_')"/>
			</xsl:when>
			<xsl:when test="starts-with($aName,'banjikuozhanyaosu_')">?????????/??????/????????????<xsl:value-of select="substring-after($aName,'banjikuozhanyaosu_')"/>
			</xsl:when>
			<xsl:otherwise>/?????????/[??????|??????|??????]/????????????/@????????????</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GetUsers">
		<xsl:if test="/office:document/office:body/office:text/text:tracked-changes//office:change-info/dc:creator or //office:annotation/@office:author or /office:document/office:body/office:text//office:annotation[not(contains(./dc:creator,'__@*Start@')) and not(contains(./dc:creator,'__@*End@'))]">
			<??????:?????????_B667>
				<xsl:for-each select="/office:document/office:body/office:text/text:tracked-changes/text:changed-region">
					<??????:??????_B668 ??????_41DC="{node()//office:change-info/dc:creator}" ?????????_4100="{generate-id()}"/>
				</xsl:for-each>
				<xsl:for-each select="//office:annotation[not(contains(./dc:creator,'__@*Start@')) and not(contains(./dc:creator,'__@*End@'))]">
					<??????:??????_B668>
						<xsl:attribute name="?????????_4100"><xsl:value-of select="generate-id()"/></xsl:attribute>
						<xsl:if test="dc:creator">
							<xsl:attribute name="??????_41DC"><xsl:value-of select="dc:creator"/></xsl:attribute>
						</xsl:if>
					</??????:??????_B668>
				</xsl:for-each>
			</??????:?????????_B667>
		</xsl:if>
	</xsl:template>
	<xsl:template name="GetTrackChanges">
		<xsl:if test="/office:document/office:body/office:text/text:tracked-changes/text:changed-region">
			<??????:???????????????_B60E>
				<xsl:for-each select="/office:document/office:body/office:text/text:tracked-changes/text:changed-region">
					<??????:????????????_B60F ??????_B611="{generate-id()}" ??????_B612="{node()//office:change-info/dc:date}" ?????????_B610="{@text:id}"/>
				</xsl:for-each>
			</??????:???????????????_B60E>
		</xsl:if>
	</xsl:template>
	<xsl:variable name="defect">
		<xsl:value-of select="/office:document/office:settings/config:config-item-set[@config:name='ooo:configuration-settings']/config:config-item[@config:name='CurrentDatabaseDataSource']"/>
	</xsl:variable>
	<xsl:template name="GetAnnotations">
		<xsl:if test="/office:document/office:body//office:annotation[not(contains(./dc:creator,'__@*Start@')) and not(contains(./dc:creator,'__@*End@'))]">
			<??????:?????????_B669>
				<xsl:for-each select="/office:document/office:body//office:annotation[not(contains(./dc:creator,'__@*Start@')) and not(contains(./dc:creator,'__@*End@'))]">
					<??????:??????_B66A>
						<xsl:attribute name="??????_41DD"><xsl:value-of select="generate-id()"/></xsl:attribute>
						<xsl:if test="string(dc:creator-initials) != ''">
							<xsl:attribute name="????????????_41DF"><xsl:value-of select="dc:creator-initials"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="dc:date">
							<xsl:attribute name="??????_41DE"><xsl:value-of select="dc:date"/></xsl:attribute>
						</xsl:if>
						<xsl:variable name="ID" select="generate-id(.)"/>
						<xsl:attribute name="????????????_41CE"><xsl:value-of select="concat('cmt', $ID)"/></xsl:attribute>
						<xsl:variable name="anthor">
							<xsl:value-of select="substring-before(substring-after($defect,'@'),'%')"/>
						</xsl:variable>
						<xsl:for-each select="./*">
							<xsl:choose>
								<xsl:when test="name()='text:p'">
									<xsl:apply-templates select="."/>
								</xsl:when>
								<xsl:when test="name()='text:list'">
									<xsl:call-template name="list-content">
										<xsl:with-param name="currlistlvl" select="number('1')"/>
										<xsl:with-param name="liststylename" select="@text:style-name"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise/>
							</xsl:choose>
						</xsl:for-each>
					</??????:??????_B66A>
				</xsl:for-each>
			</??????:?????????_B669>
		</xsl:if>
	</xsl:template>
	<xsl:template match="office:settings">
		<??????:????????????_B600>
			<!--<??????:????????????_B60B>
				<xsl:attribute name="????????????_B60C"><xsl:choose><xsl:when test="config:config-item-set[@config:name='ooo:configuration-settings']/config:config-item[@config:name='CharacterCompressionType']='1'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:attribute>
			</??????:????????????_B60B>-->
			<!--schema20101215??????????????????-->
			<!--<??????:?????????????????????????????????????????????_B60B>
				<xsl:choose><xsl:when test="config:config-item-set[@config:name='ooo:configuration-settings']/config:config-item[@config:name='CharacterCompressionType']='1'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>
			</??????:?????????????????????????????????????????????_B60B>-->
			<xsl:variable name="outview">
				<xsl:value-of select="substring-before(substring-after($defect,'#'),'@')"/>
			</xsl:variable>
			<??????:????????????_B601>
				<xsl:choose>
					<xsl:when test="not($outview='')">
						<xsl:value-of select="$outview"/>
					</xsl:when>
					<xsl:when test="config:config-item-set[@config:name='ooo:view-settings']/config:config-item[@config:name='InBrowseMode']='false'">page</xsl:when>
					<xsl:when test="config:config-item-set[@config:name='ooo:view-settings']/config:config-item[@config:name='InBrowseMode']='true'">web</xsl:when>
					<xsl:otherwise>page</xsl:otherwise>
				</xsl:choose>
			</??????:????????????_B601>
			<xsl:if test="config:config-item-set[@config:name='ooo:configuration-settings']/config:config-item[@config:name='IsKernAsianPunctuation']='false'">
				<??????:????????????_B606>none</??????:????????????_B606>
			</xsl:if>
			<xsl:if test="/office:document/office:styles/style:default-style[@style:family='paragraph']/style:paragraph-properties/@style:tab-stop-distance">
				<??????:?????????????????????_B604>
					<xsl:variable name="tabStopDistance" select="fun:Convert2uofUnit(/office:document/office:styles/style:default-style[@style:family='paragraph']/style:paragraph-properties/@style:tab-stop-distance)"/>
					<xsl:value-of select="string($tabStopDistance)"/>
				</??????:?????????????????????_B604>
			</xsl:if>
			<xsl:if test="config:config-item-set[@config:name='ooo:view-settings']/config:config-item-map-indexed[@config:name='Views']/config:config-item-map-entry/config:config-item[@config:name='ZoomFactor']">
				<??????:??????_B603>
					<xsl:value-of select="config:config-item-set[@config:name='ooo:view-settings']/config:config-item-map-indexed[@config:name='Views']/config:config-item-map-entry/config:config-item[@config:name='ZoomFactor']"/>
				</??????:??????_B603>
			</xsl:if>
			<??????:????????????_B605>
				<xsl:choose>
					<xsl:when test="/office:document/office:body/office:text/text:tracked-changes/@text:track-changes='false' or not(/office:document/office:body/office:text/text:tracked-changes)">false</xsl:when>
					<xsl:otherwise>true</xsl:otherwise>
				</xsl:choose>
			</??????:????????????_B605>
			<xsl:if test="config:config-item-set[@config:name='ooo:configuration-settings']/config:config-item-map-indexed[@config:name='ForbiddenCharacters']">
				<??????:????????????_B608>
					<??????:????????????_B609>
						<xsl:value-of select="config:config-item-set[@config:name='ooo:configuration-settings']/config:config-item-map-indexed[@config:name='ForbiddenCharacters']/config:config-item-map-entry/config:config-item[@config:name='BeginLine']"/>
					</??????:????????????_B609>
					<??????:????????????_B60A>
						<xsl:value-of select="config:config-item-set[@config:name='ooo:configuration-settings']/config:config-item-map-indexed[@config:name='ForbiddenCharacters']/config:config-item-map-entry/config:config-item[@config:name='EndLine']"/>
					</??????:????????????_B60A>
				</??????:????????????_B608>
				<xsl:if test="/office:document/office:styles/text:notes-configuration[@text:note-class='endnote']">
					<??????:????????????_B607>doc-end</??????:????????????_B607>
				</xsl:if>
			</xsl:if>
		</??????:????????????_B600>
	</xsl:template>
	<xsl:template name="FirstMasterPage">
		<xsl:param name="pos"/>
		<xsl:variable name="nodeName" select="name(/office:document/office:body/office:text/*[$pos])"/>
		<xsl:variable name="bsText">
			<xsl:choose>
				<xsl:when test="/office:document/office:body/office:text/*[$pos]/@text:style-name">
					<xsl:value-of select="/office:document/office:body/office:text/*[$pos]/@text:style-name"/>
				</xsl:when>
				<xsl:when test="/office:document/office:body/office:text/*[$pos]/@table:style-name">
					<xsl:value-of select="/office:document/office:body/office:text/*[$pos]/@table:style-name"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$nodeName = 'text:p' or $nodeName = 'table:table' or $nodeName = 'text:h'">
				<xsl:choose>
					<xsl:when test="not(/office:document/office:automatic-styles/style:style[@style:name=$bsText]/@style:master-page-name)">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$nodeName = 'text:section'">
				<xsl:variable name="bsSec" select="/office:document/office:body/office:text/*[$pos]/text:p[1]/@text:style-name"/>
				<xsl:choose>
					<xsl:when test="not(/office:document/office:automatic-styles/style:style[@style:name=$bsSec]/@style:master-page-name)">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$nodeName = 'text:list'">
				<xsl:variable name="bsSec" select="/office:document/office:body/office:text/*[$pos]/text:p[1]/@text:style-name"/>
				<xsl:choose>
					<xsl:when test="not(/office:document/office:automatic-styles/style:style[@style:name=$bsSec]/@style:master-page-name)">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="$nodeName != ''">
					<xsl:call-template name="FirstMasterPage">
						<xsl:with-param name="pos" select="$pos + 1"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="TextBody">
		<!--?????????????????????????????????????????????????????????????????????-->
		<!--<xsl:variable name="bsText" select="/office:document/office:body/office:text/text:sequence-decls/following-sibling::*[1]/@text:style-name"/>
				<xsl:variable name="bsTable" select="/office:document/office:body/office:text/text:sequence-decls/following-sibling::*[1]/@table:style-name"/>
				<xsl:variable name="bsText" select="/office:document/office:body/office:text/text:p[1]/@text:style-name"/>
				<xsl:variable name="bsTable" select="/office:document/office:body/office:text/text:table[1]/@table:style-name"/>
				<xsl:variable name="bsSection" select="/office:document/office:body/office:text/text:section[1]/text:p[1]/@text:style-name"/>-->
		<xsl:variable name="isFirstMasterPage">
			<xsl:call-template name="FirstMasterPage">
				<xsl:with-param name="pos" select="1"/>
			</xsl:call-template>
		</xsl:variable>
		<!--<xsl:if test="not(/office:document/office:automatic-styles/style:style[@style:name=$bsText]/@style:master-page-name) and not(/office:document/office:automatic-styles/style:style[@style:name=$bsTable]/@style:master-page-name) and not(/office:document/office:automatic-styles/style:style[@style:name=$bsSection]/@style:master-page-name) and ( name(/office:document/office:body/office:text/text:sequence-decls/following-sibling::*[1]) != 'text:list')">-->
		<xsl:if test="$isFirstMasterPage = 'true'">
			<xsl:for-each select="/office:document/office:master-styles/style:master-page[1]">
				<xsl:call-template name="text-page-layout">
					<xsl:with-param name="master-page" select="."/>
				</xsl:call-template>
			</xsl:for-each>
		</xsl:if>
		<xsl:for-each select="office:body/office:text">
			<xsl:call-template name="TextContent"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="sc-BookMarks">
		<xsl:if test="$documentType='spreadsheet'">
			<xsl:for-each select="/office:document/office:body/office:spreadsheet/table:named-expressions/table:named-range">
				<??????:??????_9105>
					<xsl:attribute name="??????_9103"><xsl:value-of select="@table:name"/></xsl:attribute>
					<??????:??????_9100>
						<xsl:attribute name="????????????_41CE"><xsl:call-template name="bookmaker"><xsl:with-param name="cellrangeaddress"><xsl:value-of select="@table:cell-range-address"/></xsl:with-param></xsl:call-template></xsl:attribute>
					</??????:??????_9100>
				</??????:??????_9105>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="bookmaker">
		<xsl:param name="cellrangeaddress"/>
		<xsl:choose>
			<xsl:when test="contains($cellrangeaddress,':.')">
				<xsl:variable name="string4">$</xsl:variable>
				<xsl:variable name="tablename">
					<xsl:variable name="fortablename" select="substring-before($cellrangeaddress,'.')"/>
					<xsl:choose>
						<xsl:when test="contains($fortablename,'$')">
							<xsl:value-of select="substring-after(substring-before($cellrangeaddress,'.'),'$')"/>
						</xsl:when>
						<xsl:when test="not(contains($fortablename,'$'))">
							<xsl:value-of select="substring-before($cellrangeaddress,'.')"/>
						</xsl:when>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="firstcolumn" select="substring-before(substring-after(substring-after($cellrangeaddress,'.'),'$'),'$')"/>
				<xsl:variable name="firstline" select="substring-after(substring-after(substring-before($cellrangeaddress,':.'),'.$'),'$')"/>
				<xsl:variable name="secondcolumn" select="substring-before(substring-after($cellrangeaddress,':.$'),'$')"/>
				<xsl:variable name="secondline" select="substring-after(substring-after($cellrangeaddress,':.$'),'$')"/>
				<xsl:variable name="string3">'</xsl:variable>
				<xsl:variable name="string1">
					<xsl:value-of select="'!$'"/>
				</xsl:variable>
				<xsl:variable name="string2">
					<xsl:value-of select="':$'"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$firstcolumn = $secondcolumn and $firstline = '1' and $secondline = '65536'">
						<xsl:value-of select="concat($string3,$tablename,$string3,'!$',$firstcolumn,':$',$firstcolumn)"/>
					</xsl:when>
					<xsl:when test="$secondcolumn = 'IV' and $firstline = $secondline">
						<xsl:value-of select="concat($string3,$tablename,$string3,'!$',$firstline,':$',$firstline)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($string3,$tablename,$string3,$string1,$firstcolumn,$string4,$firstline,$string2,$secondcolumn,$string4,$secondline)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="not(contains($cellrangeaddress,':.'))">
				<xsl:variable name="tablename" select="substring-before ($cellrangeaddress,'.')"/>
				<xsl:variable name="firstcolumn" select="substring-before (substring-after(substring-after($cellrangeaddress,'.'),'$'),'$')"/>
				<xsl:variable name="firstline" select="substring-after (substring-after(substring-after($cellrangeaddress,'.'),'$'),'$')"/>
				<xsl:variable name="string3">'</xsl:variable>
				<xsl:variable name="string1">
					<xsl:value-of select="'!$'"/>
				</xsl:variable>
				<xsl:variable name="string2">$</xsl:variable>
				<xsl:value-of select="concat ($string3,$tablename,$string3,$string1,$firstcolumn,$string2,$firstline)"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="SpreadsheetBody">
		<xsl:for-each select="office:body/office:spreadsheet/table:table">
			<xsl:apply-templates mode="table" select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="table:tracked-changes"/>
	<xsl:template match="table:data-pilot-tables"/>
	<xsl:template match="table:consolidation"/>
	<xsl:template match="table:dde-links"/>
	<xsl:template name="SpreadsheetCommonRule">
		<xsl:if test="/office:document/office:automatic-styles/style:style[@style:family='table-cell' and style:map]">
			<xsl:element name="??????:??????????????????_B618">
				<xsl:call-template name="create-condition-format"/>
			</xsl:element>
		</xsl:if>
		<xsl:element name="??????:??????RC??????_B634">
			<xsl:choose>
				<xsl:when test="$isRCCellAddress = 'true'">
					<xsl:value-of select="'true'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'false'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:if test="/office:document/office:settings/config:config-item-set/config:config-item-map-indexed/config:config-item-map-entry/config:config-item[@config:name='HasSheetTabs']">
			<xsl:element name="??????:???????????????????????????_B635">
				<xsl:value-of select="/office:document/office:settings/config:config-item-set/config:config-item-map-indexed/config:config-item-map-entry/config:config-item[@config:name='HasSheetTabs']"/>
			</xsl:element>
		</xsl:if>
		<xsl:element name="??????:???????????????????????????_B636">true</xsl:element>
		<xsl:element name="??????:???????????????????????????_B637">true</xsl:element>
		<!--uof2.0???????????????????????????????????????????????????-->
		<!--<xsl:if test="/office:document/office:settings/config:config-item-set/config:config-item/@config:name='AutoCalculate'">
			<xsl:element name="???:??????????????????">
				<xsl:attribute name="uof:locID">s0174</xsl:attribute>
				<xsl:attribute name="uof:attrList">???</xsl:attribute>
				<xsl:attribute name="???:???" select="/office:document/office:settings/config:config-item-set/config:config-item[@config:name='AutoCalculate']"/>
			</xsl:element>
			</xsl:if>-->
	</xsl:template>
	<xsl:template match="table:calculation-settings" mode="common">
		<xsl:if test="@table:precision-as-shown">
			<xsl:element name="??????:?????????????????????????????????_B613">
				<xsl:value-of select="@table:precision-as-shown"/>
			</xsl:element>
		</xsl:if>
		<xsl:element name="??????:????????????_B614">
			<xsl:choose>
				<xsl:when test="table:null-date/@table:date-value='1904-01-01'">1904</xsl:when>
				<xsl:when test="table:null-date/@table:date-value='1900-01-01'">iso8601</xsl:when>
				<xsl:otherwise>1899</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
		<xsl:if test="table:iteration/@table:status='enable'">
			<??????:????????????_B615>
				<xsl:attribute name="????????????_B616"><xsl:choose><xsl:when test="table:iteration/@table:steps"><xsl:value-of select="table:iteration/@table:steps"/></xsl:when><xsl:otherwise>100</xsl:otherwise><!--??????????????????--></xsl:choose></xsl:attribute>
				<xsl:attribute name="?????????_B617"><xsl:choose><xsl:when test="table:iteration/@table:maximum-difference"><xsl:value-of select="table:iteration/@table:maximum-difference"/></xsl:when><xsl:otherwise>0.001</xsl:otherwise><!--???????????????--></xsl:choose></xsl:attribute>
			</??????:????????????_B615>
		</xsl:if>
	</xsl:template>
	<xsl:template match="table:content-validations" mode="common">
		<xsl:element name="??????:??????????????????_B618">
			<xsl:call-template name="create-validation-set"/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="search-left-top-validation-inatable">
		<xsl:param name="row-num"/>
		<xsl:param name="firsttablerows"/>
		<xsl:param name="validation-name"/>
		<xsl:param name="return"/>
		<xsl:param name="currentRowCount"/>
		<!--??????????????????????????????-->
		<xsl:variable name="firstcells" select="$firsttablerows[position() = $currentRowCount]/table:table-cell"/>
		<xsl:variable name="first-left-top">
			<xsl:if test="not($currentRowCount &gt; count($firsttablerows))">
				<xsl:choose>
					<xsl:when test="$firsttablerows[position() = $currentRowCount]/table:table-cell[@table:content-validation-name = $validation-name]">
						<xsl:call-template name="search-left-top-validation-inarow">
							<xsl:with-param name="row-num" select="$row-num"/>
							<xsl:with-param name="column-num" select="number('1')"/>
							<xsl:with-param name="firstcells" select="$firstcells"/>
							<xsl:with-param name="validation-name" select="$validation-name"/>
							<xsl:with-param name="return" select="''"/>
							<xsl:with-param name="currentColumnCount" select="number('1')"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="search-left-top-validation-inatable">
							<xsl:with-param name="row-num">
								<xsl:choose>
									<xsl:when test="$firsttablerows[position() = $currentRowCount]/@table:number-rows-repeated">
										<xsl:value-of select="$row-num+ $firsttablerows[position() = $currentRowCount]/@table:number-rows-repeated"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="number($row-num) + 1"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>
							<xsl:with-param name="firsttablerows" select="$firsttablerows"/>
							<xsl:with-param name="validation-name" select="$validation-name"/>
							<xsl:with-param name="return" select="$return"/>
							<xsl:with-param name="currentRowCount" select="$currentRowCount + 1"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$first-left-top!=''">
				<xsl:value-of select="$first-left-top"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="search-left-top-validation-inarow">
		<xsl:param name="row-num"/>
		<xsl:param name="column-num"/>
		<xsl:param name="firstcells"/>
		<xsl:param name="validation-name"/>
		<xsl:param name="return"/>
		<xsl:param name="currentColumnCount"/>
		<xsl:variable name="cellsCount" select="count($firstcells[not(@table:number-columns-repeated)]) + sum($firstcells/@table:number-columns-repeated)"/>
		<xsl:variable name="first-left-top">
			<xsl:if test="not($column-num &gt; $cellsCount)">
				<xsl:choose>
					<xsl:when test="$firstcells[position() = $currentColumnCount][@table:content-validation-name = $validation-name]">
						<xsl:value-of select="concat($firstcells[position() = $currentColumnCount]/ancestor::table:table/@table:name,'.',$column-num,' ',$row-num)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="search-left-top-validation-inarow">
							<xsl:with-param name="row-num" select="$row-num"/>
							<xsl:with-param name="column-num">
								<xsl:choose>
									<xsl:when test="$firstcells[position() = $currentColumnCount]/@table:number-columns-repeated">
										<xsl:value-of select="number($column-num) + $firstcells[position() = $currentColumnCount]/@table:number-columns-repeated"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="number($column-num) + 1"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>
							<xsl:with-param name="firstcells" select="$firstcells"/>
							<xsl:with-param name="validation-name" select="$validation-name"/>
							<xsl:with-param name="return" select="$return"/>
							<xsl:with-param name="currentColumnCount" select="$currentColumnCount + 1"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$first-left-top!=''">
				<xsl:value-of select="$first-left-top"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$return"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="search-left-top-validation">
		<xsl:param name="validation-name"/>
		<xsl:param name="tableslist"/>
		<xsl:param name="return"/>
		<xsl:param name="tableNumber"/>
		<xsl:variable name="firsttablerows" select="$tableslist[position() = $tableNumber]/table:table-row"/>
		<xsl:variable name="first-left-top">
			<xsl:if test="not($tableNumber &gt; count($tableslist))">
				<xsl:choose>
					<xsl:when test="$tableslist[position() = $tableNumber]/table:table-row/table:table-cell[@table:content-validation-name = $validation-name]">
						<xsl:call-template name="search-left-top-validation-inatable">
							<xsl:with-param name="row-num" select="number('1')"/>
							<xsl:with-param name="firsttablerows" select="$firsttablerows"/>
							<xsl:with-param name="validation-name" select="$validation-name"/>
							<xsl:with-param name="return" select="''"/>
							<xsl:with-param name="currentRowCount" select="number('1')"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="search-left-top-validation">
							<xsl:with-param name="validation-name" select="$validation-name"/>
							<xsl:with-param name="tableslist" select="$tableslist"/>
							<xsl:with-param name="return" select="''"/>
							<xsl:with-param name="tableNumber" select="$tableNumber + 1"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$first-left-top != ''">
				<xsl:value-of select="$first-left-top"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$return"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="translate-left-top">
		<xsl:param name="left-top"/>
		<xsl:variable name="column-number" select="substring-before(substring-after($left-top,'.'),' ')"/>
		<xsl:variable name="column-number1" select="floor( number($column-number) div 26 )"/>
		<xsl:variable name="danyinhao">'</xsl:variable>
		<xsl:variable name="column-number2" select="number($column-number) mod 26"/>
		<xsl:variable name="column-character1">
			<xsl:call-template name="number-to-character">
				<xsl:with-param name="number" select="$column-number1"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="column-character2">
			<xsl:call-template name="number-to-character">
				<xsl:with-param name="number" select="$column-number2"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="concat($danyinhao,substring-before($left-top,'.'),$danyinhao,'!','$',$column-character1,$column-character2,'$',substring-after($left-top,' '))"/>
	</xsl:template>
	<xsl:template name="search-right-bottom-validation">
		<xsl:param name="validation-name"/>
		<xsl:param name="tablelist"/>
		<xsl:param name="tableNumber"/>
		<xsl:variable name="tableCount">
			<xsl:value-of select="count($tablelist)"/>
		</xsl:variable>
		<xsl:variable name="rowCount">
			<xsl:value-of select="count($tablelist[position() = $tableNumber]/table:table-row)"/>
		</xsl:variable>
		<xsl:if test="not($tableNumber &gt; $tableCount)">
			<xsl:choose>
				<xsl:when test="$tablelist[position() = $tableNumber]/table:table-row/table:table-cell[@table:content-validation-name = $validation-name]">
					<xsl:call-template name="search-right-bottom-validation-inRow">
						<xsl:with-param name="rowList" select="$tablelist[position() = $tableNumber]/table:table-row"/>
						<xsl:with-param name="rowCount" select="$rowCount"/>
						<xsl:with-param name="rowNumber" select="number('1')"/>
						<xsl:with-param name="currentRowPosition" select="number('1')"/>
						<xsl:with-param name="tableName" select="$tablelist[position() = $tableNumber]/@table:name"/>
						<xsl:with-param name="validation-name" select="$validation-name"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="search-right-bottom-validation">
						<xsl:with-param name="validation-name" select="$validation-name"/>
						<xsl:with-param name="tablelist" select="$tablelist"/>
						<xsl:with-param name="tableNumber" select="$tableNumber + 1"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="search-right-bottom-validation-inRow">
		<xsl:param name="rowList"/>
		<xsl:param name="rowCount"/>
		<xsl:param name="rowNumber"/>
		<xsl:param name="currentRowPosition"/>
		<xsl:param name="tableName"/>
		<xsl:param name="validation-name"/>
		<xsl:variable name="cellCount">
			<xsl:value-of select="count($rowList[position() = $currentRowPosition]/table:table-cell)"/>
		</xsl:variable>
		<xsl:if test="not($currentRowPosition &gt; $rowCount)">
			<xsl:choose>
				<xsl:when test="$rowList[position() = $currentRowPosition]/table:table-cell[@table:content-validation-name = $validation-name]  and not($rowList[position() &gt; $currentRowPosition]/table:table-cell[@table:content-validation-name = $validation-name])">
					<xsl:call-template name="search-right-bottom-validation-inCell">
						<xsl:with-param name="cellList" select="$rowList[position() = $currentRowPosition]/table:table-cell"/>
						<xsl:with-param name="cellCount" select="$cellCount"/>
						<xsl:with-param name="cellNumber" select="number('1')"/>
						<xsl:with-param name="rowNumber">
							<xsl:choose>
								<xsl:when test="$rowList[position() = $currentRowPosition]/@table:number-rows-repeated">
									<xsl:value-of select="$rowNumber + $rowList[position() = $currentRowPosition]/@table:number-rows-repeated - 1"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$rowNumber"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="currentCellPosition" select="number('1')"/>
						<xsl:with-param name="tableName" select="$tableName"/>
						<xsl:with-param name="validation-name" select="$validation-name"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="search-right-bottom-validation-inRow">
						<xsl:with-param name="rowList" select="$rowList"/>
						<xsl:with-param name="rowCount" select="$rowCount"/>
						<xsl:with-param name="rowNumber">
							<xsl:choose>
								<xsl:when test="$rowList[position() = $currentRowPosition]/@table:number-rows-repeated">
									<xsl:value-of select="$rowNumber + $rowList[position() = $currentRowPosition]/@table:number-rows-repeated"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$rowNumber + 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="currentRowPosition" select="$currentRowPosition + 1"/>
						<xsl:with-param name="tableName" select="$tableName"/>
						<xsl:with-param name="validation-name" select="$validation-name"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="search-right-bottom-validation-inCell">
		<xsl:param name="cellList"/>
		<xsl:param name="cellCount"/>
		<xsl:param name="cellNumber"/>
		<xsl:param name="rowNumber"/>
		<xsl:param name="currentCellPosition"/>
		<xsl:param name="tableName"/>
		<xsl:param name="validation-name"/>
		<xsl:if test="not($currentCellPosition &gt; $cellCount)">
			<xsl:choose>
				<xsl:when test="$cellList[position() = $currentCellPosition][@table:content-validation-name = $validation-name] and not($cellList[position() &gt; $currentCellPosition][@table:content-validation-name = $validation-name])">
					<xsl:variable name="columnResult">
						<xsl:choose>
							<xsl:when test="$cellList[position() = $currentCellPosition]/@table:number-columns-repeated">
								<xsl:value-of select="$cellNumber + $cellList[position() = $currentCellPosition]/@table:number-columns-repeated - 1"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$cellNumber"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:value-of select="concat($tableName,'.',$columnResult,' ',$rowNumber)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="search-right-bottom-validation-inCell">
						<xsl:with-param name="cellList" select="$cellList"/>
						<xsl:with-param name="cellCount" select="$cellCount"/>
						<xsl:with-param name="cellNumber">
							<xsl:choose>
								<xsl:when test="$cellList[position() = $currentCellPosition]/@table:number-columns-repeated">
									<xsl:value-of select="$cellNumber + $cellList[position() = $currentCellPosition]/@table:number-columns-repeated"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$cellNumber + 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="rowNumber" select="$rowNumber"/>
						<xsl:with-param name="currentCellPosition" select="$currentCellPosition + 1"/>
						<xsl:with-param name="tableName" select="$tableName"/>
						<xsl:with-param name="validation-name" select="$validation-name"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="create-help-error-message-content">
		<xsl:param name="text-p-set"/>
		<xsl:if test="$text-p-set">
			<xsl:value-of select="$text-p-set"/>
			<xsl:call-template name="create-help-error-message-content">
				<xsl:with-param name="text-p-set" select="$text-p-set[position()!=1]"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="validationList">
		<xsl:param name="sourceString"/>
		<xsl:variable name="quotes">"</xsl:variable>
		<xsl:variable name="temp1" select="substring-before($sourceString,';')"/>
		<xsl:variable name="temp2" select="substring-before(substring-after($temp1,$quotes),$quotes)"/>
		<xsl:variable name="isContinue" select="substring-after($sourceString,';')"/>
		<xsl:choose>
			<xsl:when test="$temp2!=''">
				<xsl:value-of select="$temp2"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring-before(substring-after($sourceString,$quotes),$quotes)"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="$isContinue !=''">
			<xsl:value-of select="','"/>
			<xsl:call-template name="validationList">
				<xsl:with-param name="sourceString" select="substring-after($sourceString,';')"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="create-validation-set">
		<xsl:for-each select="//table:content-validation">
			<xsl:element name="??????:???????????????_B619">
				<!--?????????????????????????????????-->
				<xsl:attribute name="???:name"><xsl:value-of select="@table:name"/></xsl:attribute>
				<xsl:variable name="conditiontext" select="@table:condition"/>
				<xsl:variable name="danyinhao">'</xsl:variable>
				<xsl:variable name="operatortext">
					<xsl:choose>
						<xsl:when test="contains($conditiontext,'and')">
							<xsl:value-of select="substring-after($conditiontext,'and ')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$conditiontext"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:element name="??????:?????????_B61A">
					<!--??????????????????-->
					<xsl:element name="??????:??????_B61B">
						<xsl:variable name="left-top">
							<xsl:call-template name="search-left-top-validation">
								<xsl:with-param name="validation-name" select="@table:name"/>
								<xsl:with-param name="tableslist" select="/office:document/office:body/office:spreadsheet/table:table"/>
								<xsl:with-param name="return" select="''"/>
								<xsl:with-param name="tableNumber" select="number('1')"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="after-translated-left-top">
							<xsl:call-template name="translate-left-top">
								<xsl:with-param name="left-top" select="$left-top"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="right-bottom">
							<xsl:call-template name="search-right-bottom-validation">
								<xsl:with-param name="validation-name" select="@table:name"/>
								<xsl:with-param name="tablelist" select="/office:document/office:body/office:spreadsheet/table:table"/>
								<xsl:with-param name="tableNumber" select="number('1')"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="after-translate-right-bottom">
							<xsl:call-template name="translate-left-top">
								<xsl:with-param name="left-top" select="$right-bottom"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="rest-right-bottom">
							<xsl:value-of select="substring-after($after-translate-right-bottom,'!')"/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$rest-right-bottom!='$$'">
								<xsl:value-of select="concat($after-translated-left-top,':',$rest-right-bottom)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$after-translated-left-top"/>
								<!--?????????????????????-->
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
				</xsl:element>
				<xsl:element name="??????:????????????_B61C">
					<xsl:variable name="listtest">cell-content-is-in-list("</xsl:variable>
					<xsl:choose>
						<xsl:when test="contains($conditiontext,'cell-content-is-whole-number()')">whole-number</xsl:when>
						<xsl:when test="contains($conditiontext,'cell-content-is-decimal-number()')">decimal</xsl:when>
						<xsl:when test="contains($conditiontext,'cell-content-is-date()')">date</xsl:when>
						<xsl:when test="contains($conditiontext,'cell-content-is-time()')">time</xsl:when>
						<xsl:when test="contains($conditiontext,'cell-content-is-in-list') and contains($conditiontext,$listtest)">list</xsl:when>
						<xsl:when test="contains($conditiontext,'cell-content-text-length')">text-length</xsl:when>
						<xsl:otherwise>any-value</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
				<xsl:if test="contains($operatortext,'cell-content()') or contains($conditiontext,'cell-content-text-length()') or contains($conditiontext,'is-between') or contains($conditiontext,'is-not-between')">
					<xsl:element name="??????:?????????_B61D">
						<xsl:choose>
							<xsl:when test="contains($operatortext,'cell-content()&lt;=') ">less-than-or-equal-to</xsl:when>
							<xsl:when test="contains($operatortext,'cell-content()&gt;=')">greater-than-or-equal-to</xsl:when>
							<xsl:when test="contains($operatortext,'cell-content()&lt;')">less-than</xsl:when>
							<xsl:when test="contains($operatortext,'cell-content()&gt;')">greater-than</xsl:when>
							<xsl:when test="contains($operatortext,'cell-content()!=')">not-equal-to</xsl:when>
							<xsl:when test="contains($operatortext,'cell-content()=')">equal-to</xsl:when>
							<xsl:when test="contains($conditiontext,'cell-content-text-length()')">
								<xsl:variable name="operator" select="substring-after($conditiontext,'cell-content-text-length()')"/>
								<xsl:choose>
									<xsl:when test="starts-with($operator,'&lt;=')">less-than-or-equal-to</xsl:when>
									<xsl:when test="starts-with($operator,'&gt;=')">greater-than-or-equal-to</xsl:when>
									<xsl:when test="starts-with($operator,'&lt;')">less-than</xsl:when>
									<xsl:when test="starts-with($operator,'&gt;')">greater-than</xsl:when>
									<xsl:when test="starts-with($operator,'!=')">not-equal-to</xsl:when>
									<xsl:when test="starts-with($operator,'=')">equal-to</xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="contains($conditiontext,'is-between')">between</xsl:when>
							<xsl:when test="contains($conditiontext,'is-not-between')">not-between</xsl:when>
						</xsl:choose>
					</xsl:element>
				</xsl:if>
				<xsl:element name="??????:???????????????_B61E">
					<xsl:choose>
						<xsl:when test="starts-with($operatortext,'cell-content-is-between') or contains($operatortext,'of:cell-content-text-length-is-between')">
							<xsl:choose>
								<xsl:when test="starts-with($operatortext,'cell-content-is-between')">
									<xsl:value-of select="substring-before(substring-after($operatortext,'cell-content-is-between('),',')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-before(substring-after($operatortext,'cell-content-text-length-is-between('),',')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="starts-with($operatortext,'cell-content-is-not-between')">
							<xsl:value-of select="substring-before(substring-after($operatortext,'cell-content-is-not-between('),',')"/>
						</xsl:when>
						<xsl:when test="contains($conditiontext,'cell-content-text-length()')">
							<xsl:variable name="operator" select="substring-after($conditiontext,'cell-content-text-length()')"/>
							<xsl:choose>
								<xsl:when test="starts-with($operator,'&lt;=')">
									<xsl:value-of select="substring-after($operator,'&lt;=')"/>
								</xsl:when>
								<xsl:when test="starts-with($operator,'&gt;=')">
									<xsl:value-of select="substring-after($operator,'&gt;=')"/>
								</xsl:when>
								<xsl:when test="starts-with($operator,'&lt;')">
									<xsl:value-of select="substring-after($operator,'&lt;')"/>
								</xsl:when>
								<xsl:when test="starts-with($operator,'&gt;')">
									<xsl:value-of select="substring-after($operator,'&gt;')"/>
								</xsl:when>
								<xsl:when test="starts-with($operator,'!=')">
									<xsl:value-of select="substring-after($operator,'!=')"/>
								</xsl:when>
								<xsl:when test="starts-with($operator,'=')">
									<xsl:value-of select="substring-after($operator,'=')"/>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="contains($conditiontext,'cell-content-is-in-list')">
							<xsl:call-template name="validationList">
								<xsl:with-param name="sourceString" select="substring-after(substring-before($conditiontext,')'),'(')"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="starts-with($conditiontext,'oooc:cell-content-text-length-is-not-between')">
							<xsl:value-of select="substring-before(substring-after($conditiontext,'oooc:cell-content-text-length-is-not-between('),',')"/>
						</xsl:when>
						<xsl:when test="starts-with($conditiontext,'oooc:cell-content-text-length-is-between')">
							<xsl:value-of select="substring-before(substring-after($conditiontext,'oooc:cell-content-text-length-is-between('),',')"/>
						</xsl:when>
						<xsl:when test="starts-with($operatortext,'cell-content()')">
							<xsl:variable name="operator" select="substring-after($conditiontext,'cell-content()')"/>
							<xsl:choose>
								<xsl:when test="starts-with($operator,'&lt;=')">
									<xsl:value-of select="substring-after($operator,'&lt;=')"/>
								</xsl:when>
								<xsl:when test="starts-with($operator,'&gt;=')">
									<xsl:value-of select="substring-after($operator,'&gt;=')"/>
								</xsl:when>
								<xsl:when test="starts-with($operator,'&lt;')">
									<xsl:value-of select="substring-after($operator,'&lt;')"/>
								</xsl:when>
								<xsl:when test="starts-with($operator,'&gt;')">
									<xsl:value-of select="substring-after($operator,'&gt;')"/>
								</xsl:when>
								<xsl:when test="starts-with($operator,'!=')">
									<xsl:value-of select="substring-after($operator,'!=')"/>
								</xsl:when>
								<xsl:when test="starts-with($operator,'=')">
									<xsl:value-of select="substring-after($operator,'=')"/>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
					</xsl:choose>
				</xsl:element>
				<xsl:if test="starts-with($operatortext,'cell-content-is-between') or starts-with($operatortext,'cell-content-is-not-between') or starts-with($operatortext,'of:cell-content-text-length-is-between')">
					<xsl:element name="??????:???????????????_B61F">
						<xsl:value-of select="substring-before(substring-after($operatortext,','),')')"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="starts-with($conditiontext,'oooc:cell-content-text-length-is-not-between') or starts-with($conditiontext,'oooc:cell-content-text-length-is-between')">
					<xsl:element name="??????:???????????????_B61F">
						<xsl:value-of select="substring-before(substring-after($conditiontext,','),')')"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="@table:allow-empty-cell">
					<xsl:element name="??????:??????????????????_B620">
						<xsl:value-of select="@table:allow-empty-cell"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="contains($conditiontext,'cell-content-is-in-list') ">
					<xsl:element name="??????:????????????????????????_B621">
						<xsl:variable name="listshow">
							<xsl:choose>
								<xsl:when test="@table:display-list='no'">
									<xsl:value-of select="'false'"/>
								</xsl:when>
								<xsl:otherwise>true</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:value-of select="$listshow"/>
					</xsl:element>
				</xsl:if>
				<xsl:if test="table:help-message">
					<xsl:element name="??????:????????????_B622">
						<xsl:if test="table:help-message/@table:display">
							<xsl:attribute name="????????????_B623"><xsl:value-of select="table:help-message/@table:display"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="table:help-message/@table:title">
							<xsl:attribute name="??????_B624"><xsl:value-of select="table:help-message/@table:title"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="table:help-message/text:p">
							<xsl:variable name="content">
								<xsl:call-template name="create-help-error-message-content">
									<xsl:with-param name="text-p-set" select="table:help-message/text:p"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:if test="$content">
								<xsl:attribute name="??????_B625"><xsl:value-of select="$content"/></xsl:attribute>
							</xsl:if>
						</xsl:if>
					</xsl:element>
				</xsl:if>
				<xsl:if test="table:error-message">
					<xsl:element name="??????:????????????_B626">
						<xsl:if test="table:error-message/@table:display">
							<xsl:attribute name="????????????_B623"><xsl:value-of select="table:error-message/@table:display"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="table:error-message/@table:message-type">
							<xsl:attribute name="??????_B627"><xsl:value-of select="table:error-message/@table:message-type"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="table:error-message/@table:title">
							<xsl:attribute name="??????_B624"><xsl:value-of select="table:error-message/@table:title"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="table:error-message/text:p">
							<xsl:variable name="content">
								<xsl:call-template name="create-help-error-message-content">
									<xsl:with-param name="text-p-set" select="table:error-message/text:p"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:if test="not($content='')">
								<xsl:attribute name="??????_B625"><xsl:value-of select="$content"/></xsl:attribute>
							</xsl:if>
						</xsl:if>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="create-condition-format">
		<xsl:variable name="unique-map-cellstyle" select="/office:document/office:automatic-styles/style:style[style:map and not(style:map/@style:condition=preceding-sibling::style:style/style:map/@style:condition and style:map/@style:apply-style-name=preceding-sibling::style:style/style:map/@style:apply-style-name and style:map/@style:base-cell-address=preceding-sibling::style:style/style:map/@style:base-cell-address)]"/>
		<xsl:for-each select="$unique-map-cellstyle">
			<!--xsl:if test="style:map"-->
			<xsl:element name="??????:???????????????_B629">
				<xsl:element name="??????:?????????_B61A">
					<xsl:element name="??????:??????_B62A">
						<xsl:variable name="left-top">
							<xsl:call-template name="search-left-top-condition-format">
								<xsl:with-param name="validation-name" select="@style:name"/>
								<xsl:with-param name="tableslist" select="/office:document/office:body/office:spreadsheet/table:table"/>
								<xsl:with-param name="return" select="''"/>
								<xsl:with-param name="tableNumber" select="number('1')"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="after-translated-left-top">
							<xsl:call-template name="translate-left-top">
								<xsl:with-param name="left-top" select="$left-top"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="right-bottom">
							<xsl:call-template name="search-right-bottom-condition-format">
								<xsl:with-param name="validation-name" select="@style:name"/>
								<xsl:with-param name="tablelist" select="/office:document/office:body/office:spreadsheet/table:table"/>
								<xsl:with-param name="tableNumber" select="number('1')"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="after-translate-right-bottom">
							<xsl:call-template name="translate-left-top">
								<xsl:with-param name="left-top" select="$right-bottom"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="rest-right-bottom">
							<xsl:value-of select="substring-after($after-translate-right-bottom,'!')"/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="$rest-right-bottom!='$$'">
								<xsl:value-of select="concat($after-translated-left-top,':',$rest-right-bottom)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$after-translated-left-top"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
				</xsl:element>
				<!--??????????????????????????????<xsl:call-template name="create-cell-condition-format"/>-->
			</xsl:element>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="create-cell-condition-format">
		<xsl:for-each select="style:map">
			<xsl:element name="??????:??????_B62B">
				<xsl:variable name="conditiontext" select="@style:condition"/>
				<xsl:attribute name="??????_B673"><xsl:choose><xsl:when test="contains($conditiontext,'cell-content')">cell-value</xsl:when><xsl:when test="contains($conditiontext,'is-true-formula')">formula</xsl:when><xsl:otherwise>?????????????????????!</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:if test="$conditiontext">
					<xsl:element name="??????:?????????_B62C">
						<xsl:choose>
							<xsl:when test="starts-with($conditiontext,'is-true-formula')">equal-to</xsl:when>
							<xsl:when test="starts-with($conditiontext,'cell-content()')">
								<xsl:variable name="operatortext" select="substring-after($conditiontext,'cell-content()')"/>
								<xsl:choose>
									<xsl:when test="starts-with($operatortext,'&lt;=')">less-than-or-equal-to</xsl:when>
									<xsl:when test="starts-with($operatortext,'&gt;=')">greater-than-or-equal-to</xsl:when>
									<xsl:when test="starts-with($operatortext,'&lt;')">less-than</xsl:when>
									<xsl:when test="starts-with($operatortext,'&gt;')">greater-than</xsl:when>
									<xsl:when test="starts-with($operatortext,'!=')">not-equal-to</xsl:when>
									<xsl:when test="starts-with($operatortext,'=')">equal-to</xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="starts-with($conditiontext,'cell-content-is-between')">between</xsl:when>
							<xsl:when test="starts-with($conditiontext,'cell-content-is-not-between')">not-between</xsl:when>
						</xsl:choose>
					</xsl:element>
				</xsl:if>
				<xsl:element name="??????:???????????????_B61E">
					<xsl:choose>
						<xsl:when test="starts-with($conditiontext,'is-true-formula')">
							<xsl:value-of select="substring(substring-after($conditiontext,'is-true-formula('),1,string-length($conditiontext)-1-string-length('is-true-formula('))"/>
						</xsl:when>
						<xsl:when test="starts-with($conditiontext,'cell-content-is-between')">
							<xsl:value-of select="substring-before(substring-after($conditiontext,'cell-content-is-between('),',')"/>
						</xsl:when>
						<xsl:when test="starts-with($conditiontext,'cell-content-is-not-between')">
							<xsl:value-of select="substring-before(substring-after($conditiontext,'cell-content-is-not-between('),',')"/>
						</xsl:when>
						<xsl:when test="starts-with($conditiontext,'cell-content()')">
							<xsl:variable name="operatortext" select="substring-after($conditiontext,'cell-content()')"/>
							<xsl:choose>
								<xsl:when test="starts-with($operatortext,'&lt;=')">
									<xsl:value-of select="substring-after($conditiontext,'&lt;=')"/>
								</xsl:when>
								<xsl:when test="starts-with($operatortext,'&gt;=')">
									<xsl:value-of select="substring-after($conditiontext,'&gt;=')"/>
								</xsl:when>
								<xsl:when test="starts-with($operatortext,'&lt;')">
									<xsl:value-of select="substring-after($conditiontext,'&lt;')"/>
								</xsl:when>
								<xsl:when test="starts-with($operatortext,'&gt;')">
									<xsl:value-of select="substring-after($conditiontext,'&gt;')"/>
								</xsl:when>
								<xsl:when test="starts-with($operatortext,'!=')">
									<xsl:value-of select="substring-after($conditiontext,'!=')"/>
								</xsl:when>
								<xsl:when test="starts-with($operatortext,'=')">
									<xsl:value-of select="substring-after($conditiontext,'=')"/>
								</xsl:when>
							</xsl:choose>
						</xsl:when>
					</xsl:choose>
				</xsl:element>
				<xsl:if test="starts-with($conditiontext,'cell-content-is-between') or starts-with($conditiontext,'cell-content-is-not-between')">
					<xsl:element name="??????:???????????????_B61F">
						<xsl:value-of select="substring(substring-after($conditiontext,','),1,string-length(substring-after($conditiontext,','))-1)"/>
					</xsl:element>
				</xsl:if>
				<xsl:element name="??????:??????_B62D">
					<xsl:variable name="apply-style-name" select="@style:apply-style-name"/>
					<xsl:attribute name="????????????_B62E"><xsl:value-of select="$apply-style-name"/></xsl:attribute>
				</xsl:element>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="search-left-top-condition-format">
		<xsl:param name="validation-name"/>
		<xsl:param name="tableslist"/>
		<xsl:param name="return"/>
		<xsl:param name="tableNumber"/>
		<xsl:variable name="firsttablerows" select="$tableslist[position() = $tableNumber]/table:table-row"/>
		<xsl:variable name="first-left-top">
			<xsl:if test="$tableNumber &lt; count($tableslist)">
				<xsl:choose>
					<xsl:when test="$tableslist[position() = $tableNumber]/table:table-row/table:table-cell[@table:style-name = $validation-name] or $tableslist[position() = $tableNumber]/table:table-column[@table:default-cell-style-name = $validation-name]">
						<!--<xsl:call-template name="search-left-top-condition-format-inatable">
							<xsl:with-param name="row-num" select="number('1')"/>
							<xsl:with-param name="firsttablerows" select="$firsttablerows"/>
							<xsl:with-param name="validation-name" select="$validation-name"/>
							<xsl:with-param name="return" select="''"/>
							<xsl:with-param name="currentRowCount" select="number('1')"/>
						</xsl:call-template>-->
						<xsl:variable name="ColumnNum">
							<xsl:for-each select="$tableslist[position() = $tableNumber]/table:table-row/table:table-cell[@table:style-name = $validation-name]">
								<xsl:variable name="nCount1" select="count(preceding-sibling::table:table-cell)"/>
								<xsl:variable name="nRepeatSum1" select="sum(preceding-sibling::table:table-cell[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
								<xsl:variable name="nRepeatCount1" select="count(preceding-sibling::table:table-cell[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
								<xsl:variable name="nCount2" select="count(preceding-sibling::table:covered-table-cell)"/>
								<xsl:variable name="nRepeatSum2" select="sum(preceding-sibling::table:covered-table-cell[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
								<xsl:variable name="nRepeatCount2" select="count(preceding-sibling::table:covered-table-cell[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
								<xsl:variable name="columnPos">
									<xsl:value-of select="number($nCount1 + $nRepeatSum1 - $nRepeatCount1 + $nCount2 + $nRepeatSum2 - $nRepeatCount2 + 1)"/>
								</xsl:variable>
								<xsl:value-of select="$columnPos"/>
							</xsl:for-each>
						</xsl:variable>
						<xsl:variable name="RowNum">
							<xsl:for-each select="$tableslist[position() = $tableNumber]/table:table-row[./table:table-cell/@table:style-name = $validation-name]">
								<xsl:variable name="nCount1" select="count(preceding-sibling::table:table-row)"/>
								<xsl:variable name="nRepeatSum1" select="sum(preceding-sibling::table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
								<xsl:variable name="nRepeatCount1" select="count(preceding-sibling::table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
								<xsl:variable name="nCount2" select="count(preceding-sibling::*//table:table-row[not(ancestor::office:chart)])"/>
								<xsl:variable name="nRepeatSum2" select="sum(preceding-sibling::*//table:table-row[@table:number-rows-repeated and not(ancestor::office:chart)]/@table:number-rows-repeated)"/>
								<xsl:variable name="nRepeatCount2" select="count(preceding-sibling::*//table:table-row[@table:number-rows-repeated and not(ancestor::office:chart)]/@table:number-rows-repeated)"/>
								<xsl:variable name="nCurPos">
									<xsl:value-of select="number($nCount1 + $nRepeatSum1 - $nRepeatCount1 + $nCount2 + $nRepeatSum2 - $nRepeatCount2)"/>
								</xsl:variable>
								<xsl:call-template name="RowNumber">
									<xsl:with-param name="result" select="$nCurPos"/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:variable>
						<xsl:variable name="TableName" select="$tableslist[position() = $tableNumber]/@table:name"/>
						<xsl:value-of select="concat($TableName,'.',$ColumnNum,' ',$RowNum)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="search-left-top-condition-format">
							<xsl:with-param name="validation-name" select="$validation-name"/>
							<xsl:with-param name="tableslist" select="$tableslist"/>
							<xsl:with-param name="return" select="''"/>
							<xsl:with-param name="tableNumber" select="$tableNumber + 1"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$first-left-top != ''">
				<xsl:value-of select="$first-left-top"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$return"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="search-left-top-condition-format-inatable">
		<xsl:param name="row-num"/>
		<xsl:param name="firsttablerows"/>
		<xsl:param name="validation-name"/>
		<xsl:param name="return"/>
		<xsl:param name="currentRowCount"/>
		<xsl:variable name="firstcells" select="$firsttablerows[position() = $currentRowCount]/table:table-cell"/>
		<xsl:variable name="first-left-top">
			<xsl:if test="not($currentRowCount &gt; count($firsttablerows))">
				<xsl:choose>
					<xsl:when test="$firsttablerows[position() = $currentRowCount]/table:table-cell[@table:style-name = $validation-name]">
						<xsl:call-template name="search-left-top-condition-format-inarow">
							<xsl:with-param name="row-num" select="$row-num"/>
							<xsl:with-param name="column-num" select="number('1')"/>
							<xsl:with-param name="firstcells" select="$firstcells"/>
							<xsl:with-param name="validation-name" select="$validation-name"/>
							<xsl:with-param name="return" select="''"/>
							<xsl:with-param name="currentColumnCount" select="number('1')"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="search-left-top-condition-format-inatable">
							<xsl:with-param name="row-num">
								<xsl:choose>
									<xsl:when test="$firsttablerows[position() = $currentRowCount]/@table:number-rows-repeated">
										<xsl:value-of select="$row-num+ $firsttablerows[position() = $currentRowCount]/@table:number-rows-repeated"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="number($row-num) + 1"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>
							<xsl:with-param name="firsttablerows" select="$firsttablerows"/>
							<xsl:with-param name="validation-name" select="$validation-name"/>
							<xsl:with-param name="return" select="$return"/>
							<xsl:with-param name="currentRowCount" select="$currentRowCount + 1"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$first-left-top!=''">
				<xsl:value-of select="$first-left-top"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="search-left-top-condition-format-inarow">
		<xsl:param name="row-num"/>
		<xsl:param name="column-num"/>
		<xsl:param name="firstcells"/>
		<xsl:param name="validation-name"/>
		<xsl:param name="return"/>
		<xsl:param name="currentColumnCount"/>
		<xsl:variable name="cellsCount" select="count($firstcells[not(@table:number-columns-repeated)]) + sum($firstcells/@table:number-columns-repeated)"/>
		<xsl:variable name="first-left-top">
			<xsl:if test="not($column-num &gt; $cellsCount)">
				<xsl:choose>
					<xsl:when test="$firstcells[position() = $currentColumnCount][@table:style-name = $validation-name]">
						<xsl:value-of select="concat($firstcells[position() = $currentColumnCount]/ancestor::table:table/@table:name,'.',$column-num,' ',$row-num)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="search-left-top-condition-format-inarow">
							<xsl:with-param name="row-num" select="$row-num"/>
							<xsl:with-param name="column-num">
								<xsl:choose>
									<xsl:when test="$firstcells[position() = $currentColumnCount]/@table:number-columns-repeated">
										<xsl:value-of select="number($column-num) + $firstcells[position() = $currentColumnCount]/@table:number-columns-repeated"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="number($column-num) + 1"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>
							<xsl:with-param name="firstcells" select="$firstcells"/>
							<xsl:with-param name="validation-name" select="$validation-name"/>
							<xsl:with-param name="return" select="$return"/>
							<xsl:with-param name="currentColumnCount" select="$currentColumnCount + 1"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$first-left-top!=''">
				<xsl:value-of select="$first-left-top"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$return"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="search-right-bottom-condition-format">
		<xsl:param name="validation-name"/>
		<xsl:param name="tablelist"/>
		<xsl:param name="tableNumber"/>
		<xsl:variable name="tableCount" select="count($tablelist)"/>
		<xsl:variable name="rowCount" select="count($tablelist[position() = $tableNumber]/table:table-row)"/>
		<xsl:if test="not($tableNumber &gt; $tableCount)">
			<xsl:choose>
				<!--<xsl:when test="$tablelist[position() = $tableNumber]/table:table-row/table:table-cell[@table:style-name = $validation-name]">
					<xsl:call-template name="search-right-bottom-condition-format-inRow">
						<xsl:with-param name="rowList" select="$tablelist[position() = $tableNumber]/table:table-row"/>
						<xsl:with-param name="rowCount" select="$rowCount"/>
						<xsl:with-param name="rowNumber" select="number('1')"/>
						<xsl:with-param name="currentRowPosition" select="number('1')"/>
						<xsl:with-param name="tableName" select="$tablelist[position() = $tableNumber]/@table:name"/>
						<xsl:with-param name="validation-name" select="$validation-name"/>
					</xsl:call-template>-->
				<xsl:when test="$tablelist[position() = $tableNumber]/table:table-row/table:table-cell[@table:style-name = $validation-name]">
					<xsl:variable name="count" select="count($tablelist[position() = $tableNumber]/table:table-row[./table:table-cell/@table:style-name = $validation-name])"/>
					<xsl:variable name="ColumnNum">
						<xsl:for-each select="$tablelist[position() = $tableNumber]/table:table-row/table:table-cell[@table:style-name = $validation-name][position() = $count]">
							<xsl:variable name="nCount1" select="count(preceding-sibling::table:table-cell)"/>
							<xsl:variable name="nRepeatSum1" select="sum(preceding-sibling::table:table-cell[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
							<xsl:variable name="nRepeatCount1" select="count(preceding-sibling::table:table-cell[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
							<xsl:variable name="nCount2" select="count(preceding-sibling::table:covered-table-cell)"/>
							<xsl:variable name="nRepeatSum2" select="sum(preceding-sibling::table:covered-table-cell[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
							<xsl:variable name="nRepeatCount2" select="count(preceding-sibling::table:covered-table-cell[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
							<xsl:variable name="columnPos">
								<xsl:value-of select="number($nCount1 + $nRepeatSum1 - $nRepeatCount1 + $nCount2 + $nRepeatSum2 - $nRepeatCount2 + 1)"/>
							</xsl:variable>
							<xsl:value-of select="$columnPos"/>
						</xsl:for-each>
					</xsl:variable>
					<xsl:variable name="RowNum">
						<xsl:for-each select="$tablelist[position() = $tableNumber]/table:table-row[./table:table-cell/@table:style-name = $validation-name][position() = $count]">
							<xsl:variable name="nCount1" select="count(preceding-sibling::table:table-row)"/>
							<xsl:variable name="nRepeatSum1" select="sum(preceding-sibling::table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
							<xsl:variable name="nRepeatCount1" select="count(preceding-sibling::table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
							<xsl:variable name="nCount2" select="count(preceding-sibling::*//table:table-row[not(ancestor::office:chart)])"/>
							<xsl:variable name="nRepeatSum2" select="sum(preceding-sibling::*//table:table-row[@table:number-rows-repeated and not(ancestor::office:chart)]/@table:number-rows-repeated)"/>
							<xsl:variable name="nRepeatCount2" select="count(preceding-sibling::*//table:table-row[@table:number-rows-repeated and not(ancestor::office:chart)]/@table:number-rows-repeated)"/>
							<xsl:variable name="nCurPos">
								<xsl:value-of select="number($nCount1 + $nRepeatSum1 - $nRepeatCount1 + $nCount2 + $nRepeatSum2 - $nRepeatCount2)"/>
							</xsl:variable>
							<xsl:call-template name="RowNumber">
								<xsl:with-param name="result" select="$nCurPos"/>
							</xsl:call-template>
						</xsl:for-each>
					</xsl:variable>
					<xsl:variable name="TableName" select="$tablelist[position() = $tableNumber]/@table:name"/>
					<xsl:value-of select="concat($TableName,'.',$ColumnNum,' ',$RowNum)"/>
					
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="search-right-bottom-condition-format">
						<xsl:with-param name="validation-name" select="$validation-name"/>
						<xsl:with-param name="tablelist" select="$tablelist"/>
						<xsl:with-param name="tableNumber" select="$tableNumber + 1"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="search-right-bottom-condition-format-inRow">
		<xsl:param name="rowList"/>
		<xsl:param name="rowCount"/>
		<xsl:param name="rowNumber"/>
		<xsl:param name="currentRowPosition"/>
		<xsl:param name="tableName"/>
		<xsl:param name="validation-name"/>
		<xsl:variable name="cellCount" select="count($rowList[position() = $currentRowPosition]/table:table-cell)"/>
		<xsl:if test="not($currentRowPosition &gt; $rowCount)">
			<xsl:choose>
				<xsl:when test="$rowList[position() = $currentRowPosition]/table:table-cell[@table:style-name = $validation-name]  and not($rowList[position() &gt; $currentRowPosition]/table:table-cell[@table:style-name = $validation-name])">
					<xsl:call-template name="search-right-bottom-condition-format-inCell">
						<xsl:with-param name="cellList" select="$rowList[position() = $currentRowPosition]/table:table-cell"/>
						<xsl:with-param name="cellCount" select="$cellCount"/>
						<xsl:with-param name="cellNumber" select="number('1')"/>
						<xsl:with-param name="rowNumber">
							<xsl:choose>
								<xsl:when test="$rowList[position() = $currentRowPosition]/@table:number-rows-repeated">
									<xsl:value-of select="$rowNumber + $rowList[position() = $currentRowPosition]/@table:number-rows-repeated - 1"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$rowNumber"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="currentCellPosition" select="number('1')"/>
						<xsl:with-param name="tableName" select="$tableName"/>
						<xsl:with-param name="validation-name" select="$validation-name"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="search-right-bottom-condition-format-inRow">
						<xsl:with-param name="rowList" select="$rowList"/>
						<xsl:with-param name="rowCount" select="$rowCount"/>
						<xsl:with-param name="rowNumber">
							<xsl:choose>
								<xsl:when test="$rowList[position() = $currentRowPosition]/@table:number-rows-repeated">
									<xsl:value-of select="$rowNumber + $rowList[position() = $currentRowPosition]/@table:number-rows-repeated"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$rowNumber + 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="currentRowPosition" select="$currentRowPosition + 1"/>
						<xsl:with-param name="tableName" select="$tableName"/>
						<xsl:with-param name="validation-name" select="$validation-name"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="search-right-bottom-condition-format-inCell">
		<xsl:param name="cellList"/>
		<xsl:param name="cellCount"/>
		<xsl:param name="cellNumber"/>
		<xsl:param name="rowNumber"/>
		<xsl:param name="currentCellPosition"/>
		<xsl:param name="tableName"/>
		<xsl:param name="validation-name"/>
		<xsl:if test="not($currentCellPosition &gt; $cellCount)">
			<xsl:choose>
				<xsl:when test="$cellList[position() = $currentCellPosition][@table:style-name = $validation-name] and not($cellList[position() &gt; $currentCellPosition][@table:style-name = $validation-name])">
					<xsl:variable name="columnResult">
						<xsl:choose>
							<xsl:when test="$cellList[position() = $currentCellPosition]/@table:number-columns-repeated">
								<xsl:value-of select="$cellNumber + $cellList[position() = $currentCellPosition]/@table:number-columns-repeated - 1"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$cellNumber"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:value-of select="concat($tableName,'.',$columnResult,' ',$rowNumber)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="search-right-bottom-condition-format-inCell">
						<xsl:with-param name="cellList" select="$cellList"/>
						<xsl:with-param name="cellCount" select="$cellCount"/>
						<xsl:with-param name="cellNumber">
							<xsl:choose>
								<xsl:when test="$cellList[position() = $currentCellPosition]/@table:number-columns-repeated">
									<xsl:value-of select="$cellNumber + $cellList[position() = $currentCellPosition]/@table:number-columns-repeated"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$cellNumber + 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
						<xsl:with-param name="rowNumber" select="$rowNumber"/>
						<xsl:with-param name="currentCellPosition" select="$currentCellPosition + 1"/>
						<xsl:with-param name="tableName" select="$tableName"/>
						<xsl:with-param name="validation-name" select="$validation-name"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="BorderLineAttr">
		<xsl:variable name="linetype" select="@draw:stroke-dash"/>
		<xsl:variable name="uoflinetype">
			<xsl:choose>
				<xsl:when test="@fo:border='none'">none</xsl:when>
				<xsl:when test="contains(@fo:border, 'double')">double</xsl:when>
				<xsl:when test="contains(@fo:border, 'solid')">single</xsl:when>
				<xsl:when test="not(@draw:stroke)">
					<xsl:choose>
						<xsl:when test="not(@svg:stroke-width)">single</xsl:when>
						<xsl:otherwise>single</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="@draw:stroke = 'none'">none</xsl:when>
						<xsl:when test="@draw:stroke = 'solid' ">single</xsl:when>
						<xsl:when test="not($linetype or @fo:border)">
							<xsl:variable name="mark" select="../@style:parent-style-name"/>
							<xsl:for-each select="ancestor::office:document[1]/office:styles/style:style[@style:name=$mark]">
								<xsl:choose>
									<xsl:when test="not(@fo:border)">none</xsl:when>
									<xsl:otherwise>single</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>single</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:attribute name="??????_C60D" select="$uoflinetype"/>
		<xsl:if test="not(@fo:border='none') and not(@draw:stroke = 'none')">
			<xsl:variable name="linedash">
				<xsl:choose>
					<xsl:when test="not(@draw:stroke-dash) or @draw:stroke='solid'">solid</xsl:when>
					<xsl:when test="$linetype='round-dot'">round-dot</xsl:when>
					<xsl:when test="$linetype='square-dot'">square-dot</xsl:when>
					<xsl:when test="$linetype='dash'">dash</xsl:when>
					<xsl:when test="$linetype='dash-dot'">dash-dot</xsl:when>
					<xsl:when test="$linetype='long-dash'">long-dash</xsl:when>
					<xsl:when test="$linetype='long-dash-dot'">long-dash-dot</xsl:when>
					<xsl:when test="$linetype='dash-dot-dot'">dash-dot-dot</xsl:when>
					<xsl:otherwise>dash</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:attribute name="??????_C60E" select="$linedash"/>
		</xsl:if>
		<xsl:if test="@svg:stroke-width">
			<xsl:attribute name="??????_C60F"><xsl:value-of select="fun:Convert2uofUnit(@svg:stroke-width)"/></xsl:attribute>
		</xsl:if>
		<!--?????? ??????_C610-->
		<xsl:if test="@svg:stroke-color">
			<xsl:attribute name="??????_C611"><xsl:value-of select="@svg:stroke-color"/></xsl:attribute>
		</xsl:if>
		<!--xsl:attribute name="???????????????_C611">false</xsl:attribute-->
	</xsl:template>
	<xsl:template name="Font_E70B">
		<xsl:if test="style:text-properties">
			<??????:??????_E70B>
				<xsl:call-template name="UOFTextStyle"/>
			</??????:??????_E70B>
		</xsl:if>
	</xsl:template>
	<xsl:template name="BorderLine_4226">
		<xsl:for-each select="style:graphic-properties[@draw:stroke-dash or @fo:border or @draw:stroke]">
			<??????:?????????_4226>
				<xsl:call-template name="BorderLineAttr"/>
			</??????:?????????_4226>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="Fill_E746">
		<xsl:for-each select="style:graphic-properties">
			<xsl:if test="@draw:fill or @draw:fill-color">
				<??????:??????_E746>
					<xsl:call-template name="???:??????-graph">
						<xsl:with-param name="graphproperty" select="."/>
					</xsl:call-template>
				</??????:??????_E746>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="Align_E726">
		<??????:??????_E726>
			<xsl:for-each select="style:chart-properties">
				<xsl:choose>
					<xsl:when test="@fo:text-align">
						<xsl:element name="??????:??????????????????_E700">
							<xsl:choose>
								<xsl:when test="@fo:text-align = 'center'">center</xsl:when>
								<xsl:when test="@fo:text-align = 'end'">right</xsl:when>
								<xsl:when test="@fo:text-align = 'justify'">justify</xsl:when>
								<xsl:when test="@fo:text-align = 'start' and ../../style:table-cell-properties[@style:repeat-content='true']">fill</xsl:when>
								<xsl:when test="@fo:text-align = 'start'">left</xsl:when>
								<xsl:otherwise>general</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
					</xsl:when>
				</xsl:choose>
				<xsl:if test="@style:vertical-align or @fo:vertical-align">
					<xsl:element name="??????:??????????????????_E701">
						<xsl:choose>
							<xsl:when test="@fo:vertical-align = 'top'">top</xsl:when>
							<xsl:when test="@fo:vertical-align = 'middle'">center</xsl:when>
							<xsl:when test="@fo:vertical-align = 'bottom'">bottom</xsl:when>
							<xsl:when test="@fo:vertical-align = 'justify'">justify</xsl:when>
							<xsl:when test="@fo:vertical-align = 'top'">top</xsl:when>
							<xsl:otherwise>distributed</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
				</xsl:if>
				<xsl:element name="??????:??????????????????_E703">
					<xsl:choose>
						<xsl:when test="@style:direction = 'ttb'">r2l-t2b-0e-90w</xsl:when>
						<xsl:otherwise>t2b-l2r-0e-0w</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
				<xsl:if test="@style:rotation-angle">
					<??????:??????????????????_E704>
						<xsl:value-of select="@style:rotation-angle"/>
					</??????:??????????????????_E704>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="style:paragraph-properties/@fo:margin-left">
				<??????:??????_E702>
					<xsl:value-of select="round(number(substring-before(style:paragraph-properties/@fo:margin-left,$uofUnit)))"/>
				</??????:??????_E702>
			</xsl:if>
			<??????:??????????????????_E705>true</??????:??????????????????_E705>
			<??????:????????????????????????_E706>true</??????:????????????????????????_E706>
		</??????:??????_E726>
	</xsl:template>
	<xsl:template name="Align_E730">
		<xsl:for-each select="style:chart-properties[@style:direction or @style:rotation-angle]">
			<??????:??????_E730>
				<xsl:if test="@style:direction">
					<??????:??????????????????_E703>
						<xsl:choose>
							<xsl:when test="@style:direction = 'ttb'">r2l-t2b-0e-90w</xsl:when>
							<xsl:otherwise>t2b-l2r-0e-0w</xsl:otherwise>
						</xsl:choose>
					</??????:??????????????????_E703>
				</xsl:if>
				<xsl:if test="@style:rotation-angle">
					<??????:??????????????????_E704>
						<xsl:value-of select="@style:rotation-angle"/>
					</??????:??????????????????_E704>
				</xsl:if>
				<!--???????????????-->
			</??????:??????_E730>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="number-to-character">
		<xsl:param name="number"/>
		<xsl:choose>
			<xsl:when test="$number =  0"/>
			<xsl:when test="$number =  1">A</xsl:when>
			<xsl:when test="$number =  2">B</xsl:when>
			<xsl:when test="$number =  3">C</xsl:when>
			<xsl:when test="$number =  4">D</xsl:when>
			<xsl:when test="$number =  5">E</xsl:when>
			<xsl:when test="$number =  6">F</xsl:when>
			<xsl:when test="$number =  7">G</xsl:when>
			<xsl:when test="$number =  8">H</xsl:when>
			<xsl:when test="$number =  9">I</xsl:when>
			<xsl:when test="$number = 10">J</xsl:when>
			<xsl:when test="$number = 11">K</xsl:when>
			<xsl:when test="$number = 12">L</xsl:when>
			<xsl:when test="$number = 13">M</xsl:when>
			<xsl:when test="$number = 14">N</xsl:when>
			<xsl:when test="$number = 15">O</xsl:when>
			<xsl:when test="$number = 16">P</xsl:when>
			<xsl:when test="$number = 17">Q</xsl:when>
			<xsl:when test="$number = 18">R</xsl:when>
			<xsl:when test="$number = 19">S</xsl:when>
			<xsl:when test="$number = 20">T</xsl:when>
			<xsl:when test="$number = 21">U</xsl:when>
			<xsl:when test="$number = 22">V</xsl:when>
			<xsl:when test="$number = 23">W</xsl:when>
			<xsl:when test="$number = 24">X</xsl:when>
			<xsl:when test="$number = 25">Y</xsl:when>
			<xsl:when test="$number = 26">Z</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="transform-data-area">
		<xsl:param name="data-area"/>
		<xsl:variable name="apos">'</xsl:variable>
		<!--xsl:variable name="apos1">
			<xsl:value-of select="concat(',', $apos)"/>
		</xsl:variable>
		<xsl:variable name="MidData1" select="translate($data-area, ' ', $apos1)"/>
		<xsl:variable name="apos">&apos;</xsl:variable>
		<xsl:variable name="apos2">
			<xsl:value-of select="concat($apos, '!')"/>
		</xsl:variable>
		<xsl:variable name="MidData2" select="translate($MidData1, '.', $apos2)"/>
		<xsl:variable name="MidData3" select="concat('=', $apos, $MidData2)"/>
		<xsl:value-of select="$MidData3"/-->
		<xsl:value-of select="'='"/>
		<xsl:analyze-string regex="{' '}" select="$data-area">
			<xsl:non-matching-substring>
				<xsl:analyze-string regex="{':'}" select=".">
					<xsl:non-matching-substring>
						<xsl:variable name="table-name">
							<xsl:if test="substring-before(.,'.')!=''">
								<xsl:value-of select="concat($apos,substring-before(.,'.'),$apos,'!')"/>
							</xsl:if>
						</xsl:variable>
						<xsl:value-of select="concat($table-name,substring-after(.,'.'))"/>
					</xsl:non-matching-substring>
					<xsl:matching-substring>
						<xsl:value-of select="."/>
					</xsl:matching-substring>
				</xsl:analyze-string>
			</xsl:non-matching-substring>
			<xsl:matching-substring>
				<xsl:value-of select="','"/>
			</xsl:matching-substring>
		</xsl:analyze-string>
	</xsl:template>
	<xsl:template name="??????:?????????_E743">
		<xsl:variable name="chart-style-name" select="@chart:style-name"/>
		<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$chart-style-name]">
			<xsl:call-template name="Font_E70B"/>
			<xsl:call-template name="BorderLine_4226"/>
			<xsl:call-template name="Fill_E746"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="chart:title">
		<??????:??????_E736>
			<!--??????????????????????????????????????????E7A0???E736-->
			<!--??? xsl:attribute name="??????_E742"></xsl:attribute-->
			<xsl:attribute name="??????_E742" select="text:p"/>
			<xsl:if test="@svg:x or @svg:y">
				<??????:??????_E70A>
					<xsl:if test="@svg:x">
						<xsl:attribute name="x_C606"><xsl:value-of select="fun:Convert2uofUnit(@svg:x)"/></xsl:attribute>
					</xsl:if>
					<xsl:if test="@svg:y">
						<xsl:attribute name="y_C607"><xsl:value-of select="fun:Convert2uofUnit(@svg:y)"/></xsl:attribute>
					</xsl:if>
				</??????:??????_E70A>
			</xsl:if>
			<xsl:variable name="title-style-name" select="@chart:style-name"/>
			<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$title-style-name]">
				<xsl:call-template name="Font_E70B"/>
				<xsl:call-template name="BorderLine_4226"/>
				<xsl:call-template name="Fill_E746"/>
				<xsl:call-template name="Align_E726"/>
			</xsl:for-each>
		</??????:??????_E736>
	</xsl:template>
	<xsl:template name="??????:???????????????">
		<xsl:param name="StyleName"/>
		<xsl:param name="SeriesName"/>
		<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$StyleName]">
			<xsl:call-template name="BorderLine_4226"/>
			<xsl:call-template name="Fill_E746"/>
			<xsl:for-each select="style:chart-properties">
				<xsl:call-template name="DataLabel_E752"/>
				<xsl:call-template name="DataSymbol_E70E"/>
			</xsl:for-each>
			<!-- ODF???????????? ???????????????????????? ?????????-->
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="???????????????">
		<xsl:param name="SeriesName"/>
		<xsl:param name="chart_repeated"/>
		<xsl:param name="data-series-position"/>
		<xsl:param name="data-point-position"/>
		<xsl:param name="repeat_number"/>
		<xsl:if test="$chart_repeated &gt;1">
			<??????:?????????_E756>
				<xsl:attribute name="???_E757"><xsl:value-of select="$data-point-position + $repeat_number"/></xsl:attribute>
				<xsl:call-template name="??????:???????????????">
					<xsl:with-param name="StyleName" select="@chart:style-name"/>
					<xsl:with-param name="SeriesName" select="$SeriesName"/>
				</xsl:call-template>
			</??????:?????????_E756>
			<xsl:call-template name="???????????????">
				<xsl:with-param name="SeriesName" select="$SeriesName"/>
				<xsl:with-param name="chart_repeated" select="$chart_repeated - 1"/>
				<xsl:with-param name="data-series-position" select="$data-series-position"/>
				<xsl:with-param name="data-point-position" select="$data-point-position"/>
				<xsl:with-param name="repeat_number" select="$repeat_number + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="chart:data-point">
		<xsl:param name="SeriesName"/>
		<xsl:param name="data-series-position"/>
		<xsl:variable name="data-point-position">
			<xsl:variable name="nCount" select="count(preceding-sibling::chart:data-point)"/>
			<xsl:variable name="nRepeatSum" select="sum(preceding-sibling::chart:data-point[@chart:repeated]/@chart:repeated)"/>
			<xsl:variable name="nRepeatCount" select="count(preceding-sibling::chart:data-point[@chart:repeated]/@chart:repeated)"/>
			<xsl:value-of select="number($nCount + $nRepeatSum - $nRepeatCount)"/>
		</xsl:variable>
		<??????:?????????_E756>
			<xsl:attribute name="???_E757"><xsl:value-of select="$data-point-position + 1"/></xsl:attribute>
			<xsl:call-template name="??????:???????????????">
				<xsl:with-param name="StyleName" select="@chart:style-name"/>
				<xsl:with-param name="SeriesName" select="$SeriesName"/>
			</xsl:call-template>
		</??????:?????????_E756>
		<xsl:if test="@chart:repeated &gt;1">
			<xsl:call-template name="???????????????">
				<xsl:with-param name="SeriesName" select="$SeriesName"/>
				<xsl:with-param name="chart_repeated" select="@chart:repeated"/>
				<xsl:with-param name="data-series-position" select="$data-series-position"/>
				<xsl:with-param name="data-point-position" select="$data-point-position"/>
				<xsl:with-param name="repeat_number" select="1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="??????:????????????_E74F_Attrs">
		<xsl:if test="@chart:label-cell-address">
			<xsl:variable name="cell-area">
				<xsl:variable name="data-area">
					<xsl:value-of select="@chart:label-cell-address"/>
				</xsl:variable>
				<xsl:call-template name="transform-data-area">
					<xsl:with-param name="data-area" select="$data-area"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:attribute name="??????_E774"><xsl:value-of select="$cell-area"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="@chart:values-cell-range-address">
			<xsl:variable name="cell-area">
				<xsl:variable name="data-area">
					<xsl:value-of select="@chart:values-cell-range-address"/>
				</xsl:variable>
				<xsl:call-template name="transform-data-area">
					<xsl:with-param name="data-area" select="$data-area"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:attribute name="???_E775"><xsl:value-of select="$cell-area"/></xsl:attribute>
		</xsl:if>
		<xsl:for-each select="../chart:axis[@chart:name='primary-x']/chart:categories">
			<xsl:variable name="cell-area">
				<xsl:variable name="data-area">
					<xsl:value-of select="@table:cell-range-address"/>
				</xsl:variable>
				<xsl:call-template name="transform-data-area">
					<xsl:with-param name="data-area" select="$data-area"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:attribute name="?????????_E776"><xsl:value-of select="$cell-area"/></xsl:attribute>
		</xsl:for-each>
		<xsl:variable name="chart-class" select="../../../chart:chart/@chart:class"/>
		<xsl:variable name="plot-area" select="../../chart:plot-area/@chart:style-name"/>
		<xsl:variable name="series-style-name" select="@chart:style-name"/>
		<xsl:variable name="plot-style" select="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$plot-area]/style:chart-properties"/>
		<xsl:variable name="chart-sub-class">
			<xsl:choose>
				<xsl:when test="$plot-style/@chart:vertical">
					<xsl:value-of select="$plot-style/@chart:vertical"/>
				</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="uofclass">
			<xsl:choose>
				<xsl:when test="$chart-class='chart:bar' and $chart-sub-class='true'">bar</xsl:when>
				<xsl:when test="$chart-class='chart:bar' and $chart-sub-class='false'">column</xsl:when>
				<xsl:when test="$chart-class='chart:line'">line</xsl:when>
				<xsl:when test="$chart-class='chart:circle' or $chart-class='chart:ring'">pie</xsl:when>
				<xsl:otherwise>column</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:attribute name="??????_E75D"><xsl:value-of select="$uofclass"/></xsl:attribute>
		<xsl:variable name="uofsubclass">
			<xsl:choose>
				<xsl:when test="$chart-class='chart:bar'">
					<xsl:choose>
						<xsl:when test="$plot-style/@chart:symbol-type='automatic'">clustered</xsl:when>
						<xsl:when test="$plot-style/@chart:percentage='true'">percent-stacked</xsl:when>
						<xsl:when test="$plot-style/@chart:stacked='true'">stacked</xsl:when>
						<xsl:when test="$plot-style/@chart:three-dimensional='true'">clustered-3d</xsl:when>
						<xsl:otherwise>clustered</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$chart-class='chart:circle'">
					<xsl:choose>
						<xsl:when test="$plot-style/@chart:three-dimensional='true'">
							<xsl:choose>
								<xsl:when test="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$series-style-name]/style:chart-properties/@chart:pie-offset">exploded-3d</xsl:when>
								<xsl:otherwise>standard-3d</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="not($plot-style/@chart:three-dimensional='true')">
							<xsl:choose>
								<xsl:when test="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$series-style-name]/style:chart-properties/@chart:pie-offset">exploded</xsl:when>
								<xsl:otherwise>standard</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$chart-class='chart:line'">
					<xsl:choose>
						<xsl:when test="$plot-style/@chart:percentage='true'">percent-stacked</xsl:when>
						<xsl:when test="$plot-style/@chart:stacked='true'">stacked</xsl:when>
						<!--UOF2.0 101215??????????????????????????????stacked-marker??????
							<xsl:when test="$plot-style/@chart:symbol-type='automatic'">clustered-marker</xsl:when-->
						<xsl:when test="$plot-style/@chart:symbol-type='automatic'">stacked-marker</xsl:when>
						<xsl:otherwise>clustered</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="$uofsubclass!=''">
			<xsl:attribute name="?????????_E777" select="$uofsubclass"/>
		</xsl:if>
		<xsl:attribute name="?????????_E778" select="generate-id(.)"/>
		<xsl:variable name="attached-axis-type">
			<xsl:variable name="attached-axis" select="@chart:attached-axis"/>
			<xsl:for-each select="../chart:axis[@chart:name=$attached-axis]">
				<xsl:choose>
					<xsl:when test="preceding-sibling::chart:axis[@chart:dimension=current()/@chart:dimension]">secondary</xsl:when>
					<xsl:otherwise>primary</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:if test="$attached-axis-type !=''">
			<xsl:attribute name="???????????????_E779" select="$attached-axis-type"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="DataLabel_E752">
		<xsl:if test="@chart:data-label-text|@chart:data-label-number|@chart:data-label-symbol">
			<??????:????????????_E752>
				<xsl:attribute name="?????????????????????_E715">true</xsl:attribute>
				<xsl:if test="@chart:data-label-text">
					<xsl:attribute name="?????????????????????_E716"><xsl:value-of select="@chart:data-label-text"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="@chart:data-label-number">
					<xsl:choose>
						<xsl:when test="@chart:data-label-number='value'">
							<xsl:attribute name="??????????????????_E717">true</xsl:attribute>
						</xsl:when>
						<xsl:when test="@chart:data-label-number='percentage'">
							<xsl:attribute name="?????????????????????_E718">true</xsl:attribute>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="@chart:data-label-symbol">
					<xsl:attribute name="????????????????????????_E719"><xsl:value-of select="@chart:data-label-symbol"/></xsl:attribute>
					<xsl:if test="chart:label-separator">
						<xsl:attribute name="?????????_E71A"><xsl:choose><xsl:when test="string(chart:label-separator/text:p) = ', '">1</xsl:when><xsl:when test="string(chart:label-separator/text:p) = '; '">2</xsl:when><xsl:when test="string(chart:label-separator/text:p) = '. '">3</xsl:when><xsl:otherwise>4</xsl:otherwise></xsl:choose></xsl:attribute>
					</xsl:if>
					<!--ODF???????????? @???????????? ??????????????????????????? ?????? ?????? ??????????????????-->
				</xsl:if>
			</??????:????????????_E752>
		</xsl:if>
	</xsl:template>
	<xsl:template name="DataSymbol_E70E">
		<xsl:if test="@chart:symbol-type|@chart:symbol-name|@chart:symbol-width|@chart:symbol-height">
			<??????:????????????_E70E>
				<xsl:if test="@chart:symbol-type!='none'">
					<xsl:variable name="symbol-type">
						<xsl:choose>
							<xsl:when test="@chart:symbol-name='arrow-up'">triangle</xsl:when>
							<xsl:when test="@chart:symbol-name='x'">square-cross</xsl:when>
							<xsl:when test="@chart:symbol-name='asterisk'">square-star</xsl:when>
							<xsl:when test="@chart:symbol-name='horizontal-bar'">line</xsl:when>
							<xsl:when test="@chart:symbol-name='plus'">line</xsl:when>
							<xsl:when test="@chart:symbol-name='square'or @chart:symbol-name='diamond' or @chart:symbol-name='circle'">
								<xsl:value-of select="@chart:symbol-name"/>
							</xsl:when>
							<xsl:otherwise>square</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:attribute name="??????_E70F" select="$symbol-type"/>
				</xsl:if>
				<xsl:choose>
					<!--???????????????????????????-->
					<xsl:when test="@chart:symbol-width='0.25cm'">
						<xsl:attribute name="??????_E712">7</xsl:attribute>
					</xsl:when>
				</xsl:choose>
			</??????:????????????_E70E>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FindSeriesName">
		<xsl:param name="Pos"/>
		<xsl:param name="series-generate"/>
		<xsl:for-each select="ancestor::chart:chart[1]/table:table">
			<xsl:choose>
				<xsl:when test="$series-generate = 'row'">
					<xsl:for-each select="table:table-rows/table:table-row[$Pos]/table:table-cell[1]">
						<xsl:value-of select="text:p"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="table:table-header-rows/table:table-row/table:table-cell[$Pos + 1]">
						<xsl:value-of select="text:p"/>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="chart:error-indicator">
		<xsl:param name="series-style-name"/>
		<xsl:variable name="indicator-style" select="@chart:style-name"/>
		<??????:?????????_E75A>
			<xsl:attribute name="??????_E75F" select="'Y'"/>
			<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles">
				<xsl:for-each select="style:style[@style:name=$series-style-name]">
					<xsl:for-each select="style:chart-properties">
						<xsl:choose>
							<xsl:when test="@chart:error-category='constant'">
								<xsl:attribute name="??????_E75D" select="'custom'"/>
								<!--UOF 2.0 ??? @??? ??? ????????????-->
								<xsl:attribute name="???_E75E" select="@chart:error-upper-limit"/>
							</xsl:when>
							<xsl:when test="@chart:error-category='percentage'">
								<xsl:attribute name="??????_E75D" select="'percentage'"/>
								<xsl:attribute name="???_E75E" select="@chart:error-percentage"/>
							</xsl:when>
							<xsl:when test="@chart:error-category='standard-deviation'">
								<xsl:attribute name="??????_E75D" select="'std-dev'"/>
							</xsl:when>
							<xsl:when test="@chart:error-category='standard-error'">
								<xsl:attribute name="??????_E75D" select="'srd-err'"/>
							</xsl:when>
						</xsl:choose>
						<xsl:variable name="display">
							<xsl:choose>
								<!--@chart:error-upper- @chart:error-lower- ????????????false-->
								<xsl:when test="@chart:error-upper-indicator='true' and @chart:error-lower-indicator='true'">both</xsl:when>
								<xsl:when test="@chart:error-upper-indicator='true'">positive</xsl:when>
								<xsl:when test="@chart:error-lower-indicator='true'">negtive</xsl:when>
								<xsl:otherwise>none</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:attribute name="????????????_E75C" select="$display"/>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="style:style[@style:name=$indicator-style]">
					<!-- 100520???UOF2.0?????? ??????->????????? -->
					<xsl:call-template name="BorderLine_4226"/>
				</xsl:for-each>
			</xsl:for-each>
		</??????:?????????_E75A>
	</xsl:template>
	<xsl:template match="chart:regression-curve">
		<xsl:param name="series-style-name"/>
		<xsl:variable name="curve-style" select="@chart:style-name"/>
		<??????:?????????_E763>
			<xsl:for-each select="chart:equation">
				<xsl:if test="@chart:display-r-square='false'">
					<xsl:attribute name="????????????R?????????_E771" select="'false'"/>
				</xsl:if>
				<xsl:if test="@chart:display-equation='false'">
					<xsl:attribute name="??????????????????_E770" select="'false'"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles">
				<xsl:for-each select="style:style[@style:name=$series-style-name]">
					<xsl:for-each select="style:chart-properties">
						<xsl:if test="@chart:regression-type">
							<xsl:variable name="regression-type">
								<xsl:choose>
									<xsl:when test="@chart:regression-type='none'">moving-average</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="@chart:regression-type"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:attribute name="??????_E76C" select="$regression-type"/>
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="style:style[@style:name=$curve-style]">
					<!-- 100520???UOF2.0?????? ??????->????????? -->
					<xsl:call-template name="BorderLine_4226"/>
				</xsl:for-each>
			</xsl:for-each>
			<!--ODF???????????????@ ??? ?????? ?????? ?????????????????? ??????????????????????????????-->
		</??????:?????????_E763>
	</xsl:template>
	<xsl:template match="chart:series">
		<xsl:param name="series-generate"/>
		<??????:????????????_E74F>
			<xsl:call-template name="??????:????????????_E74F_Attrs"/>
			<xsl:variable name="series-style-name" select="@chart:style-name"/>
			<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$series-style-name]">
				<xsl:call-template name="BorderLine_4226"/>
				<!--UOF 2.0 ????????????????????? 751 ?????????746-->
				<xsl:call-template name="Fill_E746"/>
				<xsl:for-each select="style:chart-properties">
					<xsl:call-template name="DataLabel_E752"/>
					<xsl:call-template name="DataSymbol_E70E"/>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:if test="chart:data-point">
				<??????:????????????_E755>
					<xsl:variable name="data-series-position">
						<xsl:value-of select="position()"/>
					</xsl:variable>
					<xsl:variable name="SeriesName">
						<xsl:call-template name="FindSeriesName">
							<xsl:with-param name="Pos" select="$data-series-position"/>
							<xsl:with-param name="series-generate" select="$series-generate"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:apply-templates select="chart:data-point">
						<xsl:with-param name="SeriesName" select="$SeriesName"/>
						<xsl:with-param name="data-series-position" select="$data-series-position"/>
					</xsl:apply-templates>
				</??????:????????????_E755>
			</xsl:if>
			<xsl:if test="chart:error-indicator">
				<??????:????????????_E759>
					<xsl:apply-templates select="chart:error-indicator">
						<xsl:with-param name="series-style-name" select="$series-style-name"/>
					</xsl:apply-templates>
				</??????:????????????_E759>
			</xsl:if>
			<xsl:if test="chart:regression-curve">
				<??????:????????????_E762>
					<xsl:apply-templates select="chart:regression-curve">
						<xsl:with-param name="series-style-name" select="$series-style-name"/>
					</xsl:apply-templates>
				</??????:????????????_E762>
			</xsl:if>
			<!--ODF???????????? ?????????-->
		</??????:????????????_E74F>
	</xsl:template>
	<!--xsl:template name="??????:??????_E479">
		<??????:??????_E479>
			<!- comment changed from anhongyun 20081222->
			<xsl:if test="office:body/office:chart/chart:chart/chart:legend/@chart:legend-position">
				<xsl:variable name="position">
					<xsl:variable name="legend-position" select="office:body/office:chart/chart:chart/chart:legend/@chart:legend-position"/>
					<xsl:choose>
						<xsl:when test="$legend-position='start'">left</xsl:when>
						<xsl:when test="$legend-position='end'">
							<xsl:choose>
								<xsl:when test="number(substring-before(office:body/office:chart/chart:chart/chart:plot-area/@svg:y,'cm')) - number(substring-before(office:body/office:chart/chart:chart/chart:legend/@svg:y,'cm')) &gt;1.7">corner</xsl:when>
								<xsl:otherwise>right</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$legend-position='top'">top</xsl:when>
						<xsl:when test="$legend-position='bottom'">bottom</xsl:when>
						<xsl:when test="$legend-position='top-end'">corner</xsl:when>
						<xsl:otherwise>right</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:attribute name="??????:??????"><xsl:value-of select="$position"/></xsl:attribute>
			</xsl:if>
			<!- comment end anhongyun 20081222->
			<xsl:attribute name="??????:x??????"><xsl:value-of select="fun:Convert2uofUnit(office:body/office:chart/chart:chart/chart:legend/@svg:x)"/></xsl:attribute>
			<xsl:attribute name="??????:y??????"><xsl:value-of select="fun:Convert2uofUnit(office:body/office:chart/chart:chart/chart:legend/@svg:y)"/></xsl:attribute>
			<xsl:variable name="legend">
				<xsl:value-of select="office:body/office:chart/chart:chart/chart:legend/@chart:style-name"/>
			</xsl:variable>
			<xsl:for-each select="office:automatic-styles/style:style[@style:name=$legend]">
				<xsl:call-template name="Font_E70B"/>
				<xsl:call-template name="BorderLine_4226"/>
				<xsl:call-template name="Fill_E746"/>
				<xsl:call-template name="Align_E726"/>
			</xsl:for-each>
		</??????:??????_E479>
	</xsl:template-->
	<xsl:template name="??????:??????_E70D">
		<??????:??????_E70D>
			<xsl:attribute name="??????????????????_E73E"><xsl:choose><xsl:when test="@chart:link-data-style-to-source!=''"><xsl:value-of select="@chart:link-data-style-to-source"/></xsl:when><xsl:otherwise>true</xsl:otherwise></xsl:choose></xsl:attribute>
			<xsl:if test="@style:data-style-name">
				<xsl:call-template name="NumberFormat"/>
			</xsl:if>
		</??????:??????_E70D>
	</xsl:template>
	<xsl:template name="??????:??????_E71D">
		<xsl:param name="v-axis-style-name"/>
		<??????:??????_E71D>
			<??????:?????????_E71E>
				<xsl:choose>
					<xsl:when test="@chart:minimum">
						<xsl:attribute name="????????????_E71F" select="'false'"/>
						<xsl:value-of select="@chart:minimum"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="????????????_E71F" select="'true'"/>
					</xsl:otherwise>
				</xsl:choose>
			</??????:?????????_E71E>
			<??????:?????????_E720>
				<xsl:choose>
					<xsl:when test="@chart:maximum">
						<xsl:attribute name="????????????_E71F" select="'false'"/>
						<xsl:value-of select="@chart:maximum"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="????????????_E71F" select="'true'"/>
					</xsl:otherwise>
				</xsl:choose>
			</??????:?????????_E720>
			<xsl:choose>
				<xsl:when test="@chart:interval-major">
					<??????:?????????_E721>
						<xsl:attribute name="????????????_E71F" select="'false'"/>
						<xsl:value-of select="@chart:interval-major"/>
					</??????:?????????_E721>
					<??????:?????????_E722>
						<xsl:choose>
							<xsl:when test="@chart:interval-minor-divisor and not(@chart:interval-minor-divisor='0')">
								<xsl:attribute name="????????????_E71F" select="'false'"/>
								<xsl:value-of select="number(@chart:interval-major) div number(@chart:interval-minor-divisor)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="????????????_E71F" select="'true'"/>
							</xsl:otherwise>
						</xsl:choose>
					</??????:?????????_E722>
				</xsl:when>
				<xsl:otherwise>
					<??????:?????????_E721>
						<xsl:attribute name="????????????_E71F" select="'true'"/>
					</??????:?????????_E721>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:variable name="axisPositon" select="../../style:style[@style:name=$v-axis-style-name]/style:chart-properties/@chart:axis-position"/>
			<!--20110107????????? ??????:?????????_E723>
				<xsl:choose>
					<xsl:when test="$axisPositon">
						<xsl:attribute name="????????????_E71F" select="'false'"/>
						<xsl:value-of select="$axisPositon"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="????????????_E71F" select="'true'"/>
					</xsl:otherwise>
				</xsl:choose>
			</???:?????????_E723-->
			<??????:?????????_E723>
				<xsl:choose>
					<xsl:when test="@chart:axis-position !=''">
						<xsl:attribute name="????????????_E71F" select="'false'"/>
						<xsl:value-of select="@chart:axis-position"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="????????????_E71F" select="'true'"/>
					</xsl:otherwise>
				</xsl:choose>
			</??????:?????????_E723>
			<!--?????? ???:????????????_E724 ODF????????????-->
			<xsl:if test="@chart:logarithmic='true' or @chart:logarithmic='1'">
				<??????:???????????????????????????_E729>true</??????:???????????????????????????_E729>
			</xsl:if>
			<xsl:if test="@chart:reverse-direction='true' or @chart:reverse-direction='1'">
				<??????:??????????????????_E72B>true</??????:??????????????????_E72B>
			</xsl:if>
			<!--?????? UOF1.1???????????????????????????????????????????????? ??????????????? ??????????????? ???????????? ~-->
			<!--?????? UOF2.0????????? ???????????????????????? ????????????????????????????????????-->
		</??????:??????_E71D>
	</xsl:template>
	<xsl:template match="chart:grid">
		<??????:?????????_E734>
			<xsl:attribute name="??????_E735" select="@chart:class"/>
			<xsl:variable name="grid-style-name" select="@chart:style-name"/>
			<xsl:for-each select="ancestor::office:document/office:automatic-styles/style:style[@style:name=$grid-style-name]/style:graphic-properties">
				<xsl:call-template name="BorderLineAttr"/>
			</xsl:for-each>
		</??????:?????????_E734>
	</xsl:template>
	<xsl:template match="chart:axis">
		<xsl:param name="v-axis-style-name"/>
		<??????:?????????_E791>
			<xsl:variable name="dimension" select="@chart:dimension"/>
			<xsl:variable name="axisPrimaryType">
				<xsl:choose>
					<xsl:when test="preceding-sibling::chart:axis[@chart:dimension=$dimension]">secondary</xsl:when>
					<xsl:otherwise>primary</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="axisSecondaryType">
				<xsl:choose>
					<!--uof2.0???????????????series(?????????),date(?????????)?????????????????????-->
					<xsl:when test="@chart:dimension='x'">category</xsl:when>
					<xsl:when test="@chart:dimension='y'">value</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="axis-style-name" select="@chart:style-name"/>
			<xsl:attribute name="?????????_E792"><xsl:value-of select="$axisPrimaryType"/></xsl:attribute>
			<xsl:attribute name="?????????_E793"><xsl:value-of select="$axisSecondaryType"/></xsl:attribute>
			<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$axis-style-name]">
				<xsl:for-each select="style:chart-properties">
					<xsl:attribute name="???????????????_E737"><xsl:choose><xsl:when test="@chart:tick-marks-major-inner='true' and @chart:tick-marks-major-outer='true'">cross</xsl:when><xsl:when test="@chart:tick-marks-major-inner='true'">inside</xsl:when><xsl:when test="@chart:tick-marks-major-outer='true'">outside</xsl:when><xsl:otherwise>none</xsl:otherwise></xsl:choose></xsl:attribute>
					<xsl:attribute name="???????????????_E738"><xsl:choose><xsl:when test="@chart:tick-marks-minor-inner='true' and @chart:tick-marks-minor-outer='true'">cross</xsl:when><xsl:when test="@chart:tick-marks-minor-inner='true'">inside</xsl:when><xsl:when test="@chart:tick-marks-minor-outer='true'">outside</xsl:when><xsl:otherwise>none</xsl:otherwise></xsl:choose></xsl:attribute>
					<xsl:attribute name="???????????????_E739"><xsl:choose><xsl:when test="not(@chart:display-label='true')">none</xsl:when><xsl:otherwise><xsl:choose><xsl:when test="@chart:axis-label-position='outside-maximum'">inside</xsl:when><xsl:when test="@chart:axis-label-position='outside-minimum'">outside</xsl:when><xsl:otherwise>next-to-axis</xsl:otherwise></xsl:choose></xsl:otherwise></xsl:choose></xsl:attribute>
					<xsl:call-template name="??????:??????_E70D"/>
					<xsl:call-template name="??????:??????_E71D">
						<xsl:with-param name="v-axis-style-name" select="$v-axis-style-name"/>
					</xsl:call-template>
				</xsl:for-each>
				<xsl:call-template name="Font_E70B"/>
				<xsl:call-template name="BorderLine_4226"/>
				<xsl:call-template name="Align_E730"/>
			</xsl:for-each>
			<xsl:if test="chart:grid">
				<??????:????????????_E733>
					<xsl:apply-templates select="chart:grid"/>
				</??????:????????????_E733>
			</xsl:if>
			<xsl:apply-templates select="chart:title"/>
		</??????:?????????_E791>
	</xsl:template>
	<xsl:template name="FindTableName">
		<xsl:for-each select="..">
			<xsl:choose>
				<xsl:when test="name(.) = 'table:table'">
					<xsl:value-of select="@table:name"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="FindTableName"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="chart:plot-area">
		<??????:?????????_E747>
			<??????:??????_E70A>
				<xsl:attribute name="x_C606"><xsl:value-of select="fun:Convert2uofUnit(@svg:x)"/></xsl:attribute>
				<xsl:attribute name="y_C607"><xsl:value-of select="fun:Convert2uofUnit(@svg:y)"/></xsl:attribute>
			</??????:??????_E70A>
			<??????:??????_E748>
				<xsl:attribute name="???_C605"><xsl:value-of select="fun:Convert2uofUnit(@svg:width)"/></xsl:attribute>
				<xsl:attribute name="???_C604"><xsl:value-of select="fun:Convert2uofUnit(@svg:height)"/></xsl:attribute>
			</??????:??????_E748>
			<??????:????????????_E74B>
				<xsl:variable name="data-area">
					<xsl:value-of select="@table:cell-range-address"/>
				</xsl:variable>
				<xsl:call-template name="transform-data-area">
					<xsl:with-param name="data-area" select="$data-area"/>
				</xsl:call-template>
			</??????:????????????_E74B>
			<xsl:variable name="plotAreaChartWall" select="chart:wall/@chart:style-name"/>
			<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$plotAreaChartWall]">
				<xsl:call-template name="BorderLine_4226"/>
				<xsl:call-template name="Fill_E746"/>
			</xsl:for-each>
			<xsl:variable name="plot-area">
				<xsl:value-of select="@chart:style-name"/>
			</xsl:variable>
			<xsl:variable name="series-generate">
				<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$plot-area]">
					<xsl:choose>
						<xsl:when test="style:chart-properties/@chart:series-source='columns'">col</xsl:when>
						<xsl:when test="style:chart-properties/@chart:series-source='rows'">row</xsl:when>
						<xsl:otherwise>col</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:variable>
			<??????:????????????_E74A>
				<xsl:value-of select="$series-generate"/>
			</??????:????????????_E74A>
			<??????:??????????????????_E74C>
				<??????:???_E74D>
					<xsl:if test="chart:series">
						<??????:???????????????_E74E>
							<xsl:apply-templates select="chart:series">
								<xsl:with-param name="series-generate" select="$series-generate"/>
							</xsl:apply-templates>
						</??????:???????????????_E74E>
					</xsl:if>
					<!--?????? ???????????????-->
					<xsl:for-each select="chart:stock-loss-marker">
						<??????:?????????_E77E>
							<xsl:variable name="loss-style" select="@chart:style-name"/>
							<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$loss-style]">
								<xsl:call-template name="BorderLine_4226"/>
								<xsl:call-template name="Fill_E746"/>
							</xsl:for-each>
						</??????:?????????_E77E>
					</xsl:for-each>
					<xsl:for-each select="chart:stock-gain-marker">
						<??????:?????????_E780>
							<xsl:variable name="gain-style" select="@chart:style-name"/>
							<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$gain-style]">
								<xsl:call-template name="BorderLine_4226"/>
								<xsl:call-template name="Fill_E746"/>
							</xsl:for-each>
						</??????:?????????_E780>
					</xsl:for-each>
				</??????:???_E74D>
			</??????:??????????????????_E74C>
			<xsl:if test="chart:axis">
				<??????:????????????_E790>
					<xsl:variable name="axises">
						<x>
							<xsl:for-each select="chart:axis[@chart:dimension='x']">
								<chart:axis>
									<xsl:attribute name="g-id" select="generate-id(.)"/>
									<xsl:copy-of select="@*"/>
								</chart:axis>
							</xsl:for-each>
						</x>
						<y>
							<xsl:for-each select="chart:axis[@chart:dimension='y']">
								<xsl:copy-of select="."/>
							</xsl:for-each>
						</y>
						<z>
							<xsl:for-each select="chart:axis[@chart:dimension='z']">
								<xsl:copy-of select="."/>
							</xsl:for-each>
						</z>
					</xsl:variable>
					<xsl:variable name="axises-style">
						<xsl:for-each select="$axises/*/*">
							<xsl:variable name="v-axis-style-name">
								<xsl:choose>
									<xsl:when test="name(..)='x'">
										<xsl:choose>
											<xsl:when test=" $axises/y/*[position()=current()/position]">
												<xsl:value-of select="$axises/y/*[position()=current()/position]/@chart:style-name"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="$axises/y/*[1]/@chart:style-name"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:when test="name(..)='y'">
										<xsl:choose>
											<xsl:when test="$axises/x/*[position()=current()/position]">
												<xsl:value-of select="$axises/y/*[position()=current()/position]/@chart:style-name"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="$axises/x/*[1]/@chart:style-name"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
								</xsl:choose>
							</xsl:variable>
							<chart:axis>
								<xsl:attribute name="g-id" select="@g-id"/>
								<xsl:attribute name="v-axis-style-name" select="$v-axis-style-name"/>
							</chart:axis>
						</xsl:for-each>
					</xsl:variable>
					<xsl:for-each select="chart:axis">
						<xsl:apply-templates select=".">
							<xsl:with-param name="v-axis-style-name" select="$axises-style/chart:axis[@g-id=generate-id(current())]/@v-axis-style-name"/>
						</xsl:apply-templates>
					</xsl:for-each>
					<!--<xsl:for-each-group select="chart:axis" group-by="@chart:dimension">
						<xsl:for-each select="current-group()">
							<xsl:variable name="v-axis-style-name">
								<xsl:choose>
									<xsl:when test="../..[position()!=current()/../position()]/*[position()=current()/position()]">
										<xsl:value-of select="../..[position()!=current()/../position()]/*[position()=current()/position()]/@chart:style-name"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="../..[position()!=current()/../position()]/*[1]/@chart:style-name"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:apply-templates select=".">
								<xsl:with-param name="v-axis-style-name" select="$v-axis-style-name"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</xsl:for-each-group>-->
				</??????:????????????_E790>
			</xsl:if>
		</??????:?????????_E747>
		<??????:?????????_E7A1>
			<xsl:for-each select="chart:wall">
				<xsl:variable name="wall-style-name" select="@chart:style-name"/>
				<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$wall-style-name]">
					<xsl:call-template name="BorderLine_4226"/>
					<!--UOF2.0????????????????????? E7A3 ?????????E746-->
					<xsl:call-template name="Fill_E746"/>
				</xsl:for-each>
			</xsl:for-each>
		</??????:?????????_E7A1>
		<??????:??????_E7A4>
			<xsl:for-each select="chart:floor">
				<xsl:variable name="floor-style-name" select="@chart:style-name"/>
				<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$floor-style-name]">
					<xsl:call-template name="BorderLine_4226"/>
					<!--UOF2.0????????????????????? E7A3 ?????????E746-->
					<xsl:call-template name="Fill_E746"/>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:apply-templates select="chart:floor"/>
		</??????:??????_E7A4>
	</xsl:template>
	<xsl:template match="chart:legend">
		<??????:??????_E794>
			<??????:??????_E70A>
				<xsl:if test="@svg:x and @svg:x!=''">
					<xsl:attribute name="x_C606"><xsl:value-of select="fun:Convert2uofUnit(@svg:x)"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="@svg:y and @svg:y!=''">
					<xsl:attribute name="y_C607"><xsl:value-of select="fun:Convert2uofUnit(@svg:y)"/></xsl:attribute>
				</xsl:if>
			</??????:??????_E70A>
			<xsl:if test="@chart:legend-position">
				<xsl:variable name="position">
					<xsl:variable name="legend-position" select="@chart:legend-position"/>
					<xsl:choose>
						<xsl:when test="$legend-position='start'">left</xsl:when>
						<xsl:when test="$legend-position='end'">
							<xsl:choose>
								<xsl:when test="number(substring-before(../chart:plot-area/@svg:y,'cm')) - number(substring-before(@svg:y,'cm')) &gt;1.7">corner</xsl:when>
								<xsl:otherwise>right</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$legend-position='top'">top</xsl:when>
						<xsl:when test="$legend-position='bottom'">bottom</xsl:when>
						<xsl:when test="$legend-position='top-end'">corner</xsl:when>
						<xsl:otherwise>right</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<??????:????????????_E795>
					<xsl:value-of select="$position"/>
				</??????:????????????_E795>
			</xsl:if>
			<!--?????? ODF????????????-->
			<xsl:variable name="legend" select="@chart:style-name"/>
			<xsl:for-each select="ancestor::office:document[1]/office:automatic-styles/style:style[@style:name=$legend]">
				<xsl:call-template name="Font_E70B"/>
				<xsl:call-template name="BorderLine_4226"/>
				<xsl:call-template name="Fill_E746"/>
			</xsl:for-each>
			<!--????????? ODF????????????-->
		</??????:??????_E794>
	</xsl:template>
	<xsl:template name="DrawFrameChart">
		<xsl:for-each select="/office:document/office:body//draw:object/office:document">
			<??????:??????_E837>
				<xsl:attribute name="?????????_E828"><!--??????--><xsl:value-of select="generate-id(..)"/></xsl:attribute>
				<xsl:for-each select="office:body/office:chart/chart:chart">
					<??????:?????????_E743>
						<xsl:call-template name="??????:?????????_E743"/>
					</??????:?????????_E743>
					<xsl:apply-templates select="chart:plot-area"/>
					<xsl:apply-templates select="chart:legend"/>
					<xsl:apply-templates select="chart:title"/>
					<!--ODF ????????????????????? ??????????????????????????????????????????????????????????????????????????????RO??????????????????-->
					<!--?????? ???????????????????????????-->
					<!--?????? ???????????????????????????-->
				</xsl:for-each>
			</??????:??????_E837>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="transform-decimal-to-hexadecimal">
		<xsl:param name="color-decimal"/>
		<xsl:variable name="first-number" select="floor($color-decimal div 16)"/>
		<xsl:variable name="first-char">
			<xsl:call-template name="decimal-to-hex">
				<xsl:with-param name="number" select="round($first-number)"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="second-number" select="$color-decimal - ($first-number * 16)"/>
		<xsl:variable name="second-char">
			<xsl:call-template name="decimal-to-hex">
				<xsl:with-param name="number" select="round($second-number)"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="concat($first-char,$second-char)"/>
	</xsl:template>
	<xsl:template name="TableView">
		<xsl:variable name="currentTableName" select="@table:name"/>
		<xsl:variable name="view-id" select="count(preceding-sibling::table:table)"/>
		<xsl:variable name="path" select="/office:document/office:settings/config:config-item-set/config:config-item-map-indexed/config:config-item-map-entry"/>
		<xsl:element name="???:??????_E7D5">
			<xsl:attribute name="???????????????_E7E5"><xsl:value-of select="$view-id"/></xsl:attribute>
			<xsl:if test="/office:document/office:settings/config:config-item-set[@config:name = 'ooo:view-settings']/config:config-item-map-indexed[@config:name = 'Views']/config:config-item-map-entry/config:config-item[@config:name = 'ActiveTable'] = $currentTableName">
				<xsl:element name="???:????????????_E7D6">true</xsl:element>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="$path/config:config-item-map-named/config:config-item-map-entry[@config:name=$currentTableName]/config:config-item[@config:name='HorizontalSplitMode']/text()='2'  or $path/config:config-item-map-named/config:config-item-map-entry[@config:name=currentTableName]/config:config-item[@config:name='VerticalSplitMode']/text()='2' ">
					<xsl:element name="???:??????_E7D8">
						<xsl:attribute name="??????_E7D9"><xsl:value-of select="$path/config:config-item-map-named/config:config-item-map-entry[@config:name=$currentTableName]/config:config-item[@config:name='VerticalSplitPosition']/text()"/></xsl:attribute>
						<xsl:attribute name="??????_E7DA"><xsl:value-of select="$path/config:config-item-map-named/config:config-item-map-entry[@config:name=$currentTableName]/config:config-item[@config:name='HorizontalSplitPosition']/text()"/></xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="???:??????_E7D7">
						<xsl:attribute name="???_C605"><xsl:choose><xsl:when test="$path/config:config-item-map-named/config:config-item-map-entry[@config:name=$currentTableName]/config:config-item[@config:name='HorizontalSplitMode']/text()='1'"><xsl:value-of select="$path/config:config-item-map-named/config:config-item-map-entry[@config:name=$currentTableName]/config:config-item[@config:name='HorizontalSplitPosition']/text()"/></xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:attribute>
						<xsl:attribute name="???_C604"><xsl:choose><xsl:when test="$path/config:config-item-map-named/config:config-item-map-entry[@config:name=$currentTableName]/config:config-item[@config:name='VerticalSplitMode']/text()='1'"><xsl:value-of select="$path/config:config-item-map-named/config:config-item-map-entry[@config:name=$currentTableName]/config:config-item[@config:name='VerticalSplitPosition']/text()"/></xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:attribute>
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:for-each select="/office:document/office:settings/config:config-item-set[@config:name = 'ooo:view-settings']/config:config-item-map-indexed[@config:name = 'Views']/config:config-item-map-entry/config:config-item-map-named[@config:name = 'Tables']/config:config-item-map-entry[@config:name = $currentTableName]">
				<xsl:element name="???:?????????_E7DB">
					<xsl:choose>
						<xsl:when test="config:config-item[@config:name = 'PositionBottom']/text()">
							<xsl:value-of select="number(config:config-item[@config:name = 'PositionBottom']/text()) + 1"/>
						</xsl:when>
						<xsl:otherwise>1</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="/office:document/office:settings/config:config-item-set[@config:name = 'ooo:view-settings']/config:config-item-map-indexed[@config:name = 'Views']/config:config-item-map-entry/config:config-item-map-named[@config:name = 'Tables']/config:config-item-map-entry[@config:name = $currentTableName]">
				<xsl:element name="???:?????????_E7DC">
					<xsl:choose>
						<xsl:when test="config:config-item[@config:name = 'PositionLeft']/text()">
							<xsl:value-of select="number(config:config-item[@config:name = 'PositionLeft']/text()) + 1"/>
						</xsl:when>
						<xsl:otherwise>1</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
			</xsl:for-each>
			<xsl:element name="???:??????????????????_E7DD">
				<xsl:choose>
					<xsl:when test="$path/config:config-item[@config:name='ShowPageBreakPreview']/text()='true'">page</xsl:when>
					<xsl:otherwise>normal</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<!--xsl:element name="???:??????????????????_E7DF">
				<xsl:choose>
					<xsl:when test="/office:document/office:settings/config:config-item-set[@config:name='ooo:view-settings']//config:config-item[@config:name='ShowGrid']/text()='true'">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:element-->
			<xsl:choose>
				<xsl:when test="/office:document/office:settings/config:config-item-set[@config:name='ooo:view-settings']//config:config-item[@config:name='ShowGrid']/text()='false'">
					<xsl:element name="???:??????????????????_E7DF">false</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="???:??????????????????_E7DF">true</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="//config:config-item-set[@config:name='ooo:view-settings']//config:config-item[@config:name='GridColor']">
				<xsl:element name="???:????????????_E7E0">
					<xsl:variable name="GridColor-text">
						<xsl:value-of select="//config:config-item-set[@config:name='ooo:view-settings']//config:config-item[@config:name='GridColor'][1]/text()"/>
					</xsl:variable>
					<xsl:variable name="R-color" select="floor(number($GridColor-text) div 65536)"/>
					<xsl:variable name="G-color" select="floor((number($GridColor-text) - (number($R-color) * 65536)) div 256)"/>
					<xsl:variable name="B-color" select="number($GridColor-text) - (number($R-color) * 65536)- (number($G-color) * 256)"/>
					<xsl:variable name="R-color-in-16">
						<xsl:call-template name="transform-decimal-to-hexadecimal">
							<xsl:with-param name="color-decimal" select="$R-color"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="G-color-in-16">
						<xsl:call-template name="transform-decimal-to-hexadecimal">
							<xsl:with-param name="color-decimal" select="$G-color"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="B-color-in-16">
						<xsl:call-template name="transform-decimal-to-hexadecimal">
							<xsl:with-param name="color-decimal" select="$B-color"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:value-of select="concat('#',$R-color-in-16,$G-color-in-16,$B-color-in-16)"/>
				</xsl:element>
			</xsl:if>
			<xsl:element name="???:??????_E7C4">
				<xsl:choose>
					<xsl:when test="$path/config:config-item-map-named/config:config-item-map-entry[@config:name=$currentTableName]/config:config-item/@config:name='ZoomValue'">
						<xsl:value-of select="$path/config:config-item-map-named/config:config-item-map-entry[@config:name=$currentTableName]/config:config-item[@config:name='ZoomValue']/text()"/>
					</xsl:when>
					<xsl:otherwise>100</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:if test="$path/config:config-item-map-named/config:config-item-map-entry[@config:name=$currentTableName]/config:config-item/@config:name='PageViewZoomValue'">
				<xsl:element name="???:????????????_E7E1">
					<xsl:value-of select="$path/config:config-item-map-named/config:config-item-map-entry[@config:name=$currentTableName]/config:config-item[@config:name='PageViewZoomValue']/text()"/>
				</xsl:element>
			</xsl:if>
			<???:????????????_E7E2>
				<xsl:variable name="positionPre" select="$path/config:config-item-map-named/config:config-item-map-entry[@config:name=$currentTableName]/config:config-item[@config:name = 'CursorPositionX']"/>
				<xsl:variable name="cursorX">
					<xsl:call-template name="number-to-character">
						<xsl:with-param name="number" select="number($positionPre) + 1"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="positionPretwo" select="$path/config:config-item-map-named/config:config-item-map-entry[@config:name=$currentTableName]/config:config-item[@config:name = 'CursorPositionY']"/>
				<xsl:variable name="cursorY" select="$positionPretwo + 1"/>
				<xsl:variable name="dollar">$</xsl:variable>
				<xsl:value-of select="concat($dollar,$cursorX,$dollar,$cursorY)"/>
			</???:????????????_E7E2>
		</xsl:element>
	</xsl:template>
	<xsl:template name="setDefaultPageWidth">
		<xsl:choose>
			<xsl:when test="$uofUnit='in'">
				<xsl:value-of select="'7.9'"/>
			</xsl:when>
			<xsl:when test="$uofUnit='cm'">
				<xsl:value-of select="'20.999'"/>
			</xsl:when>
			<xsl:when test="$uofUnit='mm'">
				<xsl:value-of select="'200.99'"/>
			</xsl:when>
			<xsl:when test="$uofUnit='pt'">
				<xsl:value-of select="'787'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'20.990'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="setDefaultPageHeight">
		<xsl:choose>
			<xsl:when test="$uofUnit='inch'">
				<xsl:value-of select="'10.14'"/>
			</xsl:when>
			<xsl:when test="$uofUnit='cm'">
				<xsl:value-of select="'29.699'"/>
			</xsl:when>
			<xsl:when test="$uofUnit='mm'">
				<xsl:value-of select="'269.99'"/>
			</xsl:when>
			<xsl:when test="$uofUnit='pt'">
				<xsl:value-of select="'1023'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'26.990'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="TablePagePaper">
		<xsl:element name="???:??????_E7C2">
			<xsl:variable name="height">
				<xsl:call-template name="convert2cm">
					<xsl:with-param name="value" select="fun:Convert2uofUnit(style:page-layout-properties/@fo:page-height)"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="width">
				<xsl:call-template name="convert2cm">
					<xsl:with-param name="value" select="fun:Convert2uofUnit(style:page-layout-properties/@fo:page-width)"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="paperType">
				<xsl:choose>
					<xsl:when test="number($width) &lt; 30.01 and number($width) &gt; 29 and number($height) &lt; 42.1 and number($height) &gt; 41.5">A3</xsl:when>
					<xsl:when test="number($width) &lt; 15.11 and number($width) &gt; 14.5 and number($height) &lt; 22 and number($height) &gt; 19.5">A5</xsl:when>
					<xsl:when test="number($width) &lt; 25.11 and number($width) &gt; 24.5 and number($height) &lt; 36 and number($height) &gt; 34.5">B4</xsl:when>
					<xsl:when test="number($width) &lt; 18.5 and number($width) &gt; 16.5 and number($height) &lt; 26 and number($height) &gt; 24">B5</xsl:when>
					<xsl:when test="number($width) &lt; 13.5 and number($width) &gt; 11.5 and number($height) &lt; 18 and number($height) &gt; 17">B6</xsl:when>
					<xsl:when test="number($width) &lt; 13 and number($width) &gt; 12 and number($height) &lt; 18 and number($height) &gt; 17">B6</xsl:when>
					<xsl:when test="number($width) &lt; 15 and number($width) &gt; 13 and number($height) &lt; 21.3 and number($height) &gt; 19.3">PRC-32K(Big)</xsl:when>
					<xsl:when test="number($width) &lt; 22.6 and number($width) &gt; 20.6 and number($height) &lt; 28.95 and number($height) &gt; 26.95">letter</xsl:when>
					<xsl:when test="number($width) &lt; 19.4 and number($width) &gt; 17.4 and number($height) &lt; 27 and number($height) &gt; 25">PRC-16K</xsl:when>
					<xsl:when test="number($width) &lt; 15 and number($width) &gt; 13 and number($height) &lt; 21.3 and number($height) &gt; 19.3">PRC-32K(Big)</xsl:when>
					<xsl:when test="number($width) &lt; 14 and number($width) &gt; 12 and number($height) &lt; 19.4 and number($height) &gt; 17.4">PRC-32K</xsl:when>
					<xsl:otherwise>A4</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<!--????????????-->
			<!--xsl:attribute name="??????_C60C"><xsl:value-of select="$paperType"/></xsl:attribute-->
			<xsl:variable name="uofwidth">
				<xsl:choose>
					<xsl:when test="$width != ''">
						<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:page-width)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="setDefaultPageWidth"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:attribute name="???_C605"><xsl:value-of select="$uofwidth"/></xsl:attribute>
			<xsl:variable name="uofheight">
				<xsl:choose>
					<xsl:when test="$height != ''">
						<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:page-height)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="setDefaultPageHeight"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:attribute name="???_C604"><xsl:value-of select="$uofheight"/></xsl:attribute>
		</xsl:element>
	</xsl:template>
	<xsl:template name="TablePageMargin">
		<xsl:element name="???:?????????_E7C5">
			<xsl:if test="style:page-layout-properties/@fo:margin-left">
				<xsl:variable name="margin_left" select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-left)"/>
				<xsl:attribute name="???_C608"><xsl:value-of select="$margin_left"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="style:page-layout-properties/@fo:margin-top">
				<xsl:variable name="margin_top">
					<xsl:choose>
						<xsl:when test="style:header-style/style:header-footer-properties/@fo:min-height">
							<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-top) + fun:Convert2uofUnit(style:header-style/style:header-footer-properties/@fo:min-height)"/>
						</xsl:when>
						<xsl:when test="style:footer-style/style:header-footer-properties/@fo:min-height">
							<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-top) + fun:Convert2uofUnit(style:footer-style/style:header-footer-properties/@fo:min-height)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-top)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:attribute name="???_C609"><xsl:value-of select="$margin_top"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="style:page-layout-properties/@fo:margin-right">
				<xsl:variable name="margin_right" select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-right)"/>
				<xsl:attribute name="???_C60A"><xsl:value-of select="$margin_right"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="style:page-layout-properties/@fo:margin-bottom">
				<xsl:variable name="margin_bottom">
					<xsl:choose>
						<xsl:when test="style:header-style/style:header-footer-properties/@fo:min-height">
							<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-bottom) + fun:Convert2uofUnit(style:header-style/style:header-footer-properties/@fo:min-height)"/>
						</xsl:when>
						<xsl:when test="style:footer-style/style:header-footer-properties/@fo:min-height">
							<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-bottom) + fun:Convert2uofUnit(style:footer-style/style:header-footer-properties/@fo:min-height)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="fun:Convert2uofUnit(style:page-layout-properties/@fo:margin-bottom)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:attribute name="???_C60B"><xsl:value-of select="$margin_bottom"/></xsl:attribute>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template name="TablePageSetting">
		<xsl:param name="master-page"/>
		<xsl:variable name="page-layout-name" select="$master-page/@style:page-layout-name"/>
		<xsl:element name="???:????????????_E7C1">
			<xsl:attribute name="??????_E7D4"><xsl:value-of select="$master-page/@style:name"/></xsl:attribute>
			<xsl:for-each select="/office:document/office:automatic-styles/style:page-layout[@style:name = $page-layout-name]">
				<xsl:call-template name="TablePagePaper"/>
				<xsl:element name="???:????????????_E7C3">
					<xsl:choose>
						<xsl:when test="style:page-layout-properties/@style:print-orientation">
							<xsl:value-of select="style:page-layout-properties/@style:print-orientation"/>
						</xsl:when>
						<xsl:otherwise>portrait</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
				<xsl:element name="???:??????_E7C4">
					<xsl:choose>
						<xsl:when test="style:page-layout-properties/@style:scale-to">
							<xsl:value-of select="substring-before(style:page-layout-properties/@style:scale-to,'%')"/>
						</xsl:when>
						<xsl:otherwise>100</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
				<xsl:call-template name="TablePageMargin"/>
				<xsl:for-each select="$master-page/style:header/child::*">
					<???:????????????_E7C6>
						<xsl:choose>
							<xsl:when test="name(..)='style:region-left' or name(.)='style:region-left'">
								<xsl:attribute name="??????_E7C9">header-left</xsl:attribute>
								<xsl:for-each select="*">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</xsl:when>
							<xsl:when test="name(..)='style:region-right' or name(.)='style:region-right'">
								<xsl:attribute name="??????_E7C9">header-right</xsl:attribute>
								<xsl:for-each select="*">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="??????_E7C9">header-center</xsl:attribute>
								<???:??????_416B>
									<xsl:for-each select="*">
										<???:???_419D>
											<???:?????????_415B>
												<xsl:value-of select="."/>
											</???:?????????_415B>
										</???:???_419D>
									</xsl:for-each>
								</???:??????_416B>
							</xsl:otherwise>
						</xsl:choose>
					</???:????????????_E7C6>
				</xsl:for-each>
				<xsl:for-each select="$master-page/style:footer/child::*">
					<???:????????????_E7C6>
						<xsl:choose>
							<xsl:when test="name(..)='style:region-left' or name(.)='style:region-left'">
								<xsl:attribute name="??????_E7C9">footer-left</xsl:attribute>
								<xsl:for-each select="*">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</xsl:when>
							<xsl:when test="name(..)='style:region-right' or name(.)='style:region-right'">
								<xsl:attribute name="??????_E7C9">footer-right</xsl:attribute>
								<xsl:for-each select="*">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="??????_E7C9">footer-center</xsl:attribute>
								<!--???:??????_416B-->
								<xsl:for-each select="*">
									<xsl:choose>
										<xsl:when test="name(.)!=''">
											<xsl:apply-templates select="."/>
										</xsl:when>
										<xsl:otherwise>
											<???:??????_416B>
												<???:???_419D>
													<???:?????????_415B>
														<xsl:value-of select="."/>
													</???:?????????_415B>
												</???:???_419D>
											</???:??????_416B>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								<!--/???:??????_416B-->
							</xsl:otherwise>
						</xsl:choose>
					</???:????????????_E7C6>
				</xsl:for-each>
				<xsl:if test="style:page-layout-properties/@style:print-page-order or style:page-layout-properties/@style:print">
					<???:??????_E7CA>
						<xsl:if test="style:page-layout-properties/@style:print-page-order='ltr'">
							<xsl:attribute name="??????????????????_E7CE">false</xsl:attribute>
						</xsl:if>
						<xsl:if test="contains(style:page-layout-properties/@style:print,'headers')">
							<xsl:attribute name="?????????????????????_E7CC">true</xsl:attribute>
						</xsl:if>
						<xsl:if test="contains(style:page-layout-properties/@style:print,'grid')">
							<xsl:attribute name="??????????????????_E7CB">true</xsl:attribute>
						</xsl:if>
					</???:??????_E7CA>
				</xsl:if>
				<xsl:if test="contains(style:page-layout-properties/@style:print,'annotations')">
					<???:??????????????????_E7CF>sheet-end</???:??????????????????_E7CF>
				</xsl:if>
				<???:??????????????????_E701>
					<xsl:choose>
						<xsl:when test="style:page-layout-properties/@style:table-centering='vertical' or style:page-layout-properties/@style:table-centering='both'">center</xsl:when>
						<xsl:otherwise>top</xsl:otherwise>
					</xsl:choose>
				</???:??????????????????_E701>
				<???:??????????????????_E700>
					<xsl:choose>
						<xsl:when test="style:page-layout-properties/@style:table-centering='horizontal' or style:page-layout-properties/@style:table-centering='both'">center</xsl:when>
						<xsl:otherwise>left</xsl:otherwise>
					</xsl:choose>
				</???:??????????????????_E700>
				<xsl:if test="style:page-layout-properties/@style:scale-to-X or style:page-layout-properties/@style:scale-to-Y">
					<???:??????_E7D1>
						<xsl:if test="style:page-layout-properties/@style:scale-to-X">
							<xsl:attribute name="????????????_E7D2"><xsl:value-of select="style:page-layout-properties/@style:scale-to-X"/></xsl:attribute>
						</xsl:if>
						<xsl:if test="style:page-layout-properties/@style:scale-to-Y">
							<xsl:attribute name="????????????_E7D3"><xsl:value-of select="style:page-layout-properties/@style:scale-to-Y"/></xsl:attribute>
						</xsl:if>
					</???:??????_E7D1>
				</xsl:if>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="TableSheetProperties">
		<xsl:param name="tablestyle"/>
		<xsl:element name="???:???????????????_E80D">
			<xsl:if test="$tablestyle/style:table-properties/@table:tab-font-color">
				<???:???????????????_E7BF>
					<xsl:value-of select="$tablestyle/style:table-properties/@table:tab-font-color"/>
				</???:???????????????_E7BF>
			</xsl:if>
			<xsl:if test="$tablestyle/style:table-properties/@table:tab-color">
				<???:???????????????_E7C0>
					<xsl:value-of select="$tablestyle/style:table-properties/@table:tab-color"/>
				</???:???????????????_E7C0>
			</xsl:if>
			<xsl:variable name="PageName" select="$tablestyle/@style:master-page-name"/>
			<xsl:call-template name="TablePageSetting">
				<xsl:with-param name="master-page" select="/office:document/office:master-styles/style:master-page[@style:name=$PageName]"/>
			</xsl:call-template>
			<xsl:call-template name="TableView"/>
			<!--uof2.0????????????????????????????????????
			<xsl:if test="table:table-column/@table:number-columns-repeated &gt; 200">
				<xsl:variable name="temp" select="table:table-column/@table:default-cell-style-name"/>
				<xsl:variable name="bkcolor" select="key('TableStyle',@temp)/style:table-cell-properties/@fo:background-color"/>
				<xsl:if test="$bkcolor != ''">
					<xsl:element name="???:????????????_E830">
						<xsl:element name="???:??????_8004">
							<xsl:value-of select="$bkcolor"/>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:if>-->
			<xsl:if test="$tablestyle/style:table-properties/@fo:background-color">
				<xsl:element name="???:????????????_E830">
					<xsl:element name="???:??????_8004">
						<xsl:value-of select="$tablestyle/style:table-properties/@fo:background-color"/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template match="table:table-cell" mode="table">
		<xsl:param name="rowPos"/>
		<xsl:call-template name="CellContent">
			<xsl:with-param name="rowPos" select="$rowPos"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="table:covered-table-cell" mode="table">
		<xsl:param name="rowPos"/>
		<xsl:call-template name="CellContent">
			<xsl:with-param name="rowPos" select="$rowPos"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="RowNumber">
		<xsl:param name="result"/>
		<!--xsl:variable name="nCount1" select="count(preceding-sibling::table:table-row)"/>
		<xsl:variable name="nRepeatSum1" select="sum(preceding-sibling::table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
		<xsl:variable name="nRepeatCount1" select="count(preceding-sibling::table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
		<xsl:variable name="nCount2" select="count(preceding-sibling::*[name() != 'table:shapes']//table:table-row)"/>
		<xsl:variable name="nRepeatSum2" select="sum(preceding-sibling::*[name() != 'table:shapes']//table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
		<xsl:variable name="nRepeatCount2" select="count(preceding-sibling::*[name() != 'table:shapes']//table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
		<xsl:variable name="nCurPos">
			<xsl:value-of select="number($nCount1 + $nRepeatSum1 - $nRepeatCount1 + $nCount2 + $nRepeatSum2 - $nRepeatCount2)"/>
		</xsl:variable-->
		<xsl:variable name="nCount1" select="count(preceding-sibling::table:table-row)"/>
		<xsl:variable name="nRepeatSum1" select="sum(preceding-sibling::table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
		<xsl:variable name="nRepeatCount1" select="count(preceding-sibling::table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
		<xsl:variable name="nCount2" select="count(preceding-sibling::*//table:table-row[not(ancestor::office:chart)])"/>
		<xsl:variable name="nRepeatSum2" select="sum(preceding-sibling::*//table:table-row[@table:number-rows-repeated and not(ancestor::office:chart)]/@table:number-rows-repeated)"/>
		<xsl:variable name="nRepeatCount2" select="count(preceding-sibling::*//table:table-row[@table:number-rows-repeated and not(ancestor::office:chart)]/@table:number-rows-repeated)"/>
		<xsl:variable name="nCurPos">
			<xsl:value-of select="number($nCount1 + $nRepeatSum1 - $nRepeatCount1 + $nCount2 + $nRepeatSum2 - $nRepeatCount2)"/>
		</xsl:variable>
		<xsl:for-each select="..">
			<xsl:choose>
				<xsl:when test="name(.) != 'table:table'">
					<xsl:call-template name="RowNumber">
						<xsl:with-param name="result" select="number($result) + number($nCurPos)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="number($result) + number($nCurPos)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="table:table-row" mode="table">
		<xsl:element name="???:???_E7F1">
			<xsl:variable name="nNumber">
				<xsl:call-template name="RowNumber">
					<xsl:with-param name="result" select="0"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:attribute name="??????_E7F3"><xsl:value-of select="$nNumber + 1"/></xsl:attribute>
			<xsl:if test="@table:visibility = 'collapse' or @table:visibility = 'filter'">
				<xsl:attribute name="????????????_E73C">true</xsl:attribute>
			</xsl:if>
			<xsl:variable name="rowHeight" select="key('RowStyle',@table:style-name)/style:table-row-properties/@style:row-height"/>
			<xsl:if test="$rowHeight != ''">
				<xsl:variable name="uofHeight" select="fun:Convert2uofUnit($rowHeight)"/>
				<xsl:attribute name="??????_E7F4"><xsl:value-of select="$uofHeight"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@table:default-cell-style-name">
				<xsl:attribute name="????????????_E7BD"><xsl:value-of select="@table:default-cell-style-name"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@table:number-rows-repeated">
				<!--xsl:attribute name="??????_E7EF"><xsl:value-of select="@table:number-rows-repeated - 1"/></xsl:attribute-->
				<xsl:attribute name="??????_E7EF" select="number(@table:number-rows-repeated)- 1"/>
			</xsl:if>
			<xsl:for-each select="*">
				<xsl:choose>
					<xsl:when test="self::node()[name(.)='table:table-cell']">
						<xsl:apply-templates mode="table" select=".">
							<xsl:with-param name="rowPos" select="$nNumber + 1"/>
						</xsl:apply-templates>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:covered-table-cell']">
						<xsl:apply-templates mode="table" select=".">
							<xsl:with-param name="rowPos" select="$nNumber + 1"/>
						</xsl:apply-templates>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template match="table:table-rows" mode="table">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="self::node()[name(.)='table:table-row']">
					<xsl:apply-templates mode="table" select="."/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="table:table-header-rows" mode="table">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="self::node()[name(.)='table:table-row']">
					<xsl:apply-templates mode="table" select="."/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="table:table-row-group" mode="table">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="self::node()[name(.)='table:table-row-group']">
					<xsl:apply-templates mode="table" select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='table:table-header-rows']">
					<xsl:apply-templates mode="table" select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='table:table-rows']">
					<xsl:apply-templates mode="table" select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='table:table-row']">
					<xsl:apply-templates mode="table" select="."/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="ColumnNumber">
		<xsl:param name="result"/>
		<!--xsl:variable name="nCurPos">
			<xsl:variable name="nCount1" select="count(preceding-sibling::table:table-column)"/>
			<xsl:variable name="nRepeatSum1" select="sum(preceding-sibling::table:table-column[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
			<xsl:variable name="nRepeatCount1" select="count(preceding-sibling::table:table-column[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
			<xsl:variable name="nCount2" select="count(preceding-sibling::*[name() != 'table:shapes']//table:table-column)"/>
			<xsl:variable name="nRepeatSum2" select="sum(preceding-sibling::*[name() != 'table:shapes']//table:table-column[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
			<xsl:variable name="nRepeatCount2" select="count(preceding-sibling::*[name() != 'table:shapes']//table:table-column[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
			<xsl:value-of select="number($nCount1 + $nRepeatSum1 - $nRepeatCount1 + $nCount2 + $nRepeatSum2 - $nRepeatCount2)"/>
		</xsl:variable-->
		<xsl:variable name="nCurPos">
			<xsl:variable name="nCount1" select="count(preceding-sibling::table:table-column)"/>
			<xsl:variable name="nRepeatSum1" select="sum(preceding-sibling::table:table-column[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
			<xsl:variable name="nRepeatCount1" select="count(preceding-sibling::table:table-column[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
			<xsl:variable name="nCount2" select="count(preceding-sibling::*//table:table-column[not(ancestor::office:chart)])"/>
			<xsl:variable name="nRepeatSum2" select="sum(preceding-sibling::*//table:table-column[@table:number-columns-repeated and not(ancestor::office:chart)]/@table:number-columns-repeated)"/>
			<xsl:variable name="nRepeatCount2" select="count(preceding-sibling::*//table:table-column[@table:number-columns-repeated and not(ancestor::office:chart)]/@table:number-columns-repeated)"/>
			<xsl:value-of select="number($nCount1 + $nRepeatSum1 - $nRepeatCount1 + $nCount2 + $nRepeatSum2 - $nRepeatCount2)"/>
		</xsl:variable>
		<xsl:for-each select="..">
			<xsl:choose>
				<xsl:when test="name(.) != 'table:table'">
					<xsl:call-template name="ColumnNumber">
						<xsl:with-param name="result" select="number($result) + number($nCurPos)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="number($result) + number($nCurPos)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="table:table-column" mode="table">
		<???:???_E7EC>
			<xsl:variable name="nNumber">
				<xsl:call-template name="ColumnNumber">
					<xsl:with-param name="result" select="0"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:attribute name="??????_E7ED"><xsl:value-of select="$nNumber + 1"/></xsl:attribute>
			<xsl:if test="@table:visibility">
				<xsl:attribute name="????????????_E73C"><xsl:choose><xsl:when test="@table:visibility='collapse'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:attribute>
			</xsl:if>
			<xsl:variable name="colWidth" select="key('ColStyle',@table:style-name)/style:table-column-properties/@style:column-width"/>
			<xsl:if test="$colWidth != ''">
				<xsl:variable name="uofWidth" select="fun:Convert2uofUnit($colWidth)"/>
				<xsl:attribute name="??????_E7EE"><xsl:value-of select="$uofWidth"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@table:default-cell-style-name">
				<xsl:attribute name="????????????_E7BD"><xsl:value-of select="@table:default-cell-style-name"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="number(@table:number-columns-repeated) &gt; 1">
				<!--xsl:attribute name="??????_E7EF"><xsl:value-of select="@table:number-columns-repeated - 1"/></xsl:attribute-->
				<xsl:attribute name="??????_E7EF" select="number(@table:number-columns-repeated) - 1"/>
			</xsl:if>
		</???:???_E7EC>
	</xsl:template>
	<xsl:template match="table:table-columns" mode="table">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="self::node()[name(.)='table:table-column']">
					<xsl:apply-templates mode="table" select="."/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="table:table-header-columns" mode="table">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="self::node()[name(.)='table:table-column']">
					<xsl:apply-templates mode="table" select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='text:soft-page-break']">
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="table:table-column-group" mode="table">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="self::node()[name(.)='table:table-column-group']">
					<xsl:apply-templates mode="table" select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='table:table-header-columns']">
					<xsl:apply-templates mode="table" select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='table:table-columns']">
					<xsl:apply-templates mode="table" select="."/>
				</xsl:when>
				<xsl:when test="self::node()[name(.)='table:table-column']">
					<xsl:apply-templates mode="table" select="."/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="TableGroups">
		<xsl:if test=".//table:table-column-group or .//table:table-row-group">
			<xsl:element name="???:?????????_E7F6">
				<xsl:for-each select=".//table:table-column-group">
					<???:???_E841>
						<xsl:variable name="nStartNumber">
							<xsl:for-each select="descendant::table:table-column[1]">
								<xsl:call-template name="ColumnNumber">
									<xsl:with-param name="result" select="0"/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:variable>
						<xsl:attribute name="??????_E73A"><xsl:value-of select="$nStartNumber + 1"/></xsl:attribute>
						<xsl:variable name="nCount" select="count(.//table:table-column)"/>
						<xsl:variable name="nRepeatSum" select="sum(.//table:table-column[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
						<xsl:variable name="nRepeatCount" select="count(.//table:table-column[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
						<xsl:attribute name="??????_E73B"><xsl:value-of select="$nStartNumber + $nCount + $nRepeatSum - $nRepeatCount"/></xsl:attribute>
						<xsl:if test="@table:display">
							<xsl:choose>
								<xsl:when test="@table:display = 'true'">
									<xsl:attribute name="????????????_E73C">false</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="????????????_E73C">true</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</???:???_E841>
				</xsl:for-each>
				<xsl:for-each select=".//table:table-row-group">
					<???:???_E842>
						<xsl:variable name="nStartNumber">
							<xsl:for-each select="descendant::table:table-row[1]">
								<xsl:call-template name="RowNumber">
									<xsl:with-param name="result" select="0"/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:variable>
						<xsl:attribute name="??????_E73A"><xsl:value-of select="$nStartNumber + 1"/></xsl:attribute>
						<xsl:variable name="nCount" select="count(.//table:table-row)"/>
						<xsl:variable name="nRepeatSum" select="sum(.//table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
						<xsl:variable name="nRepeatCount" select="count(.//table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
						<xsl:attribute name="??????_E73B"><xsl:value-of select="$nStartNumber + $nCount + $nRepeatSum - $nRepeatCount"/></xsl:attribute>
						<xsl:if test="@table:display">
							<xsl:choose>
								<xsl:when test="@table:display = 'true'">
									<xsl:attribute name="????????????_E73C">false</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="????????????_E73C">true</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</???:???_E842>
				</xsl:for-each>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template name="TableGroupAndOutline">
		<xsl:variable name="OutlineDetailValue">
			<xsl:value-of select="/office:document/office:settings/config:config-item-set[@config:name='ooo:view-settings']/config:config-item-map-indexed[@config:name='Views']/config:config-item-map-entry/config:config-item[@config:name='OutlineDetailValue']"/>
		</xsl:variable>
		<!--xsl:if test="(.//table:table-column-group or .//table:table-row-group) and ($OutlineDetailValue != '')"-->
		<xsl:if test="(.//table:table-column-group or .//table:table-row-group) and (($OutlineDetailValue = '0') or ($OutlineDetailValue = '1') or ($OutlineDetailValue = '2'))">
			<???:????????????????????????_E7F7>
				<xsl:choose>
					<xsl:when test="$OutlineDetailValue = '0'">below</xsl:when>
					<xsl:when test="$OutlineDetailValue = '1'">below</xsl:when>
					<xsl:when test="$OutlineDetailValue = '2'">right</xsl:when>
					<!--xsl:otherwise>none</xsl:otherwise-->
				</xsl:choose>
			</???:????????????????????????_E7F7>
		</xsl:if>
	</xsl:template>
	<xsl:template name="TableSheetContent">
		<xsl:element name="???:???????????????_E80E">
			<???:????????????_E7E6>
				<xsl:variable name="maxRow">
					<xsl:variable name="nRow" select="count(.//table:table-row)"/>
					<xsl:variable name="nRepeatSum" select="sum(.//table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
					<xsl:variable name="nRepeatCount" select="count(.//table:table-row[@table:number-rows-repeated]/@table:number-rows-repeated)"/>
					<xsl:value-of select="$nRow + $nRepeatSum - $nRepeatCount"/>
				</xsl:variable>
				<xsl:attribute name="?????????_E7E7"><xsl:value-of select="$maxRow"/></xsl:attribute>
				<xsl:variable name="maxColumn">
					<xsl:variable name="nColumn" select="count(.//table:table-column)"/>
					<xsl:variable name="nRepeatSum" select="sum(.//table:table-column[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
					<xsl:variable name="nRepeatCount" select="count(.//table:table-column[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
					<xsl:value-of select="$nColumn + $nRepeatSum - $nRepeatCount"/>
				</xsl:variable>
				<xsl:attribute name="?????????_E7E8"><xsl:value-of select="$maxColumn"/></xsl:attribute>
			</???:????????????_E7E6>
			<???:??????????????????_E7E9>
				<xsl:attribute name="????????????_E7EA"><xsl:choose><xsl:when test="$uofUnit= 'cm'">0.53</xsl:when><xsl:when test="$uofUnit= 'mm'">5.3</xsl:when><xsl:when test="$uofUnit= 'inch'">0.20867</xsl:when><xsl:otherwise>15.024</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:attribute name="????????????_E7EB"><xsl:choose><xsl:when test="$uofUnit= 'cm'">2.27</xsl:when><xsl:when test="$uofUnit= 'mm'">22.7</xsl:when><xsl:when test="$uofUnit= 'inch'">0.8937</xsl:when><xsl:otherwise>64.346</xsl:otherwise></xsl:choose></xsl:attribute>
			</???:??????????????????_E7E9>
			<xsl:for-each select="*">
				<xsl:choose>
					<xsl:when test="self::node()[name(.)='table:table-column-group']">
						<xsl:apply-templates mode="table" select="."/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-header-columns']">
						<xsl:apply-templates mode="table" select="."/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-columns']">
						<xsl:apply-templates mode="table" select="."/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-column']">
						<xsl:apply-templates mode="table" select="."/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-row-group']">
						<xsl:apply-templates mode="table" select="."/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-header-rows']">
						<xsl:apply-templates mode="table" select="."/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-rows']">
						<xsl:apply-templates mode="table" select="."/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-row']">
						<xsl:apply-templates mode="table" select="."/>
					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:named-expressions']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:title']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:desc']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:table-source']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='office:dde-source']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='table:scenario']">

					</xsl:when>
					<xsl:when test="self::node()[name(.)='office:forms']">

					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="table:shapes">
				<xsl:apply-templates mode="table" select="."/>
			</xsl:for-each>
			<xsl:call-template name="TableGroups"/>
			<xsl:call-template name="TableGroupAndOutline"/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="translate-expression">
		<xsl:param name="expression"/>
		<xsl:variable name="expression1">
			<xsl:value-of select="substring-before($expression,':')"/>
		</xsl:variable>
		<xsl:variable name="expression2">
			<xsl:value-of select="substring-after($expression,':')"/>
		</xsl:variable>
		<xsl:variable name="expression3">
			<xsl:value-of select="substring-before($expression1,'.')"/>
			<!--Table Name-->
		</xsl:variable>
		<xsl:variable name="expression4">
			<xsl:value-of select="substring-before($expression2,'.')"/>
			<!--Table Name-->
		</xsl:variable>
		<xsl:variable name="expression5">
			<xsl:value-of select="substring-after($expression1,'.')"/>
			<!--Start point-->
		</xsl:variable>
		<xsl:variable name="expression6">
			<xsl:value-of select="substring-after($expression2,'.')"/>
			<!--end point-->
		</xsl:variable>
		<xsl:variable name="startHorizonal">
			<xsl:choose>
				<xsl:when test="string-length($expression5) = 2">
					<xsl:value-of select="substring($expression5,1,1)"/>
				</xsl:when>
				<xsl:when test="string-length($expression5) = 3">
					<xsl:variable name="secondCharacter" select="substring($expression5,2,1)"/>
					<xsl:choose>
						<xsl:when test="number($secondCharacter) &gt; 9">
							<xsl:value-of select="substring($expression5,1,2)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="substring($expression5,1,1)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="startVertical">
			<xsl:choose>
				<xsl:when test="string-length($expression5) = 2">
					<xsl:value-of select="substring($expression5,2,1)"/>
				</xsl:when>
				<xsl:when test="string-length($expression5) = 3">
					<xsl:variable name="secondCharacter" select="substring($expression5,2,1)"/>
					<xsl:choose>
						<xsl:when test="number($secondCharacter) &gt; 9">
							<xsl:value-of select="substring($expression5,3)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="substring($expression5,2)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="endHorizonal">
			<xsl:choose>
				<xsl:when test="string-length($expression6) = 2">
					<xsl:value-of select="substring($expression6,1,1)"/>
				</xsl:when>
				<xsl:when test="string-length($expression6) = 3">
					<xsl:variable name="secondCharacter" select="substring($expression6,2,1)"/>
					<xsl:choose>
						<xsl:when test="number($secondCharacter) &gt; 9">
							<xsl:value-of select="substring($expression6,1,2)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="substring($expression6,1,1)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="endVertical">
			<xsl:choose>
				<xsl:when test="string-length($expression6) = 2">
					<xsl:value-of select="substring($expression6,2,1)"/>
				</xsl:when>
				<xsl:when test="string-length($expression6) = 3">
					<xsl:variable name="secondCharacter" select="substring($expression6,2,1)"/>
					<xsl:choose>
						<xsl:when test="number($secondCharacter) &gt; 9">
							<xsl:value-of select="substring($expression6,3)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="substring($expression6,2)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="start">
			<xsl:value-of select="concat('$',$startHorizonal,'$',$startVertical)"/>
		</xsl:variable>
		<xsl:variable name="end">
			<xsl:value-of select="concat('$',$endHorizonal,'$',$endVertical)"/>
		</xsl:variable>
		<xsl:variable name="yinhao">'</xsl:variable>
		<xsl:choose>
			<xsl:when test="$expression3 != $expression4">
				<xsl:value-of select="concat($yinhao,$expression3,$yinhao,'!',$start,':',$yinhao,$expression4,$yinhao,'!',$end)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($yinhao,$expression3,$yinhao,'!',$start,':',$end)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="TableOperator">
		<xsl:element name="???:????????????_E815">
			<xsl:element name="???:?????????_E816">
				<xsl:choose>
					<xsl:when test="@table:operator = '='">equal to</xsl:when>
					<xsl:when test="@table:operator = '!='">not equal to</xsl:when>
					<xsl:when test="@table:operator = '&gt;'">greater than</xsl:when>
					<xsl:when test="@table:operator = '&gt;='">greater than or equal to</xsl:when>
					<xsl:when test="@table:operator = '&lt;'">less than</xsl:when>
					<xsl:when test="@table:operator = '&lt;='">less than or equal to</xsl:when>
					<xsl:when test="@table:operator = 'begins-with'">start with</xsl:when>
					<xsl:when test="@table:operator = 'does-not-begin-with'">not start with</xsl:when>
					<xsl:when test="@table:operator = 'ends-with'">end with</xsl:when>
					<xsl:when test="@table:operator = 'does-not-end-with'">not end with</xsl:when>
					<xsl:when test="@table:operator = 'contains'">contain</xsl:when>
					<xsl:when test="@table:operator = 'does-not-contain'">not contain</xsl:when>
					<xsl:otherwise>equal to</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="???:???_E817">
				<xsl:if test="@table:value">
					<xsl:value-of select="@table:value"/>
				</xsl:if>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template name="TableDataFilter">
		<xsl:param name="tablename"/>
		<xsl:if test="/*/office:body/office:spreadsheet/table:database-ranges/table:database-range[not(@table:name) and contains(@table:target-range-address,$tablename)]">
			<???:?????????_E83A>
				<xsl:for-each select="/*/office:body/office:spreadsheet/table:database-ranges/table:database-range[not(@table:name) and contains(@table:target-range-address,$tablename)]">
					<xsl:variable name="target-range-address" select="//table:database-range[table:filter]/@table:target-range-address"/>
					<xsl:element name="???:??????_E80F">
						<xsl:attribute name="??????_E83B"><xsl:choose><xsl:when test="@table:display-filter-buttons">auto</xsl:when><xsl:otherwise>advance</xsl:otherwise></xsl:choose></xsl:attribute>
						<xsl:element name="???:??????_E810">
							<xsl:call-template name="translate-expression">
								<xsl:with-param name="expression" select="./@table:target-range-address"/>
							</xsl:call-template>
						</xsl:element>
						<xsl:variable name="column-and-row" select="substring-before(substring-after($target-range-address,'.'),':')"/>
						<xsl:if test="table:filter">
							<xsl:element name="???:??????_E811">
								<xsl:variable name="columnNumber">
									<xsl:choose>
										<xsl:when test="table:filter/table:filter-condition/@table:field-number">
											<xsl:value-of select="number(table:filter/table:filter-condition/@table:field-number) + 1"/>
										</xsl:when>
										<xsl:when test="table:filter/table:filter-or/table:filter-condition/@table:field-number">
											<xsl:value-of select="number(table:filter/table:filter-or/table:filter-condition[1]/@table:field-number) + 1"/>
										</xsl:when>
										<xsl:when test="table:filter/table:filter-and/table:filter-condition/@table:field-number">
											<xsl:value-of select="number(table:filter/table:filter-and/table:filter-condition[1]/@table:field-number) + 1"/>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								</xsl:variable>
								<xsl:attribute name="??????_E819"><xsl:value-of select="$columnNumber[1]"/></xsl:attribute>
								<xsl:variable name="filter1" select="table:filter/table:filter-condition/@table:operator"/>
								<xsl:choose>
									<xsl:when test="$filter1 = 'bottom values' or $filter1 = 'bottom percent' or $filter1 = 'top values' or $filter1 = 'top percent' or $filter1 = '='">
										<xsl:element name="???:??????_E812">
											<xsl:attribute name="??????_E7B6"><xsl:choose><xsl:when test="$filter1 = 'bottom values'">bottomitem</xsl:when><xsl:when test="$filter1 = 'bottom percent'">bottompercent</xsl:when><xsl:when test="$filter1 = 'top values'">topitem</xsl:when><xsl:when test="$filter1 = 'top percent'">toppercent</xsl:when><xsl:when test="$filter1 = '='">value</xsl:when></xsl:choose></xsl:attribute>
											<xsl:attribute name="???_E813"><xsl:value-of select="table:filter/table:filter-condition/@table:value"/></xsl:attribute>
										</xsl:element>
									</xsl:when>
									<xsl:otherwise>
										<xsl:element name="???:?????????_E814">
											<xsl:variable name="tableFilter">
												<xsl:choose>
													<xsl:when test="table:filter/table:filter-or">or</xsl:when>
													<xsl:when test="/table:filter/table:filter-and">and</xsl:when>
												</xsl:choose>
											</xsl:variable>
											<xsl:if test="$tableFilter != ''">
												<xsl:attribute name="??????_E75D"><xsl:value-of select="$tableFilter"/></xsl:attribute>
											</xsl:if>
											<xsl:for-each select="table:filter/table:filter-or/table:filter-condition | table:filter/table:filter-and/table:filter-condition | table:filter/table:filter-condition">
												<xsl:call-template name="TableOperator"/>
											</xsl:for-each>
										</xsl:element>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
						</xsl:if>
						<xsl:if test="@table:condition-source-range-address">
							<xsl:element name="???:????????????_E81A">
								<xsl:value-of select="@table:condition-source-range-address"/>
							</xsl:element>
						</xsl:if>
						<xsl:if test="@table:display-duplicates">
							<xsl:element name="???:????????????_E81B">
								<xsl:value-of select="@table:display-duplicates"/>
							</xsl:element>
						</xsl:if>
					</xsl:element>
				</xsl:for-each>
			</???:?????????_E83A>
		</xsl:if>
	</xsl:template>
	<xsl:template name="TablePageBreak">
		<xsl:if test="key('ColStyle', .//table:table-column/@table:style-name)/style:table-column-properties/@fo:break-before = 'page' or key('ColStyle', .//table:table-row/@table:style-name)/style:table-row-properties/@fo:break-before = 'page'">
			<???:????????????_E81E>
				<xsl:for-each select=".//table:table-column">
					<xsl:if test="key('ColStyle', @table:style-name)/style:table-column-properties/@fo:break-before = 'page'">
						<xsl:variable name="nNumber">
							<xsl:call-template name="ColumnNumber">
								<xsl:with-param name="result" select="0"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:element name="???:?????????_E81F">
							<xsl:attribute name="??????_E821"><xsl:value-of select="$nNumber"/></xsl:attribute>
						</xsl:element>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select=".//table:table-row">
					<xsl:if test="key('RowStyle', @table:style-name)/style:table-row-properties/@fo:break-before = 'page'">
						<xsl:variable name="nNumber">
							<xsl:call-template name="RowNumber">
								<xsl:with-param name="result" select="0"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:element name="???:?????????_E81F">
							<xsl:attribute name="??????_E820"><xsl:value-of select="$nNumber"/></xsl:attribute>
						</xsl:element>
					</xsl:if>
				</xsl:for-each>
			</???:????????????_E81E>
		</xsl:if>
	</xsl:template>
	<xsl:template match="table:table" mode="table">
		<xsl:element name="???:?????????_E825">
			<xsl:attribute name="?????????_E7AC"><xsl:value-of select="concat('Table', generate-id())"/></xsl:attribute>
			<xsl:attribute name="??????_E822"><xsl:value-of select="@table:name"/></xsl:attribute>
			<xsl:variable name="tablestyle" select="key('TableStyle',@table:style-name)"/>
			<xsl:variable name="status" select="$tablestyle/style:table-properties/@table:display"/>
			<xsl:attribute name="????????????_E73C"><xsl:choose><xsl:when test="$status = 'false'"><xsl:value-of select="'true'"/></xsl:when><xsl:otherwise><xsl:value-of select="'false'"/></xsl:otherwise></xsl:choose></xsl:attribute>
			<!--xsl:attribute name="??????_E823"><xsl:choose><xsl:when test="$tablestyle/style:table-properties/@fo:background-color"><xsl:value-of select="$tablestyle/style:table-properties/@fo:background-color"/></xsl:when><xsl:otherwise>#ffffff</xsl:otherwise></xsl:choose></xsl:attribute-->
			<!--xsl:attribute name="???:????????????_E824"><xsl:value-of select="@table:style-name"/></xsl:attribute-->
			<xsl:call-template name="TableSheetProperties">
				<xsl:with-param name="tablestyle" select="$tablestyle"/>
			</xsl:call-template>
			<xsl:call-template name="TableSheetContent"/>
			<xsl:call-template name="TableDataFilter">
				<xsl:with-param name="tablename" select="@table:name"/>
			</xsl:call-template>
			<xsl:if test="/office:document/office:automatic-styles/style:style/style:table-column-properties[@fo:break-before]">
				<xsl:call-template name="TablePageBreak"/>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template match="table:shapes" mode="table">
		<xsl:for-each select="*">
			<xsl:call-template name="UOFAnchor">
				<!--xsl:with-param name="anchor_name1" select="'uof:??????_C644'"/-->
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="text:p" mode="tablecell">
		<xsl:call-template name="paragraph_content"/>
	</xsl:template>
	<xsl:template match="office:annotation" mode="tablecell">
		<xsl:element name="???:??????_E7B7">
			<xsl:attribute name="????????????_E7B9"><xsl:choose><xsl:when test="@office:display = 'true'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:attribute>
			<xsl:call-template name="UOFAnchor">
				<!--xsl:with-param name="anchor_name1" select="'uof:??????_C644'"/-->
			</xsl:call-template>
		</xsl:element>
	</xsl:template>
	<xsl:template name="CellContent">
		<xsl:param name="rowPos"/>
		<???:?????????_E7F2>
			<xsl:variable name="nCount1" select="count(preceding-sibling::table:table-cell)"/>
			<xsl:variable name="nRepeatSum1" select="sum(preceding-sibling::table:table-cell[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
			<xsl:variable name="nRepeatCount1" select="count(preceding-sibling::table:table-cell[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
			<xsl:variable name="nCount2" select="count(preceding-sibling::table:covered-table-cell)"/>
			<xsl:variable name="nRepeatSum2" select="sum(preceding-sibling::table:covered-table-cell[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
			<xsl:variable name="nRepeatCount2" select="count(preceding-sibling::table:covered-table-cell[@table:number-columns-repeated]/@table:number-columns-repeated)"/>
			<xsl:variable name="columnPos">
				<xsl:value-of select="number($nCount1 + $nRepeatSum1 - $nRepeatCount1 + $nCount2 + $nRepeatSum2 - $nRepeatCount2 + 1)"/>
			</xsl:variable>
			<xsl:attribute name="??????_E7BC" select="$columnPos"/>
			<xsl:if test="@table:style-name">
				<xsl:attribute name="????????????_E7BD"><xsl:value-of select="@table:style-name"/></xsl:attribute>
			</xsl:if>
			<!--????????????????????????????????????-->
			<xsl:if test="@table:content-validation-name">
				<xsl:attribute name="???:content-validation-name"><xsl:value-of select="@table:content-validation-name"/></xsl:attribute>
			</xsl:if>
			<!--
			<xsl:variable name="defaultCellStyle">
				<xsl:for-each select="../preceding-sibling::*[name(.) = 'table:table-column']">
					<xsl:variable name="nNumber">
						<xsl:call-template name="ColumnNumber">
							<xsl:with-param name="result" select="0"/>
						</xsl:call-template>
					</xsl:variable>
					<uof:tempTree>
						<uof:columnNumber><xsl:value-of select="number($nNumber) + 1"/></uof:columnNumber>
						<uof:repeated><xsl:value-of select="@table:number-columns-repeated"/></uof:repeated>
						<uof:defaultCellStyleName><xsl:value-of select="@table:default-cell-style-name"/></uof:defaultCellStyleName>
					</uof:tempTree>
				</xsl:for-each>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="@table:style-name">
					<xsl:attribute name="???:????????????"><xsl:value-of select="@table:style-name"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="$defaultCellStyle/uof:tempTree[uof:columnNumber = $columnPos]/uof:defaultCellStyleName != ''">
					<xsl:attribute name="???:????????????"><xsl:value-of select="$defaultCellStyle/uof:tempTree[uof:columnNumber = $columnPos]/uof:defaultCellStyleName"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="$defaultCellStyle/uof:tempTree[((number(uof:columnNumber) + number(uof:repeated)) = $columnPos) or ((number(uof:columnNumber) + number(uof:repeated)) &gt; $columnPos)]/uof:defaultCellStyleName != ''">
					<xsl:attribute name="???:????????????"><xsl:value-of select="$defaultCellStyle/uof:tempTree[((number(uof:columnNumber) + number(uof:repeated)) = $columnPos) or ((number(uof:columnNumber) + number(uof:repeated)) &gt; $columnPos)]/uof:defaultCellStyleName"/></xsl:attribute>
				</xsl:when>
			</xsl:choose>
		
			<???:??????_E7AF>
				<xsl:if test="@table:number-columns-spanned &gt; 1">
					<???:??????_E7B0>
						<xsl:value-of select="@table:number-columns-spanned - 1"/>
					</???:??????_E7B0>
				</xsl:if>
				<xsl:if test="@table:number-rows-spanned &gt; 1">
					<???:??????_E7B1>
						<xsl:value-of select="@table:number-rows-spanned - 1"/>
					</???:??????_E7B1>
				</xsl:if>
			</???:??????_E7AF>	-->
			<xsl:if test="number(@table:number-columns-spanned) &gt; 1 or number(@table:number-rows-spanned) &gt; 1">
				<???:??????_E7AF>
					<xsl:if test="number(@table:number-columns-spanned) &gt; 1">
						<!--xsl:attribute name="??????_E7B0"><xsl:value-of select="@table:number-columns-spanned - 1"/></xsl:attribute-->
						<xsl:attribute name="??????_E7B0" select="number(@table:number-columns-spanned)-1"/>
					</xsl:if>
					<xsl:if test="number(@table:number-rows-spanned) &gt; 1">
						<!--xsl:attribute name="??????_E7B1"><xsl:value-of select="@table:number-rows-spanned - 1"/></xsl:attribute-->
						<xsl:attribute name="??????_E7B1" select="number(@table:number-rows-spanned)-1"/>
					</xsl:if>
				</???:??????_E7AF>
			</xsl:if>
			<xsl:if test="number(@table:number-columns-repeated) &gt; 1">
				<!--???:??????_E7B2>
					<xsl:value-of select="@table:number-columns-repeated - 1"/>
				</???:??????_E7B2-->
				<xsl:attribute name="??????_E7EF" select="number(@table:number-columns-repeated) - 1"/>
			</xsl:if>
			<xsl:if test="*">
				<???:??????_E7B3>
					<xsl:variable name="datatype">
						<xsl:choose>
							<xsl:when test="@office:value-type = 'string'">text</xsl:when>
							<xsl:when test="@office:value-type = 'boolean'">boolean</xsl:when>
							<xsl:when test="@office:value-type = 'date'">date</xsl:when>
							<xsl:when test="@office:value-type = 'time'">error</xsl:when>
							<xsl:when test="@office:value-type = 'float' or @office:value-type = 'percentage' or @office:value-type = 'currency'">number</xsl:when>
							<!--<xsl:otherwise>number</xsl:otherwise>-->
						</xsl:choose>
					</xsl:variable>
					<xsl:if test="$datatype != ''">
						<xsl:attribute name="??????_E7B6" select="$datatype"/>
					</xsl:if>
					<xsl:choose>
						<!-- ??? ???:????????? ?????????????????????office:value??????text:p????????????????????????????????????????????????????????? -->
						<xsl:when test="@office:value or @office:date-value or @office:time-value or @office:boolean-value or @office:string-value  or @table:formula">
							<xsl:if test="@office:value">
								<???:???_419D>
									<???:?????????_415B>
										<xsl:value-of select="@office:value"/>
									</???:?????????_415B>
								</???:???_419D>
							</xsl:if>
							<xsl:if test="@office:date-value">
								<???:???_419D>
									<???:?????????_415B>
										<xsl:value-of select="@office:date-value"/>
									</???:?????????_415B>
								</???:???_419D>
							</xsl:if>
							<xsl:if test="@office:time-value">
								<???:???_419D>
									<???:?????????_415B>
										<xsl:value-of select="@office:time-value"/>
									</???:?????????_415B>
								</???:???_419D>
							</xsl:if>
							<xsl:if test="@office:boolean-value">
								<???:???_419D>
									<???:?????????_415B>
										<xsl:value-of select="@office:boolean-value"/>
									</???:?????????_415B>
								</???:???_419D>
							</xsl:if>
							<xsl:if test="@office:string-value">
								<???:???_419D>
									<???:?????????_415B>
										<xsl:value-of select="@office:string-value"/>
									</???:?????????_415B>
								</???:???_419D>
							</xsl:if>
							<xsl:if test="@table:formula">
								<???:??????_E7B5>
									<xsl:call-template name="translate-formular-expression">
										<xsl:with-param name="rowPos" select="$rowPos"/>
										<xsl:with-param name="columnPos" select="$columnPos"/>
										<xsl:with-param name="expression" select="@table:formula"/>
									</xsl:call-template>
								</???:??????_E7B5>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates mode="tablecell" select="text:p"/>
						</xsl:otherwise>
					</xsl:choose>
				</???:??????_E7B3>
			</xsl:if>
			<xsl:for-each select="node()[not(name()='text:p')]">
				<xsl:choose>
					<xsl:when test="self::node()[name(.)='office:annotation']">
						<xsl:apply-templates mode="tablecell" select="."/>
					</xsl:when>
					<xsl:when test="self::node()[substring-before(name(.),':')='draw']">
						<xsl:call-template name="UOFAnchor">
							<!--hsr ????????????????????? xsl:with-param name="anchor_name1" select="'uof:??????_C644'"/-->
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</???:?????????_E7F2>
	</xsl:template>
	<!-- Translate OpenFormula expressions of table cells to spreadsheetml expression

		For example:
			"of:=ROUNDDOWN(123.321;2)"
				to "=ROUNDDOWN(123.321,2)"
			"of:=([.B2]-[.C2])"
				to  "=(RC[-2]-RC[-1])"
			"of:=DCOUNTA([.E14:.F21];[.F14];[.H14:.I15])"
				to  "=DCOUNTA(R[-17]C[3]:R[-10]C[4],R[-17]C[4],R[-17]C[6]:R[-16]C[7])"   -->
	<xsl:template name="translate-formular-expression">
		<!--  return position or range for formula or other -->
		<xsl:param name="rowPos"/>
		<!-- the position in row (vertical) of cell -->
		<xsl:param name="columnPos"/>
		<!-- the position in column (horizontal of cell) -->
		<xsl:param name="expression"/>
		<!-- the expression string to be converted  -->
		<xsl:choose>
			<xsl:when test="$expression != ''">
				<xsl:choose>
					<!-- OASIS Open Document XML formular expressions  -->
					<xsl:when test="starts-with($expression,'of:')">
						<!-- giving out the '=', which will be removed with 'of:=' to enable recursive string parsing  -->
						<xsl:text>=</xsl:text>
						<xsl:call-template name="function-parameter-mapping">
							<xsl:with-param name="rowPos" select="$rowPos"/>
							<xsl:with-param name="columnPos" select="$columnPos"/>
							<!-- 1) remove 'of:=' prefix and exchange ';' with ',' -->
							<xsl:with-param name="expression" select="translate(substring($expression,5),';',',')"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$expression"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$expression"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- As the function API of our Office and MS Office show differences in the argumentlists,
			-	sometimes the last parameter have to be neglected
			-	sometimes a default have to be added
		these exchanges have to be done as well -->
	<xsl:template name="function-parameter-mapping">
		<xsl:param name="rowPos"/>
		<!-- the position in row (vertical of cell) -->
		<xsl:param name="columnPos"/>
		<!-- the position in column (horizontal of cell) -->
		<xsl:param name="expression"/>
		<!-- expression to be exchanged -->
		<!-- Choose if the expression contains one of the function, which might need changes -->
		<xsl:choose>
			<!-- if not contain one of the functions, which need parameter mapping -->
			<xsl:when test="not(contains($expression, 'ADDRESS(') or         contains($expression, 'CEILING(') or         contains($expression, 'FLOOR(') or         contains($expression, 'IF(') or         contains($expression, 'ROUND('))">
				<!-- simply translate possily exisiting column & row references -->
				<xsl:call-template name="translate-of-expression">
					<xsl:with-param name="rowPos" select="$rowPos"/>
					<xsl:with-param name="columnPos" select="$columnPos"/>
					<xsl:with-param name="expression" select="$expression"/>
				</xsl:call-template>
			</xsl:when>
			<!-- functions to be mapped -->
			<xsl:otherwise>
				<xsl:variable name="functionPrefix" select="substring-before($expression, '(')"/>
				<xsl:variable name="expressionSuffix" select="substring-after($expression, '(')"/>
				<!-- translate in case the expression contains row/cell references aside of the function name -->
				<xsl:call-template name="translate-of-expression">
					<xsl:with-param name="rowPos" select="$rowPos"/>
					<xsl:with-param name="columnPos" select="$columnPos"/>
					<xsl:with-param name="expression" select="$functionPrefix"/>
				</xsl:call-template>
				<!-- Prefix do not include the bracket -->
				<xsl:text>(</xsl:text>
				<xsl:choose>
					<xsl:when test="not(contains($functionPrefix, 'ADDRESS') or           contains($functionPrefix, 'CEILING') or           contains($functionPrefix, 'FLOOR') or           (contains($functionPrefix, 'IF') and not(            contains($functionPrefix, 'COUNTIF') or            contains($functionPrefix, 'SUMIF'))) or           contains($functionPrefix, 'ROUND'))">
						<xsl:call-template name="function-parameter-mapping">
							<xsl:with-param name="rowPos" select="$rowPos"/>
							<xsl:with-param name="columnPos" select="$columnPos"/>
							<xsl:with-param name="expression" select="$expressionSuffix"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="contains($functionPrefix, 'ADDRESS')">
								<xsl:call-template name="find-parameters">
									<xsl:with-param name="rowPos" select="$rowPos"/>
									<xsl:with-param name="columnPos" select="$columnPos"/>
									<xsl:with-param name="expressionSuffix" select="$expressionSuffix"/>
									<xsl:with-param name="parameterRemoval" select="4"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="contains($functionPrefix, 'CEILING') or            contains($functionPrefix, 'FLOOR')">
								<xsl:call-template name="find-parameters">
									<xsl:with-param name="rowPos" select="$rowPos"/>
									<xsl:with-param name="columnPos" select="$columnPos"/>
									<xsl:with-param name="expressionSuffix" select="$expressionSuffix"/>
									<xsl:with-param name="parameterRemoval" select="3"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="contains($functionPrefix, 'IF')">
								<xsl:if test="not(contains($functionPrefix, 'COUNTIF') or               contains($functionPrefix, 'SUMIF'))">
									<xsl:call-template name="find-parameters">
										<xsl:with-param name="rowPos" select="$rowPos"/>
										<xsl:with-param name="columnPos" select="$columnPos"/>
										<xsl:with-param name="expressionSuffix" select="$expressionSuffix"/>
										<xsl:with-param name="parameterAddition" select="'true'"/>
										<xsl:with-param name="additonAfterLastParameter" select="2"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:when>
							<xsl:when test="contains($functionPrefix, 'ROUND')">
								<xsl:call-template name="find-parameters">
									<xsl:with-param name="rowPos" select="$rowPos"/>
									<xsl:with-param name="columnPos" select="$columnPos"/>
									<xsl:with-param name="expressionSuffix" select="$expressionSuffix"/>
									<xsl:with-param name="parameterAddition" select="'null'"/>
									<xsl:with-param name="additonAfterLastParameter" select="1"/>
								</xsl:call-template>
							</xsl:when>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Each parameter of the argumentlist have to be determined.
	Due to the low level string functionlity in XSLT it becomes a clumsy task -->
	<xsl:template name="find-parameters">
		<!-- used for mapping of row/column reference  -->
		<xsl:param name="rowPos"/>
		<!-- the position in row (vertical of cell) -->
		<xsl:param name="columnPos"/>
		<!-- the position in column (horizontal of cell) -->
		<!-- used for mapping of parameter  -->
		<xsl:param name="parameterRemoval"/>
		<xsl:param name="parameterAddition"/>
		<xsl:param name="additonAfterLastParameter"/>
		<!-- used as helper to find a parameter  -->
		<xsl:param name="expressionSuffix"/>
		<xsl:param name="parameterNumber" select="1"/>
		<xsl:variable name="parameter">
			<xsl:call-template name="getParameter">
				<xsl:with-param name="expressionSuffix" select="$expressionSuffix"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:choose>
			<!-- if it is not the last parameter -->
			<xsl:when test="starts-with(substring-after($expressionSuffix, $parameter), ',')">
				<!-- searches the argument for functions to be mapped -->
				<xsl:if test="not(number($parameterRemoval) = number($parameterNumber))">
					<xsl:call-template name="function-parameter-mapping">
						<xsl:with-param name="rowPos" select="$rowPos"/>
						<xsl:with-param name="columnPos" select="$columnPos"/>
						<xsl:with-param name="expression">
							<xsl:choose>
								<!-- in case a character will be removed the preceding won't make a comma -->
								<xsl:when test="number($parameterRemoval) = (number($parameterNumber) + 1)">
									<xsl:value-of select="$parameter"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($parameter, ',')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- searches for the next parameter -->
				<xsl:call-template name="find-parameters">
					<xsl:with-param name="rowPos" select="$rowPos"/>
					<xsl:with-param name="columnPos" select="$columnPos"/>
					<xsl:with-param name="parameterRemoval" select="$parameterRemoval"/>
					<xsl:with-param name="parameterAddition" select="$parameterAddition"/>
					<xsl:with-param name="additonAfterLastParameter" select="$additonAfterLastParameter"/>
					<xsl:with-param name="expressionSuffix" select="substring-after(substring-after($expressionSuffix, $parameter),',')"/>
					<xsl:with-param name="parameterNumber" select="$parameterNumber + 1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<!-- the last parameter -->
				<xsl:choose>
					<xsl:when test="$parameterRemoval = $parameterNumber">
						<!-- searches the rest of the expression for functions to be mapped -->
						<xsl:call-template name="function-parameter-mapping">
							<xsl:with-param name="rowPos" select="$rowPos"/>
							<xsl:with-param name="columnPos" select="$columnPos"/>
							<xsl:with-param name="expression" select="substring-after($expressionSuffix, $parameter)"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$parameterAddition and ($parameterNumber  = $additonAfterLastParameter)">
						<!-- searches the rest of the expression for functions to be mapped -->
						<xsl:call-template name="function-parameter-mapping">
							<xsl:with-param name="rowPos" select="$rowPos"/>
							<xsl:with-param name="columnPos" select="$columnPos"/>
							<xsl:with-param name="expression" select="$parameter"/>
						</xsl:call-template>
						<!-- searches last parameter and additional parameters for functions to be mapped -->
						<xsl:call-template name="function-parameter-mapping">
							<xsl:with-param name="rowPos" select="$rowPos"/>
							<xsl:with-param name="columnPos" select="$columnPos"/>
							<!-- for the final parameter the latter substring is the ')' -->
							<xsl:with-param name="expression" select="concat(',', $parameterAddition, substring-after($expressionSuffix, $parameter))"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<!-- searches the argument for functions to be mapped -->
						<xsl:call-template name="function-parameter-mapping">
							<xsl:with-param name="rowPos" select="$rowPos"/>
							<xsl:with-param name="columnPos" select="$columnPos"/>
							<xsl:with-param name="expression" select="$parameter"/>
						</xsl:call-template>
						<!-- searches the rest of the expression for functions to be mapped -->
						<xsl:call-template name="function-parameter-mapping">
							<xsl:with-param name="rowPos" select="$rowPos"/>
							<xsl:with-param name="columnPos" select="$columnPos"/>
							<xsl:with-param name="expression" select="substring-after($expressionSuffix, $parameter)"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="getParameter">
		<xsl:param name="closingBracketCount" select="0"/>
		<xsl:param name="openingBracketCount" select="0"/>
		<xsl:param name="expressionSuffix"/>
		<xsl:param name="parameterCandidate">
			<xsl:choose>
				<!-- if there are multiple parameter -->
				<xsl:when test="contains(substring-before($expressionSuffix, ')'), ',')">
					<xsl:value-of select="substring-before($expressionSuffix, ',')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="substring-before($expressionSuffix, ')')"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="earlierCandidate" select="$parameterCandidate"/>
		<xsl:choose>
			<xsl:when test="contains($parameterCandidate, '(') or contains($parameterCandidate, ')')">
				<xsl:choose>
					<!-- contains only closing bracket(s) -->
					<xsl:when test="contains($parameterCandidate, '(') and not(contains($parameterCandidate, ')'))">
						<xsl:call-template name="getParameter">
							<xsl:with-param name="openingBracketCount" select="$openingBracketCount + 1"/>
							<xsl:with-param name="closingBracketCount" select="$closingBracketCount"/>
							<xsl:with-param name="parameterCandidate" select="substring-after($parameterCandidate, '(')"/>
							<xsl:with-param name="earlierCandidate" select="$earlierCandidate"/>
							<xsl:with-param name="expressionSuffix" select="$expressionSuffix"/>
						</xsl:call-template>
					</xsl:when>
					<!-- contains only opening bracket(s) -->
					<xsl:when test="not(contains($parameterCandidate, '(')) and contains($parameterCandidate, ')')">
						<xsl:call-template name="getParameter">
							<xsl:with-param name="openingBracketCount" select="$openingBracketCount"/>
							<xsl:with-param name="closingBracketCount" select="$closingBracketCount + 1"/>
							<xsl:with-param name="parameterCandidate" select="substring-after($parameterCandidate, ')')"/>
							<xsl:with-param name="earlierCandidate" select="$earlierCandidate"/>
							<xsl:with-param name="expressionSuffix" select="$expressionSuffix"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="string-length(substring-before($parameterCandidate, '(')) &lt;            string-length(substring-before($parameterCandidate, ')'))">
								<xsl:call-template name="getParameter">
									<xsl:with-param name="openingBracketCount" select="$openingBracketCount + 1"/>
									<xsl:with-param name="closingBracketCount" select="$closingBracketCount"/>
									<xsl:with-param name="parameterCandidate" select="substring-after($parameterCandidate, '(')"/>
									<xsl:with-param name="earlierCandidate" select="$earlierCandidate"/>
									<xsl:with-param name="expressionSuffix" select="$expressionSuffix"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="getParameter">
									<xsl:with-param name="openingBracketCount" select="$openingBracketCount"/>
									<xsl:with-param name="closingBracketCount" select="$closingBracketCount + 1"/>
									<xsl:with-param name="parameterCandidate" select="substring-after($parameterCandidate, ')')"/>
									<xsl:with-param name="earlierCandidate" select="$earlierCandidate"/>
									<xsl:with-param name="expressionSuffix" select="$expressionSuffix"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$openingBracketCount = $closingBracketCount">
						<xsl:value-of select="$earlierCandidate"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$earlierCandidate"/>
						<xsl:variable name="parameterCandidate">
							<xsl:variable name="formularAfterCandidate" select="substring-after($expressionSuffix, $earlierCandidate)"/>
							<xsl:variable name="parameterTillBracket" select="concat(substring-before($formularAfterCandidate,')'),')')"/>
							<xsl:variable name="parameterTillComma" select="substring-before(substring-after($expressionSuffix, $parameterTillBracket),',')"/>
							<xsl:choose>
								<xsl:when test="string-length($parameterTillComma) &gt; 0 and             not(contains($parameterTillComma, '('))">
									<xsl:choose>
										<xsl:when test="starts-with($formularAfterCandidate, ',')">
											<xsl:value-of select="concat(',',substring-before(substring-after($formularAfterCandidate,','),','))"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="substring-before($formularAfterCandidate,',')"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$parameterTillBracket"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:call-template name="getParameter">
							<xsl:with-param name="closingBracketCount" select="$closingBracketCount"/>
							<xsl:with-param name="openingBracketCount" select="$openingBracketCount"/>
							<xsl:with-param name="parameterCandidate" select="$parameterCandidate"/>
							<xsl:with-param name="earlierCandidate" select="$parameterCandidate"/>
							<xsl:with-param name="expressionSuffix" select="$expressionSuffix"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Mapping table-cell definitions by exchangomg all table cell definitions:
		a) a pair of cells e.g. "[.E14:.F21]" to "R[-17]C[3]:R[-10]C[4]"
		b) a single cell e.g. "[.F14]" to "R[-17]"-->
	<xsl:template name="translate-of-expression">
		<xsl:param name="rowPos"/>
		<!-- the position in row (vertical of cell) -->
		<xsl:param name="columnPos"/>
		<!-- the position in column (horizontal of cell) -->
		<xsl:param name="expression"/>
		<!-- expression to be exchanged -->
		<xsl:choose>
			<xsl:when test="contains($expression, '[')">
				<!-- Giving out the part before '[.' -->
				<xsl:value-of select="substring-before($expression, '[')"/>
				<!-- Mapping cell definitions
				1) a pair of cells e.g. "[.E14:.F21]" to "R[-17]C[3]:R[-10]C[4]"
				2) a single cell e.g. "[.F14]" to "R[-17]"-->
				<xsl:variable name="localExpression" select="substring-after($expression, '[')"/>
				<xsl:variable name="fileName" select="substring-before($localExpression, '#$')"/>
				<xsl:variable name="afterFileName">
					<xsl:choose>
						<xsl:when test="$fileName = ''">
							<xsl:value-of select="$localExpression"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="substring-after($localExpression, '#$')"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="sheetName">
					<xsl:choose>
						<xsl:when test="starts-with($afterFileName, &quot;'&quot;)">
							<xsl:variable name="str-in" select="substring-before(substring-after($afterFileName, &quot;'&quot;), &quot;'&quot;)"/>
							<xsl:value-of select="concat(&quot;'&quot;, $str-in, &quot;'&quot;)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="substring-before($afterFileName, '.')"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="outFileName">
					<xsl:choose>
						<xsl:when test="starts-with($fileName, &quot;'&quot;)">
							<xsl:variable name="str-in" select="substring-before(substring-after($fileName, &quot;'&quot;), &quot;'&quot;)"/>
							<xsl:variable name="newStr-in" select="replace($str-in, 'file:///', '')"/>
							<xsl:variable name="pathName">
								<xsl:call-template name="GetPath">
									<xsl:with-param name="fullFilename" select="$newStr-in"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:variable name="onlyFileName">
								<xsl:choose>
									<xsl:when test="$pathName = ''">
										<xsl:value-of select="$newStr-in"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="substring-after($newStr-in, $pathName)"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="concat(&quot;'&quot;, replace($pathName, '/', '\\'), '[', $onlyFileName, ']')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$fileName"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<!-- Giving out the filename -->
				<xsl:choose>
					<xsl:when test="$outFileName = ''">
						<xsl:if test="$sheetName != ''">
							<xsl:value-of select="$sheetName"/>
							<xsl:text>!</xsl:text>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="starts-with($sheetName, &quot;'&quot;)">
								<xsl:variable name="str-in" select="substring-before(substring-after($sheetName, &quot;'&quot;), &quot;'&quot;)"/>
								<xsl:value-of select="concat($outFileName, $str-in, &quot;'&quot;)"/>
								<xsl:text>!</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($outFileName, $sheetName, &quot;'&quot;)"/>
								<xsl:text>!</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:variable name="remainingExpression">
					<xsl:choose>
						<xsl:when test="$sheetName = ''">
							<xsl:value-of select="$afterFileName"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="substring-after($afterFileName, $sheetName)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$isRCCellAddress = 'true'">
						<xsl:choose>
							<xsl:when test="contains(substring-before($remainingExpression, ']'), ':')">
								<xsl:call-template name="translate-cell-expression">
									<xsl:with-param name="rowPos" select="$rowPos"/>
									<xsl:with-param name="columnPos" select="$columnPos"/>
									<xsl:with-param name="expression" select="substring-before($remainingExpression, ':')"/>
								</xsl:call-template>
								<xsl:value-of select="':'"/>
								<xsl:call-template name="translate-cell-expression">
									<xsl:with-param name="rowPos" select="$rowPos"/>
									<xsl:with-param name="columnPos" select="$columnPos"/>
									<xsl:with-param name="expression" select="substring-after(substring-before($remainingExpression, ']'), ':')"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="translate-cell-expression">
									<xsl:with-param name="rowPos" select="$rowPos"/>
									<xsl:with-param name="columnPos" select="$columnPos"/>
									<xsl:with-param name="expression" select="substring-before($remainingExpression, ']')"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="translate(substring-before($remainingExpression, ']'), '.', '')"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:call-template name="translate-of-expression">
					<xsl:with-param name="rowPos" select="$rowPos"/>
					<xsl:with-param name="columnPos" select="$columnPos"/>
					<xsl:with-param name="expression" select="substring-after($remainingExpression,']')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<!-- Giving out the remaining part -->
				<xsl:value-of select="$expression"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GetPath">
		<xsl:param name="fullFilename"/>
		<xsl:choose>
			<xsl:when test="contains($fullFilename, '/')">
				<xsl:value-of select="concat(substring-before($fullFilename, '/'), '/')"/>
				<xsl:call-template name="GetPath">
					<xsl:with-param name="fullFilename" select="substring-after($fullFilename, '/')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- A cell expression has usually starts with a '.' otherwise it references to a sheet  -->
	<xsl:template name="translate-cell-expression">
		<xsl:param name="rowPos"/>
		<!-- the vertical position of the current cell -->
		<xsl:param name="columnPos"/>
		<!-- the horizontal position of the current cell -->
		<xsl:param name="targetRowPos" select="0"/>
		<!-- the vertical position of the target cell -->
		<xsl:param name="targetColumnPos" select="0"/>
		<!-- the horizontal position of the target cell -->
		<xsl:param name="charPos" select="0"/>
		<!-- current column position (needed for multiplying) -->
		<xsl:param name="digitPos" select="0"/>
		<!-- current row position (needed for multiplying) -->
		<xsl:param name="expression"/>
		<!-- expression to be parsed by character -->
		<xsl:param name="isRow" select="true()"/>
		<!-- the string (e.g. $D39 is parsed character per character from the back,
													   first the row, later the column is parsed -->
		<xsl:choose>
			<xsl:when test="starts-with($expression, '.')">
				<xsl:variable name="expLength" select="string-length($expression)"/>
				<xsl:choose>
					<!-- parsing from the end, till only the '.' remains -->
					<xsl:when test="$expLength != 1">
						<xsl:variable name="token" select="substring($expression, $expLength)"/>
						<xsl:choose>
							<xsl:when test="$token='0' or $token='1' or $token='2' or $token='3' or $token='4' or $token='5' or $token='6' or $token='7' or $token='8' or $token='9'">
								<xsl:variable name="multiplier">
									<xsl:call-template name="calculate-square-numbers">
										<xsl:with-param name="base" select="10"/>
										<xsl:with-param name="exponent" select="$digitPos"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:call-template name="translate-cell-expression">
									<xsl:with-param name="columnPos" select="$columnPos"/>
									<xsl:with-param name="rowPos" select="$rowPos"/>
									<xsl:with-param name="targetColumnPos" select="$targetColumnPos"/>
									<xsl:with-param name="targetRowPos" select="$targetRowPos + $multiplier * number($token)"/>
									<xsl:with-param name="digitPos" select="$digitPos + 1"/>
									<xsl:with-param name="charPos" select="$charPos"/>
									<!-- removing the last character-->
									<xsl:with-param name="expression" select="substring($expression, 1, $expLength - 1)"/>
									<xsl:with-param name="isRow" select="true()"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:when test="$token = '$'">
								<xsl:choose>
									<!-- if this is the first '$' after '.' (column-->
									<xsl:when test="$expLength = 2">
										<xsl:text>C</xsl:text>
										<xsl:value-of select="$targetColumnPos"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>R</xsl:text>
										<xsl:value-of select="$targetRowPos"/>
										<xsl:call-template name="translate-cell-expression">
											<xsl:with-param name="columnPos" select="$columnPos"/>
											<xsl:with-param name="rowPos" select="$rowPos"/>
											<xsl:with-param name="targetColumnPos" select="$targetColumnPos"/>
											<xsl:with-param name="targetRowPos" select="$targetRowPos"/>
											<xsl:with-param name="charPos" select="$charPos"/>
											<!-- removing the last character-->
											<xsl:with-param name="expression" select="substring($expression, 1, $expLength - 1)"/>
											<xsl:with-param name="isRow" select="false()"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<!-- in case of a letter -->
							<xsl:otherwise>
								<xsl:if test="$isRow">
									<xsl:text>R</xsl:text>
									<xsl:if test="$targetRowPos != $rowPos">
										<xsl:text>[</xsl:text>
										<xsl:value-of select="$targetRowPos - $rowPos"/>
										<xsl:text>]</xsl:text>
									</xsl:if>
								</xsl:if>
								<xsl:variable name="multiplier">
									<xsl:call-template name="calculate-square-numbers">
										<xsl:with-param name="base" select="26"/>
										<xsl:with-param name="exponent" select="$charPos"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:variable name="tokenNumber">
									<xsl:call-template name="character-to-number">
										<xsl:with-param name="character" select="$token"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:call-template name="translate-cell-expression">
									<xsl:with-param name="columnPos" select="$columnPos"/>
									<xsl:with-param name="rowPos" select="$rowPos"/>
									<xsl:with-param name="targetColumnPos" select="$targetColumnPos + $multiplier * number($tokenNumber)"/>
									<xsl:with-param name="targetRowPos" select="$targetRowPos"/>
									<xsl:with-param name="digitPos" select="$digitPos"/>
									<xsl:with-param name="charPos" select="$charPos + 1"/>
									<!-- removing the last character-->
									<xsl:with-param name="expression" select="substring($expression, 1, $expLength - 1)"/>
									<xsl:with-param name="isRow" select="false()"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>C</xsl:text>
						<xsl:if test="$targetColumnPos != $columnPos">
							<xsl:text>[</xsl:text>
							<xsl:value-of select="$targetColumnPos - $columnPos"/>
							<xsl:text>]</xsl:text>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<!-- the formular seems wrong, should give out the remaining part here -->
				<xsl:value-of select="$expression"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="PresentationCommonRule">
		<!--<???:????????????_B666>
				<xsl:value-of select="$uofUnit"/>
			</???:????????????_B666>-->
		<!--
 alert 2011-01-24 begin
		<xsl:variable name="layout_name" select="office:master-styles/style:master-page/@style:page-layout-name"/>
		<xsl:apply-templates select="office:automatic-styles/style:page-layout[@style:name = $layout_name]" mode="sdstyle"/>-->
		<??????:???????????????_B670>
			<xsl:for-each select="office:master-styles/style:master-page |office:master-styles/style:handout-master">
				<xsl:variable name="layout_name" select="@style:page-layout-name"/>
				<xsl:apply-templates mode="sdstyle" select="../../office:automatic-styles/style:page-layout[@style:name = $layout_name]"/>
			</xsl:for-each>
		</??????:???????????????_B670>
		<xsl:if test="office:styles/style:presentation-page-layout">
			<??????:???????????????_B651>
				<xsl:apply-templates mode="sdstyle" select="office:styles/style:presentation-page-layout"/>
			</??????:???????????????_B651>
		</xsl:if>
		<xsl:for-each select="office:settings/config:config-item-set/config:config-item-map-indexed[@config:name='Views']/config:config-item-map-entry">
			<xsl:call-template name="View"/>
		</xsl:for-each>
		<??????:???????????????_B640>
			<xsl:call-template name="headerandfooterset"/>
		</??????:???????????????_B640>
		<??????:????????????_B653>
			<xsl:apply-templates select="office:body/office:presentation/presentation:settings"/>
		</??????:????????????_B653>
		<!--UOF2.0?????????????????????-->
		<!--???:??????????????? uof:locID="p0131">
				<xsl:for-each select="office:master-styles/style:master-page">
					<xsl:call-template name="TextStyleSet"/>
				</xsl:for-each>
			</???:???????????????-->
	</xsl:template>
	<xsl:template match="style:page-layout" mode="sdstyle">
		<xsl:element name="??????:????????????_B638">
			<xsl:attribute name="?????????_B671"><xsl:value-of select="@style:name"/></xsl:attribute>
			<xsl:attribute name="??????_B672"><xsl:value-of select="@style:name"/></xsl:attribute>
			<xsl:for-each select="style:page-layout-properties">
				<xsl:element name="???:??????_6BDD">
					<xsl:variable name="height">
						<xsl:value-of select="@fo:page-height"/>
					</xsl:variable>
					<xsl:variable name="width">
						<xsl:value-of select="@fo:page-width"/>
					</xsl:variable>
					<xsl:attribute name="???_C604"><xsl:value-of select="fun:Convert2uofUnit($height)"/></xsl:attribute>
					<xsl:attribute name="???_C605"><xsl:value-of select="fun:Convert2uofUnit($width)"/></xsl:attribute>
					<!--????????????-->
					<!--xsl:choose>
						<xsl:when test="$height='29.7cm' and $width='42cm'">
							<xsl:attribute name="??????_C60C">A3</xsl:attribute>
						</xsl:when>
						<xsl:when test="$height='21cm' and $width='29.7cm'">
							<xsl:attribute name="??????_C60C">A4</xsl:attribute>
						</xsl:when>
						<xsl:when test="$height='14.8cm' and $width='21cm'">
							<xsl:attribute name="??????_C60C">A5</xsl:attribute>
						</xsl:when>
						<xsl:when test="$height='25cm' and $width='35.3cm'">
							<xsl:attribute name="??????_C60C">B4</xsl:attribute>
						</xsl:when>
						<xsl:when test="$height='17.6cm' and $width='25cm'">
							<xsl:attribute name="??????_C60C">B5</xsl:attribute>
						</xsl:when>
						<xsl:when test="$height='12.5cm' and $width='17.6cm'">
							<xsl:attribute name="??????_C60C">B6</xsl:attribute>
						</xsl:when>
					</xsl:choose-->
				</xsl:element>
				<xsl:element name="???:?????????_6BDE">
					<xsl:attribute name="???_C608"><xsl:value-of select="fun:Convert2uofUnit(@fo:margin-left)"/></xsl:attribute>
					<xsl:attribute name="???_C609"><xsl:value-of select="fun:Convert2uofUnit(@fo:margin-top)"/></xsl:attribute>
					<xsl:attribute name="???_C60A"><xsl:value-of select="fun:Convert2uofUnit(@fo:margin-right)"/></xsl:attribute>
					<xsl:attribute name="???_C60B"><xsl:value-of select="fun:Convert2uofUnit(@fo:margin-bottom)"/></xsl:attribute>
				</xsl:element>
				<xsl:variable name="PageNumberFormat">
					<xsl:value-of select="/office:document/office:settings/config:config-item-set/config:config-item[@config:name='PageNumberFormat']"/>
				</xsl:variable>
				<xsl:if test="not($PageNumberFormat='5')">
					<xsl:element name="???:????????????_6BDF">
						<xsl:choose>
							<xsl:when test="$PageNumberFormat='0'">upper-letter</xsl:when>
							<xsl:when test="$PageNumberFormat='1'">lower-letter</xsl:when>
							<xsl:when test="$PageNumberFormat='2'">upper-roman</xsl:when>
							<xsl:when test="$PageNumberFormat='3'">lower-roman</xsl:when>
							<xsl:when test="$PageNumberFormat='4'">decimal</xsl:when>
						</xsl:choose>
					</xsl:element>
				</xsl:if>
				<xsl:element name="???:????????????_6BE1">
					<xsl:choose>
						<xsl:when test="@style:print-orientation">
							<xsl:value-of select="@style:print-orientation"/>
						</xsl:when>
						<xsl:otherwise>portrait</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template match="style:presentation-page-layout" mode="sdstyle">
		<??????:????????????_B652>
			<xsl:attribute name="?????????_6B0D"><xsl:value-of select="@style:name"/></xsl:attribute>
			<xsl:attribute name="??????_6BE3"><xsl:value-of select="@style:name"/></xsl:attribute>
			<???:????????????_6BE2>
				<xsl:variable name="layout" select="substring-after(@style:name,'T')"/>
				<xsl:variable name="uoflayout">
					<xsl:choose>
						<xsl:when test="$layout='0'">title-subtitle</xsl:when>
						<xsl:when test="$layout='1'">title-body</xsl:when>
						<xsl:when test="$layout='19'">only-title</xsl:when>
						<xsl:when test="$layout='12'">column-2-rows</xsl:when>
						<xsl:when test="$layout='15'">2-rows-column</xsl:when>
						<xsl:when test="$layout='16'">2-columns-row</xsl:when>
						<xsl:when test="$layout='17'">2-rows</xsl:when>
						<xsl:when test="$layout='18'">4-objects</xsl:when>
						<xsl:when test="$layout='27'">v-2-rows</xsl:when>
						<xsl:when test="$layout='28'">v-title-body</xsl:when>
						<xsl:when test="$layout='29'">big-object</xsl:when>
						<xsl:when test="$layout='30'">2-columns</xsl:when>
						<xsl:when test="$layout='26'">handout</xsl:when>
						<!--'21'??????note-page???uof???-->
						<xsl:otherwise>title-body</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
			</???:????????????_6BE2>
			<xsl:for-each select="presentation:placeholder">
				<xsl:call-template name="UOFAnchor">
					<!--xsl:with-param name="anchor_name1" select="'uof:??????_C644'"/-->
				</xsl:call-template>
			</xsl:for-each>
		</??????:????????????_B652>
	</xsl:template>
	<xsl:template name="View">
		<xsl:variable name="PageKind">
			<xsl:value-of select="config:config-item[@config:name='PageKind']"/>
		</xsl:variable>
		<xsl:variable name="ViewId">
			<xsl:value-of select="config:config-item[@config:name='ViewId']"/>
		</xsl:variable>
		<xsl:variable name="modeStandard">
			<xsl:value-of select="config:config-item[@config:name='EditModeStandard']"/>
		</xsl:variable>
		<xsl:variable name="modeNotes">
			<xsl:value-of select="config:config-item[@config:name='EditModeNotes']"/>
		</xsl:variable>
		<xsl:variable name="viewtype">
			<xsl:choose>
				<xsl:when test="$PageKind='0' and $ViewId='view2'">sort</xsl:when>
				<xsl:when test="$PageKind='2' and $ViewId='view1'">handout-master</xsl:when>
				<xsl:when test="$PageKind='1' and $ViewId='view1' and $modeNotes='0'">note-page</xsl:when>
				<xsl:when test="$PageKind='1' and $ViewId='view1' and $modeNotes='1'">note-master</xsl:when>
				<xsl:when test="$PageKind='0' and $ViewId='view1' and $modeStandard='1'">slide-master</xsl:when>
				<xsl:when test="$PageKind='0' and $ViewId='view1'">normal</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<??????:????????????_B639>
			<xsl:if test="$viewtype != ''">
				<xsl:element name="??????:??????_B63A">
					<xsl:value-of select="$viewtype"/>
				</xsl:element>
			</xsl:if>
			<xsl:element name="??????:??????????????????_B63B">0</xsl:element>
			<xsl:element name="??????:???????????????_B63C">
				<xsl:attribute name="??????_B63D">100</xsl:attribute>
				<xsl:attribute name="??????_B63E">100</xsl:attribute>
			</xsl:element>
		</??????:????????????_B639>
		<xsl:variable name="VisibleAreaWidth">
			<xsl:value-of select="config:config-item[@config:name='VisibleAreaWidth']"/>
		</xsl:variable>
		<xsl:variable name="VisibleArea" select="floor((13997 div number($VisibleAreaWidth))*100)"/>
		<xsl:if test="$VisibleArea">
			<??????:????????????_B63F>
				<xsl:value-of select="$VisibleArea"/>
			</??????:????????????_B63F>
		</xsl:if>
	</xsl:template>
	<xsl:template name="TextStyleSet">
		<??????:????????????_9914>
			<xsl:variable name="mastername" select="@style:name"/>
			<xsl:variable name="autonum">
				<xsl:value-of select="key('Style',concat($mastername,'-outline1'))/style:graphic-properties/text:list-style/@style:name"/>
			</xsl:variable>
			<xsl:attribute name="?????????_9909"><xsl:value-of select="concat($mastername,'_styles')"/></xsl:attribute>
			<xsl:attribute name="??????_990A">????????????</xsl:attribute>
			<xsl:for-each select="key('Style',concat($mastername,'-title'))[1]|key('Style',concat($mastername,'-outline1'))[1]|key('Style',concat($mastername,'-outline2'))[1]|key('Style',concat($mastername,'-outline3'))[1]|key('Style',concat($mastername,'-outline4'))[1]|key('Style',concat($mastername,'-outline5'))[1]|key('Style',concat($mastername,'-outline6'))[1]|key('Style',concat($mastername,'-outline7'))[1]|key('Style',concat($mastername,'-outline8'))[1]|key('Style',concat($mastername,'-outline9'))[1]">
				<xsl:element name="??????:????????????_9912">
					<xsl:attribute name="?????????_4100"><xsl:value-of select="@style:name"/></xsl:attribute>
					<xsl:attribute name="??????_4101"><xsl:value-of select="@style:name"/></xsl:attribute>
					<xsl:attribute name="??????_4102">auto</xsl:attribute>
					<xsl:if test="@style:class">
						<xsl:attribute name="??????_4103"><xsl:value-of select="@style:class"/></xsl:attribute>
					</xsl:if>
					<xsl:if test="@style:parent-style-name">
						<xsl:attribute name="???????????????_4104"><xsl:value-of select="@style:parent-style-name"/></xsl:attribute>
					</xsl:if>
					<xsl:if test="style:paragraph-properties">
						<xsl:call-template name="UofParagraphStyle">
							<!--????????????????????????????????? ???-outline1????????????-->
							<xsl:with-param name="autonum">
								<xsl:if test="contains(@style:name,'-outline')">
									<xsl:value-of select="$autonum"/>
								</xsl:if>
							</xsl:with-param>
							<xsl:with-param name="level">
								<xsl:choose>
									<xsl:when test="substring-after(@style:name,'-outline')">
										<xsl:value-of select="substring-after(@style:name,'-outline')"/>
									</xsl:when>
									<xsl:otherwise>0</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="style:text-properties">
						<???:?????????_4158>
							<xsl:call-template name="UOFTextStyle"/>
						</???:?????????_4158>
					</xsl:if>
				</xsl:element>
			</xsl:for-each>
		</??????:????????????_9914>
	</xsl:template>
	<xsl:template match="presentation:settings">
		<xsl:choose>
			<!--end-node???????????????????????????????????????????????????????????????-->
			<!--?????????????????????draw:page?????????id???????????????????????????????????????????????????/@???:??????????????????-->
			<xsl:when test="@presentation:start-page and @presentation:end-page">
				<??????:???????????????_B654>
					<xsl:attribute name="?????????_B655">customList</xsl:attribute>
					<xsl:attribute name="???????????????_B657">false</xsl:attribute>
					<xsl:variable name="start" select="@presentation:start-page"/>
					<xsl:variable name="end" select="@presentation:end-page"/>
					<xsl:value-of select="concat($start,' ',$end)"/>
				</??????:???????????????_B654>
			</xsl:when>
			<xsl:when test="presentation:show">
				<xsl:for-each select="presentation:show">
					<??????:???????????????_B654>
						<xsl:attribute name="??????_B656">???????????????</xsl:attribute>
						<xsl:attribute name="?????????_B655"><xsl:value-of select="@presentation:name"/></xsl:attribute>
						<xsl:attribute name="???????????????_B657">true</xsl:attribute>
						<xsl:value-of select="normalize-space(translate(@presentation:pages,',',' '))"/>
					</??????:???????????????_B654>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>
		<xsl:variable name="showlist">
			<xsl:choose>
				<xsl:when test="@presentation:show">
					<xsl:value-of select="@presentation:show"/>
				</xsl:when>
				<xsl:when test="@presentation:start-page and @presentation:end-page">
					<xsl:value-of select="'customList'"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="$showlist != ''">
			<??????:????????????_B658>
				<xsl:value-of select="$showlist"/>
				<!--xsl:if test="not($showlist='')">
					<xsl:attribute name="???:????????????" select="$showlist"/>
				</xsl:if-->
			</??????:????????????_B658>
		</xsl:if>
		<??????:??????????????????_B659>
			<xsl:choose>
				<xsl:when test="@presentation:full-screen='false'">false</xsl:when>
				<xsl:otherwise>true</xsl:otherwise>
			</xsl:choose>
		</??????:??????????????????_B659>
		<??????:??????????????????_B65A>
			<xsl:choose>
				<xsl:when test="@presentation:endless='true'">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</??????:??????????????????_B65A>
		<xsl:if test="@presentation:pause">
			<xsl:variable name="hms" select="substring-after(@presentation:pause,'PT')"/>
			<??????:????????????_B65B>
				<xsl:value-of select="concat('P0Y0M0DT',$hms)"/>
			</??????:????????????_B65B>
		</xsl:if>
		<??????:??????????????????_B65C>
			<xsl:choose>
				<xsl:when test="@presentation:force-manual='true'">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</??????:??????????????????_B65C>
		<??????:????????????????????????_B65D>
			<xsl:choose>
				<xsl:when test="@presentation:start-with-navigator='true'">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</??????:????????????????????????_B65D>
		<??????:??????????????????_B65E>
			<xsl:choose>
				<xsl:when test="@presentation:animations='disabled'">false</xsl:when>
				<xsl:otherwise>true</xsl:otherwise>
			</xsl:choose>
		</??????:??????????????????_B65E>
		<??????:??????????????????_B65F>
			<xsl:choose>
				<xsl:when test="@presentation:stay-on-top='true'">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</??????:??????????????????_B65F>
		<!--??????????????????????????????-->
		<xsl:if test="/office:document/office:meta/dc:description = 'backgroudvoice'">
			<xsl:for-each select="/office:document/office:body/office:presentation/draw:page[1]/anim:par/anim:par/anim:audio[1]">
				<xsl:call-template name="AudioSound"/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="headerandfooterset">
		<xsl:variable name="drawpage1" select="/office:document/office:body/office:presentation/draw:page[1]"/>
		<xsl:variable name="drawpage2" select="/office:document/office:body/office:presentation/draw:page[2]"/>
		<xsl:variable name="footerandheaderProp" select="key('Style',$drawpage1/@draw:style-name)/style:drawing-page-properties"/>
		<xsl:variable name="footerandheaderProp2" select="key('Style',$drawpage2/@draw:style-name)/style:drawing-page-properties"/>
		<xsl:variable name="notefooterandheaderProp" select="key('Style',$drawpage1/presentation:notes/@draw:style-name)/style:drawing-page-properties"/>
		<xsl:variable name="ftname" select="$drawpage1/@presentation:use-footer-name"/>
		<xsl:variable name="dtname" select="$drawpage1/@presentation:use-date-time-name"/>
		<xsl:variable name="ft2name" select="$drawpage2/@presentation:use-footer-name"/>
		<xsl:variable name="dt2name" select="$drawpage2/@presentation:use-date-time-name"/>
		<xsl:variable name="noteftname" select="$drawpage1/presentation:notes/@presentation:use-footer-name"/>
		<xsl:variable name="notedtname" select="$drawpage1/presentation:notes/@presentation:use-date-time-name"/>
		<xsl:variable name="notehdname" select="$drawpage1/presentation:notes/@presentation:use-header-name"/>
		<xsl:if test="$ftname and $footerandheaderProp/@presentation:display-footer='true' or $dtname and  $footerandheaderProp/@presentation:display-date-time='true'or $footerandheaderProp/@presentation:display-page-number='true' or $footerandheaderProp2/@presentation:display-footer='true' and $ft2name or  $drawpage2/@presentation:use-date-time-name and $footerandheaderProp2/@presentation:display-date-time='true' or $footerandheaderProp2/@presentation:display-page-number='true'">
			<??????:?????????_B641>
				<xsl:attribute name="??????_B645">slide</xsl:attribute>
				<xsl:attribute name="?????????_B646">LOGO</xsl:attribute>
				<xsl:choose>
					<xsl:when test="$footerandheaderProp/@presentation:display-footer='false' and $footerandheaderProp/@presentation:display-page-number='false' and $footerandheaderProp/@presentation:display-date-time='false'">
						<xsl:attribute name="??????????????????????????????_B64B">true</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="??????????????????????????????_B64B">false</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:attribute name="??????????????????_B647"><xsl:choose><xsl:when test="$footerandheaderProp/@presentation:display-footer='true' or $footerandheaderProp2/@presentation:display-footer='true'"><xsl:value-of select="'true'"/></xsl:when><xsl:otherwise><xsl:value-of select="'false'"/></xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:attribute name="???????????????????????????_B64A"><xsl:choose><xsl:when test="$footerandheaderProp/@presentation:display-page-number='true' or $footerandheaderProp2/@presentation:display-page-number='true'"><xsl:value-of select="'true'"/></xsl:when><xsl:otherwise><xsl:value-of select="'false'"/></xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:for-each select="office:body/office:presentation">
					<xsl:choose>
						<xsl:when test="presentation:date-time-decl[@presentation:source='current-date'][@presentation:name=$dtname]">
							<xsl:attribute name="?????????????????????????????????_B649">true</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="?????????????????????????????????_B649">false</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="not(presentation:date-time-decl) or ($footerandheaderProp/@presentation:display-date-time='false' and $footerandheaderProp2/@presentation:display-date-time='false')">
							<xsl:attribute name="???????????????????????????_B647">false</xsl:attribute>
						</xsl:when>
						<xsl:when test="(presentation:date-time-decl[@presentation:source='fixed']) and ($footerandheaderProp/@presentation:display-date-time='true') or (presentation:date-time-decl[@presentation:source='fixed']) and ($footerandheaderProp2/@presentation:display-date-time='true')">
							<xsl:attribute name="???????????????????????????_B647">true</xsl:attribute>
							<xsl:element name="??????:????????????????????????_B643">
								<xsl:value-of select="presentation:date-time-decl"/>
							</xsl:element>
						</xsl:when>
						<xsl:when test="($footerandheaderProp/@presentation:display-date-time='true') or ($footerandheaderProp2/@presentation:display-date-time='true')">
							<xsl:attribute name="???????????????????????????_B647">true</xsl:attribute>
							<xsl:element name="??????:????????????????????????_B643">
							</xsl:element>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="presentation:footer-decl">
							<xsl:element name="??????:??????_B644">
								<xsl:value-of select="presentation:footer-decl[@presentation:name=$ftname]"/>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise/>
					</xsl:choose>
				</xsl:for-each>
			</??????:?????????_B641>
		</xsl:if>
		<xsl:if test="$noteftname and $notefooterandheaderProp/@presentation:display-footer='true' or $notehdname and $notefooterandheaderProp/@presentation:display-header='true' or $notedtname and $notefooterandheaderProp/@presentation:display-date-time='true'or $notefooterandheaderProp/@presentation:display-page-number='true'">
			<??????:???????????????_B64C>
				<xsl:attribute name="?????????_B66F">notefooterheader</xsl:attribute>
				<xsl:attribute name="??????????????????_B648"><xsl:choose><xsl:when test="$notefooterandheaderProp/@presentation:display-footer='true'"><xsl:value-of select="'true'"/></xsl:when><xsl:otherwise><xsl:value-of select="'false'"/></xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:attribute name="??????????????????_B64F"><xsl:choose><xsl:when test="$notefooterandheaderProp/@presentation:display-header='true'"><xsl:value-of select="'true'"/></xsl:when><xsl:otherwise><xsl:value-of select="'false'"/></xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:attribute name="??????????????????_B650"><xsl:choose><xsl:when test="$notefooterandheaderProp/@presentation:display-page-number='true'"><xsl:value-of select="'true'"/></xsl:when><xsl:otherwise><xsl:value-of select="'false'"/></xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:for-each select="office:body/office:presentation">
					<xsl:choose>
						<xsl:when test="presentation:date-time-decl[@presentation:source='current-date'] and $notefooterandheaderProp/@presentation:display-date-time='true'">
							<xsl:attribute name="?????????????????????????????????_B649">true</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="?????????????????????????????????_B649">false</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="not(presentation:date-time-decl) or ($notefooterandheaderProp/@presentation:display-date-time='false')">
							<xsl:attribute name="???????????????????????????_B647">false</xsl:attribute>
						</xsl:when>
						<xsl:when test="(presentation:date-time-decl[@presentation:name=$notedtname]) and ($notefooterandheaderProp/@presentation:display-date-time='true')">
							<xsl:attribute name="???????????????????????????_B647">true</xsl:attribute>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="presentation:header-decl">
							<xsl:element name="???:??????_B64D">
								<xsl:value-of select="presentation:header-decl[@presentation:name=$notehdname]"/>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise/>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="presentation:footer-decl">
							<xsl:element name="???:??????_B644">
								<xsl:value-of select="presentation:footer-decl[@presentation:name=$noteftname]"/>
							</xsl:element>
						</xsl:when>
						<xsl:otherwise/>
					</xsl:choose>
				</xsl:for-each>
			</??????:???????????????_B64C>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PresentationBody">
		<???:?????????_6C0C>
			<xsl:for-each select="office:master-styles">
				<xsl:apply-templates select="style:handout-master"/>
				<xsl:apply-templates select="style:master-page"/>
				<xsl:apply-templates select="style:master-page/presentation:notes"/>
			</xsl:for-each>
		</???:?????????_6C0C>
		<???:????????????_6C0E>
			<xsl:apply-templates select="office:body/office:presentation/draw:page"/>
		</???:????????????_6C0E>
	</xsl:template>
	<xsl:template match="style:handout-master">
		<???:??????_6C0D ??????_6BE9="handout??????" ??????_6BEA="handout">
			<xsl:attribute name="?????????_6BE8"><xsl:value-of select="concat('handout-',parent::style:master-page/@style:name)"/></xsl:attribute>
			<!--xsl:attribute name="??????????????????"><xsl:value-of select="@style:page-layout-name"/></xsl:attribute-->
			<xsl:attribute name="??????????????????_6C18"><xsl:value-of select="@style:page-layout-name"/></xsl:attribute>
			<xsl:if test="@presentation:presentation-page-layout-name">
				<xsl:attribute name="??????????????????_6BEC"><xsl:value-of select="@presentation:presentation-page-layout-name"/></xsl:attribute>
			</xsl:if>
			<xsl:for-each select="child::node()">
				<xsl:if test="substring-before(name(),':')='draw'">
					<xsl:call-template name="UOFAnchor">
						<!--xsl:with-param name="anchor_name1" select="'uof:??????_C644'"/-->
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
		</???:??????_6C0D>
	</xsl:template>
	<xsl:template name="SurpassOutline">
		<xsl:param name="MasterOutlineName"/>
		<xsl:choose>
			<xsl:when test="@presentation:class = 'outline'">
				<xsl:choose>
					<xsl:when test="@presentation:style-name = $MasterOutlineName">
						<xsl:value-of select="'false'"/>
					</xsl:when>
					<xsl:when test="preceding-sibling::*[@presentation:class = 'outline']">
						<xsl:value-of select="'true'"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="following-sibling::*[@presentation:class = 'outline'][@presentation:style-name = $MasterOutlineName]">
								<xsl:value-of select="'true'"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'false'"/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="'false'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'false'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="style:master-page">
		<???:??????_6C0D ??????_6BE9="slide??????" ??????_6BEA="slide">
			<xsl:attribute name="?????????_6BE8"><xsl:value-of select="@style:name"/></xsl:attribute>
			<!--xsl:attribute name="??????????????????"><xsl:value-of select="@style:page-layout-name"/></xsl:attribute-->
			<xsl:attribute name="??????????????????_6C18"><xsl:value-of select="@style:page-layout-name"/></xsl:attribute>
			<xsl:if test="@presentation:presentation-page-layout-name">
				<xsl:attribute name="??????????????????_6BEC"><xsl:value-of select="@presentation:presentation-page-layout-name"/></xsl:attribute>
			</xsl:if>
			<xsl:attribute name="??????????????????_6BED"><xsl:value-of select="concat(@style:name,'_styles')"/></xsl:attribute>
			<xsl:variable name="MasterOutlineName" select="concat(@style:name, '-outline1')"/>
			<xsl:for-each select="child::node()">
				<xsl:choose>
					<xsl:when test="substring-before(name(),':')='draw'">
						<xsl:variable name="IsSurpassOutline">
							<xsl:call-template name="SurpassOutline">
								<xsl:with-param name="MasterOutlineName" select="$MasterOutlineName"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:if test="$IsSurpassOutline != 'true'">
							<xsl:call-template name="UOFAnchor">
								<!--xsl:with-param name="anchor_name1" select="'uof:??????_C644'"/-->
							</xsl:call-template>
						</xsl:if>
					</xsl:when>
					<xsl:when test="name()= 'anim:par' and child::anim:seq">
						<???:??????_6B1A>
							<xsl:apply-templates select="anim:seq"/>
						</???:??????_6B1A>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<xsl:variable name="stylename">
				<xsl:value-of select="@draw:style-name"/>
			</xsl:variable>
			<!--@draw:fill='solid'?????????????????? ?????????????????????-->
			<xsl:for-each select="key('Style',$stylename)/style:drawing-page-properties">
				<xsl:if test="@draw:fill='color' or @draw:fill='bitmap' or @draw:fill='hatch'or @draw:fill='gradient' or (@draw:fill='solid' and (@fo:background-color or @draw:fill-color))or @draw:fill-hatch-name">
					<???:??????_6B2C>
						<xsl:call-template name="???:??????-graph">
							<xsl:with-param name="graphproperty" select="."/>
						</xsl:call-template>
					</???:??????_6B2C>
				</xsl:if>
			</xsl:for-each>
		</???:??????_6C0D>
	</xsl:template>
	<xsl:template match="presentation:notes">
		<???:??????_6C0D ??????_6BE9="notes??????" ??????_6BEA="notes">
			<xsl:attribute name="?????????_6BE8"><xsl:value-of select="concat('note-',parent::style:master-page/@style:name)"/></xsl:attribute>
			<!--xsl:attribute name="??????????????????"><xsl:value-of select="@style:page-layout-name"/></xsl:attribute-->
			<xsl:attribute name="??????????????????_6C18"><xsl:value-of select="@style:page-layout-name"/></xsl:attribute>
			<xsl:if test="@presentation:presentation-page-layout-name">
				<xsl:attribute name="??????????????????_6BEC"><xsl:value-of select="@presentation:presentation-page-layout-name"/></xsl:attribute>
			</xsl:if>
			<xsl:for-each select="child::node()">
				<xsl:if test="substring-before(name(),':')='draw'">
					<xsl:call-template name="UOFAnchor">
						<!--xsl:with-param name="anchor_name1" select="'uof:??????_C644'"/-->
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
		</???:??????_6C0D>
	</xsl:template>
	<xsl:template match="draw:page">
		<???:?????????_6C0F>
			<xsl:variable name="stylename">
				<xsl:value-of select="@draw:style-name"/>
			</xsl:variable>
			<xsl:if test="@draw:display-name">
				<xsl:attribute name="??????_6B0B"><xsl:value-of select="@draw:display-name"/></xsl:attribute>
			</xsl:if>
			<xsl:attribute name="?????????_6B0A"><xsl:value-of select="@draw:name"/></xsl:attribute>
			<xsl:attribute name="????????????_6B26"><xsl:value-of select="@draw:master-page-name"/></xsl:attribute>
			<xsl:if test="@presentation:presentation-page-layout-name">
				<xsl:attribute name="??????????????????_6B27"><xsl:value-of select="@presentation:presentation-page-layout-name"/></xsl:attribute>
			</xsl:if>
			<xsl:for-each select="key('Style',$stylename)/style:drawing-page-properties">
				<xsl:choose>
					<xsl:when test="@presentation:visibility = 'hidden'">
						<xsl:attribute name="????????????_6B28">false</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="????????????_6B28">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="@presentation:background-visible">
					<xsl:attribute name="??????????????????_6B29"><xsl:value-of select="@presentation:background-visible"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="@presentation:background-objects-visible">
					<xsl:attribute name="????????????????????????_6B2A"><xsl:value-of select="@presentation:background-objects-visible"/></xsl:attribute>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="child::node()">
				<xsl:choose>
					<xsl:when test="substring-before(name(),':')='draw'">
						<xsl:call-template name="UOFAnchor">
							<!--xsl:with-param name="anchor_name1" select="'uof:??????_C644'"/-->
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="name()= 'anim:par' and child::anim:seq">
						<???:??????_6B1A>
							<xsl:apply-templates select="anim:seq"/>
						</???:??????_6B1A>
					</xsl:when>
					<xsl:when test="name()='presentation:notes'">
						<xsl:apply-templates mode="page" select="."/>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="key('Style',$stylename)/style:drawing-page-properties">
				<xsl:if test="@draw:fill='color' or @draw:fill='bitmap' or @draw:fill='hatch'or @draw:fill='gradient' or (@draw:fill='solid' and (@fo:background-color or @draw:fill-color))or @draw:fill-hatch-name">
					<???:??????_6B2C>
						<xsl:call-template name="???:??????-graph">
							<xsl:with-param name="graphproperty" select="."/>
						</xsl:call-template>
					</???:??????_6B2C>
				</xsl:if>
			</xsl:for-each>
			<xsl:call-template name="slideswitch">
				<xsl:with-param name="stylename" select="$stylename"/>
			</xsl:call-template>
		</???:?????????_6C0F>
	</xsl:template>
	<xsl:template name="Fonts_presentation">
		<??????:?????????_990C>
			<??????:????????????_990D ??????_9903="Times New Roman" ?????????_9902="Times_New_Roman">
				<??????:?????????_9900>roman</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="??????" ?????????_9902="??????">
				<??????:?????????_9900>roman</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="????????????" ?????????_9902="????????????">
				<??????:?????????_9900>roman</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="StarSymbol" ?????????_9902="StarSymbol">
				<??????:?????????_9900>auto</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="OpenSymbol" ?????????_9902="OpenSymbol">
				<??????:?????????_9900>auto</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="WingDings" ?????????_9902="WingDings">
				<??????:?????????_9900>decorative</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="StarBats" ?????????_9902="StarBats">
				<??????:?????????_9900>auto</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="??????_GB2312" ?????????_9902="??????_GB2312">
				<??????:?????????_9900>swiss</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="??????_GB2312" ?????????_9902="??????_GB2312">
				<??????:?????????_9900>roman</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="??????" ?????????_9902="??????">
				<??????:?????????_9900>roman</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="????????????" ?????????_9902="????????????">
				<??????:?????????_9900>script</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="Arial" ?????????_9902="Arial">
				<??????:?????????_9900>swiss</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="Wingdings" ?????????_9902="Wingdings">
				<??????:?????????_9900>auto</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="Verdana" ?????????_9902="Verdana">
				<??????:?????????_9900>auto</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="????????????" ?????????_9902="????????????">
				<??????:?????????_9900>script</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="????????????" ?????????_9902="????????????">
				<??????:?????????_9900>script</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="????????????" ?????????_9902="????????????">
				<??????:?????????_9900>script</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="????????????" ?????????_9902="????????????">
				<??????:?????????_9900>roman</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
			<??????:????????????_990D ??????_9903="????????????" ?????????_9902="????????????">
				<??????:?????????_9900>roman</??????:?????????_9900>
				<??????:???????????????_9901>auto</??????:???????????????_9901>
			</??????:????????????_990D>
		</??????:?????????_990C>
	</xsl:template>
	<xsl:template name="slideswitch">
		<xsl:param name="stylename"/>
		<???:??????_6B1F>
			<xsl:choose>
				<xsl:when test="anim:par/anim:par/anim:transitionFilter">
					<xsl:for-each select="anim:par/anim:par/anim:transitionFilter">
						<xsl:variable name="duration">
							<xsl:value-of select="@smil:dur"/>
						</xsl:variable>
						<xsl:element name="???:??????_6B21">
							<xsl:choose>
								<xsl:when test="$duration = '3s'">slow</xsl:when>
								<xsl:when test="$duration = '2s'">middle</xsl:when>
								<xsl:when test="$duration = '1s'">fast</xsl:when>
								<xsl:otherwise>middle</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
						<xsl:call-template name="Switchtype"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="key('Style',$stylename)/style:drawing-page-properties">
						<xsl:element name="???:??????_6B21">
							<xsl:choose>
								<xsl:when test="@presentation:transition-speed='slow'">slow</xsl:when>
								<xsl:when test="@presentation:transition-speed='fast'">fast</xsl:when>
								<xsl:otherwise>middle</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
						<xsl:call-template name="Switchtype"/>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="anim:par/anim:par/anim:command/@anim:command = 'stop-audio'">
					<???:??????_6B22 ???????????????_C631="stop previous sound"/>
				</xsl:when>
				<xsl:when test="anim:par/anim:par/anim:audio">
					<xsl:for-each select="anim:par/anim:par/anim:audio[1]">
						<xsl:call-template name="AudioSound"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="key('Style',$stylename)/style:drawing-page-properties/presentation:sound">
						<xsl:call-template name="AudioSound"/>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:for-each select="key('Style',$stylename)/style:drawing-page-properties">
				<???:??????_6B23>
					<???:????????????_6B24>
						<xsl:choose>
							<xsl:when test="@presentation:transition-type='automatic'">false</xsl:when>
							<xsl:otherwise>true</xsl:otherwise>
						</xsl:choose>
					</???:????????????_6B24>
					<xsl:if test="@presentation:duration">
						<???:????????????_6B25>
							<xsl:call-template name="aDuration">
								<xsl:with-param name="duration" select="@presentation:duration"/>
							</xsl:call-template>
						</???:????????????_6B25>
					</xsl:if>
				</???:??????_6B23>
			</xsl:for-each>
		</???:??????_6B1F>
	</xsl:template>
	<xsl:template name="Switchtype">
		<xsl:variable name="type">
			<xsl:value-of select="@smil:type"/>
		</xsl:variable>
		<xsl:variable name="subtype">
			<xsl:value-of select="@smil:subtype"/>
		</xsl:variable>
		<xsl:variable name="animtype">
			<xsl:choose>
				<xsl:when test="$type='irisWipe' and $subtype='rectangle' and @smil:direction='reverse'">box in</xsl:when>
				<xsl:when test="$type='irisWipe' and $subtype='rectangle'">box out</xsl:when>
				<xsl:when test="$type='checkerBoardWipe' and $subtype='across'">checkerboard across</xsl:when>
				<xsl:when test="$type='checkerBoardWipe' and $subtype='down'">checkerboard down</xsl:when>
				<xsl:when test="$type='pushWipe' and $subtype='combHorizontal'">comb horizontal</xsl:when>
				<xsl:when test="$type='pushWipe' and $subtype='combVertical'">comb vertical</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromTop' and @smil:direction='reverse'">uncover down</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromRight' and @smil:direction='reverse'">uncover left</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromLeft' and @smil:direction='reverse'">uncover right</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromBottom' and @smil:direction='reverse'">uncover up</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromTopRight' and @smil:direction='reverse'">uncover left-down</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromBottomRight' and @smil:direction='reverse'">uncover left-up</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromTopLeft' and @smil:direction='reverse'">uncover right-down</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromBottomLeft' and @smil:direction='reverse'">uncover right-up</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromTop'">cover down</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromRight'">cover left</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromLeft'">cover right</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromBottom'">cover up</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromTopRight'">cover left-down</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromBottomRight'">cover left-up</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromTopLeft'">cover right-down</xsl:when>
				<xsl:when test="$type='slideWipe' and $subtype='fromBottomLeft'">cover right-up</xsl:when>
				<xsl:when test="$type='fade' and $subtype='fadeOverColor'">fade through black</xsl:when>
				<xsl:when test="$type='pushWipe' and $subtype='fromTop'">push down</xsl:when>
				<xsl:when test="$type='pushWipe' and $subtype='fromRight'">push left</xsl:when>
				<xsl:when test="$type='pushWipe' and $subtype='fromLeft'">push right</xsl:when>
				<xsl:when test="$type='pushWipe' and $subtype='fromBottom'">push up</xsl:when>
				<xsl:when test="$type='randomBarWipe' and $subtype='horizontal'">random bars horizontal</xsl:when>
				<xsl:when test="$type='randomBarWipe' and $subtype='vertical'">random bars vertical</xsl:when>
				<xsl:when test="$type='ellipseWipe' and $subtype='circle'">shape circle</xsl:when>
				<xsl:when test="$type='irisWipe' and $subtype='diamond'">shape diamond</xsl:when>
				<xsl:when test="$type='fourBoxWipe' and $subtype='cornersOut'">shape plus</xsl:when>
				<xsl:when test="$type='barnDoorWipe' and $subtype='horizontal' and @smil:direction='reverse'">split horizontal in</xsl:when>
				<xsl:when test="$type='barnDoorWipe' and $subtype='horizontal'">split horizontal out</xsl:when>
				<xsl:when test="$type='barnDoorWipe' and $subtype='vertical' and @smil:direction='reverse'">split vertical in</xsl:when>
				<xsl:when test="$type='barnDoorWipe' and $subtype='vertical'">split vertical out</xsl:when>
				<xsl:when test="$type='fanWipe' and $subtype='centerTop'">wedge</xsl:when>
				<xsl:when test="$type='pinWheelWipe' and $subtype='oneBlade'">wheel clockwise ??? 1 spoke</xsl:when>
				<xsl:when test="$type='pinWheelWipe' and $subtype='twoBladeVertical'">wheel clockwise ??? 2 spoke</xsl:when>
				<xsl:when test="$type='pinWheelWipe' and $subtype='threeBlade'">wheel clockwise ??? 3 spoke</xsl:when>
				<xsl:when test="$type='pinWheelWipe' and $subtype='fourBlade'">wheel clockwise ??? 4 spoke</xsl:when>
				<xsl:when test="$type='pinWheelWipe' and $subtype='eightBlade'">wheel clockwise ??? 8 spoke</xsl:when>
				<xsl:when test="$type='barWipe' and $subtype='leftToRight' and @smil:direction='reverse'">wipe left</xsl:when>
				<xsl:when test="$type='barWipe' and $subtype='leftToRight'">wipe right</xsl:when>
				<xsl:when test="$type='barWipe' and $subtype='topToBottom' and @smil:direction='reverse'">wipe up</xsl:when>
				<xsl:when test="$type='barWipe' and $subtype='topToBottom'">wipe down</xsl:when>
				<xsl:when test="$type='blindsWipe' and $subtype='vertical'">blinds vertical</xsl:when>
				<xsl:when test="$type='blindsWipe' and $subtype='horizontal'">blinds horizontal</xsl:when>
				<xsl:when test="$type='dissolve'">dissolve</xsl:when>
				<xsl:when test="$type='random'">random transition</xsl:when>
				<xsl:when test="$type='fade' and $subtype='crossfade'">fade smoothly</xsl:when>
				<xsl:when test="$type='waterfallWipe' and $subtype='horizontalLeft' and @smil:direction='reverse'">strips left-up</xsl:when>
				<xsl:when test="$type='waterfallWipe' and $subtype='horizontalLeft'">strips right-down</xsl:when>
				<xsl:when test="$type='waterfallWipe' and $subtype='horizontalRight' and @smil:direction='reverse'">strips right-up</xsl:when>
				<xsl:when test="$type='waterfallWipe' and $subtype='horizontalRight'">strips left-down</xsl:when>
				<xsl:otherwise>none</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:element name="???:??????_6B20">
			<xsl:value-of select="$animtype"/>
		</xsl:element>
	</xsl:template>
	<xsl:template name="AudioSound">
		<???:??????_6B22>
			<xsl:variable name="voicetype">
				<xsl:choose>
					<xsl:when test="contains(@xlink:href,'applause.wav')">applause</xsl:when>
					<xsl:when test="contains(@xlink:href,'arrow.wav')">arrow</xsl:when>
					<xsl:when test="contains(@xlink:href,'bomb.wav')">bomb</xsl:when>
					<xsl:when test="contains(@xlink:href,'breeze.wav')">breeze</xsl:when>
					<xsl:when test="contains(@xlink:href,'camera.wav')">camera</xsl:when>
					<xsl:when test="contains(@xlink:href,'cashregister.wav')">cash register</xsl:when>
					<xsl:when test="contains(@xlink:href,'chime.wav')">chime</xsl:when>
					<xsl:when test="contains(@xlink:href,'click.wav')">click</xsl:when>
					<xsl:when test="contains(@xlink:href,'coin.wav')">coin</xsl:when>
					<xsl:when test="contains(@xlink:href,'drumroll.wav')">drum roll</xsl:when>
					<xsl:when test="contains(@xlink:href,'explosion.wav')">explosion</xsl:when>
					<xsl:when test="contains(@xlink:href,'hammer.wav')">hammer</xsl:when>
					<xsl:when test="contains(@xlink:href,'laser.wav')">laser</xsl:when>
					<xsl:when test="contains(@xlink:href,'push.wav')">push</xsl:when>
					<xsl:when test="contains(@xlink:href,'suction.wav')">suction</xsl:when>
					<xsl:when test="contains(@xlink:href,'typewriter.wav')">typewriter</xsl:when>
					<xsl:when test="contains(@xlink:href,'voltage.wav')">voltage</xsl:when>
					<xsl:when test="contains(@xlink:href,'whoosh.wav')">whoosh</xsl:when>
					<xsl:when test="contains(@xlink:href,'wind.wav')">wind</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="$voicetype != ''">
					<xsl:attribute name="???????????????_C631"><xsl:value-of select="$voicetype"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="???????????????_C632"><xsl:value-of select="@xlink:href"/></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="@smil:repeatCount = 'indefinite'">
				<xsl:attribute name="??????????????????_C633">true</xsl:attribute>
			</xsl:if>
		</???:??????_6B22>
	</xsl:template>
	<xsl:template name="aDuration">
		<xsl:param name="duration"/>
		<xsl:value-of select="concat('PT',number(substring-before(substring-after($duration,'PT'),'H'))*3660+number(substring-before(substring-after($duration,'H'),'M'))*60+number(substring-before(substring-after($duration,'M'),'S')),'S')"/>
	</xsl:template>
	<xsl:template match="presentation:notes" mode="page">
		<???:???????????????_6B1D>
			<xsl:variable name="masterpagename">
				<xsl:value-of select="parent::*/@draw:master-page-name"/>
			</xsl:variable>
			<xsl:attribute name="??????????????????_6B2D"><xsl:value-of select="concat('note-',$masterpagename)"/></xsl:attribute>
			<xsl:for-each select="child::*">
				<xsl:if test="substring-before(name(),':')='draw'">
					<xsl:call-template name="UOFAnchor">
						<!--xsl:with-param name="anchor_name1" select="'uof:??????_C644'"/-->
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
			<xsl:call-template name="notePageAnchor">
				<xsl:with-param name="masterpagename" select="$masterpagename"/>
			</xsl:call-template>
			<xsl:for-each select="key('Style',@draw:style-name)/style:drawing-page-properties">
				<xsl:if test="@draw:fill='solid' and (@fo:background-color or @draw:fill-color) or @draw:fill = 'gradient' or @draw:fill = 'hatch' or @draw:fill = 'bitmap'">
					<???:??????_6B2C>
						<xsl:call-template name="???:??????-graph">
							<xsl:with-param name="graphproperty" select="."/>
						</xsl:call-template>
					</???:??????_6B2C>
				</xsl:if>
			</xsl:for-each>
		</???:???????????????_6B1D>
	</xsl:template>
	<xsl:template name="notePageAnchor">
		<xsl:param name="masterpagename"/>
		<xsl:if test="@presentation:use-footer-name and key('Style',@draw:style-name)/style:drawing-page-properties/@presentation:display-footer='true'">
			<xsl:call-template name="anchorAttr">
				<xsl:with-param name="anchorType" select="'footer'"/>
				<xsl:with-param name="placeChar" select="'footer'"/>
				<xsl:with-param name="masterpagename" select="$masterpagename"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="@presentation:use-date-time-name and key('Style',@draw:style-name)/style:drawing-page-properties/@presentation:display-date-time='true'">
			<xsl:call-template name="anchorAttr">
				<xsl:with-param name="anchorType" select="'date-time'"/>
				<xsl:with-param name="placeChar" select="'date'"/>
				<xsl:with-param name="masterpagename" select="$masterpagename"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="@presentation:use-header-name and key('Style',@draw:style-name)/style:drawing-page-properties/@presentation:display-header='true'">
			<xsl:call-template name="anchorAttr">
				<xsl:with-param name="anchorType" select="'header'"/>
				<xsl:with-param name="placeChar" select="'header'"/>
				<xsl:with-param name="masterpagename" select="$masterpagename"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="key('Style',@draw:style-name)/style:drawing-page-properties/@presentation:display-page-number='true'">
			<xsl:call-template name="anchorAttr">
				<xsl:with-param name="anchorType" select="'page-number'"/>
				<xsl:with-param name="placeChar" select="'number'"/>
				<xsl:with-param name="masterpagename" select="$masterpagename"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="anchorAttr">
		<xsl:param name="anchorType"/>
		<xsl:param name="placeChar"/>
		<xsl:param name="masterpagename"/>
		<xsl:for-each select="key('MasterPage',$masterpagename)/presentation:notes/draw:frame[@presentation:class = $anchorType]">
			<uof:??????_C644>
				<xsl:attribute name="x??????"><xsl:value-of select="substring-before(./@svg:x,'cm')"/></xsl:attribute>
				<xsl:attribute name="y??????"><xsl:value-of select="substring-before(./@svg:y,'cm')"/></xsl:attribute>
				<xsl:attribute name="??????"><xsl:value-of select="substring-before(./@svg:height,'cm')"/></xsl:attribute>
				<xsl:attribute name="??????"><xsl:value-of select="substring-before(./@svg:width,'cm')"/></xsl:attribute>
				<xsl:attribute name="????????????"><xsl:value-of select="generate-id()"/></xsl:attribute>
				<xsl:attribute name="?????????">false</xsl:attribute>
				<xsl:attribute name="?????????"><xsl:value-of select="$placeChar"/></xsl:attribute>
			</uof:??????_C644>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="anim:seq">
		<xsl:for-each select="anim:par">
			<xsl:for-each select="./anim:par">
				<xsl:apply-templates select="child::*"/>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="anim:par | anim:iterate">
		<???:??????_6B1B>
			<xsl:variable name="targetName">
				<xsl:variable name="targetName2">
					<xsl:value-of select="anim:set/@smil:targetElement | @smil:targetElement | anim:animateMotion/@smil:targetElement | anim:animate/@smil:targetElement | anim:animateColor/@smil:targetElement | anim:animateTransform/@smil:targetElement | ../@smil:targetElement"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="contains(string($targetName2),' ')">
						<xsl:value-of select="substring-before(string($targetName2),' ')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$targetName2"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:attribute name="????????????_6C28"><xsl:value-of select="$targetName"/></xsl:attribute>
			<!--?????????????????????-->
			<???:??????_6B2E>
				<xsl:variable name="animationSpeed">
					<!--very slow 5s	slow 3s medium 2s	fast 1s		very fast 0.5s-->
					<xsl:choose>
						<xsl:when test="anim:animate/@smil:dur='0.5s' or anim:transitionFilter/@smil:dur='0.5s' or anim:animateColor/@smil:dur='0.5s'">very-fast</xsl:when>
						<xsl:when test="anim:animate/@smil:dur='1s' or anim:transitionFilter/@smil:dur='1s' or anim:animateColor/@smil:dur='1s'">fast</xsl:when>
						<xsl:when test="anim:animate/@smil:dur='2s' or anim:transitionFilter/@smil:dur='2s' or anim:animateColor/@smil:dur='2s'">medium</xsl:when>
						<xsl:when test="anim:animate/@smil:dur='3s' or anim:transitionFilter/@smil:dur='3s' or anim:animateColor/@smil:dur='3s'">slow</xsl:when>
						<xsl:when test="anim:animate/@smil:dur='5s' or anim:transitionFilter/@smil:dur='5s' or anim:animateColor/@smil:dur='5s'">very-slow</xsl:when>
						<xsl:otherwise>medium</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:attribute name="??????_6B2F"><!--enmu:	 on click	 with previous	 after previous--><xsl:choose><xsl:when test="@presentation:node-type='on-click'">on-click</xsl:when><xsl:when test="@presentation:node-type='after-previous'">after-previous</xsl:when><xsl:when test="@presentation:node-type='with-previous'">with-previous</xsl:when><xsl:otherwise><xsl:attribute name="??????">on-click</xsl:attribute></xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:attribute name="??????_6B30"><xsl:value-of select="concat('PT',substring-before(@smil:begin,'s'),'S')"/></xsl:attribute>
				<xsl:attribute name="??????_6B31"><xsl:value-of select="$animationSpeed"/></xsl:attribute>
				<xsl:attribute name="??????_6B32"><!--none 2	3	4	5	10	until next click 	until end of slide--><xsl:choose><xsl:when test="@smil:repeatCount = 'indefinite' "><xsl:choose><xsl:when test="@smil:end='next'">until-next-click</xsl:when><xsl:otherwise>until-end-of-slide</xsl:otherwise></xsl:choose></xsl:when><xsl:when test="@smil:repeatCount ='2' or @smil:repeatCount ='3' or @smil:repeatCount ='4' or @smil:repeatCount ='5' or @smil:repeatCount ='10' "><xsl:value-of select="@smil:repeatCount"/></xsl:when><xsl:otherwise>none</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:attribute name="????????????_6B33"><xsl:choose><xsl:when test="@smil:fill='remove'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:if test="ancestor::anim:seq/@presentation:node-type='interactive-sequence'">
					<xsl:attribute name="??????????????????_6B34"><xsl:value-of select="substring-before(../../@smil:begin,'.')"/></xsl:attribute>
				</xsl:if>
			</???:??????_6B2E>
			<xsl:if test="../../following-sibling::*[1]/anim:par/anim:animateColor or (name(following-sibling::*[1]) = 'anim:set' and following-sibling::*[1]/@smil:to = 'hidden') or ../../following-sibling::*[1]/anim:par/anim:set/@smil:to = 'hidden' or name() = 'anim:iterate' or ./anim:audio or name(following-sibling::*[1]) = 'anim:animateColor' or name(following-sibling::*[1])='anim:set'">
				<???:??????_6B35>
					<xsl:choose>
						<xsl:when test="name(following-sibling::*[1]) = 'anim:animateColor' or name(following-sibling::*[1])='anim:set'">
							<???:???????????????_6B36>
								<xsl:if test="name(following-sibling::*[1]) = 'anim:animateColor'">
									<???:??????_6B37>
										<xsl:value-of select="following-sibling::*[1]/@smil:to"/>
									</???:??????_6B37>
								</xsl:if>
								<xsl:if test="name(following-sibling::*[1])='anim:set'">
									<xsl:choose>
										<xsl:when test="following-sibling::*[1]/@smil:begin = 'next'">
											<???:?????????????????????_6B39>true</???:?????????????????????_6B39>
										</xsl:when>
										<xsl:otherwise>
											<???:?????????????????????_6B38>true</???:?????????????????????_6B38>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</???:???????????????_6B36>
						</xsl:when>
						<xsl:when test="../../following-sibling::*[1]/anim:par/anim:animateColor or (name(following-sibling::*[1]) = 'anim:set' and following-sibling::*[1]/@smil:to = 'hidden') or ../../following-sibling::*[1]/anim:par/anim:set/@smil:to = 'hidden'">
							<???:???????????????_6B36>
								<xsl:if test="../../following-sibling::*[1]/anim:par/anim:animateColor">
									<???:??????_6B37>
										<xsl:value-of select="following-sibling::*[1]/@smil:to"/>
									</???:??????_6B37>
								</xsl:if>
								<xsl:if test="name(following-sibling::*[1]) = 'anim:set' and following-sibling::*[1]/@smil:to = 'hidden' or ../../following-sibling::*[1]/anim:par/anim:set/@smil:to = 'hidden'">
									<xsl:choose>
										<xsl:when test="contains(following-sibling::*[1]/@smil:begin,'end')">
											<???:?????????????????????_6B39>true</???:?????????????????????_6B39>
										</xsl:when>
										<xsl:otherwise>
											<???:?????????????????????_6B38>true</???:?????????????????????_6B38>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
							</???:???????????????_6B36>
						</xsl:when>
					</xsl:choose>
					<xsl:if test="name() = 'anim:iterate'">
						<???:????????????_6B3A>
							<xsl:attribute name="??????_6B3C"><xsl:value-of select="concat('PT',substring-before(@anim:iterate-interval,'s'),'S')"/></xsl:attribute>
							<xsl:choose>
								<xsl:when test="@anim:iterate-type = 'by-word'">
									<xsl:attribute name="??????_6B3B">by word</xsl:attribute>
								</xsl:when>
								<xsl:when test="@anim:iterate-type = 'by-letter'">
									<xsl:attribute name="??????_6B3B">by letter</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="??????_6B3B">all at once</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</???:????????????_6B3A>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="./anim:audio">
							<xsl:for-each select="anim:audio">
								<xsl:call-template name="AudioSound"/>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="./anim:command">
							<???:??????_6B22 ???:???????????????_C631="stop previous sound"/>
						</xsl:when>
					</xsl:choose>
				</???:??????_6B35>
			</xsl:if>
			<???:??????_6B40>
				<xsl:choose>
					<xsl:when test="./@presentation:preset-class = 'entrance'">
						<???:??????_6B41>
							<xsl:choose>
								<xsl:when test="@presentation:preset-id and @presentation:preset-id != ''">
									<xsl:apply-templates select="@presentation:preset-id"/>
								</xsl:when>
								<xsl:otherwise>
									<???:??????_6B65/>
								</xsl:otherwise>
							</xsl:choose>
						</???:??????_6B41>
					</xsl:when>
					<xsl:when test="./@presentation:preset-class = 'exit'">
						<???:??????_6BBE>
							<xsl:choose>
								<xsl:when test="@presentation:preset-id and @presentation:preset-id != ''">
									<xsl:apply-templates select="@presentation:preset-id"/>
								</xsl:when>
								<xsl:otherwise>
									<???:??????_6B65/>
								</xsl:otherwise>
							</xsl:choose>
						</???:??????_6BBE>
					</xsl:when>
					<xsl:when test="./@presentation:preset-class = 'emphasis' ">
						<???:??????_6B07>
							<xsl:choose>
								<xsl:when test="@presentation:preset-id and @presentation:preset-id != ''">
									<xsl:apply-templates select="@presentation:preset-id"/>
								</xsl:when>
								<xsl:otherwise>
									<???:??????_6B65/>
								</xsl:otherwise>
							</xsl:choose>
						</???:??????_6B07>
					</xsl:when>
					<xsl:when test="./@presentation:preset-class = 'motion-path'">
						<???:????????????_6BD1>
							<xsl:attribute name="??????_6BD6"><xsl:value-of select="child::anim:animateMotion/@svg:path"/></xsl:attribute>
						</???:????????????_6BD1>
					</xsl:when>
				</xsl:choose>
			</???:??????_6B40>
		</???:??????_6B1B>
	</xsl:template>
	<xsl:template name="anim_speed">
		<xsl:param name="speed"/>
		<xsl:choose>
			<xsl:when test="$speed='0.5s' or $speed='0.25s'">very-fast</xsl:when>
			<xsl:when test="$speed='1s'">fast</xsl:when>
			<xsl:when test="$speed='2s'">medium</xsl:when>
			<xsl:when test="$speed='3s'">slow</xsl:when>
			<xsl:when test="$speed='5s'">very-slow</xsl:when>
			<xsl:otherwise>medium</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--?????? ????????? ??????-->
	<!--ooo-entrance-venetian-blinds 	1 ?????????p0080-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-venetian-blinds']">
		<???:?????????_6B42>
			<???:?????????_6B43>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B45"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:?????????_6B43>
		</???:?????????_6B42>
	</xsl:template>
	<!-- appear ??????-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-appear']">
		<???:?????????_6B42>
			<???:??????_6B46/>
		</???:?????????_6B42>
	</xsl:template>
	<!-- box ??????p0082-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-box']">
		<???:?????????_6B42>
			<???:??????_6B47>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B48"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:??????_6B47>
		</???:?????????_6B42>
	</xsl:template>
	<!--ooo-entrance-diagonal-squares 	1 ?????????p0083-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-diagonal-squares']">
		<???:?????????_6B42>
			<???:?????????_6B49>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B4A"><xsl:choose><xsl:when test="../@presentation:preset-sub-type = 'left-to-bottom' ">left down</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'left-to-top' ">left up</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'right-to-bottom' ">right down</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'right-to-top' ">right up</xsl:when></xsl:choose></xsl:attribute>
			</???:?????????_6B49>
		</???:?????????_6B42>
	</xsl:template>
	<!-- wheel 1 ??????p0084-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-wheel']">
		<???:?????????_6B42>
			<???:??????_6B4B>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B4D"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:??????_6B4B>
		</???:?????????_6B42>
	</xsl:template>
	<!-- checkerboard ??????p0085-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-checkerboard']">
		<???:?????????_6B42>
			<???:??????_6B4E>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B50"><xsl:value-of select="../anim:transitionFilter/@smil:subtype"/></xsl:attribute>
			</???:??????_6B4E>
		</???:?????????_6B42>
	</xsl:template>
	<!--ooo-entrance-flash-once 	1 ????????????p0086-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-flash-once']">
		<???:?????????_6B42>
			<???:????????????_6B51>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:set/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6B51>
		</???:?????????_6B42>
	</xsl:template>
	<!-- plus ???????????????0087-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-plus']">
		<???:?????????_6B42>
			<???:???????????????_6B53>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B48"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:???????????????_6B53>
		</???:?????????_6B42>
	</xsl:template>
	<!--ooo-entrance-random 	1 ????????????p0088-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-random']">
		<???:?????????_6B42>
			<???:????????????_6B55>
				<!--xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:choose><xsl:when test="parent::anim:par/anim:transitionFilter/@smil:dur"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:when><xsl:otherwise><xsl:value-of select="../anim:animate/@smil:dur"/></xsl:otherwise></xsl:choose></xsl:with-param></xsl:call-template></xsl:attribute-->
			</???:????????????_6B55>
		</???:?????????_6B42>
	</xsl:template>
	<!-- circle 1 ????????????p0089-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-circle']">
		<???:?????????_6B42>
			<???:????????????_6B56>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B48"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:????????????_6B56>
		</???:?????????_6B42>
	</xsl:template>
	<!--ooo-entrance-wipe 	1 ??????p0090-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-wipe']">
		<???:?????????_6B42>
			<???:??????_6B57>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B58"><xsl:choose><xsl:when test="../@presentation:preset-sub-type = 'from-right'">from right</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-left'">from left</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-top'">from top</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-bottom'">from bottom</xsl:when></xsl:choose></xsl:attribute>
			</???:??????_6B57>
		</???:?????????_6B42>
	</xsl:template>
	<!-- fly in ??????p0091-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-fly-in']">
		<???:?????????_6B42>
			<???:??????_6B59>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:animate[1]/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:if test="../@presentation:preset-sub-type">
					<xsl:attribute name="??????_6B5A"><xsl:choose><xsl:when test="../@presentation:preset-sub-type = 'from-bottom'">from bottom</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-top-right'">from top-right</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-top-left'">from top-left</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-bottom-left'">from bottom-left</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-bottom-right'">from bottom-right</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-right'">from right</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-left'">from left</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-top'">from top</xsl:when></xsl:choose></xsl:attribute>
				</xsl:if>
			</???:??????_6B59>
		</???:?????????_6B42>
	</xsl:template>
	<!--ooo-entrance-fly-in-slow 	1 ????????????p0092-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-fly-in-slow']">
		<???:?????????_6B42>
			<???:????????????_6B5B>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:animate[1]/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B58"><xsl:choose><xsl:when test="../@presentation:preset-sub-type = 'from-right'">from right</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-left'">from left</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-top'">from top</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-bottom'">from bottom</xsl:when></xsl:choose></xsl:attribute>
			</???:????????????_6B5B>
		</???:?????????_6B42>
	</xsl:template>
	<!-- diamond 1 ??????p0093-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-diamond']">
		<???:?????????_6B42>
			<???:??????_6B5D>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B48"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:??????_6B5D>
		</???:?????????_6B42>
	</xsl:template>
	<!-- split 1 ??????p0094-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-split']">
		<???:?????????_6B42>
			<???:??????_6B5E>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B5F"><xsl:choose><xsl:when test="../@presentation:preset-sub-type = 'horizontal-out'">horizontal out</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'horizontal-in'">horizontal in</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'vertical-in'">vertical in</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'vertical-out'">vertical out</xsl:when></xsl:choose></xsl:attribute>
			</???:??????_6B5E>
		</???:?????????_6B42>
	</xsl:template>
	<!-- peek in 1 ??????p0095-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-peek-in']">
		<???:?????????_6B42>
			<???:??????_6B60>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B58"><xsl:choose><xsl:when test="../@presentation:preset-sub-type = 'from-right'">from right</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-left'">from left</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-top'">from top</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-bottom'">from bottom</xsl:when></xsl:choose></xsl:attribute>
			</???:??????_6B60>
		</???:?????????_6B42>
	</xsl:template>
	<!--ooo-entrance-wedge 	1 ????????????p0096-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-wedge']">
		<???:?????????_6B42>
			<???:????????????_6B61>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6B61>
		</???:?????????_6B42>
	</xsl:template>
	<!-- random bars 1 ????????????p0097-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-random-bars']">
		<???:?????????_6B42>
			<???:????????????_6B62>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B45"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:????????????_6B62>
		</???:?????????_6B42>
	</xsl:template>
	<!--ooo-entrance-dissolve-in 	1 ????????????p0098-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-dissolve-in']">
		<???:?????????_6B42>
			<???:????????????_6B64>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6B64>
		</???:?????????_6B42>
	</xsl:template>
	<!--?????? ????????? ??????-->
	<!--?????? ????????? ??????-->
	<!--fade in	?????????UOF_?????????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-fade-in']">
		<???:?????????_6B42>
			<???:??????_6B67>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B67>
		</???:?????????_6B42>
	</xsl:template>
	<!--fade in and swivel	??????????????????UOF_??????????????????	<b1> -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-fade-in-and-swivel']">
		<???:?????????_6B42>
			<???:???????????????_6B69>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:???????????????_6B69>
		</???:?????????_6B42>
	</xsl:template>
	<!--fade in and zoom	??????????????????UOF_??????????????????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-fade-in-and-zoom']">
		<???:?????????_6B42>
			<???:???????????????_6B6A>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:???????????????_6B6A>
		</???:?????????_6B42>
	</xsl:template>
	<!--expand	??????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-expand']">
		<???:?????????_6B42>
			<???:??????_6B6B>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B6B>
		</???:?????????_6B42>
	</xsl:template>
	<!--?????? ????????? ??????-->
	<!--?????? ????????? ??????-->
	<!--turn and grow 	??????????????????UOF_??????????????? 	<b1> -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-turn-and-grow']">
		<???:?????????_6B42>
			<???:?????????????????????_6B6E>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:?????????????????????_6B6E>
		</???:?????????_6B42>
	</xsl:template>
	<!--ease in	???????????? ???UOF_?????????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-ease-in']">
		<???:?????????_6B42>
			<???:??????_6B6F>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B6F>
		</???:?????????_6B42>
	</xsl:template>
	<!--stretchy	RO?????????UOF_????????? -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-stretchy']">
		<???:?????????_6B42>
			<???:??????_6B70>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<!--???-->
				<xsl:attribute name="??????_6B71"/>
			</???:??????_6B70>
		</???:?????????_6B42>
	</xsl:template>
	<!--zoom??????ooo-entrance-zoom  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-colored-lettering']">
		<???:?????????_6B42>
			<???:??????_6B72>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<!--???-->
				<xsl:attribute name="??????_6B73"/>
			</???:??????_6B72>
		</???:?????????_6B42>
	</xsl:template>
	<!--compress??????-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-compress']">
		<???:?????????_6B42>
			<???:??????_6B74>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B74>
		</???:?????????_6B42>
	</xsl:template>
	<!--unfold	??????	<b1> -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-unfold']">
		<???:?????????_6B42>
			<???:??????_6B6B>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B6B>
		</???:?????????_6B42>
	</xsl:template>
	<!--pinwheel	?????????UOF_?????????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-pinwheel']">
		<???:?????????_6B42>
			<???:??????_6B75>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B75>
		</???:?????????_6B42>
	</xsl:template>
	<!--ascend	??????	   -->
	<xsl:template match="@presentation:preset-id[. = 'oooo-entrance-ascend']">
		<???:?????????_6B42>
			<???:??????_6B76>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B76>
		</???:?????????_6B42>
	</xsl:template>
	<!--rise up	??????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-rise-up']">
		<???:?????????_6B42>
			<???:??????_6B77>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B77>
		</???:?????????_6B42>
	</xsl:template>
	<!-- falling in	??????	<b1-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-falling-in']">
		<???:?????????_6B42>
			<???:??????_6B78>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B78>
		</???:?????????_6B42>
	</xsl:template>
	<!--descend	?????? 2???1-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-descend']">
		<???:?????????_6B42>
			<???:??????_6B78>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B78>
		</???:?????????_6B42>
	</xsl:template>
	<!--colored lettering	???????????? 	<b1>ooo-entrance-colored-lettering -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-colored-lettering']">
		<???:?????????_6B42>
			<???:???????????????_6B79>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:???????????????_6B79>
		</???:?????????_6B42>
	</xsl:template>
	<!--center revolve	????????????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-center-revolve']">
		<???:?????????_6B42>
			<???:????????????_6B7B>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6B7B>
		</???:?????????_6B42>
	</xsl:template>
	<!--?????? ????????? ??????-->
	<!--?????? ????????? ??????-->
	<!--bounce	??????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-bounce']">
		<???:?????????_6B7C>
			<???:??????_6B7D>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B7D>
		</???:?????????_6B7C>
	</xsl:template>
	<!--boomerang	?????????UOF_?????????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-boomerang']">
		<???:?????????_6B7C>
			<???:??????_6B75>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B75>
		</???:?????????_6B7C>
	</xsl:template>
	<!--put on the breaks	?????????UOF_?????????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-breaks']">
		<???:?????????_6B7C>
			<???:??????_6B7F>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B7F>
		</???:?????????_6B7C>
	</xsl:template>
	<!--?????????????????????-->
	<!--flip	?????????UOF_?????????	<b1> -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-flip']">
		<???:?????????_6B7C>
			<???:??????_6B81>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B81>
		</???:?????????_6B7C>
	</xsl:template>
	<!--curve up	????????????	???UOF_???????????????   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-curve-up']">
		<???:?????????_6B7C>
			<???:????????????_6B82>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6B82>
		</???:?????????_6B7C>
	</xsl:template>
	<!--spin in	???????????????UOF_???????????????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-spin-in']">
		<???:?????????_6B7C>
			<???:????????????_6B83>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6B83>
		</???:?????????_6B7C>
	</xsl:template>
	<!--swivel	??????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-swivel']">
		<???:?????????_6B7C>
			<???:??????_6B84>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B48"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:??????_6B84>
		</???:?????????_6B7C>
	</xsl:template>
	<!--movie credits	????????????	 ???UOF_????????????  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-movie-credits']">
		<???:?????????_6B7C>
			<???:?????????_6B87>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:?????????_6B87>
		</???:?????????_6B7C>
	</xsl:template>
	<!--magnify	??????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-magnify']">
		<???:?????????_6B7C>
			<???:??????_6B89>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B89>
		</???:?????????_6B7C>
	</xsl:template>
	<!--float	??????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-float']">
		<???:?????????_6B7C>
			<???:??????_6B8A>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B8A>
		</???:?????????_6B7C>
	</xsl:template>
	<!--glide	??????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-glide']">
		<???:?????????_6B7C>
			<???:??????_6B8B>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B8B>
		</???:?????????_6B7C>
	</xsl:template>
	<!--whip?????????UOF_????????? <b1> -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-whip']">
		<???:?????????_6B7C>
			<???:??????_6B8C>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B8C>
		</???:?????????_6B7C>
	</xsl:template>
	<!--spiral in	????????????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-spiral-in']">
		<???:?????????_6B7C>
			<???:????????????_6B8D>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6B8D>
		</???:?????????_6B7C>
	</xsl:template>
	<!--sling	??????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-sling']">
		<???:?????????_6B7C>
			<???:??????_6B8E>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B8E>
		</???:?????????_6B7C>
	</xsl:template>
	<!-- thread	??????(UOF_??????)	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-thread']">
		<???:?????????_6B7C>
			<???:??????_6B8F>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B8F>
		</???:?????????_6B7C>
	</xsl:template>
	<!--fold	??????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-entrance-fold']">
		<???:?????????_6B7C>
			<???:??????_6B90>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B90>
		</???:?????????_6B7C>
	</xsl:template>
	<!--?????? ????????? ??????-->
	<!-- emphasis ??????  ????????? ??????-->
	<!-- zoom ??????0120-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-grow-and-shrink']">
		<???:?????????_6B42>
			<???:??????_6B72>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:animateTransform/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:variable name="horizontalDirection" select="substring-after(../anim:animateTransform/@smil:to,',')"/>
				<xsl:variable name="verticalDirection" select="substring-before(../anim:animateTransform/@smil:to,',')"/>
				<xsl:attribute name="??????_6B91"><xsl:choose><xsl:when test="$horizontalDirection = '1'">horizontal</xsl:when><xsl:when test="$verticalDirection = '1'">vertical</xsl:when><xsl:otherwise>both</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:choose>
					<xsl:when test="$horizontalDirection = '0.25' or $verticalDirection = '0.25'">
						<xsl:attribute name="???????????????_6B92">tiny</xsl:attribute>
					</xsl:when>
					<xsl:when test="$horizontalDirection = '0.5' or $verticalDirection = '0.5'">
						<xsl:attribute name="???????????????_6B92">smaller</xsl:attribute>
					</xsl:when>
					<xsl:when test="$horizontalDirection = '1.5' or $verticalDirection = '1.5'">
						<xsl:attribute name="???????????????_6B92">larger</xsl:attribute>
					</xsl:when>
					<xsl:when test="$horizontalDirection = '4' or $verticalDirection = '4'">
						<xsl:attribute name="???????????????_6B92">huge</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="???????????????_6B93"><xsl:choose><xsl:when test="$horizontalDirection = '1'"><xsl:value-of select="number($verticalDirection) * 100"/></xsl:when><xsl:when test="$verticalDirection = '1'"><xsl:value-of select="number($horizontalDirection) * 100"/></xsl:when><xsl:otherwise><xsl:value-of select="number($horizontalDirection) * 100"/></xsl:otherwise></xsl:choose></xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</???:??????_6B72>
		</???:?????????_6B42>
	</xsl:template>
	<!-- change line color 1 ??????????????????0121-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-line-color']">
		<???:?????????_6B42>
			<???:??????????????????_6B94>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:animateColor/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B95"><xsl:value-of select="../anim:animateColor/@smil:to"/></xsl:attribute>
			</???:??????????????????_6B94>
		</???:?????????_6B42>
	</xsl:template>
	<!-- change font style 1 ????????????0122-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-font-style' or . = 'ooo-emphasis-font']">
		<???:?????????_6B42>
			<???:????????????_6B96>
				<xsl:attribute name="??????_6B97"><xsl:value-of select="generate-id(..)"/></xsl:attribute>
				<xsl:attribute name="??????_6B98"><!--begin--><xsl:variable name="qijian" select="string(../anim:set[1]/@smil:dur)"/><xsl:choose><xsl:when test="$qijian='until next click'">until-next-click</xsl:when><xsl:when test="$qijian='indefinite'">until-end-of-slide</xsl:when><xsl:when test="$qijian='1.0s' or $qijian='1s'">1.0</xsl:when><xsl:when test="$qijian='2s' or $qijian='2.0s'">2.0</xsl:when><xsl:when test="$qijian='3s' or $qijian='3.0s'">3.0</xsl:when><xsl:when test="$qijian='4s' or $qijian='4.0s'">4.0</xsl:when><xsl:when test="$qijian='5s' or $qijian='5.0s'">5.0</xsl:when><xsl:when test="$qijian='0.5s'">0.5</xsl:when><xsl:otherwise>2.0</xsl:otherwise></xsl:choose></xsl:attribute>
			</???:????????????_6B96>
		</???:?????????_6B42>
	</xsl:template>
	<!-- change font ??????????????????????????????????????????????????????-->
	<!-- spin 1 ?????????0123-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-spin']">
		<???:?????????_6B42>
			<???:?????????_6B9B>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:animateTransform/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="?????????????????????_6B9C"><xsl:choose><xsl:when test="number(parent::anim:par/anim:animateTransform/@smil:by) &gt;= 0">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:choose>
					<xsl:when test="parent::anim:par/anim:animateTransform/@smil:by='90' or parent::anim:par/anim:animateTransform/@smil:by='-90'">
						<xsl:attribute name="???????????????_6B9D">quarter spin</xsl:attribute>
					</xsl:when>
					<xsl:when test="parent::anim:par/anim:animateTransform/@smil:by='180' or parent::anim:par/anim:animateTransform/@smil:by='-180'">
						<xsl:attribute name="???????????????_6B9D">half spin</xsl:attribute>
					</xsl:when>
					<xsl:when test="parent::anim:par/anim:animateTransform/@smil:by='360' or parent::anim:par/anim:animateTransform/@smil:by='-360'">
						<xsl:attribute name="???????????????_6B9D">full spin</xsl:attribute>
					</xsl:when>
					<xsl:when test="parent::anim:par/anim:animateTransform/@smil:by='720' or parent::anim:par/anim:animateTransform/@smil:by='-720'">
						<xsl:attribute name="???????????????_6B9D">two spins</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="???????????????_6B9E"><xsl:value-of select="substring-after(parent::anim:par/anim:animateTransform/@smil:by,'-')"/></xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</???:?????????_6B9B>
		</???:?????????_6B42>
	</xsl:template>
	<!-- change fill color 1 ??????????????????0124-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-fill-color']">
		<???:?????????_6B42>
			<???:??????????????????_6B9F>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:animateColor/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B95"><xsl:value-of select="../anim:animateColor/@smil:to"/></xsl:attribute>
			</???:??????????????????_6B9F>
		</???:?????????_6B42>
	</xsl:template>
	<!-- change font size "1 ????????????0125/??????0120???????????????????????????"-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-font-size']">
		<???:?????????_6B42>
			<???:????????????_6BA0>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:animate/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<!--tiny smaller larger huge-->
				<xsl:choose>
					<xsl:when test="parent::anim:par/anim:animate/@smil:to='0.25pt' ">
						<xsl:attribute name="???????????????_6B92">tiny</xsl:attribute>
					</xsl:when>
					<xsl:when test="parent::anim:par/anim:animate/@smil:to='0.5pt' ">
						<xsl:attribute name="???????????????_6B92">smaller</xsl:attribute>
					</xsl:when>
					<xsl:when test="parent::anim:par/anim:animate/@smil:to='1.5pt' ">
						<xsl:attribute name="???????????????_6B92">larger</xsl:attribute>
					</xsl:when>
					<xsl:when test="parent::anim:par/anim:animate/@smil:to='4pt' ">
						<xsl:attribute name="???????????????_6B92">huge</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="???????????????_6B93"><xsl:choose><xsl:when test="parent::anim:par/anim:animate/@smil:to"><xsl:value-of select="number(substring(substring-before(parent::anim:par/anim:animate/@smil:to,'pt'),1,3)) * 100"/></xsl:when><xsl:otherwise>1</xsl:otherwise></xsl:choose></xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</???:????????????_6BA0>
		</???:?????????_6B42>
	</xsl:template>
	<!-- change font color 1 ??????????????????0126-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-font-color']">
		<???:?????????_6B42>
			<???:??????????????????_6BA2>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:animateColor/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B95"><xsl:value-of select="../anim:animateColor/@smil:to"/></xsl:attribute>
			</???:??????????????????_6BA2>
		</???:?????????_6B42>
	</xsl:template>
	<!-- Transparency 1 ??????0127-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-transparency']">
		<???:?????????_6B42>
			<???:??????_6BA3>
				<!--25	50	75	100??????	0.5	1	2	3	4	5	until next click	until end of slide-->
				<xsl:choose>
					<xsl:when test="../anim:set/@smil:to='0.25' ">
						<xsl:attribute name="??????????????????_6BA4">25</xsl:attribute>
					</xsl:when>
					<xsl:when test="../anim:set/@smil:to='0.5' ">
						<xsl:attribute name="??????????????????_6BA4">50</xsl:attribute>
					</xsl:when>
					<xsl:when test="../anim:set/@smil:to='0.75' ">
						<xsl:attribute name="??????????????????_6BA4">75</xsl:attribute>
					</xsl:when>
					<xsl:when test="../anim:set/@smil:to='1' ">
						<xsl:attribute name="??????????????????_6BA4">100</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="??????????????????_6BA5"><xsl:value-of select="number(substring(../anim:set/@smil:to,1,4)) * 100"/></xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:attribute name="??????_6BA6"><xsl:variable name="qijian" select="string(../anim:set[1]/@smil:dur)"/><xsl:choose><xsl:when test="$qijian='until next click'">until-next-click</xsl:when><xsl:when test="$qijian='indefinite'">until-end-of-slide</xsl:when><xsl:when test="$qijian='1.0s' or $qijian='1s'">1.0</xsl:when><xsl:when test="$qijian='2s' or $qijian='2.0s'">2.0</xsl:when><xsl:when test="$qijian='3s' or $qijian='3.0s'">3.0</xsl:when><xsl:when test="$qijian='4s' or $qijian='4.0s'">4.0</xsl:when><xsl:when test="$qijian='5s' or $qijian='5.0s'">5.0</xsl:when><xsl:when test="$qijian='0.5s'">0.5</xsl:when><xsl:otherwise>2.0</xsl:otherwise></xsl:choose></xsl:attribute>
			</???:??????_6BA3>
		</???:?????????_6B42>
	</xsl:template>
	<!-- emphasis ??????  ????????? ??????-->
	<!-- emphasis ??????  ?????????-->
	<!--lighten	??????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-lighten']">
		<???:?????????_6B66>
			<???:??????_6BA7>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6BA7>
		</???:?????????_6B66>
	</xsl:template>
	<!--complementary by color 2	??????2	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-complementary-color-2']">
		<???:?????????_6B66>
			<???:??????2_6BA8>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????2_6BA8>
		</???:?????????_6B66>
	</xsl:template>
	<!--color over by letter	??????????????????UOF_???????????????	<b1>  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-color-over-by-letter']">
		<???:?????????_6B66>
			<???:????????????_6BA9>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B95"><xsl:value-of select="../anim:animateColor/@smil:to"/></xsl:attribute>
			</???:????????????_6BA9>
		</???:?????????_6B66>
	</xsl:template>
	<!--contrasting color	?????????	 -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-contrasting-color']">
		<???:?????????_6B66>
			<???:?????????_6BAA>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:?????????_6BAA>
		</???:?????????_6B66>
	</xsl:template>
	<!--color blend	??????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-color-blend']">
		<???:?????????_6B66>
			<???:??????_6BAB>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B95"><xsl:value-of select="../anim:animateColor/@smil:to"/></xsl:attribute>
			</???:??????_6BAB>
		</???:?????????_6B66>
	</xsl:template>
	<!--darken	?????????UOF_????????? 	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-darken']">
		<???:?????????_6B66>
			<???:??????_6BAC>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6BAC>
		</???:?????????_6B66>
	</xsl:template>
	<!--color over by word	??????????????????UOF_?????????	<b1>  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-color-over-by-word']">
		<???:?????????_6B66>
			<???:??????_6BAD>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B95"><xsl:value-of select="../anim:animateColor/@smil:to"/></xsl:attribute>
			</???:??????_6BAD>
		</???:?????????_6B66>
	</xsl:template>
	<!--complementary by color	??????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-complementary-color']">
		<???:?????????_6B66>
			<???:??????_6BAE>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6BAE>
		</???:?????????_6B66>
	</xsl:template>
	<!--desaturate	?????????UOF_????????????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-desaturate']">
		<???:?????????_6B66>
			<???:?????????_6BAF>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:?????????_6BAF>
		</???:?????????_6B66>
	</xsl:template>
	<!--??????????????????-->
	<!--flash bulb	????????????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-flash-bulb']">
		<???:?????????_6B66>
			<???:????????????_6BB2>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6BB2>
		</???:?????????_6B66>
	</xsl:template>
	<!--bold flash	????????????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-bold-flash']">
		<???:?????????_6B66>
			<???:????????????_6BB3>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6BB3>
		</???:?????????_6B66>
	</xsl:template>
	<!--reveal underline	??????????????????UOF_??????????????????	<b1>  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-reveal-underline']">
		<???:?????????_6B66>
			<???:???????????????_6BB4>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:???????????????_6BB4>
		</???:?????????_6B66>
	</xsl:template>
	<!-- emphasis ??????  ????????? ??????-->
	<!-- emphasis ??????  ????????? ??????-->
	<!--grow with color	???????????????UOF_??????????????? 	<b1>  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-grow-with-color']">
		<???:?????????_6B6D>
			<???:????????????_6BB5>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B95"><xsl:value-of select="../anim:animateColor/@smil:to"/></xsl:attribute>
			</???:????????????_6BB5>
		</???:?????????_6B6D>
	</xsl:template>
	<!--flicker	?????? 	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-flicker']">
		<???:?????????_6B6D>
			<???:??????_6BB6>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B95"><xsl:value-of select="../anim:animateColor/@smil:to"/></xsl:attribute>
			</???:??????_6BB6>
		</???:?????????_6B6D>
	</xsl:template>
	<!--teeter	????????? 	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-teeter']">
		<???:?????????_6B6D>
			<???:?????????_6BB7>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B95"><xsl:value-of select="../anim:animateColor/@smil:to"/></xsl:attribute>
			</???:?????????_6BB7>
		</???:?????????_6B6D>
	</xsl:template>
	<!--shimmer	?????? 	<b1>  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-shimmer']">
		<???:?????????_6B6D>
			<???:??????_6BB8>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6BB8>
		</???:?????????_6B6D>
	</xsl:template>
	<!-- emphasis ??????  ????????? ??????-->
	<!-- emphasis ??????  ????????? ??????-->
	<!--blast	?????? 	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-blast']">
		<???:?????????_6B7C>
			<???:??????_6BB9>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B95"><xsl:value-of select="../anim:animateColor/@smil:to"/></xsl:attribute>
			</???:??????_6BB9>
		</???:?????????_6B7C>
	</xsl:template>
	<!--bold reveal	???????????????UOF_??????????????? 	<b1>  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-bold-reveal']">
		<???:?????????_6B7C>
			<???:????????????_6BBA>
				<xsl:attribute name="??????_6B98"/>
			</???:????????????_6BBA>
		</???:?????????_6B7C>
	</xsl:template>
	<!--style emphasis	???????????????UOF_???????????????	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-style-emphasis']">
		<???:?????????_6B7C>
			<???:????????????_6BBB>
				<xsl:attribute name="??????_6B95"><xsl:value-of select="../anim:animateColor/@smil:to"/></xsl:attribute>
				<xsl:attribute name="??????_6B98"/>
			</???:????????????_6BBB>
		</???:?????????_6B7C>
	</xsl:template>
	<!-- wave wave	?????????UOF_???????????? 	<b1>ooo-emphasis-wave -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-wave']">
		<???:?????????_6B7C>
			<???:?????????_6BBC>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:?????????_6BBC>
		</???:?????????_6B7C>
	</xsl:template>
	<!--blink	?????? 	   -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-emphasis-blink']">
		<???:?????????_6B7C>
			<???:??????_6BBD>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6BBD>
		</???:?????????_6B7C>
	</xsl:template>
	<!-- emphasis ??????  ????????? ??????-->
	<!-- exit ??????-->
	<!--?????? ????????? ??????-->
	<!--ooo-exit-venetian-blinds 	1 ?????????0100-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-venetian-blinds']">
		<???:?????????_6B42>
			<???:?????????_6B43>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B45"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:?????????_6B43>
		</???:?????????_6B42>
	</xsl:template>
	<!-- fly out 1 ??????0101-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-fly-out']">
		<???:?????????_6B42>
			<???:??????_6BBF>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:animate[1]/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6BC0"><xsl:choose><xsl:when test="../@presentation:preset-sub-type = 'from-bottom'">to bottom</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-top-right'">to top-right</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-top-left'">to top-left</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-bottom-left'">to bottom-left</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-bottom-right'">to bottom-right</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-right'">to right</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-left'">to left</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-top'">to top</xsl:when></xsl:choose></xsl:attribute>
			</???:??????_6BBF>
		</???:?????????_6B42>
	</xsl:template>
	<!-- crawl out 1 ????????????0102-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-crawl-out']">
		<???:?????????_6B42>
			<???:????????????_6BC1>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:animate[1]/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6BC2"><xsl:choose><xsl:when test="../@presentation:preset-sub-type = 'from-right'">to right</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-left'">to left</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-top'">to top</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-bottom'">to bottom</xsl:when></xsl:choose></xsl:attribute>
			</???:????????????_6BC1>
		</???:?????????_6B42>
	</xsl:template>
	<!-- diamond 1 ??????0103-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-diamond']">
		<???:?????????_6B42>
			<???:??????_6B5D>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B48"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:??????_6B5D>
		</???:?????????_6B42>
	</xsl:template>
	<!-- split 1 ??????0104-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-split']">
		<???:?????????_6B42>
			<???:??????_6B5E>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B5F"><xsl:choose><xsl:when test="../@presentation:preset-sub-type = 'horizontal-out'">horizontal out</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'horizontal-in'">horizontal in</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'vertical-in'">vertical in</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'vertical-out'">vertical out</xsl:when><xsl:otherwise>horizontal out</xsl:otherwise></xsl:choose></xsl:attribute>
			</???:??????_6B5E>
		</???:?????????_6B42>
	</xsl:template>
	<!-- peek out 1 ??????0105-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-peek-out']">
		<???:?????????_6B42>
			<???:??????_6BC4>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6BC2"><xsl:choose><xsl:when test="../@presentation:preset-sub-type = 'from-right'">to right</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-left'">to left</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-top'">to top</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-bottom'">to bottom</xsl:when></xsl:choose></xsl:attribute>
			</???:??????_6BC4>
		</???:?????????_6B42>
	</xsl:template>
	<!--ooo-exit-wedge 	1 ????????????0106-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-wedge']">
		<???:?????????_6B42>
			<???:????????????_6B61>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6B61>
		</???:?????????_6B42>
	</xsl:template>
	<!-- random bars 1 ????????????0107-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-random-bars']">
		<???:?????????_6B42>
			<???:????????????_6B62>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B45"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:????????????_6B62>
		</???:?????????_6B42>
	</xsl:template>
	<!--ooo-exit-dissolve 	1 ????????????0108-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-dissolve']">
		<???:?????????_6B42>
			<???:????????????_6BC5>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6BC5>
		</???:?????????_6B42>
	</xsl:template>
	<!-- circle 1 ????????????0109-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-circle']">
		<???:?????????_6B42>
			<???:????????????_6B56>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B48"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:????????????_6B56>
		</???:?????????_6B42>
	</xsl:template>
	<!-- wipe 1 ??????0110-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-wipe']">
		<???:?????????_6B42>
			<???:??????_6B57>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B58"><xsl:choose><xsl:when test="../@presentation:preset-sub-type = 'from-right'">from right</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-left'">from left</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-top'">from top</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'from-bottom'">from bottom</xsl:when></xsl:choose></xsl:attribute>
			</???:??????_6B57>
		</???:?????????_6B42>
	</xsl:template>
	<!-- box 1 ??????0111-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-box']">
		<???:?????????_6B42>
			<???:??????_6B47>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B48"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:??????_6B47>
		</???:?????????_6B42>
	</xsl:template>
	<!--ooo-exit-diagonal-squares 	1 ?????????0112-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-diagonal-squares']">
		<???:?????????_6B42>
			<???:?????????_6B49>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B4A"><xsl:choose><xsl:when test="../@presentation:preset-sub-type = 'left-to-bottom' ">left down</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'left-to-top' ">left up</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'right-to-bottom' ">right down</xsl:when><xsl:when test="../@presentation:preset-sub-type = 'right-to-top' ">right up</xsl:when></xsl:choose></xsl:attribute>
			</???:?????????_6B49>
		</???:?????????_6B42>
	</xsl:template>
	<!-- wheel 1 ??????0113-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-wheel']">
		<???:?????????_6B42>
			<???:??????_6B4B>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B4D"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:??????_6B4B>
		</???:?????????_6B42>
	</xsl:template>
	<!-- checkerboard 1 ??????0114-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-checkerboard']">
		<???:?????????_6B42>
			<???:??????_6B4E>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B50"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:subtype"/></xsl:attribute>
			</???:??????_6B4E>
		</???:?????????_6B42>
	</xsl:template>
	<!--ooo-exit-flash-once 	1 ????????????0115-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-flash-once']">
		<???:?????????_6B42>
			<???:????????????_6B51>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="../anim:animate/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6B51>
		</???:?????????_6B42>
	</xsl:template>
	<!-- plus 1 ???????????????0116-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-plus']">
		<???:?????????_6B42>
			<???:???????????????_6B53>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B48"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:???????????????_6B53>
		</???:?????????_6B42>
	</xsl:template>
	<!--ooo-exit-random 	1 ????????????0117-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-random']">
		<???:?????????_6B42>
			<???:????????????_6B55>
				<!--xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:choose><xsl:when test="parent::anim:par/anim:transitionFilter/@smil:dur"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:when><xsl:otherwise><xsl:value-of select="../anim:animate/@smil:dur"/></xsl:otherwise></xsl:choose></xsl:with-param></xsl:call-template></xsl:attribute-->
			</???:????????????_6B55>
		</???:?????????_6B42>
	</xsl:template>
	<!--ooo-exit-disappear 	1 ??????0118-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-disappear']">
		<???:?????????_6B42>
			<???:??????_6BC7/>
		</???:?????????_6B42>
	</xsl:template>
	<!--?????? ????????? ??????-->
	<!--?????? ????????? ??????-->
	<!--SPECIAL		-->
	<!--fade out	?????????UOF_?????????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-fade-out']">
		<???:?????????_6B66>
			<???:??????_6B67>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B67>
		</???:?????????_6B66>
	</xsl:template>
	<!--fade out and swivel	??????????????????UOF_??????????????????	<b1>-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-fade-out-and-swivel']">
		<???:?????????_6B66>
			<???:???????????????_6B69>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:???????????????_6B69>
		</???:?????????_6B66>
	</xsl:template>
	<!--fade out and zoom	??????????????????UOF_??????????????????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-fade-out-and-zoom']">
		<???:?????????_6B66>
			<???:???????????????_6B6A>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:???????????????_6B6A>
		</???:?????????_6B66>
	</xsl:template>
	<!--contract	??????	 -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-contract']">
		<???:?????????_6B66>
			<???:??????_6BC8>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6BC8>
		</???:?????????_6B66>
	</xsl:template>
	<!--?????? ????????? ??????-->
	<!--?????? ????????? ??????-->
	<!--??????_6BC9-->
	<!--pinwheel	?????????UOF_????????? 	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-pinwheel']">
		<???:?????????_6B6D>
			<???:??????_6B75>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B75>
		</???:?????????_6B6D>
	</xsl:template>
	<!--ascend	?????? 	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-ascend']">
		<???:?????????_6B6D>
			<???:??????_6B76>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B76>
		</???:?????????_6B6D>
	</xsl:template>
	<!--zoom	??????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-zoom']">
		<???:?????????_6B6D>
			<???:??????_6B72>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_E829"/>
			</???:??????_6B72>
		</???:?????????_6B6D>
	</xsl:template>
	<!--descend	??????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-descend']">
		<???:?????????_6B6D>
			<???:??????_6B78>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B78>
		</???:?????????_6B6D>
	</xsl:template>
	<!--unfold	??????	<b1> -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-unfold']">
		<???:?????????_6B6D>
			<???:??????_6B6B>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B6B>
		</???:?????????_6B6D>
	</xsl:template>
	<!--turn and grow 	??????????????????UOF_???????????????????????? 	<b1>-->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-turn-and-grow ']">
		<???:?????????_6B6D>
			<???:?????????????????????_6BCB>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:?????????????????????_6BCB>
		</???:?????????_6B6D>
	</xsl:template>
	<!--ease out	???????????????UOF_????????? 	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-ease-out']">
		<???:?????????_6B6D>
			<???:??????_6BCC>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6BCC>
		</???:?????????_6B6D>
	</xsl:template>
	<!--stretchy 	??????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-stretchy']">
		<???:?????????_6B6D>
			<???:??????_6BCD>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6BCD>
		</???:?????????_6B6D>
	</xsl:template>
	<!--sink down	??????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-sink-down']">
		<???:?????????_6B6D>
			<???:??????_6BCE>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6BCE>
		</???:?????????_6B6D>
	</xsl:template>
	<!--colored lettering	???????????????UOF_?????????????????? 	<b1> -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-colored-lettering']">
		<???:?????????_6B6D>
			<???:???????????????_6B79>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:???????????????_6B79>
		</???:?????????_6B6D>
	</xsl:template>
	<!--center revolve	????????????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-center-revolve']">
		<???:?????????_6B6D>
			<???:????????????_6B7B>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6B7B>
		</???:?????????_6B6D>
	</xsl:template>
	<!--?????? ????????? ??????-->
	<!--?????? ????????? ??????-->
	<!--bounce	?????? 	 -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-bounce']">
		<???:?????????_6B7C>
			<???:??????_6B7D>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B7D>
		</???:?????????_6B7C>
	</xsl:template>
	<!--boomerang	?????????UOF_????????? 	 -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-boomerang']">
		<???:?????????_6B7C>
			<???:??????_6B7E>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B7E>
		</???:?????????_6B7C>
	</xsl:template>
	<!--put on the breaks	?????????UOF_?????????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-breaks']">
		<???:?????????_6B7C>
			<???:??????_6B7F>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B7F>
		</???:?????????_6B7C>
	</xsl:template>
	<!--?????????	 -->
	<!--flip	?????????UOF_????????? 	<b1> -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-flip']">
		<???:?????????_6B7C>
			<???:??????_6B81>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B81>
		</???:?????????_6B7C>
	</xsl:template>
	<!--sling	?????? 	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-sling']">
		<???:?????????_6B7C>
			<???:??????_6B8E>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B8E>
		</???:?????????_6B7C>
	</xsl:template>
	<!--thread	?????????UOF_????????? 	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-thread']">
		<???:?????????_6B7C>
			<???:??????_6B8F>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B8F>
		</???:?????????_6B7C>
	</xsl:template>
	<!--swivel	??????	 -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-swivel']">
		<???:?????????_6B7C>
			<???:??????_6B84>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
				<xsl:attribute name="??????_6B45"><xsl:value-of select="../@presentation:preset-sub-type"/></xsl:attribute>
			</???:??????_6B84>
		</???:?????????_6B7C>
	</xsl:template>
	<!--movie credits	???????????????UOF_???????????? 	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-movie-credits']">
		<???:?????????_6B7C>
			<???:?????????_6B87>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:?????????_6B87>
		</???:?????????_6B7C>
	</xsl:template>
	<!--magnify	?????? 	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-magnify']">
		<???:?????????_6B7C>
			<???:??????_6B89>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B89>
		</???:?????????_6B7C>
	</xsl:template>
	<!--float	?????? 	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-float']">
		<???:?????????_6B7C>
			<???:??????_6B8A>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B8A>
		</???:?????????_6B7C>
	</xsl:template>
	<!--glide	?????? 	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-glide']">
		<???:?????????_6B7C>
			<???:??????_6B8B>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B8B>
		</???:?????????_6B7C>
	</xsl:template>
	<!--swish	?????? 	<b1> -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-swish']">
		<???:?????????_6B7C>
			<???:??????_6B8C>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B8C>
		</???:?????????_6B7C>
	</xsl:template>
	<!--????????????	 -->
	<!--spin out	???????????????UOF_???????????????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-spin-out']">
		<???:?????????_6B7C>
			<???:????????????_6B83>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6B83>
		</???:?????????_6B7C>
	</xsl:template>
	<!--curve down	???????????????UOF_???????????????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-curve-down']">
		<???:?????????_6B7C>
			<???:????????????_6BD0>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:????????????_6BD0>
		</???:?????????_6B7C>
	</xsl:template>
	<!--collapse	??????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-collapse']">
		<???:?????????_6B7C>
			<???:??????_6B90>
				<xsl:attribute name="??????_6B44"><xsl:call-template name="anim_speed"><xsl:with-param name="speed"><xsl:value-of select="parent::anim:par/anim:transitionFilter/@smil:dur"/></xsl:with-param></xsl:call-template></xsl:attribute>
			</???:??????_6B90>
		</???:?????????_6B7C>
	</xsl:template>
	<!--?????? ????????? ??????-->
	<!--end	 -->
	<!--fold	??????	  -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-fold']">
		<???:?????????_6B7C>
			<???:?????? uof:locID="p0119">
				<xsl:copy-of select="parent::node()"/>
			</???:??????>
		</???:?????????_6B7C>
	</xsl:template>
	<!--whip	?????? 	<b1> -->
	<xsl:template match="@presentation:preset-id[. = 'ooo-exit-whip']">
		<???:?????????_6B7C>
			<???:?????? uof:locID="p0119">
				<xsl:copy-of select="parent::node()"/>
			</???:??????>
		</???:?????????_6B7C>
	</xsl:template>
	<xsl:template name="ColorschemesRO">
		<??????:????????????_6BE4>
			<xsl:attribute name="?????????_6B0A">?????????</xsl:attribute>
			<xsl:attribute name="??????_6B0B">??????</xsl:attribute>
			<!--xsl:if test="">
					<xsl:element name="???:?????????_6B02"/>
				</xsl:if>
				<xsl:if test="">
					<xsl:element name="???:???????????????_6B03"/>
				</xsl:if>
				<xsl:if test="">
					<xsl:element name="???:??????_6B04"/>
				</xsl:if>
				<xsl:if test="">
					<xsl:element name="???:????????????_6B05"/>
				</xsl:if>
				<xsl:if test="">
					<xsl:element name="???:??????_6B06"/>
				</xsl:if>
				<xsl:if test="">
					<xsl:element name="???:??????_6B07"/>
				</xsl:if>
				<xsl:if test="">
					<xsl:element name="???:?????????????????????_6B08"/>
				</xsl:if>
				<xsl:if test="">
					<xsl:element name="???:???????????????????????????_6B09"/>
				</xsl:if-->
		</??????:????????????_6BE4>
	</xsl:template>
</xsl:stylesheet>
