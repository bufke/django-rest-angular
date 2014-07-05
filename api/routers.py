from rest_framework import routers
from api.polls.views import PollViewSet

router = routers.DefaultRouter()
router.register(r'polls', PollViewSet)
api_urls = router.urls
