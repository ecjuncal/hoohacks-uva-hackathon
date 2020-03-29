class ErrorResponse:
    def __init__(self, message):
        self.error = True
        self.message = message


class SuccessResponse:
    def __init__(self, message):
        self.error = False
        self.message = message


class DbModelResponse:
    def __init__(self, model):
        self.error = False
        self.model = model

    def __dict__(self):
        return {**{"error": self.error}, **self.model}
