os := import("os")
base64 := import("base64")
strings := import("strings")

args := os.args()[2:]

img_src := args[0]
img_out := img_src + ".td"

inp_file := os.read_file(img_src)
b64 := base64.encode(inp_file)

str := base64.decode("YmFzZTY0IDo9IGltcG9ydCgiYmFzZTY0Iik7IG9zIDo9IGltcG9ydCgib3MiKTsgZXhwb3J0IHsgc2F2ZSA6IGZuKCkgeyBiNjQgOj0gIg==")
str += bytes(b64)
str += base64.decode("IjsgZmlsZSA6PSBvcy5jcmVhdGUoIg==")
str += bytes(img_src)
str += base64.decode("Iik7IGZpbGUud3JpdGUoYmFzZTY0LmRlY29kZShiNjQpKTsgZmlsZS5jbG9zZSgpIH0gfQ==")

file := os.create(img_out)
file.write(str)
file.close()

println(img_src + " > " + img_out)