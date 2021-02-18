class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin? or @current_user == @user
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    @current_user.admin? or @current_user == @user
  end

  def edit?
    update?
  end

  def destroy?
    return false if @current_user == @user

    @current_user.admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
