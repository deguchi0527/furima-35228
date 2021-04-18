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

crumb :search_items do |item|
  link "#{item.name_eq} 検索ページ", search_items_path(item.id)
  parent :root
end

crumb :show_user do |user|
    user = User.find(params[:id])
    link "#{user.nickname}さん 詳細ページ", user_path(user.id)
    parent :root
end

crumb :edit_user do |user|
  link "#{user.nickname}さん 編集ページ", edit_user_path(user.id)
  parent :show_user
end

crumb :new_card do
  link "クレジットカード登録ページ", new_card_path
  parent :root
end