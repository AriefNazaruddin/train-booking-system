# Generated by Django 5.1.2 on 2024-11-08 08:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('booking', '0003_remove_train_total_amount_booking_total_amount'),
    ]

    operations = [
        migrations.AddField(
            model_name='train',
            name='destination',
            field=models.CharField(default=8, max_length=255),
            preserve_default=False,
        ),
    ]
