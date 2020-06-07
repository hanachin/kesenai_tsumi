ActiveRecord::ConnectionAdapters::TableDefinition.prepend(Module.new {
  def column(name, type, index: nil, **options)
    super(name, type, index: index, **options.merge(null: false))
  end
})
