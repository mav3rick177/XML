<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <xsl:for-each select="mondial/continent">
            <xsl:variable name="id" select="@id"/>
            <xsl:element name="{$id}">
                <xsl:attribute name="superficie">
                    <xsl:value-of select="sum(../country[encompassed/@continent=$id and encompassed/@percentage>50]/@area)"/>
                </xsl:attribute>
                <xsl:attribute name="population">
                    <xsl:value-of select="sum(../country[encompassed/@continent=$id and encompassed/@percentage>50]/population[last()])"/>
                </xsl:attribute>
                <xsl:for-each select="../country[encompassed/@continent=$id]">
                    <xsl:variable name="code" select="@car_code"/>
                    <xsl:element name="pays">
                        <xsl:attribute name="name"><xsl:value-of select="name"/></xsl:attribute>
                        <xsl:attribute name="code"><xsl:value-of select="@car_code"/></xsl:attribute>
                        <xsl:attribute name="population"><xsl:value-of select="population[last()]"/></xsl:attribute>
                        <xsl:element name="villes">
                            <xsl:for-each select="city">
                                <xsl:element name="ville">                                
                                    <xsl:value-of select="name"/>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                        <xsl:element name="aeroports">
                            <xsl:for-each select="../airport[@country=$code]">
                                <xsl:element name="name">
                                    <xsl:value-of select="name"/>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
            
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>