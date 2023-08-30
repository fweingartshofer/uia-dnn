def accuracy(true_positives: int, true_negatives: int, false_positives: int, false_negatives: int) -> float:
    return (true_positives + true_negatives) / (true_positives + true_negatives + false_positives + false_negatives)


def recall(true_positives: int, false_negatives: int) -> float:
    return true_positives / (true_positives + false_negatives)


def precision(true_positives: int, false_positives: int) -> float:
    return true_positives / (true_positives + false_positives)


def f1(true_positives: int, false_positives: int, false_negatives: int) -> float:
    return (2 * true_positives) / (2 * true_positives + false_positives + false_negatives)
