class UserPolicy < ApplicationPolicy

  def new?
    user.present? && record == user || user_has_power?
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end


  private

  def user_has_power?
    user.admin? || user.moderator?
  end

end
