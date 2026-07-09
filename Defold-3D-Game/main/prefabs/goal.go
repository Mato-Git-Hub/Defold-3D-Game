components {
  id: "cube"
  component: "/assets/models/cube.model"
  position {
    y: 0.5
  }
}
components {
  id: "cube1"
  component: "/assets/models/cube.model"
  position {
    y: 1.5
  }
}
components {
  id: "level_completion_tracker"
  component: "/main/scripts/goal/level_completion_tracker.script"
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_TRIGGER\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"default\"\n"
  "mask: \"default\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_BOX\n"
  "    position {\n"
  "      y: 1.0\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 3\n"
  "    id: \"box\"\n"
  "  }\n"
  "  data: 0.5\n"
  "  data: 1.0\n"
  "  data: 0.5\n"
  "}\n"
  ""
}
