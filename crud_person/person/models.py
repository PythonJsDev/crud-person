from django.db import models


class Person(models.Model):
    class Roles(models.TextChoices):
        INCUMBENT = "I", "Titulaire"
        TRAPPER = "T", "Piégeur"
        CONTROLLER = "C", "Contrôleur"

    role = models.CharField(max_length=1, choices=Roles.choices, default=Roles.TRAPPER)
    email = models.EmailField(max_length=200, unique=True)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    address = models.CharField(max_length=300)
    zip_code = models.IntegerField()
    city = models.CharField(max_length=50)
    approval_ref = models.CharField(max_length=50, blank=True)

    def __str__(self) -> str:
        return f"{self.first_name} {self.last_name}"
