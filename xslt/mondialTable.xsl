<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">
    <xsl:output method="html"></xsl:output>
    <xsl:template match="/">
        <html>
            <head></head>
            <body>
                <h2>Population by continent</h2>
                <table style="border:1px black solid;border-collapse:collapse">
                    <tr>
                        <th></th>
                        <th>Muslim</th>
                        <th>Jewish</th>
                        <th>Cristians</th>
                        <th>Others</th>                        
                    </tr>
                    <xsl:for-each select="*/continent">
                        <xsl:variable name="continent" select="@id"/>
                        <tr style="border:1px black solid">
                            <th style="border:1px black solid"><xsl:value-of select="@id"/></th>
                            <td style="border:1px black solid;padding:5px">
                                <xsl:value-of select="sum(../country[encompassed/@continent=$continent and religion ='Muslim']/population[last()])"/>                                
                            </td>
                            <td style="border:1px black solid;padding:5px">
                                <xsl:value-of select="sum(../country[encompassed/@continent=$continent and religion ='Jewish']/population[last()])"/>                                
                            </td>
                            <td style="border:1px black solid;padding:5px">
                                <xsl:value-of select="sum(../country[encompassed/@continent=$continent and religion = ('Christian Orthodox', 'Christian', 'Congregational Christian', 'Church Christ' , 'Church Tuvalu', 'Christian Congregationalist','United Church','Coptic Christian', 'Ukrainian Greek Catholic' , 'Roman Catholic')]/population[last()])"/>                                
                            </td>
                            <td style="border:1px black solid;padding:5px">
                                <xsl:value-of select="sum(../country[encompassed/@continent=$continent and religion =('Hindu','Protestant','Buddhist','Jehovas Witnesses''Angilcan','Sikh','Bahai','Armenian Apostolic','Yezidi','Jains','Hoa Hao','Cao Dai', 'Druze', 'Seventh-Day Adventist','Presbyterian','Confucianism','Chondogyo','Taoist')]/population[last()])"/>                                
                            </td>                            
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <th>The world</th>
                        <td style="border:1px black solid;padding:5px">
                            <xsl:value-of select="sum(*/country[religion/text()='Muslim']/population[last()])"/>                                
                        </td>
                        <td style="border:1px black solid;padding:5px">
                            <xsl:value-of select="sum(*/country[religion/text()='Jewish']/population[last()])"/>                                
                        </td>
                        <td style="border:1px black solid;padding:5px">
                            <xsl:value-of select="sum(*/country[religion = ('Christian Orthodox', 'Christian', 'Congregational Christian', 'Church Christ' , 'Church Tuvalu', 'Christian Congregationalist','United Church','Coptic Christian', 'Ukrainian Greek Catholic' , 'Roman Catholic')]/population[last()])"/>                                
                        </td>
                        <td style="border:1px black solid;padding:5px">
                            <xsl:value-of select="sum(*/country[religion =('Hindu','Protestant','Buddhist','Jehovas Witnesses''Angilcan','Sikh','Bahai','Armenian Apostolic','Yezidi','Jains','Hoa Hao','Cao Dai', 'Druze', 'Seventh-Day Adventist','Presbyterian','Confucianism','Chondogyo','Taoist')]/population[last()])"/>                                
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>