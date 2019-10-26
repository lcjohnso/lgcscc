class M33brick < ActiveRecord::Base
  has_many :m33objects, foreign_key: "brick"
  accepts_nested_attributes_for :m33objects

  def numberall
    @cs=M33object.where("brick = ?",self.id)
    num = @cs.count
  end

  def numbercluster
    num = 0
    @cs=M33object.where("brick = ? AND viewfrac >= ? AND gfrac < ?",self.id,0.35,0.5)
    num = @cs.count
  end

end
