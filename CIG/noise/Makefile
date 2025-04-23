
INCLUDE_DIRS=-I/home/esteban/dev/vm/libnoise/include -I/home/esteban/dev/vm/libnoise/include/noise
LIBS=-lnoise

../lib/noise_bindings.so: noise_bindings.cpp
	clang -xc++ -fPIC --shared $(INCLUDE_DIRS) $(LIBS) noise_bindings.cpp -o ../lib/noise_bindings.so
