<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="no"/>

<xsl:template match="/lexicon">
<lexicon>
<xsl:for-each select="ar">
	<xsl:sort select="k" order="ascending"/>
	<xsl:copy-of select="."/>
	</xsl:for-each>
</lexicon>
</xsl:template>

</xsl:stylesheet>
