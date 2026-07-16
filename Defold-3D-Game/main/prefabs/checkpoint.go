components {
  id: "checkpoint_animation"
  component: "/main/scripts/checkpoint/checkpoint_animation.script"
}
components {
  id: "checkpoint_spawnpoint_setting"
  component: "/main/scripts/checkpoint/checkpoint_spawnpoint_setting.script"
}
components {
  id: "checkpoint"
  component: "/assets/models/checkpoint.model"
  rotation {
    x: 0.35355338
    y: 0.14644662
    z: 0.35355338
    w: 0.8535534
  }
}
components {
  id: "checkpoint_particles"
  component: "/assets/particles/checkpoint_particles.particlefx"
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
  "      x: 0.35355338\n"
  "      y: 0.14644662\n"
  "      z: 0.35355338\n"
  "      w: 0.8535534\n"
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
