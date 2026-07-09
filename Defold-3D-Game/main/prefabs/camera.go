components {
  id: "camera_controller"
  component: "/main/scripts/camera/camera_controller.script"
}
components {
  id: "camera_level_completed_animation"
  component: "/main/scripts/camera/camera_level_completed_animation.script"
}
embedded_components {
  id: "camera"
  type: "camera"
  data: "aspect_ratio: 1.0\n"
  "fov: 0.7854\n"
  "near_z: 0.1\n"
  "far_z: 1000.0\n"
  "auto_aspect_ratio: 1\n"
  ""
}
