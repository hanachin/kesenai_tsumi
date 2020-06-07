
ActiveRecord::ConnectionAdapters::TableDefinition.prepend(Module.new {
  def column(name, type, index: nil, **options)
    super(name, type, index: index, **options.merge(null: false))
  end
})

# NOTE: PostgreSQLAdapter is not loaded before connecion resolved
require "active_record/connection_adapters/postgresql_adapter"
ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.prepend(Module.new {
  def add_column(table_name, column_name, type, **options)
    super(table_name, column_name, type, **options.merge(null: false))
  end
})
