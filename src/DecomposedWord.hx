package ;

/**
 * ...
 * @author Samir Sabri
 */
class DecomposedWord
{

	
		var stripped_harakat:Array<Dynamic> = [];
		var harakat_positions:Array<Dynamic> = [];
		public var stripped_regular_letters:Array<String> = [];
		var letters_position:Array<Dynamic> = [];
		
		public function new(aWord:String, aInier:Bool= false) 
	{
		if (aInier) return;
		var word:Array<String> = aWord.split("");
		for (i in 0... word.length)
		{
			var c:String = word[i];
			if (ArabicReshaper.is_haraka(c)){
				harakat_positions.push(i);
				stripped_harakat.push(c);
			}
			else
			{
				letters_position.push(i);
				stripped_regular_letters.push(c);
			}
		}
	}
	
	function reconstruct_word( aReshaped_word:String) {
		var reshaped_word:Array<String> = aReshaped_word.split("");
		var l:Array<String> = new Array<String>();
		for (i in 0...(stripped_harakat.length+reshaped_word.length))
		{
			l.push("\u0000");
		}
		
		for (i in 0...letters_position.length)
			l[letters_position[i]] = reshaped_word[i];
		for (i in 0...harakat_positions.length)
			l[harakat_positions[i]] = stripped_harakat[i];
		return l.join("");
	}
	function get_reshaped_word(unshaped_word:String):String
	{
		
	var unshaped_word:String = ArabicReshaper.replace_jalalah(unshaped_word);
	unshaped_word = ArabicReshaper.replace_lam_alef(unshaped_word);
	var decomposed_word:DecomposedWord = new DecomposedWord(unshaped_word);
	var result:String = "";
	if (decomposed_word.stripped_regular_letters.length> 0)
		result = reshape_it(decomposed_word.stripped_regular_letters.join(""));
	
		return decomposed_word.reconstruct_word(result);
	}
		
	
	function reshape_it(aUnshaped_word:String=""):String
	{
	var unshaped_word:Array<String> = aUnshaped_word.split("");
	
		if (aUnshaped_word== "")
			return "";
		
		if (unshaped_word.length == 1)
		return ArabicReshaper.get_reshaped_glyph(unshaped_word[0], 1);
		
		var reshaped_word:Array<String> = [];
		for (i in 0...unshaped_word.length)
		{
			var before:Bool = false;
			var after:Bool = false;
			if (i == 0)
				after = ArabicReshaper.get_glyph_type(unshaped_word[i]) == 4;
			else if( i == unshaped_word.length - 1)
				before = ArabicReshaper.get_glyph_type(unshaped_word[i - 1]) == 4;
			else{
				after = ArabicReshaper.get_glyph_type(unshaped_word[i]) == 4;
				before = ArabicReshaper.get_glyph_type(unshaped_word[i - 1]) == 4;
				}
			if (after && before)
				reshaped_word.push(ArabicReshaper.get_reshaped_glyph(unshaped_word[i], 3));
			else if (after && ! before)
				reshaped_word.push(ArabicReshaper.get_reshaped_glyph(unshaped_word[i], 2));
			else if (!after && before)
				reshaped_word.push(ArabicReshaper.get_reshaped_glyph(unshaped_word[i], 4))
			else if (! after && ! before)
				reshaped_word.push(ArabicReshaper.get_reshaped_glyph(unshaped_word[i], 1));
		}		
		return reshaped_word.join("");
		
	}
	
	function is_arabic_character(target:String):Bool
	{
		return ArabicReshaper.ARABIC_GLYPHS.exists(target) || ArabicReshaper.HARAKAT.indexOf(target) != -1;
	}
	
	function get_words(sentence:String):Array<String>
	{
		if (sentence.length> 0)
	
		return new EReg('\\s', "").split(sentence);
		
		return [];
	}
	
	function has_arabic_letters(word:String):Bool
	{
		for (c in 0...word.length)
			if (is_arabic_character(word.charAt(c)))
		return true;
		return false;
	}
	function is_arabic_word(word:String):Bool
	{
	for (c in 0...word.length)
		if (!is_arabic_character(word.charAt(c)))
			return false;
		return true;
	}
	
	
	function get_words_from_mixed_word(word:String):Array<String>
	{
		var temp_word:String = "";
		var words:Array<String> = [];
		for (c in 0...word.length)
		{
			var cc:String = word.charAt(c);
			if (is_arabic_character(cc))
			{
				if (temp_word.length> 0 && ! is_arabic_word(temp_word)){
					words.push(temp_word);
					temp_word = cc;
				}
				else
					temp_word += cc;
			}
			else
			{
				if (temp_word.length > 0 && is_arabic_word(temp_word))
				{
					words.push(temp_word);
					temp_word = cc;
				}
				else
					temp_word += cc;
			}
		}
		if (temp_word.length> 0)
			words.push(temp_word);
		return words;
	}
	
	public function reshape(text:String):String
	{
		var lines:Array<String> = new Array<String>();
		
		if (text.length > 0)
		{
			lines = new EReg('\\r?\\n', "").split(text);
			for (i in 0...lines.length)
				lines[i] = reshape_sentence(lines[i]);
				
				
			// REVERSE
			var reshaped_text:String = lines.join('\n');
			var result:String = "";
			for (i in 0...reshaped_text.length)
			{
				result = reshaped_text.charAt(i) + result;
				
			}
		
			return result;
		}
		
		return "";
	}
	function reshape_sentence(sentence:String):String
	{
		var words:Array<String> = get_words(sentence);
		for (i in 0...words.length)
		{
			var word:String = words[i];
			if (has_arabic_letters(word))
				if (is_arabic_word(word))
					words[i] = get_reshaped_word(word);
				else
				{
					var mixed_words:Array<String> = get_words_from_mixed_word(word);
					for (j in 0...mixed_words.length)
						mixed_words[j] = get_reshaped_word(mixed_words[j]);
					words[i] = mixed_words.join("");
				}
		}
		return words.join(" ");
	}
}

