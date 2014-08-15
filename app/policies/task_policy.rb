class TaskPolicy < Struct.new(:user, :task)

  def hoge?
  	
  end

  def index?
    false
    #allow_all
  end

  def show?
    false
  end

  def create?
    allow_all
  end

  def new?
    allow_all
  end

  def update?
	allow_owner_admin
  end

  def edit?
	allow_owner_admin
  end

  def destroy?
	allow_owner_admin
  end

  def owned?
	task.created_user_id === user.id
  end

  private
    def is_admin
      user.role === "admin"
	end

	def owned
	  task.created_user_id === user.id
	end

	def allow_all
	  true
	end

	def allow_owner_admin
	  if owned or is_admin
		true
	  end
	end
end