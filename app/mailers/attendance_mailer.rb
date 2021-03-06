class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@rennes-events.fr'
 
  def congrat_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = User.find(attendance.user_id)
    @user_email = @user.email

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user_email, subject: 'Inscription check !') 
  end
end
