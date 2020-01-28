class TodolistsController < ApplicationController
  def new
    #viewへ渡すためのインスタンス変数にからのモデルオブジェクトを生成する
    #@listに深い意味はない。インスタンス変数の名前。
    @list = List.new
  end

  def create
    # このlistって何→新規登録するためのインスタンス（引数:list_params)
    # 急に出てきた引数もよく分からない:newに引数？？
    list = List.new(list_params)

    list.save

    redirect_to '/top'
  end

  private

  def list_params
    # paramsはデータを受け取る、requireで「どこの」permitでキーを指定（何を取るか）
    params.require(:list).permit(:title, :body)

  end
end
