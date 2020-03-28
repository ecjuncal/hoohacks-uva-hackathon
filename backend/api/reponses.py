class ErrorResponse:
    def __init__(self, message):
        self.error = True
        self.message = message

class SuccessResponse:
    def __init__(self, message):
        self.error = False
        self.message = message
