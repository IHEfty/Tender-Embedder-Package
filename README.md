# **Tender Embedder Package**

The **Tender Embedder Package** enables seamless embedding of binary files (e.g., images) into Tender scripts by converting them into base64 format. This utility is especially useful for integrating external resources directly within your Tender projects without relying on external file systems.

## **Overview**

The `embedder.td` script reads an input file, encodes it into base64 format, and generates a corresponding `.td` file. This output file contains the encoded data and the necessary logic to decode and utilize the embedded content within your Tender scripts.

### **Key Features**

- **File Embedding**: Embed any file (e.g., images, documents) into a `.td` script.
- **Base64 Encoding**: Converts binary files to base64, making them suitable for text-based embedding.
- **Tender-Compatible Output**: Generates `.td` files that are easily importable and executable within Tender.
- **Self-Contained Resource**: Avoids the need for external file dependencies by embedding everything directly in your Tender scripts.

## **Getting Started**

To get started with **Tender**, follow these steps:

### **1. Install Go**

Ensure you have the latest version of Go installed on your machine. You can download it from the [official Go website](https://golang.org/).

### **2. Install Tender**

Once Go is installed, you can install **Tender** by running the following command:

```bash
go install github.com/2dprototype/tender/cmd/tender@latest
```

Alternatively, you can download precompiled binaries from the [Tender Releases page](https://github.com/2dprototype/tender/releases). Choose the appropriate binary for your operating system and follow the installation instructions provided there.

### **3. Install the Embedder Package**

Place the `embedder.td` file in the `pkg` directory of your Tender installation. Your directory structure should look like this:

```plaintext
/tender
├───bin
│   └───tender.exe
└───pkg
    ├───embedder.td
    ├───<other packages>
```

## **Usage Instructions**

Once the script is in the correct directory, you can use it to embed files into Tender scripts.

### **Basic Command**

To embed a file, such as `join_us.png`, run the following command:

```bash
tender embedder.td join_us.png
```

This will create a new file:

```bash
join_us.png > join_us.png.td
```

### **How It Works**

- The input file (`join_us.png`) is read and encoded into base64 format.
- A new Tender script (`join_us.png.td`) is created, which contains both the encoded content and the logic to decode and save the file when executed within a Tender environment.

### **Example Usage in Code**

Here’s an example of how the `embedder.td` script works behind the scenes:

```tender
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
```

### **Output Explanation**

- **Step 1**: The file is read and encoded using the base64 module.
- **Step 2**: A new `.td` file is created containing the base64 data and the necessary decoding logic.
- **Step 3**: The `.td` file can later be executed to retrieve and use the original file content.

## **Technical Requirements**

- **Tender Language Environment**: Ensure that you are running this script in a properly configured Tender setup.
- **Base64 Encoding**: The script relies on the `base64` module to convert files into a format that can be embedded into Tender scripts.

## **File Structure**

```plaintext
/tender
├───bin
│   └───tender.exe
└───pkg
    ├───embedder.td
    ├───ansi.td
    ├───console.td
    ├───<other packages>
```


## Contributing

Contributions to the `embedder` package are welcome! If you have suggestions for new features, improvements, or bug fixes, please feel free to open an issue or submit a pull request.

## **Explore More**

To explore more **Tender** projects and get access to additional code examples, visit the following repository:

[1000+ Codes in Tender](https://github.com/IHEfty/1000-Codes-in-Tender/)

This repository contains a rich collection of Tender-based code samples, ranging from simple applications to complex utilities, allowing you to enhance your understanding of **Tender** and its capabilities.

## License

This project is licensed under the MIT License. For details, please refer to the [LICENSE](LICENSE) file.
