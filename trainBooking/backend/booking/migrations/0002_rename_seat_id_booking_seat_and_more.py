# Generated by Django 5.1.2 on 2024-11-08 06:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('booking', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='booking',
            old_name='seat_id',
            new_name='seat',
        ),
        migrations.RenameField(
            model_name='booking',
            old_name='train_id',
            new_name='train',
        ),
        migrations.RenameField(
            model_name='booking',
            old_name='user_id',
            new_name='user',
        ),
        migrations.RenameField(
            model_name='bookingseat',
            old_name='booking_id',
            new_name='booking',
        ),
        migrations.RenameField(
            model_name='bookingseat',
            old_name='seat_id',
            new_name='seat',
        ),
        migrations.RenameField(
            model_name='coach',
            old_name='train_id',
            new_name='train',
        ),
        migrations.RenameField(
            model_name='seat',
            old_name='coach_id',
            new_name='coach',
        ),
    ]
