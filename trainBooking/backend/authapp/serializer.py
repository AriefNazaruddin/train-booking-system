from django.contrib.auth.models import User
from rest_framework import serializers

class UserSerializer(serializers.ModelSerializer):
    confirmPassword = serializers.CharField(write_only=True)
    class Meta:
        model = User
        fields = ('username', 'email', 'password', 'confirmPassword')
        extra_kwargs = {'password': {'write_only': True},
                        'confirmPassword' : {'write_only': True}}
        
    def validate(self, data):
        if data['password'] != data['confirmPassword']:
            raise serializers.ValidationError("password and confirm password do not match")
        return data

    def create(self, validated_data):
        validated_data.pop('confirmPassword')
        user = User.objects.create_user(
            username = validated_data['username'],
            email = validated_data['email'],
            password=validated_data['password']
        )
        return user