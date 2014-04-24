ActiveAdmin.register Project do
  index do
    selectable_column
    column :id
    column "Nazwa", :title
    column "Krótki opis", :short_desc do |project|
      project.short_desc.html_safe
    end
    column "Dłuższy opis", :long_desc do |project|
      project.long_desc.html_safe
    end
    if Rails.env.development?
      column "Short dev", :short_desc do |project|
        project.short_desc
      end
      column "Long dev", :long_desc do |project|
        project.long_desc
      end
    end
    column "Lokalizacja", :location
    column "Kod obrazków", :imgcode
    column "Data utworzenia", :created_at
    # column "Ostatnie zmiany", :updated_at
    default_actions
  end

  form do |f|
    f.inputs "Podstawowe informacje" do
      f.input :title, label: "Tytuł"
      f.input :location, label: "Miasto"
    end
    f.inputs "Opisy" do
      f.input :short_desc, as: :html_editor, label: "Opis krótki"
      f.input :long_desc, as: :html_editor, label: "Opis szczegółowy"
    end
    f.actions
  end
  
end
