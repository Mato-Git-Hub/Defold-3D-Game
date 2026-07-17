components {
  id: "ball_movement"
  component: "/main/scripts/ball/ball_movement.script"
}
components {
  id: "ball"
  component: "/assets/models/ball.model"
}
components {
  id: "ball_shadow"
  component: "/main/scripts/ball/ball_shadow.script"
}
components {
  id: "dash_particles"
  component: "/assets/particles/dash_particles.particlefx"
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_DYNAMIC\n"
  "mass: 1.0\n"
  "friction: 1.0\n"
  "restitution: 0.0\n"
  "group: \"default\"\n"
  "mask: \"ground\"\n"
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
  "linear_damping: 0.1\n"
  "angular_damping: 0.5\n"
  "bullet: true\n"
  ""
}
