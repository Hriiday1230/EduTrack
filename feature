# feedback_manager.py

class FeedbackManager:
    def __init__(self):
        self.feedback_data = []

    def submit_feedback(self, student_name, feedback_text, rating):
        """Submit feedback from a student."""
        feedback = {
            "student_name": student_name,
            "feedback_text": feedback_text,
            "rating": rating
        }
        self.feedback_data.append(feedback)
        return "Feedback submitted successfully!"

    def get_feedback(self):
        """Get all feedback."""
        return self.feedback_data

    def get_average_rating(self):
        """Get the average rating of all feedback."""
        if not self.feedback_data:
            return 0
        total_rating = sum([feedback["rating"] for feedback in self.feedback_data])
        return total_rating / len(self.feedback_data)

    def get_top_scores(self, top_n=3):
        """Return the top N feedback scores."""
        sorted_feedback = sorted(self.feedback_data, key=lambda x: x['rating'], reverse=True)
        return sorted_feedback[:top_n]

    def get_gradewise_counts(self):
        """Return the count of feedback by grade (A, B, C, D, F)."""
        grade_counts = {"A": 0, "B": 0, "C": 0, "D": 0, "F": 0}
        
        for feedback in self.feedback_data:
            rating = feedback["rating"]
            if rating == 5:
                grade_counts["A"] += 1
            elif rating == 4:
                grade_counts["B"] += 1
            elif rating == 3:
                grade_counts["C"] += 1
            elif rating == 2:
                grade_counts["D"] += 1
            elif rating == 1:
                grade_counts["F"] += 1
        
        return grade_counts
Explanation of New Functions:
get_top_scores(top_n=3):

This method sorts the feedback by the rating in descending order and returns the top N feedback entries.

You can specify the number of top scores you want to retrieve by passing an argument top_n.

get_gradewise_counts():

This method counts the number of feedbacks in each grade category (A, B, C, D, F) based on the rating.

It uses a dictionary grade_counts to keep track of how many feedbacks fall into each grade category.

2. Updating Unit Tests
Next, we will update our test suite to test these new functions. We'll add tests for:

The get_top_scores() function.

The get_gradewise_counts() function.

Updated test_feedback_manager.py
python
Copy
# test_feedback_manager.py

from edutrack.feedback_manager import FeedbackManager

def test_submit_feedback():
    manager = FeedbackManager()
    result = manager.submit_feedback("John Doe", "Great course!", 5)
    assert result == "Feedback submitted successfully!"
    assert len(manager.get_feedback()) == 1
    assert manager.get_feedback()[0]["student_name"] == "John Doe"

def test_get_average_rating():
    manager = FeedbackManager()
    manager.submit_feedback("John Doe", "Great course!", 5)
    manager.submit_feedback("Jane Doe", "Good course.", 4)
    assert manager.get_average_rating() == 4.5

def test_get_top_scores():
    manager = FeedbackManager()
    manager.submit_feedback("John Doe", "Great course!", 5)
    manager.submit_feedback("Jane Doe", "Good course.", 4)
    manager.submit_feedback("Alex Smith", "Average course.", 3)
    manager.submit_feedback("Maria Garcia", "Bad course.", 2)
    
    top_scores = manager.get_top_scores(top_n=2)
    assert len(top_scores) == 2
    assert top_scores[0]["rating"] == 5  # Highest rating should be first
    assert top_scores[1]["rating"] == 4  # Second highest rating

def test_get_gradewise_counts():
    manager = FeedbackManager()
    manager.submit_feedback("John Doe", "Excellent course!", 5)
    manager.submit_feedback("Jane Doe", "Decent course.", 4)
    manager.submit_feedback("Alex Smith", "Okay course.", 3)
    manager.submit_feedback("Maria Garcia", "Poor course.", 2)
    manager.submit_feedback("Tom Lee", "Terrible course.", 1)

    grade_counts = manager.get_gradewise_counts()
    
    assert grade_counts["A"] == 1  # One feedback with rating 5
    assert grade_counts["B"] == 1  # One feedback with rating 4
    assert grade_counts["C"] == 1  # One feedback with rating 3
    assert grade_counts["D"] == 1  # One feedback with rating 2
    assert grade_counts["F"] == 1  # One feedback with rating 1
