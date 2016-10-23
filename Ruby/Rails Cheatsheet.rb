# *************** MIGRATIONS ***************

# Create a new table
rails generate migration [name_of_migration]

# Creates new migration and model, plus configures the migration
rails g model ModelName column_1:type column_2:type column_3:type

# Create a new database, if needed
rake db:create

# Specify columns on new table
create_table :[table_name] do |bla|
  bla.string :[column_name], null: false
  bla.timestamps #creates Added On and Modified On
end

# Add column to existing table
add_column :[table_name], :[column_name], :[column_type]

# Add indexes to columns to search them faster. They do take up space, so use them wisely
# Optionally, validate it to unique
add_index :[class_name] :[col_name], unique: true

# Run migration
rake db:migrate

# If downloading a project, run setup to create, migrate and seed all at once:
rake db:setup


# *************** MODELS ***************

# Create a new .rb file and define a new class. By doing this,
# you'll be able to access the table with the same name through a class.
# THE FILE NAME AND THE CLASS NAME MUST MATCH THAT OF THE TABLE!!
class SomeName < ActiveRecord::Base
end

# Create directly into db
SomeName.create(key1: value1, key2: value2)

# Instantiate and create/update the db
new_instance = SomeName.new
new_instance.value_1 = "something"
new_instance.save

SomeName.all #returns all rows of the table

# Delete a row from the table
to_delete = SomeName.first
to_delete.destroy

# Search by ID
SomeName.find(2)

# Search by options hash
SomeName.find_by(key: value)

# Adding validation for one column
validates :col_1, :col_2, uniqueness: true, presence: true

# Adding validation for multiple columns
validates :column_1, uniqueness: { scope: :column_2 }
validates :column_1, uniqueness: { scope: [:column_2, :column_3] }

# Validate on length
validates :password, presence: false, length: { minimum: 6 }

# Generate rnd Session token with 16 chars
SecureRandom::urlsafe_base64(16)


# ***** Associations *****
#These will write setter and getter methods too, so be careful!!

# From the table that holds the foreign key:
belongs_to :[some_name_here], #from here on, it gets treated as a hash
  primary_key: :[p_k_col_name], #this is for whatever table holds the primary key
  foreign_key: :[f_k_col_name], #this is for whatever table holds the foreign key
  class_name: :[class/table_name] #this is the class or table name, which should be the same, for the primary key holder

  # From the table that holds the primary key:
has_many :[some_name_here], #from here on, it gets treated as a hash
  primary_key: :[p_k_col_name], #this is for whatever table holds the primary key
  foreign_key: :[f_k_col_name], #this is for whatever table holds the foreign key
  class_name: :[class/table_name] #this is the class or table name, which should be the same, for the foreign key holder

  # From the table that holds the foreign key to another table that needs JOINing
has_many :[some_method_name], #returns an array
  through: :[name of association in this class]
  source: :[name of association in foregin class that returns the value I want]

has_one :[some_method_name], #returns the first element of the array
  through: :[name of association in this class]
  source: :[name of association in foregin class that returns the value I want]

#Add inverse_of: :cat to create the association on the reverse path
has_many :taggings, inverse_of: :cat

# ***** Validations *****
validates :[col1_name], presence: true, uniqueness: true
validates :[col2_name], presence: true, uniqueness: false

[instance].valid? #checks if it's valid to be saved into db
[instance].errors.full_messages #lists validation errors

validates :no_some_value
def no_some_value
  if self.col1 == 'value1'
    self.errors[:col1] << "can't be value1"
  end
end


# *************** ROUTES ***************

# Lists all routes (verb, URI and controller#action)
bundle exec rake routes


# *************** CONTROLLERS ***************

# Whitelisting of incoming params, so we don't accept and try to change something
# that we don't want change or that doesn't exist
params.require(:book).permit(:title, :author)


# *************** CONTROLLERS ***************
# ***** Check Boxes *****#
# • must be saved as cat[tag_ids][]
# • to capture all checks as hidden, you must add a hidden input with name=cat[tag_ids] value=""
