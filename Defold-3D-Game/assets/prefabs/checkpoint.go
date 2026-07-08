components {
  id: "cube"
  component: "/assets/modules/models/cube.model"
}
components {
  id: "checkpoint_animation"
  component: "/assets/scripts/checkpoint/checkpoint_animation.script"
}
components {
  id: "checkpoint_spawnpoint_setting"
  component: "/assets/scripts/checkpoint/checkpoint_spawnpoint_setting.script"
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
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 3\n"
  "    id: \"box\"\n"
  "  }\n"
  "  data: 0.5\n"
  "  data: 0.5\n"
  "  data: 0.5\n"
  "}\n"
  "event_collision: false\n"
  "event_contact: false\n"
  ""
}
