<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html"/>
    <xsl:decimal-format name="pop" grouping-separator=" "/>
    <xsl:template match="/">
        <html>
            <head></head>
            <body>
                <h2>Pays du monde</h2>
                <ul>
                    <xsl:variable name="color">black</xsl:variable>
                        
                    <xsl:for-each select="*/country">
                        <xsl:sort select="population[last()]" data-type="number" order="descending"/>
                        <xsl:variable name="color">                            
                            <xsl:choose>
                                <xsl:when test="encompassed/@continent = 'europe'">#888</xsl:when>
                                <xsl:when test="encompassed/@continent = 'america'">#800</xsl:when>
                                <xsl:when test="encompassed/@continent = 'asia'">#008</xsl:when>
                                <xsl:when test="encompassed/@continent = 'australia'">#880</xsl:when>
                                <xsl:otherwise>#000</xsl:otherwise>                            
                            </xsl:choose>
                        </xsl:variable>
                        <li>
                            <xsl:attribute name="style" select="concat('color:',$color)"></xsl:attribute>
                            <xsl:value-of select="name"/> -
                            <xsl:value-of select="format-number(population[last()], '# 000', 'pop')"/>
                        </li>
                    </xsl:for-each>
                    <xsl:for-each select="*/country">
                        <xsl:if test="/encompassed"></xsl:if>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>