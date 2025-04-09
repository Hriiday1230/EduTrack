# search_feedback.py

class FeedbackManager:
    def __init__(self):
        """Initialize an empty list to store feedback entries."""
        self.feedbacks = []

    def add_feedback(self, student_name, feedback):
        """Add feedback from a student."""
        self.feedbacks.append({"student_name": student_name, "feedback": feedback})

    def search_feedback(self, keyword):
        """Search feedback containing the given keyword (case-insensitive)."""
        return [entry for entry in self.feedbacks if keyword.lower() in entry["feedback"].lower()]

    def display_feedback(self):
        """Display all feedback entries."""
        for entry in self.feedbacks:
            print(f"{entry['student_name']}: {entry['feedback']}")
