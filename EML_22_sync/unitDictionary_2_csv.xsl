<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xd" version="1.0"
    xmlns:stmml="http://www.xml-cml.org/schema/stmml-1.2">


    <xd:doc scope="stylesheet">
        <!-- copied from DataSetEnties. for use with loopy2 -->
    </xd:doc>
    <xsl:output method="text" indent="yes" encoding="UTF-8" version="1.0"/>

    <xsl:variable name="delimiter">
        <xsl:text>,</xsl:text>
    </xsl:variable>
    <xsl:variable name="newline">
        <xsl:text>
</xsl:text>
    </xsl:variable>
    <xsl:variable name="space">
        <xsl:text> </xsl:text>
    </xsl:variable>
    <!-- xsl 1.0 does not have the lower-case() function -->
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'"/>
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>

    <!-- 
 code pulls units out of the 2.2 dictionary to compare what the schema allows to what is in the LTER unit registry
         -->

    <xsl:template match="stmml:unitList">

        <xsl:text>id,name,deprecatedInFavorOf,udunitSynonym,parentSi,constantToSi,multiplierToSi,abbreviation,unitType</xsl:text>
        <xsl:value-of select="$newline"/>
        <!-- insert a <xml:text> header here if you want one. 
       <xsl:value-of select="$newline"/>  -->

        <xsl:apply-templates select="stmml:unit"/>

    </xsl:template>

    <xsl:template match="stmml:unit">

        <xsl:value-of select="@id"/>
        <xsl:value-of select="$delimiter"/>

        <xsl:value-of select="@name"/>
        <xsl:value-of select="$delimiter"/>

        <xsl:choose>
            <xsl:when test="@deprecatedInFavorOf">
                <xsl:value-of select="@deprecatedInFavorOf"/>
            </xsl:when>
            <xsl:otherwise>
                <!--     <xsl:text>\N</xsl:text> -->
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$delimiter"/>
        
        <xsl:choose>
            <xsl:when test="@udunitsSynonym != ''">
                <xsl:value-of select="@udunitsSynonym"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- <xsl:text>\N</xsl:text> -->
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$delimiter"/>
        
        <xsl:choose>
            <xsl:when test="@parentSI">
                <xsl:value-of select="@parentSI"/>
            </xsl:when>
            <xsl:otherwise>
                <!--     <xsl:text>\N</xsl:text> -->
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$delimiter"/>
        
        <xsl:choose>
            <xsl:when test="@constantToSI">
                <xsl:value-of select="@constantToSI"/>
            </xsl:when>
            <xsl:otherwise>
                <!--     <xsl:text>\N</xsl:text> -->
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$delimiter"/>
        
        <xsl:choose>
            <xsl:when test="@multiplierToSI">
                <xsl:value-of select="@multiplierToSI"/>
            </xsl:when>
            <xsl:otherwise>
                <!--     <xsl:text>\N</xsl:text> -->
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$delimiter"/>
        
        <xsl:choose>
            <xsl:when test="@abbreviation">
                <xsl:value-of select="@abbreviation"/>
            </xsl:when>
            <xsl:otherwise>
                <!--     <xsl:text>\N</xsl:text> -->
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$delimiter"/>
        
        <xsl:choose>
            <xsl:when test="@unitType">
                <xsl:value-of select="@unitType"/>
            </xsl:when>
            <xsl:otherwise>
                <!--     <xsl:text>\N</xsl:text> -->
            </xsl:otherwise>
        </xsl:choose>

        <xsl:value-of select="$newline"/>

    </xsl:template>




</xsl:stylesheet>
