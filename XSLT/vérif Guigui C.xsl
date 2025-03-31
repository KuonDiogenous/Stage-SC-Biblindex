<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.1">
    
    <xsl:output method="html"/>
    
    <xsl:template match="xi:include[@ref='Guillaume de Saint-Thierry']" name="Guillaume">
        <xsl:result-document method="html" href="Guillaume de Saint-Thierry.html">
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">Guillaume de Saint-Thierry</xsl:element>
                    
                </xsl:element>
                <xsl:element name="body">
                    <xsl:element name="h1">
                        <xsl:text>Corpus de textes de Guillaume de Saint-Thierry</xsl:text>
                    </xsl:element>
                    <xsl:element name="nav">
                        <xsl:element name="h2">
                            <xsl:text>Menu</xsl:text>
                        </xsl:element>
                        <xsl:element name="ul">
                            <xsl:for-each select=".//tei:TEI">
                                <xsl:sort select="tokenize(base-uri(),'/')[last()]" order="ascending"></xsl:sort>
                                <xsl:element name="li">
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="@xml:id"/>
                                            <xsl:text>.html</xsl:text>
                                        </xsl:attribute>
                                        <xsl:value-of select="replace(replace(replace(tokenize(base-uri(),'/')[last()], '%20', ' '), '.xml', ''), '%C3%A8', 'è')"/>
                                        </xsl:element>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                <xsl:call-template name="Texte"/>
            </xsl:element>       
            
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//tei:TEI" name="Texte">
        <xsl:for-each select="//tei:TEI">
            <xsl:result-document method="html" href="{./@xml:id}.html">
                <xsl:element name="html">
                    <xsl:element name="head">
                        <xsl:element name="title"><xsl:value-of select="replace(replace(replace(tokenize(base-uri(),'/')[last()], '%20', ' '), '.xml', ''), '%C3%A8', 'è')"/></xsl:element>
                        
                    </xsl:element>

                        <xsl:element name="body">                        
                        <xsl:element name="nav">
                            <xsl:element name="a"><xsl:attribute name="name"><xsl:text>top</xsl:text></xsl:attribute></xsl:element>
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>Guillaume de Saint-Thierry.html</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Retour à la liste des oeuvres de l'auteur</xsl:text>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="main">

                            <xsl:for-each select="tei:text">
                                <xsl:apply-templates></xsl:apply-templates>
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>#top</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Revenir en haut</xsl:text>
                                </xsl:element>
                                <xsl:text> ou </xsl:text>
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>Guillaume de Saint-Thierry.html</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Retour à la liste des oeuvres de l'auteur</xsl:text>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:element>
                    
                </xsl:element>       
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
   
    
</xsl:stylesheet>
