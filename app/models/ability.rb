class Ability
  include CanCan::Ability

  def initialize(user)

    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)
       
       alias_action :read, :create, :update, :destroy, :to => :crud
       
       if user.role == "admin"
         can :crud,  [Pessoa, @pessoa]

           

       elsif user.role == "secretario" 
         can :crud, [Ponto,@ponto]  

         can :crud, [SugestaoItemPautum,@sugestao_item_pautum] 
         can :read, [Reuniao, @reuniao]
         can :update,[Convocado,@convocado]
         can :crud, [Questao,@questao]  
         can :read, [Local,@local]  
         can :read, [Pautum,@pautum]
         can :read, [Atum,@atum]  
         can :update, [Atum,@atum]    
       
       elsif user.role == "participante" 
         can :crud, [Ponto,@ponto]  
         can :create, [SugestaoItemPautum,@sugestao_item_pautum]
         can :read, [SugestaoItemPautum,@sugestao_item_pautum]
         can :read, [Reuniao,@reuniao]
         can :read, [Local,@local]
         can :update, [Convocado,@convocado]
         can :create, [Questao,@questao]
         can :read, [Questao,@questao]
         can :read, [Pautum,@pautum]
         can :read, [Atum,@atum]
       
       elsif user.role == "coordenador"
          can :manage, :all
       end

  end
end
