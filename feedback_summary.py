import json
from collections import Counter

# Sample feedback data (could be loaded from a file or database)
sample_feedback = [
    {"student": "Alice", "feedback": "The course was great!", "sentiment": "positive"},
    {"student": "Bob", "feedback": "It was okay, could be improved.", "sentiment": "neutral"},
    {"student": "Charlie", "feedback": "Too fast, I couldn’t understand anything.", "sentiment": "negative"},
    {"student": "Dana", "feedback": "Very informative and well-paced.", "sentiment": "positive"},
    {"student": "Eli", "feedback": "Not bad, but I expected more examples.", "sentiment": "neutral"}
]

def summarize_feedback(feedback_list):
    sentiment_counter = Counter()
    for entry in feedback_list:
        sentiment = entry.get("sentiment", "unknown").lower()
        sentiment_counter[sentiment] += 1

    total = sum(sentiment_counter.values())
    summary = {
        "total_feedback": total,
        "positive": sentiment_counter["positive"],
        "neutral": sentiment_counter["neutral"],
        "negative": sentiment_counter["negative"]
    }

    return summary

def print_summary(summary):
    print("📊 Feedback Summary:")
    print(f"- Total feedback: {summary['total_feedback']}")
    print(f"- Positive: {summary['positive']}")
    print(f"- Neutral: {summary['neutral']}")
    print(f"- Negative: {summary['negative']}")

if _name_ == "_main_":
    summary = summarize_feedback(sample_feedback)
    print_summary(summary)
