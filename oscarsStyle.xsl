<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="year" />
<xsl:param name="category" />
<xsl:param name="nominee" />
<xsl:param name="info" />
<xsl:param name="won" />
<xsl:template match="/">
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
        <title>IWT | CW2 | jalmaq01</title>
        <meta charset="utf-8" />
    </head>
    <body>
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Search</a></li>
                <li class="breadcrumb-item active" aria-current="page">Results</li>
            </ol>
        </nav>
            <h2 class="text-center">Academy Awards (Oscars) from 1960 to 2010</h2>
        <hr />
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Year</th>
                    <th scope="col">Category</th>
                    <th scope="col">Nominee</th>
                    <th scope="col">Info</th>
                    <th scope="col">Won?</th>
                </tr>
            </thead>
            <tbody>
            <xsl:for-each select="Oscars/Nomination">
                <xsl:if test="./Year[contains(., $year)] 
                    and ./Category[contains(., $category)]  
                    and ./Nominee[contains(., $nominee)] 
                    and ./Info[contains(., $info)]
                    and ./Won[contains(., $won)]">
                    <tr>
                        <td><xsl:value-of select="Year"/></td>
                        <td><xsl:value-of select="Category"/></td>
                        <td><xsl:value-of select="Nominee"/></td>
                        <td><xsl:value-of select="Info"/></td>
                        <td><xsl:value-of select="Won"/></td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
            </tbody>
        </table>
        <div class="footer-copyright text-center py-3">
            <p>I, Jalal Maqdisi, confirm that this coursework submission is entirely my own work, except where explicitly stated otherwise.</p>
        </div>
    </div>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>
