
def summarize_feedback(feedback_list: List[Dict[str, str]]) -> Dict[str, int]:
    """
    Summarizes sentiment counts from a list of feedback entries.

    Args:
        feedback_list (List[Dict]): A list of feedback dicts with a 'sentiment' key.

    Returns:
        Dict[str, int]: A dictionary with total, positive, neutral, and negative counts.
    """
    sentiment_counter = Counter()

    for entry in feedback_list:
        sentiment = entry.get("sentiment", "unknown").lower()
        if sentiment in ["positive", "neutral", "negative"]:
            sentiment_counter[sentiment] += 1

    total = sum(sentiment_counter.values())
    return {
        "total_feedback": total,
        "positive": sentiment_counter.get("positive", 0),
        "neutral": sentiment_counter.get("neutral", 0),
        "negative": sentiment_counter.get("negative", 0)
    }


def print_summary(summary: Dict[str, int]) -> None:
    """
    Prints a formatted summary to the console.

    Args:
        summary (Dict[str, int]): Summary dictionary with sentiment counts.
    """
    print("📊 Feedback Summary:")
    print(f"- Total feedback: {summary['total_feedback']}")
    print(f"- Positive: {summary['positive']}")
    print(f"- Neutral: {summary['neutral']}")
    print(f"- Negative: {summary['negative']}")


if _name_ == "_main_":
    # Example usage
    sample_feedback = [
        {"student": "Alice", "feedback": "Great course!", "sentiment": "positive"},
        {"student": "Bob", "feedback": "Okay, could improve.", "sentiment": "neutral"},
        {"student": "Charlie", "feedback": "Too hard to follow.", "sentiment": "negative"},
    ]
    summary = summarize_feedback(sample_feedback)
    print_summary(summary)
