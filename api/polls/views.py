from rest_framework import viewsets
from polls.models import Poll
from api.polls.serializers import PollSerializer

class PollViewSet(viewsets.ModelViewSet):
    """
    an API endpoint for the Poll model
    """
    queryset = Poll.objects.all()
    serializer_class = PollSerializer

