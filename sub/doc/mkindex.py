#!/usr/bin/python
#
# ./mkindex.py

import glob
import os
import markdown
import codecs
import shutil

def main():
    houtn='htmlout'
    hout=os.path.join(os.getcwd(), houtn)
    if(os.path.isdir(hout)):
        shutil.rmtree(hout)

    os.mkdir(hout)

    files=glob.glob('*.txt')
   
    indexf= 'index.html'
    indexfname = os.path.join(hout,indexf) 
    index = open(indexfname, "w") 

    index.write(header + "\n")
    title =  os.path.basename(os.getcwd())
    index.write("<h2>" + title + "</h2>")
    index.write("<ul>")
    for f in files:
        bn, ext = os.path.splitext(f)
        htmlf=bn + '.html'
        htmlfname = os.path.join(hout,htmlf) 
        txtfile = codecs.open(f,mode="r", encoding="utf8")
        raw = txtfile.read()
        html = markdown.markdown(raw)
        htmlfile = codecs.open(htmlfname, mode="w", encoding="utf8")
        htmlfile.write(html)


        link = "<a href='" + htmlf + "'>" + bn + "</a><p>"
        index.write(link + "\n")

    index.write("</ul>")
    index.write(footer + "\n")
    index.close()




header="""
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title></title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="generator" content="pandoc" />
  <meta name="date" content="" />
</head>
<body>
"""
footer="""
</body>
</html>

"""


if __name__ == "__main__":
    main()
