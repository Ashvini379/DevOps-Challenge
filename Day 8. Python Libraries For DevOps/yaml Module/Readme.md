# yaml Module

PyYAML is a YAML parser and emitter for Python.

YAML’s block collections use indentation for scope and begin each entry on its own line. Block sequences indicate each entry with a dash and space ( "-"). Mappings use a colon and space (":") to mark each mapping key: value pair.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/24cab27a-a9f3-42b8-a61f-b0d5464e58c1)

```
import yaml
#Python object
names_yaml = """
- 'eric'
- 'justin'
- 'mary-kate'
"""
#Convert yaml document to python object
names = yaml.safe_load(names_yaml)

#dump converts python object into yaml file
with open('names.yaml', 'w') as file:
    yaml.dump(names, file)
#print file content
print(open('names.yaml').read())
```
