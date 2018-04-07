module ApplicationHelper
  # GETで検索した時にUTF8=✓のパラメータを付与しないようにoverride
  def utf8_enforcer_tag
    "".html_safe
  end
end
