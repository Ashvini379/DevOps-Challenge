# json Module
```
It is a lightweight data interchange format inspired by JavaScript object literal syntax. It is mainly used for storing and transferring data between the browser and the server.

import json
#json.loads - It converts json data to python object
students='{"John":35,"Jane":45,"Kate":42}'
student_dict=json.loads(students)
print(student_dict)
```

```
import json
#json.dumps - It convert python object to json data
students_dict={"John":35,"Jane":45,"Kate":42}
students_json=json.dumps(students_dict)
print(students_json)
```
