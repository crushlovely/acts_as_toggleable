require 'test_helper'

class ActiveRecordTest < Minitest::Test
  setup do
    Article.delete_all
  end

  let(:visible_article) { Article.create(:visible => true) }
  let(:hidden_article) { Article.create(:visible => false) }

  test 'scopes creation based on the parameters passed in' do
    assert_respond_to Article, :visible
    assert_respond_to Article, :hidden
    assert_respond_to Story, :publishable
    assert_respond_to Story, :unpublishable
    assert_respond_to Story, :features
    assert_respond_to Story, :not_featured
  end

  test 'positive scope returns the appropriate records' do
    assert_includes Article.visible, visible_article
    refute_includes Article.visible, hidden_article
  end

  test 'negative scope returns the appropriate records' do
    assert_includes Article.hidden, hidden_article
    refute_includes Article.hidden, visible_article
  end

  test '#toggle toggles the value of the toggleable field' do
    assert_equal visible_article.visible, true
    visible_article.toggle(:visible)
    assert_equal visible_article.visible, false

    assert_equal hidden_article.visible, false
    hidden_article.toggle(:visible)
    assert_equal hidden_article.visible, true
  end

  test '#toggle! toggles the value of the toggleable field' do
    assert_equal visible_article.visible, true
    visible_article.toggle!(:visible)
    visible_article.reload
    assert_equal visible_article.visible, false

    assert_equal hidden_article.visible, false
    hidden_article.toggle!(:visible)
    hidden_article.reload
    assert_equal hidden_article.visible, true
  end
end
