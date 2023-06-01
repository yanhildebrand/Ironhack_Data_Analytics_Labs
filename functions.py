def remove_punctuation_f(sentence):
    """
    Removes all punctuation marks (commas, periods, exclamation marks, question marks) from a sentence.

    Parameters:
    sentence (str): A string representing a sentence.

    Returns:
    str: The sentence without any punctuation marks.
    """
    punctuation = '''!()-[],<>./?@#$%^&*_~:'''
    sentence = sentence.translate(str.maketrans('', '', punctuation))
    return sentence

def word_count_f(sentence):
    """
    Counts the number of words in a given sentence. To do this properly, first it removes punctuation from the sentence.
    Note: A word is defined as a sequence of characters separated by spaces. We can assume that there will be no leading or trailing spaces in the input sentence.
    
    Parameters:
    sentence (str): A string representing a sentence.

    Returns:
    int: The number of words in the sentence.
    """
    punctuation = '''!()-[],<>./?@#$%^&*_~:'''
    sentence = sentence.translate(str.maketrans('', '', punctuation))
    wordsInSentence = sentence.split()
    numberOfWords1 = len(wordsInSentence)
    return numberOfWords1

