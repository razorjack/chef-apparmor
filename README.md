# apparmor Cookbook

This cookbook provides a means to enable apparmor and load your own profiles

## Supported Platforms

Ubuntu 12.04 is the only tested platform, but it may work on other Ubuntu versions and Debian. Reports of success or failure are appreciated.

## Usage

### apparmor::default

If all you want to do is enable apparmor with the stock Ubuntu profiles, include `apparmor` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[apparmor::default]"
  ]
}
```

### apparmor\_profile

This definition is used to load your own apparmor profile.

#### Parameters

* `name` - Name of the apparmor profile. Apparmor requires the name be the path of the executable to be confined, with the _/_ replaced by _._.
* `restart_service` - Optional name of a service to restart after the profile is loaded. Defaults to nothing,
* `source` - Source for the apparmor profile file. Defaults to `name`.
* `cookbook` - Cookbook that the `source` is in. Defaults to the cookbook you use the definition in.

#### Example

If you have a profile in *files/default/usr.bin.httpd* in your cookbook, and you want to restart httpd after it is applied:

```
apparmor_profile 'usr.sbin.httpd' do
  restart_service 'httpd'
end
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write chefsepc and/or serverspec tests for your change
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Brian Pitts (brian.pitts@lonelyplanet.com)

```text
Copyright 2014, Lonely Planet

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
