from rest_framework import views, permissions, response, status


class HealthCheckView(views.APIView):

    authentication_classes = ()
    permission_classes = (permissions.AllowAny,)

    def get(self, request):
        return response.Response(status=status.HTTP_200_OK)
