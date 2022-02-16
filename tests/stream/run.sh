#!/bin/bash

EXE=bin/stream

for psize in 16384 #4096 8192 16384
do
    for t in 8 #1 2 4 8 16 32 64
    do
	env OMP_NUM_THREADS=$t UMAP_PAGESIZE=${psize} ./${EXE}
	env OMP_NUM_THREADS=$t UMAP_PAGESIZE=${psize} UMAP_BUFSIZE=$(( 240000000/psize/2)) UMAP_PAGE_FILLERS=1 UMAP_PAGE_EVICTORS=1 ./${EXE}
	env OMP_NUM_THREADS=$t UMAP_PAGESIZE=${psize} UMAP_BUFSIZE=$(( 240000000/psize/2)) ./${EXE}
    done
    echo "Done"
done
