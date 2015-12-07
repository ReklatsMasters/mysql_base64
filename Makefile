TARGET = udf_gbbase64.so

all: $(TARGET)

$(TARGET): base64.c
	$(CC) -Wall -O2 -shared -fPIC $(CFLAGS) $(LDLAGS) -o "$@" $^

clean:
	rm -f "$(TARGET)"

install: $(TARGET)
	[ -d "/usr/lib64/mysql/plugin" ] && install -m 0644 "$(TARGET)" "/usr/lib64/mysql/plugin"

uninstall:
	[ -f "/usr/lib64/mysql/plugin/$(TARGET)" ] && rm -f "/usr/lib64/mysql/plugin/$(TARGET)"
