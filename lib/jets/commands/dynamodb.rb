module Jets::Commands
  class Dynamodb < Jets::Commands::Base
    desc "migrate", "Runs DynamoDB migrations"
    long_desc Help.text('dynamodb:migrate')
    def migrate
      Dynomite::Migration::Runner.new(options).run
    end

    desc "generate NAME", "Creates a migration for a DynamoDB table"
    long_desc Help.text('dynamodb:generate')
    option :action, desc: "create_table or update_table. Defaults to convention based on the name of the migration."
    option :partition_key, default: "id:string", desc: "table's partition key"
    option :sort_key, default: nil, desc: "table's sort key"
    option :table_name, desc: "override the the conventional table name"
    def generate(name)
      Dynomite::Migration::Generator.new(name, options).generate
    end
  end
end
