components {
  id: "loader"
  component: "/main/scripts/collection_manager/loader.script"
}
embedded_components {
  id: "level_1"
  type: "collectionproxy"
  data: "collection: \"/main/collections/level_1.collection\"\n"
  ""
}
embedded_components {
  id: "level_0"
  type: "collectionproxy"
  data: "collection: \"/main/collections/main_menu.collection\"\n"
  ""
}
embedded_components {
  id: "level_2"
  type: "collectionproxy"
  data: "collection: \"/main/collections/level_2.collection\"\n"
  ""
}
