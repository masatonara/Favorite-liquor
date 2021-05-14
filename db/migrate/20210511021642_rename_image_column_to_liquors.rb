class RenameImageColumnToLiquors < ActiveRecord::Migration[5.2]
  def change
    rename_column :liquors, :image, :liquor_image_id
  end
end
