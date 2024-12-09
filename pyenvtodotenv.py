import env

# File to write environment variables
output_file = ".env"

# Open the file for writing
with open(output_file, "w") as f:
    for key, value in vars(env).items():
        if not key.startswith("__") and isinstance(value, (str, int, float)):
            f.write(f"{key}={value}\n")

print(f"Environment variables have been written to {output_file}")
