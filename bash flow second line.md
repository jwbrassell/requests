**Request:** I am looking for a bash script that will allow me to output a box for each item in a list. In the below example, list is contains "TEXT 1", "TEXT 2", "TEXT 3".

**Example1:**
```
+--------+    +--------+    +--------+
| TEXT 1 | -> | TEXT 2 | -> | TEXT 3 | 
+--------+    +--------+    +--------+ 
                  |
                  |  +--------+
                  |->| subtext|
                     +--------+
```
**Example of how the CSV would be structure to generate the above:**
| TASK   | SUB TASK | SUB SUB TASK |
|--------|----------|--------------|
| TEXT 1 |          |              |
| TEXT 2 | subtext  |              |
| TEXT 3 |          |              |

**Example2:**
```
+--------+    +--------+    +--------+    +--------+    +--------+    +--------+
| TEXT 1 | -> | TEXT 2 | -> | TEXT 3 | -> | TEXT 4 | -> | TEXT 5 | -> | TEXT 6 | 
+--------+    +--------+    +--------+    +--------+    +--------+    +--------+
                  |                                         |
                  |  +-----------+                          |  +-----------+
                  |->| sub task 1|                          |->| sub task 1|
                     +-----------+                          |  +-----------+
                          |                                 |
                          |  +---------------+              |  +-----------+
                          |->| sub sub task 2|              |->| sub task 2|
                             +---------------+                 +-----------+
``` 
**Example of how the CSV would be structure to generate the above:**
| TASK   | SUB TASK               | SUB SUB TASK   |
|--------|------------------------|----------------|
| TEXT 1 |                        |                |
| TEXT 2 | sub task 1             | sub sub task 2 |
| TEXT 3 |                        |                |
| TEXT 4 |                        |                |
| TEXT 5 | sub task 1, sub task 2 |                |
| TEXT 6 |                        |                |

+ I would like this to expand on the first version you wrote and add some capability. 
  - I want to be able to upload a csv (just tell the file the path where the csv file is) and from that csv file draw the above. 
  - I want to be able to have boxes that show underneath another one that basically shows as a sub task under it or a third layer of sub sub tasks
  - id like the output to stay with consistent spacing 
  
  
