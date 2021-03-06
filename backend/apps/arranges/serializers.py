from rest_framework import serializers
from .models import Arrange


class ArrangeSerializer(serializers.ModelSerializer):
    arrange_time = serializers.SerializerMethodField()

    def get_arrange_time(self, obj):
        return obj.arrange_time.strftime('%Y-%m-%d')

    class Meta:
        model = Arrange
        fields = ('title', 'content', 'arrange_time')
