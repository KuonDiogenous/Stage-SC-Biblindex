<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="html"/>
    
    <xsl:template match="//collection" name="Jérôme">
        <xsl:result-document method="html" href="Jérôme.html">
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">Jérôme</xsl:element>
                    
                </xsl:element>
                <xsl:element name="body">
                    <xsl:element name="h1">
                        <xsl:text>Corpus de textes de Jérôme</xsl:text>
                    </xsl:element>
                    <xsl:element name="nav">
                        <xsl:element name="h2">
                            <xsl:text>Menu</xsl:text>
                        </xsl:element>
                        <xsl:element name="ul">
                            <xsl:for-each select="//collection[@href]">
                                <xsl:element name="li">
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="@href"/>
                                            <xsl:text>.html</xsl:text>
                                        </xsl:attribute>
                                        <xsl:value-of select="replace(replace(replace(@href, '%20', ' '), '.xml', ''), '%C3%A8', 'è')"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>       
            <xsl:call-template name="Lettres"/>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//tei:TEI" name="Lettres">
        <xsl:for-each select="//tei:TEI">
            <xsl:result-document method="html" href="{./@xml:id}.html">
                <xsl:element name="html">
                    <xsl:element name="head">
                        <xsl:element name="title"><xsl:value-of select="./@xml:id"/></xsl:element>
                        
                    </xsl:element>
                    <xsl:element name="body">                        
                        <xsl:element name="nav">
                            
                            <xsl:element name="a">
                                <xsl:attribute name="name">
                                    <xsl:text>top</xsl:text>
                                </xsl:attribute>
                            </xsl:element>
                            
                            <xsl:element name="a">
                                <xsl:attribute name="name">
                                    <xsl:value-of select="./@xml:id"/>
                                </xsl:attribute>
                            </xsl:element>
                            
                            
                            <xsl:call-template name="Anchor_précédant"></xsl:call-template>
                            
                            <xsl:text> | </xsl:text>
                            
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>Jérôme.html</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Retour à la liste des oeuvres de l'auteur</xsl:text>
                            </xsl:element>
                        </xsl:element>
                        
                        <xsl:text> | </xsl:text>
                        
                        <xsl:call-template name="Anchor_suivant"></xsl:call-template>
                        <xsl:element name="main">
                            
                            
                            <xsl:for-each select="tei:text">
                                <xsl:apply-templates></xsl:apply-templates>
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>#top</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Revenir en haut</xsl:text>
                                </xsl:element>
                                
                                
                                <xsl:text> | </xsl:text>
                                
                                
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>Jérôme.html</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Retour à la liste des oeuvres de l'auteur</xsl:text>
                                </xsl:element>
                                
                                
                            </xsl:for-each>
                            <xsl:text> | </xsl:text>
                            <xsl:call-template name="Anchor_suivant"></xsl:call-template>
                        </xsl:element>
                    </xsl:element>
                    
                </xsl:element>       
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    
    <xsl:template match="//tei:TEI" name="Anchor_suivant">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:variable name="num" select="tokenize(@xml:id,'_')[last()]"/>
                <xsl:variable name="incremented" select="xs:integer($num) + 1"/>
                <xsl:text>Lettres_</xsl:text>
                <xsl:value-of select="$incremented"/>
                <xsl:text>.html</xsl:text>
            </xsl:attribute>
            <xsl:text>Aller à la page suivante</xsl:text>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:TEI" name="Anchor_précédant">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:variable name="num" select="tokenize(@xml:id,'_')[last()]"/>
                <xsl:variable name="incremented" select="xs:integer($num) - 1"/>
                <xsl:text>Lettres_</xsl:text>
                <xsl:value-of select="$incremented"/>
                <xsl:text>.html</xsl:text>
            </xsl:attribute>
            <xsl:text>Aller à la page précédente</xsl:text>
        </xsl:element>
    </xsl:template> 
</xsl:stylesheet>
