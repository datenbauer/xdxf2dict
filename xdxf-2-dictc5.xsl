<?xml version="1.0" encoding="UTF-8"?>
<!-- 
	XSLT stylesheet for transforming XDXF dictionaries into DICT format (-c5 variant).
	
	The resulting file can be compiled with the following command:
	$ dictfmt -c5 -break-headwords -headword-separator ';' -utf8 <file>
	
	
	PROGRESS:
	- über „ar“s iterieren
	- mehrere Schlüsselwörter mit Strichpunkten auflisten
	- nummerierte Liste aller Bedeutungen (getrennt mit Kommas)
	- falls nicht verschachtelt, unnummerierter Eintrag
	- Beispiele aufführen
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="text" indent="no" encoding="UTF-8"/>

<!--=======================================================
			LEXICON TEMPLATE
========================================================-->
<xsl:template match="/xdxf/lexicon">
<!-- erster Trennstrich (vor erstem Eintrag) -->
<xsl:text>_____
</xsl:text>

<!-- Vorlage für ar aufrufen -->
<xsl:apply-templates select="ar"/>
</xsl:template>


<!--=======================================================
			AR TEMPLATE
========================================================-->
<xsl:template match="ar">
<!-- Leerzeile -->
<xsl:text>
</xsl:text>

<!-- Schlüsselwörter auflisten -->
<xsl:for-each select="k">
<xsl:value-of select="."/><xsl:if test="position() != last()">;</xsl:if>
</xsl:for-each>

<!-- neue Zeile -->
<xsl:text>
</xsl:text>

<!-- nummerierte liste aller defs erzeugen -->
<xsl:choose>
	<xsl:when test="def/def">
		<xsl:for-each select="def/def">
<xsl:number value="position()"/><xsl:text>. </xsl:text> <xsl:apply-templates select="."/>
<xsl:text>
</xsl:text>
<xsl:text>
</xsl:text>
		</xsl:for-each>
	</xsl:when>
	<xsl:otherwise>
		<xsl:apply-templates select="def"/>
	</xsl:otherwise>
</xsl:choose>

<!-- abschließender Trennstrich -->
<xsl:text>
_____
</xsl:text>

</xsl:template>

<!--=======================================================
			DEF TEMPLATE
========================================================-->
<xsl:template match="def">
<xsl:for-each select="deftext"><xsl:value-of select="."/><xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each>
<xsl:text>
</xsl:text>

<!-- Beispiele -->
<xsl:if test="ex">
<xsl:text>Bsp.:
</xsl:text>
</xsl:if>
<xsl:for-each select="ex">
<xsl:apply-templates select="."/>
</xsl:for-each>
</xsl:template>

<!--=======================================================
			EX TEMPLATE
========================================================-->
<xsl:template match="ex">
<xsl:text>  </xsl:text><xsl:value-of select="ex_orig"/><xsl:text> -- </xsl:text><xsl:value-of select="ex_tran"/>
<xsl:text>
</xsl:text>
</xsl:template>

</xsl:stylesheet>