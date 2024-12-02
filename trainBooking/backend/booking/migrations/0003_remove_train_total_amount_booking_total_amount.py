# Generated by Django 5.1.2 on 2024-11-08 07:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('booking', '0002_rename_seat_id_booking_seat_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='train',
            name='total_amount',
        ),
        migrations.AddField(
            model_name='booking',
            name='total_amount',
            field=models.IntegerField(default=0),
            preserve_default=False,
        ),
    ]
