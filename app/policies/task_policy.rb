class TaskPolicy < Struct.new(:user, :task)

  def admin?
    if user.role === "admin" or task.created_user_id === user.id
      true
    end
  end
end