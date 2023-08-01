ActiveAdmin.register Post, as: 'Post' do
    menu priority:3, label: 'Posts'
    actions :all, :except => [:destroy]
    permit_params :name, :status, :description
  
    index do
      selectable_column
      id_column
      column :name
      column :status
      column :description
      actions defaults: false do |post|
        item "View", admin_post_path(post), class: "view_link"
        item "Edit", edit_admin_post_path(post), class: "edit_link"
      end
    end
  
    filter :name
  
    form do |f|
      inputs "Post" do
        f.input :name
        f.input :status, as: :select, collection: %w[approved rejected]
        f.input :description
      end
      actions
    end

    show title: 'Post Details' do
      attributes_table do
        row :name
        row :status
        row :description
      end
    end
  end