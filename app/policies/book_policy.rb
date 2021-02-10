class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user: user)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?

    # If the user is the owner of the current book => true
    # Otherwise => false
    # user => current_user
    # record => @book (argument passed to 'authorize')
    # user == record.user || user.admin?

    user == record.user

  end

  def destroy?
    # user == record.user || user.admin?
    user == record.user
  end

private

def user_is_owner_or_admin?
   user == record.user || user.admin
end

end

