
Usando ImageMagick

    Crear un PDF con etiquetas de nombre: ImageMagick puede convertir imágenes a PDF y puedes usar anotaciones para agregar texto, pero esto puede ser complicado y limitado directamente con convert. En cambio, sería más efectivo generar primero las imágenes con los nombres y luego convertirlas a PDF.

    bash

for file in *.png; do
  convert "$file" -gravity south -pointsize 12 -annotate +0+10 "%t" "$file.pdf"
done
convert *.pdf output.pdf


Usando Ghostscript

Ghostscript es una suite de software que puede procesar archivos PDF, PostScript y más. Puede comprimir y optimizar archivos PDF sin necesidad de convertir las imágenes a PDF nuevamente.

    Instalar Ghostscript:

    bash

sudo zypper install ghostscript

Comando para optimizar PDF: Este comando puede reducir significativamente el tamaño del archivo PDF, aunque debes tener en cuenta que podría afectar la calidad visual de las imágenes.

bash

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen \
-dNOPAUSE -dQUIET -dBATCH -sOutputFile=output_optimized.pdf output.pdf


Listar los Archivos PNG y Guardar en un Archivo: Utiliza ls para listar los archivos y redirige la salida a un archivo de texto:

bash

ls *.webp > lista_imagenes.txt

Este comando listará todos los archivos que terminen con la extensión .png en el directorio actual y guardará los nombres en el archivo lista_imagenes.txt.
