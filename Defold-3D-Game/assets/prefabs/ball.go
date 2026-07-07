components {
  id: "ball_movement"
  component: "/assets/scripts/ball_movement.script"
}
components {
  id: "sphere"
  component: "/assets/modules/models/sphere.model"
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_DYNAMIC\n"
  "mass: 1.0\n"
  "friction: 0.75\n"
  "restitution: 0.0\n"
  "group: \"default\"\n"
  "mask: \"default\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_SPHERE\n"
  "    position {\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 1\n"
  "    id: \"sphere\"\n"
  "  }\n"
  "  data: 0.5\n"
  "}\n"
  "linear_damping: 0.5\n"
  "angular_damping: 0.5\n"
  ""
}
