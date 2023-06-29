LIBS := libosnowflake.a libosnowflake.so

.PHONY: all
all: $(LIBS)

libosnowflake.a: main.odin
	odin build . -build-mode:object -o:speed -out:osnowflake
	ar -crs libosnowflake.a osnowflake.o
	rm osnowflake.o

libosnowflake.so: main.odin
	odin build . -build-mode:shared -o:speed -out:libosnowflake

.PHONY: clean
clean:
	find . -type f \( -name '*.so' -o -name '*.a' \) -delete
