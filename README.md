chef-env-vars Cookbook
======================
A cookbook to help manage ENV variables using data bags.

Attributes
----------

#### chef-env-vars::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chef-env-vars']['vars']</tt></td>
    <td>Array</td>
    <td>an array of ENV variable names to fetch from the env vars databag item.</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

Usage
-----

#### chef-env-vars::default
Add the ENV variables to the `env` `vars` data bag item. 

  knife data bag create --secret-file /etc/chef/encrypted_data_bag_secret env vars

#### databag example

data_bags/env/vars.json

```json
  { "id": "vars", "API_KEY": "akjhsfjlkjlkjw535kjhkjhsd8" }
```

Include the `chef-env-vars` in your node's `run_list` and add the `vars` to the `node/role` attributes.

#### node configuration example

```json
  { "name": "node-name", "vars": [ "API_KEY" ] }
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Umang Chouhan
