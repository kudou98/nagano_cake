class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name,  presence: true
  validates :first_name, presence: true
  validates :last_name_kana,  presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  # カタカナ制限
  validates :telephone_number, presence: true, format: {with: /\A\d{10}$|^\d{11}\z/, message: '10桁か11桁の電話番号を入力してください。'}
  # 電話番号
  validates :postal_code,  presence: true, format: {with: /\A\d{7}\z/}
   # 郵便番号のフォーマット指定 ハイフン無し７桁固定 Viewのフォーム設定
  validates :address, presence: true
  has_many :cart_items, dependent: :destroy
  has_many :ship_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy


  enum is_deleted: {Available: true, Invalid: false} #有効会員はtrue、退会済み会員はfalse
  def active_for_authentication?
      super && (self.is_deleted === "Available")
  end
  #is_activeが有効の場合は有効会員(ログイン可能)


end
