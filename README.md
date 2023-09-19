# Actions on mount in macOS

### Prerequisites:
Copy `action_on_mount.sample.sh` to `action_on_mount.sh` and replace with needed code.

### Setup:
```sh
# with default action_on_mount.sh
./setup.sh
# Or with custom script file name
./setup.sh custom_script_name.sh
```

### Remove
```sh
./remove.sh
```


### Notes:
Personally I used direnv to store env variables in `.envrc` file and automatically run code inside them on enter directory
