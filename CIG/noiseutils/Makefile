
INCLUDE_DIRS=-I/home/esteban/dev/vm/noiseutils -I/home/esteban/dev/vm/libnoise/include -I/home/esteban/dev/vm/libnoise/include/noise -I../noise
LIBS=-lnoise -lnoiseutils

../lib/noiseutils_bindings.so: noiseutils_bindings.cpp
	clang -xc++ -fPIC --shared $(INCLUDE_DIRS) $(LIBS) noiseutils_bindings.cpp -o ../lib/noiseutils_bindings.so
