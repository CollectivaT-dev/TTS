#!/usr/bin/env python3

from TTS.tts.utils.text.cleaners import catalan_cleaners


def test_time() -> None:
    assert catalan_cleaners("a les 11:45") == "a les onze i quaranta-cinc"
    assert catalan_cleaners("a partir de les 23:12") == "a partir de les vint-i-tres i dotze"

'''
def test_currency() -> None:
    assert phoneme_cleaners("It's $10.50") == "It's ten dollars fifty cents"
    assert phoneme_cleaners("£1.1") == "one pound sterling one penny"
    assert phoneme_cleaners("¥1") == "one yen"
'''

def test_expand_numbers() -> None:
    assert catalan_cleaners("2n") == "segon"
    assert catalan_cleaners("1,33") == "u coma trenta-tres"
