class CreateRailsAppRole < ActiveRecord::Migration[6.1]
  def up
    execute(<<~SQL)
      revoke all on all tables in schema public from rails_app;
      revoke all on all sequences in schema public from rails_app;
      revoke all on database kesenai_tsumi_development from rails_app;
      drop role rails_app;
      create role rails_app login password 'kesenai';
      grant connect on database kesenai_tsumi_development to rails_app;
      grant select, insert on all tables in schema public to rails_app;
      grant update on all sequences in schema public to rails_app;
    SQL
  end

  def down
    execute(<<~SQL)
      revoke all on all tables in schema public from rails_app;
      revoke all on all sequences in schema public from rails_app;
      revoke all on database kesenai_tsumi_development from rails_app;
      drop role rails_app;
    SQL
  end
end
