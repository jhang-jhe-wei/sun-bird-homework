module MaterialHelper
  def first_3_materials_options
    options_for_select(Material.all.first(3).map { |material| [material.name, material.id] })
  end
end
