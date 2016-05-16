ActiveRecord::Schema.define(:version => 0) do
  create_table :stories do |t|
    t.boolean :publishable, :null => false, :default => false
    t.boolean :featured, :null => false, :default => false
  end

  create_table :articles do |t|
    t.boolean :visible, :null => false, :default => false
  end
end
