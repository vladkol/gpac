<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gpac="urn:enst:gpac" >
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="svg-status-query">
		<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
        	<head>
        		<title>SVG 1.1 <xsl:value-of select="@profile"/> Test Suite - GPAC Implementation Status </title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        		<link rel="stylesheet" type="text/css" href="http://www.w3.org/StyleSheets/TR/base.css"/>
        		<style type="text/css" xml:space="preserve">
                    tr { padding: 0.2em; background: #ddd }
                    td {padding: 0.2em}
                    tr p {margin-top: 0.2em; margin-bottom: 0.2em}
                    .OK { background: #cfc; } 
                    .PARTIAL { background: #eee } 
                    .FAIL { background: #fdc; border: 2px solid #f33 } 
                </style>
        	</head>
            <body>
    
                <h1>SVG 1.1 Test Suite Implementation Results</h1>
                <h1>Profile: <xsl:value-of select="@profile"/></h1>
                <h1>Date : <xsl:value-of select="@date"/></h1>
                <h2><xsl:value-of select="@company"/> - <xsl:value-of select="@product"/> - <xsl:value-of select="@version"/></h2>
                <h3><xsl:value-of select="@gpac:raster"/> - <xsl:value-of select="@gpac:xml-loader"/> - <xsl:value-of select="@gpac:font-engine"/></h3>
				<h2>Global results</h2>
				<table>
					<tbody>
						<tr>
							<td>Total number of tests</td>
							<td align="right"><xsl:value-of select="count(//test)"/></td>
						</tr>
						<tr>
							<td class="OK">Number of (non-empty) tests with status = OK</td>
							<td class="OK" align="right"><xsl:value-of select="count(//test[@status='OK' and @comment!='empty'])"/></td>
							<td class="OK" align="right"><xsl:value-of select="format-number(count(//test[@status='OK' and @comment!='empty']) div count(//test[@comment!='empty']), '.%')"/></td>
						</tr>
						<tr>
							<td class="PARTIAL">Number of (non-empty) tests with status = PARTIAL</td>
							<td class="PARTIAL" align="right"><xsl:value-of select="count(//test[@status='PARTIAL' and @comment!='empty'])"/></td>
							<td class="PARTIAL" align="right"><xsl:value-of select="format-number(count(//test[@status='PARTIAL' and @comment!='empty']) div count(//test[@comment!='empty']), '.%')"/></td>
						</tr>
						<tr>
							<td class="FAIL">Number of (non-empty) tests with status = FAIL</td>
							<td class="FAIL" align="right"><xsl:value-of select="count(//test[@status='FAIL' and @comment!='empty'])"/></td>
							<td class="FAIL" align="right"><xsl:value-of select="format-number(count(//test[@status='FAIL' and @comment!='empty']) div count(//test[@comment!='empty']), '.%')"/></td>
						</tr>
					</tbody>
				</table>
				<h2>Detailled Results</h2>
                <table>
    				<thead>
    					<tr>
    						<th>Test File</th>
    						<th>Revision</th>
    						<th>Comment in case of failure or partial result.</th>
    					</tr>
    				</thead>
                    <tbody>
                    <xsl:apply-templates select="./test"/>
                    </tbody>
                </table>
            </body>
    	</html>
    </xsl:template>


<xsl:template match="test">
	<tr>	  
		<td class="{@status}" align="center"><xsl:value-of select="@name"/></td>
		<td class="{@status}" align="center"><xsl:value-of select="@revision"/></td>
		<td class="{@status}"><xsl:value-of select="@comment"/></td>
	</tr>
</xsl:template>

</xsl:stylesheet>

