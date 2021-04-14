crumb :root do
  link "トップページ", root_path
end

crumb :new_user_registration do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :new_user_session do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :new_item do
  link "出品ページ", new_item_path
  parent :root
end

crumb :show_item do |item|
  if params[:item_id]
    item = Item.find(params[:item_id])
    link "#{item.name} 詳細ページ", item_path(item.id)
    parent :root
  else
    item = Item.find(params[:id])
    link "#{item.name} 詳細ページ", item_path(item.id)
    parent :root
  end
end

crumb :edit_item do |item|
  link "#{item.name} 編集ページ", item_path(item.id)
  parent :show_item
end

crumb :item_orders do |item|
  link "#{item.name} 購入ページ", item_orders_path(item.id)
  parent :show_item
end