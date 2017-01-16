# NAME

Arthub LIDO fixes for Flemish Art Museums.

## SYNOPSIS

These fixes are used to transform records stored in the collection registration
systems of the institutions to [LIDO](http://lido-schema.org) using
[Catmandu](http://librecat.org). LIDO is an XML Schema for Contributing
Content to Cultural Heritage Repositories.

Command line client `catmandu`:

    catmandu convert XML to LIDO --fix msk.fix < input.xml > output.xml

## AVAILABLE FIXES

- Groeninge Museum Bruges: Adlib XML to LIDO XML. See [msk_lido.xml](https://github.com/VlaamseKunstcollectie/Datahub-Fixes/blob/master/msk_lido.xml) for an example record.
- Museum of Fine Arts Ghent: Adlib XML to LIDO XML. See [kmska_lido.xml](https://github.com/VlaamseKunstcollectie/Datahub-Fixes/blob/master/kmska_lido.xml) for an example record.

# SEE ALSO

This module is based on [Catmandu](https://metacpan.org/pod/Catmandu), [Lido::XML](https://metacpan.org/pod/Lido::XML) and [Catmandu::LIDO](https://metacpan.org/pod/Catamndu::LIDO)
