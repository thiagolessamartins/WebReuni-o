class Pessoa < ActiveRecord::Base
  has_many :convocados
  has_many :participacaos
  belongs_to :user

  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_presence_of :email,:nome, :cpf, :uf, :cidade, :endereco,:message => "não pode ficar em branco"
  validates_uniqueness_of :email,:matricula,:cpf
  validates_format_of :email,with: EMAIL_REGEXP

  Role=%w[admin secretario participante coordenador ]

  UF = %w[ac al ap am ba ce df es go ma mt ms mg pa pb pr pe pi rj rn rs ro rr sc sp se to]
 def self.search(query)

   if query.present? 
           where(["user_id = :query", query: query])
   end
 end

  def self.buscaMatricula(query)

           where(["matricula = :query", query: query])
  end


  def self.buscaCPF(query)

   if query.present? 

           where(["cpf = :query", query: query])
 else
           where(["uf = :query", query: query])
   end
  end
end
