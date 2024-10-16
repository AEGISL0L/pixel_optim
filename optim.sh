#!/bin/bash
for file in *.png; do
    cwebp -q 80 "$file" -o "${file%.png}.webp"
done
echo "Conversión a WebP completada para todas las imágenes PNG."
 



#!/bin/bash
for file in *.png; do
    pngquant --quality=65-80 --ext .png --force "$file"
    advpng -z -4 "$file"
done
echo "Optimización completa para todos los archivos PNG."
 




for file in *.png; do
  nice -n -10 pngcrush -rem alla -reduce -brute "$file" "optimized_$file"
done



#!/bin/bash
LOGFILE="conversion_log.txt"
echo "Iniciando conversión: $(date)" > $LOGFILE

for file in *.png; do
  original_size=$(stat -c%s "$file")
  best_size=$original_size
  best_file=""
  
  for quality in 30 40 50 60; do
    for method in 4 5 6; do
      output="${file%.png}_q${quality}_m${method}.webp"
      if cwebp -q $quality -m $method -pass 6 -f 80 -af -near_lossless 80 -mt "$file" -o "$output"; then
        current_size=$(stat -c%s "$output")
        echo "Archivo $output creado con tamaño $current_size bytes." >> $LOGFILE
        if [ $current_size -lt $best_size ]; then
          best_size=$current_size
          best_file=$output
        fi
      else
        echo "Error creando $output para $file con calidad $quality y método $method" >> $LOGFILE
      fi
    done
  done

  echo "Best file for $file is $best_file with size $best_size bytes" >> $LOGFILE

  # Limpiar archivos temporales y renombrar el mejor archivo
  if [ -n "$best_file" ]; then
    for quality in 30 40 50 60; do
      for method in 4 5 6; do
        output="${file%.png}_q${quality}_m${method}.webp"
        if [ "$output" != "$best_file" ]; then
          rm -f "$output"
        fi
      done
    done
    mv "$best_file" "${file%.png}.webp"
  fi

done

echo "Conversión completada: $(date)" >> $LOGFILE
 
