import json

config_file = "/etc/hysteria/config.json"

# Read existing config
with open(config_file, "r") as f:
    config = json.load(f)

# Read new password from input
new_password = input("  * Create New Client Password: ")

# Add the new password to the "config" array in the "auth" section
config["auth"]["config"].append(new_password)

# Update the "disable_udp" value to "false"
config["disable_udp"] = "false"

# Manually format the config JSON with desired structure
updated_config = (
    '{{\n'
    '  "listen": "{listen}",\n'
    '  "protocol": "{protocol}",\n'
    '  "cert": "{cert}",\n'
    '  "key": "{key}",\n'
    '  "up": "{up}",\n'
    '  "up_mbps": {up_mbps},\n'
    '  "down": "{down}",\n'
    '  "down_mbps": {down_mbps},\n'
    '  "disable_udp": {disable_udp},\n'
    '  "obfs": "{obfs}",\n'
    '  "auth": {{\n'
    '    "mode": "passwords",\n'
    '    "config": ["{config_list}"]\n'
    '  }}\n'
    '}}'
).format(
    listen=config["listen"],
    protocol=config["protocol"],
    cert=config["cert"],
    key=config["key"],
    up=config["up"],
    up_mbps=config["up_mbps"],
    down=config["down"],
    down_mbps=config["down_mbps"],
    disable_udp=config["disable_udp"],
    obfs=config["obfs"],
    auth_mode=config["auth"]["mode"],
    config_list='", "'.join(config["auth"]["config"])
)

# Write updated config back to the file
with open(config_file, "w") as f:
    f.write(updated_config)

print("  * * * * * * *")
print("  * Client Authentication Password Added!.")
