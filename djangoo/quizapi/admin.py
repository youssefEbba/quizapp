from django.contrib import admin

from django.contrib import admin

from .models  import Quiz ,Participation ,Question, User

admin.site.register(Quiz)
admin.site.register(Participation)
admin.site.register(Question)
admin.site.register(User)