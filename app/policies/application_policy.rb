class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    can_moderate?(user, record)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def scope
    record.class
  end

  private

  def can_moderate?(user, record)
   @user = user
   @record = record 
   user.present? && (record.user == user or user.role?(:admin) or user.role?(:moderator))  
  end

end

