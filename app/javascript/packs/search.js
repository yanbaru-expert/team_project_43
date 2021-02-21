document.addEventListener('turbolinks:load', () => {
  // イベントリスナーの登録対象(検索窓)取得
  const search = document.getElementById('language-search')
  // 全てのカードを取得
  const TextCards = document.querySelectorAll('.text-card-container')
  // 実行したい関数
  const filterTextCards = (e) =>{
  // 検索フォームの入力値を取得
  const value = e.target.value.toLowerCase()
  for(const p of TextCards){
  // 入力値がタイトルに含まれるか調べる。有の場合インデックス、無の場合0を返す。
  const isVisible = p.textContent.toLowerCase().indexOf(value)> -1
  // 有の場合は表示、無の場合は、非表示
  p.style.display = isVisible? "" : "none"
  }
}
  // イベントリスナーの登録
  search.addEventListener('input', filterTextCards )
})
