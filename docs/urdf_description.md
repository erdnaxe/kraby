# URDF description

The **Unified Robot Description Format** (URDF) is an XML format
for representing a robot model. It has been developed
by the Robotic Operating System project (ROS).

Kraby URDF description is available at
<https://github.com/erdnaxe/kraby/blob/master/gym_kraby/data/hexapod.urdf>.

---

## Editing and building the URDF

To simplify URDF editing and to avoid input errors,
the project uses Jinja2[^xacro] templates to generate the URDF.
You may edit files under
[gym_kraby/data/src/](https://github.com/erdnaxe/kraby/tree/master/gym_kraby/data/src)
then execute
[gym_kraby/data/generate_urdf.py](https://github.com/erdnaxe/kraby/tree/master/gym_kraby/data).

[^xacro]: [Xacro](http://wiki.ros.org/xacro) could also be an option, but it
requires to install the ROS toolchain.

---

## Computing 3d-printed part inertia

[Meshlab](http://www.meshlab.net/) is able to compute a inertia tensor from
a STL file with the "*Compute Geometric Measures*" filter.
Nevertheless the STL is in millimeter and Meshlab implies a density of 1.
The following Python script is able to take MeshLab output and print the
corresponding inertia URDF tag.

```Python
mass = float(input("Object Mass is : "))
volume = float(input("Mesh Volume is : "))
print("Inertia Tensor is :")
j = [list(map(float, input("  ").strip().split(" "))) for _ in range(3)]

for i in range(3):
    for k in range(3):
        # Change density and convert millimeter to meter
        j[i][k] *= mass/volume*0.000001

print(f"""\n<inertia ixx="{j[0][0]:.16f}" ixy="{j[0][1]:.16f}" ixz="{j[0][2]:.16f}" iyy="{j[1][1]:.16f}" iyz="{j[1][2]:.16f}" izz="{j[2][2]:.16f}" />""")
```

For example, this is the input and output to computer a foot inertia.

```
% python3 compute_inertia.py
Object Mass is : 0.0105
Mesh Volume is : 15253.618164
Inertia Tensor is :
  8171479.500000 -1091.582153 858.932007
  -1091.582153 6636559.000000 29447.435547
  858.932007 29447.435547 2481984.750000    

<inertia ixx="0.0000056249300217" ixy="-0.0000000007514029"
         ixz="0.0000000005912555" iyy="0.0000045683501941"
         iyz="0.0000000202704742" izz="0.0000017085021793" />
```


For more information, see
<http://gazebosim.org/tutorials?tut=inertia&cat=build_robot>.


