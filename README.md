# Experimental resources for converting from XDXF to DICT format

## Requirements

- `xsltproc` for converting from XDXF to DICT format
- `dictfmt` to compile the DICT source

You can install them on Ubuntu 18.04 with the following command:
```sh
$ sudo apt install xsltproc dictfmt
```

## How to

1. Create or download a XDXF dictionary source file. If you want to create one yourself, look [here](https://github.com/soshial/xdxf_makedict/blob/master/format_standard/xdxf_description.md) for the specifications.
2. Download the XSL stylesheet `xdxf-2-dictc5.xsl`. This one contains the information to transform the XDXF source into a DICT source file.<br>
Compile with:<br>
`$ xsltproc xdxf-2-dictc5.xsl source > output`<br>
where `source` is your dictionary file and `output` is the name of the output (e.g. dictionary.txt).
3. Compile the new file to DICT format by launching:<br>
`dictfmt -c5 --break-headwords --headword-separator ';' --utf8 basename < dictfile`<br>
where `basename` is the name of your dictionary (e.g. 'mydict') and `dictfile` is the previously generated DICT source.

Now you can copy the result into your dictionary folder and use it in your application.