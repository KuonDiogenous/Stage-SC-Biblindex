<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math tei"
    version="3.0">
    <xsl:output method="xml"></xsl:output>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <xsl:variable name="num">
            <xsl:number count="tei:lb" level="any"/>
        </xsl:variable>
        <xsl:element name="lb">
            <xsl:attribute name="n">
                <xsl:value-of select="$num"/>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="@break">
                    <xsl:attribute name="break">
                        <xsl:value-of select="@break"/>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>
<!-- 

    à enlever après transfo :
xmlns=""
instant="false"
full="yes"
part="N"
anchored="true"
-->