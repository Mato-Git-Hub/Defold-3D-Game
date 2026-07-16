components {
  id: "quad_2x2"
  component: "/assets/models/water.model"
  rotation {
    x: -0.70710677
    w: 0.70710677
  }
}
components {
  id: "death_object"
  component: "/main/scripts/water/death_object.script"
}
components {
  id: "water_splash_effect"
  component: "/main/scripts/water/water_splash_effect.script"
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
  "      y: -0.5\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 3\n"
  "    id: \"box\"\n"
  "  }\n"
  "  data: 1.0\n"
  "  data: 0.5\n"
  "  data: 1.0\n"
  "}\n"
  "event_collision: false\n"
  "event_contact: false\n"
  ""
}
