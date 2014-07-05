from polls.models import Poll
from rest_framework import serializers

class PollSerializer(serializers.ModelSerializer):
    """
    serializing the Poll Model for use with the API
    """
    id = serializers.Field()

    class Meta:
        model = Poll

