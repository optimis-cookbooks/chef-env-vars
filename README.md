chef-env-vars Cookbook
======================
A cookbook to help manage ENV variables using data bags.

Requirements
------------

#### packages
- `openssl` - chef-env-vars needs openssl to decrypt encrypted data bag items.

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
    <td>an array of ENV variables</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['chef-env-vars']['vars']['name']</tt></td>
    <td>String</td>
    <td>the ENV variable name</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['chef-env-vars']['vars']['data_bag']</tt></td>
    <td>String</td>
    <td>the data bag containing the ENV variable value</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['chef-env-vars']['vars']['encrypted']</tt></td>
    <td>Boolean</td>
    <td>is the ENV variable value encrypted?</td>
    <td><tt>true</tt></td>
  </tr> 
</table>

Usage
-----
#### chef-env-vars::default
Add a `data bag` and items for each ENV variable. Also, encrypt the data bag items if needed. Include `chef-env-vars` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef-env-vars]"
  ]
}
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
