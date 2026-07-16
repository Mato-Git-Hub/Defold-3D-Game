components {
  id: "level_completion_tracker"
  component: "/main/scripts/goal/level_completion_tracker.script"
}
components {
  id: "goal"
  component: "/assets/models/goal.model"
  position {
    x: 0.1
    y: 1.0
  }
}
components {
  id: "checkpoint_animation"
  component: "/main/scripts/checkpoint/checkpoint_animation.script"
  properties {
    id: "movement_amplitude"
    value: "0.5"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "movement_frequency"
    value: "0.2"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "rotation_frequency"
    value: "0.05"
    type: PROPERTY_TYPE_NUMBER
  }
}
components {
  id: "goal_idle"
  component: "/assets/particles/goal_idle.particlefx"
  position {
    y: 0.75
  }
}
components {
  id: "goal_particles"
  component: "/main/scripts/goal/goal_particles.script"
}
components {
  id: "goal_finish"
  component: "/assets/particles/goal_finish.particlefx"
  position {
    y: 0.5
  }
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
