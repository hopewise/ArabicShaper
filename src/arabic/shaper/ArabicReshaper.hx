package arabic.shaper ;

/**
 * ...
 * @author Samir Sabri
 */
class ArabicReshaper
{

	public static inline var DEFINED_CHARACTERS_ORGINAL_ALF_UPPER_MDD 		= '\u0622';
	public static inline var DEFINED_CHARACTERS_ORGINAL_ALF_UPPER_HAMAZA		= '\u0623';
	public static inline var DEFINED_CHARACTERS_ORGINAL_ALF_LOWER_HAMAZA 	= '\u0625';
	public static inline var DEFINED_CHARACTERS_ORGINAL_ALF 					= '\u0627';
	public static inline var DEFINED_CHARACTERS_ORGINAL_LAM					= '\u0644';


	public static var LAM_ALEF_GLYPHS:Array<Array<String>>;
	public static var HARAKAT:Array<String>;
	public static var ARABIC_GLYPHS_LIST:Array<Array<Dynamic>>;
	public static var ARABIC_GLYPHS:Map < String, Array<Dynamic> > ;
	public static var re:EReg;
	
	public static function init() 
	{
		LAM_ALEF_GLYPHS = [	['\u0622', '\uFEF6', '\uFEF5'],	['\u0623', '\uFEF8', '\uFEF7'],
		['\u0627', '\uFEFC', '\uFEFB'],
		['\u0625', '\uFEFA', '\uFEF9']
		];
		
		HARAKAT = [
			'\u0600', '\u0601', '\u0602', '\u0603', '\u0606', '\u0607', '\u0608', '\u0609',
			'\u060A', '\u060B', '\u060D', '\u060E', '\u0610', '\u0611', '\u0612', '\u0613',
			'\u0614', '\u0615', '\u0616', '\u0617', '\u0618', '\u0619', '\u061A', '\u061B',
			'\u061E', '\u061F', '\u0621', '\u063B', '\u063C', '\u063D', '\u063E', '\u063F',
			'\u0640', '\u064B', '\u064C', '\u064D', '\u064E', '\u064F', '\u0650', '\u0651',
			'\u0652', '\u0653', '\u0654', '\u0655', '\u0656', '\u0657', '\u0658', '\u0659',
			'\u065A', '\u065B', '\u065C', '\u065D', '\u065E', '\u0660', '\u066A', '\u066B',
			'\u066C', '\u066F', '\u0670', '\u0672', '\u06D4', '\u06D5', '\u06D6', '\u06D7',
			'\u06D8', '\u06D9', '\u06DA', '\u06DB', '\u06DC', '\u06DF', '\u06E0', '\u06E1',
			'\u06E2', '\u06E3', '\u06E4', '\u06E5', '\u06E6', '\u06E7', '\u06E8', '\u06E9',
			'\u06EA', '\u06EB', '\u06EC', '\u06ED', '\u06EE', '\u06EF', '\u06D6', '\u06D7',
			'\u06D8', '\u06D9', '\u06DA', '\u06DB', '\u06DC', '\u06DD', '\u06DE', '\u06DF',
			'\u06F0', '\u06FD', '\uFE70', '\uFE71', '\uFE72', '\uFE73', '\uFE74', '\uFE75',
			'\uFE76', '\uFE77', '\uFE78', '\uFE79', '\uFE7A', '\uFE7B', '\uFE7C', '\uFE7D',
			'\uFE7E', '\uFE7F', '\uFC5E', '\uFC5F', '\uFC60', '\uFC61', '\uFC62', '\uFC63'
		];
		
		ARABIC_GLYPHS= new Map < String, Array<Dynamic> > ();
		
		ARABIC_GLYPHS.set('\u0622' , ['\u0622', '\uFE81', '\uFE81', '\uFE82', '\uFE82', 2]);
		ARABIC_GLYPHS.set('\u0623' , ['\u0623', '\uFE83', '\uFE83', '\uFE84', '\uFE84', 2]);
		ARABIC_GLYPHS.set('\u0624' , ['\u0624', '\uFE85', '\uFE85', '\uFE86', '\uFE86', 2]);
		ARABIC_GLYPHS.set('\u0625' , ['\u0625', '\uFE87', '\uFE87', '\uFE88', '\uFE88', 2]);
		ARABIC_GLYPHS.set('\u0626' , ['\u0626', '\uFE89', '\uFE8B', '\uFE8C', '\uFE8A', 4]);
		ARABIC_GLYPHS.set('\u0627' , ['\u0627', '\u0627', '\u0627', '\uFE8E', '\uFE8E', 2]);
		ARABIC_GLYPHS.set('\u0628' , ['\u0628', '\uFE8F', '\uFE91', '\uFE92', '\uFE90', 4]);
		ARABIC_GLYPHS.set('\u0629' , ['\u0629', '\uFE93', '\uFE93', '\uFE94', '\uFE94', 2]);
		ARABIC_GLYPHS.set('\u062A' , ['\u062A', '\uFE95', '\uFE97', '\uFE98', '\uFE96', 4]);
		ARABIC_GLYPHS.set('\u062B' , ['\u062B', '\uFE99', '\uFE9B', '\uFE9C', '\uFE9A', 4]);
		ARABIC_GLYPHS.set('\u062C' , ['\u062C', '\uFE9D', '\uFE9F', '\uFEA0', '\uFE9E', 4]);
		ARABIC_GLYPHS.set('\u062D' , ['\u062D', '\uFEA1', '\uFEA3', '\uFEA4', '\uFEA2', 4]);
		ARABIC_GLYPHS.set('\u062E' , ['\u062E', '\uFEA5', '\uFEA7', '\uFEA8', '\uFEA6', 4]);
		ARABIC_GLYPHS.set('\u062F' , ['\u062F', '\uFEA9', '\uFEA9', '\uFEAA', '\uFEAA', 2]);
		ARABIC_GLYPHS.set('\u0630' , ['\u0630', '\uFEAB', '\uFEAB', '\uFEAC', '\uFEAC', 2]);
		ARABIC_GLYPHS.set('\u0631' , ['\u0631', '\uFEAD', '\uFEAD', '\uFEAE', '\uFEAE', 2]);
		ARABIC_GLYPHS.set('\u0632' , ['\u0632', '\uFEAF', '\uFEAF', '\uFEB0', '\uFEB0', 2]);
		ARABIC_GLYPHS.set('\u0633' , ['\u0633', '\uFEB1', '\uFEB3', '\uFEB4', '\uFEB2', 4]);
		ARABIC_GLYPHS.set('\u0634' , ['\u0634', '\uFEB5', '\uFEB7', '\uFEB8', '\uFEB6', 4]);
		ARABIC_GLYPHS.set('\u0635' , ['\u0635', '\uFEB9', '\uFEBB', '\uFEBC', '\uFEBA', 4]);
		ARABIC_GLYPHS.set('\u0636' , ['\u0636', '\uFEBD', '\uFEBF', '\uFEC0', '\uFEBE', 4]);
		ARABIC_GLYPHS.set('\u0637' , ['\u0637', '\uFEC1', '\uFEC3', '\uFEC4', '\uFEC2', 4]);
		ARABIC_GLYPHS.set('\u0638' , ['\u0638', '\uFEC5', '\uFEC7', '\uFEC8', '\uFEC6', 4]);
		ARABIC_GLYPHS.set('\u0639' , ['\u0639', '\uFEC9', '\uFECB', '\uFECC', '\uFECA', 4]);
		ARABIC_GLYPHS.set('\u063A' , ['\u063A', '\uFECD', '\uFECF', '\uFED0', '\uFECE', 4]);
		ARABIC_GLYPHS.set('\u0641' , ['\u0641', '\uFED1', '\uFED3', '\uFED4', '\uFED2', 4]);
		ARABIC_GLYPHS.set('\u0642' , ['\u0642', '\uFED5', '\uFED7', '\uFED8', '\uFED6', 4]);
		ARABIC_GLYPHS.set('\u0643' , ['\u0643', '\uFED9', '\uFEDB', '\uFEDC', '\uFEDA', 4]);
		ARABIC_GLYPHS.set('\u0644' , ['\u0644', '\uFEDD', '\uFEDF', '\uFEE0', '\uFEDE', 4]);
		ARABIC_GLYPHS.set('\u0645' , ['\u0645', '\uFEE1', '\uFEE3', '\uFEE4', '\uFEE2', 4]);
		ARABIC_GLYPHS.set('\u0646' , ['\u0646', '\uFEE5', '\uFEE7', '\uFEE8', '\uFEE6', 4]);
		ARABIC_GLYPHS.set('\u0647' , ['\u0647', '\uFEE9', '\uFEEB', '\uFEEC', '\uFEEA', 4]);
		ARABIC_GLYPHS.set('\u0648' , ['\u0648', '\uFEED', '\uFEED', '\uFEEE', '\uFEEE', 2]);
		ARABIC_GLYPHS.set('\u0649' , ['\u0649', '\uFEEF', '\uFEEF', '\uFEF0', '\uFEF0', 2]);
		ARABIC_GLYPHS.set('\u0671' , ['\u0671', '\u0671', '\u0671', '\uFB51', '\uFB51', 2]);
		ARABIC_GLYPHS.set('\u064A' , ['\u064A', '\uFEF1', '\uFEF3', '\uFEF4', '\uFEF2', 4]);
		ARABIC_GLYPHS.set('\u066E' , ['\u066E', '\uFBE4', '\uFBE8', '\uFBE9', '\uFBE5', 4]);
		ARABIC_GLYPHS.set('\u06AA' , ['\u06AA', '\uFB8E', '\uFB90', '\uFB91', '\uFB8F', 4]);
		ARABIC_GLYPHS.set('\u06C1' , ['\u06C1', '\uFBA6', '\uFBA8', '\uFBA9', '\uFBA7', 4]);
		ARABIC_GLYPHS.set('\u06E4' , ['\u06E4', '\u06E4', '\u06E4', '\u06E4', '\uFEEE', 2]);
		ARABIC_GLYPHS.set('\u067E' , ['\u067E', '\uFB56', '\uFB58', '\uFB59', '\uFB57', 4]);
		ARABIC_GLYPHS.set('\u0698' , ['\u0698', '\uFB8A', '\uFB8A', '\uFB8A', '\uFB8B', 2]);
		ARABIC_GLYPHS.set('\u06AF' , ['\u06AF', '\uFB92', '\uFB94', '\uFB95', '\uFB93', 4]);
		ARABIC_GLYPHS.set('\u0686' , ['\u0686', '\uFB7A', '\uFB7C', '\uFB7D', '\uFB7B', 4]);
		ARABIC_GLYPHS.set('\u06A9' , ['\u06A9', '\uFB8E', '\uFB90', '\uFB91', '\uFB8F', 4]);
		ARABIC_GLYPHS.set('\u06CC' , ['\u06CC', '\uFEEF', '\uFEF3', '\uFEF4', '\uFEF0', 4]);
		
		
		ARABIC_GLYPHS_LIST = [
		['\u0622', '\uFE81', '\uFE81', '\uFE82', '\uFE82', 2],
		['\u0623', '\uFE83', '\uFE83', '\uFE84', '\uFE84', 2],
		['\u0624', '\uFE85', '\uFE85', '\uFE86', '\uFE86', 2],
		['\u0625', '\uFE87', '\uFE87', '\uFE88', '\uFE88', 2],
		['\u0626', '\uFE89', '\uFE8B', '\uFE8C', '\uFE8A', 4],
		['\u0627', '\u0627', '\u0627', '\uFE8E', '\uFE8E', 2],
		['\u0628', '\uFE8F', '\uFE91', '\uFE92', '\uFE90', 4],
		['\u0629', '\uFE93', '\uFE93', '\uFE94', '\uFE94', 2],
		['\u062A', '\uFE95', '\uFE97', '\uFE98', '\uFE96', 4],
		['\u062B', '\uFE99', '\uFE9B', '\uFE9C', '\uFE9A', 4],
		['\u062C', '\uFE9D', '\uFE9F', '\uFEA0', '\uFE9E', 4],
		['\u062D', '\uFEA1', '\uFEA3', '\uFEA4', '\uFEA2', 4],
		['\u062E', '\uFEA5', '\uFEA7', '\uFEA8', '\uFEA6', 4],
		['\u062F', '\uFEA9', '\uFEA9', '\uFEAA', '\uFEAA', 2],
		['\u0630', '\uFEAB', '\uFEAB', '\uFEAC', '\uFEAC', 2],
		['\u0631', '\uFEAD', '\uFEAD', '\uFEAE', '\uFEAE', 2],
		['\u0632', '\uFEAF', '\uFEAF', '\uFEB0', '\uFEB0', 2],
		['\u0633', '\uFEB1', '\uFEB3', '\uFEB4', '\uFEB2', 4],
		['\u0634', '\uFEB5', '\uFEB7', '\uFEB8', '\uFEB6', 4],
		['\u0635', '\uFEB9', '\uFEBB', '\uFEBC', '\uFEBA', 4],
		['\u0636', '\uFEBD', '\uFEBF', '\uFEC0', '\uFEBE', 4],
		['\u0637', '\uFEC1', '\uFEC3', '\uFEC4', '\uFEC2', 4],
		['\u0638', '\uFEC5', '\uFEC7', '\uFEC8', '\uFEC6', 4],
		['\u0639', '\uFEC9', '\uFECB', '\uFECC', '\uFECA', 4],
		['\u063A', '\uFECD', '\uFECF', '\uFED0', '\uFECE', 4],
		['\u0641', '\uFED1', '\uFED3', '\uFED4', '\uFED2', 4],
		['\u0642', '\uFED5', '\uFED7', '\uFED8', '\uFED6', 4],
		['\u0643', '\uFED9', '\uFEDB', '\uFEDC', '\uFEDA', 4],
		['\u0644', '\uFEDD', '\uFEDF', '\uFEE0', '\uFEDE', 4],
		['\u0645', '\uFEE1', '\uFEE3', '\uFEE4', '\uFEE2', 4],
		['\u0646', '\uFEE5', '\uFEE7', '\uFEE8', '\uFEE6', 4],
		['\u0647', '\uFEE9', '\uFEEB', '\uFEEC', '\uFEEA', 4],
		['\u0648', '\uFEED', '\uFEED', '\uFEEE', '\uFEEE', 2],
		['\u0649', '\uFEEF', '\uFEEF', '\uFEF0', '\uFEF0', 2],
		['\u0671', '\u0671', '\u0671', '\uFB51', '\uFB51', 2],
		['\u064A', '\uFEF1', '\uFEF3', '\uFEF4', '\uFEF2', 4],
		['\u066E', '\uFBE4', '\uFBE8', '\uFBE9', '\uFBE5', 4],
		['\u06AA', '\uFB8E', '\uFB90', '\uFB91', '\uFB8F', 4],
		['\u06C1', '\uFBA6', '\uFBA8', '\uFBA9', '\uFBA7', 4],
		['\u067E', '\uFB56', '\uFB58', '\uFB59', '\uFB57', 4],
		['\u0698', '\uFB8A', '\uFB8A', '\uFB8A', '\uFB8B', 2],
		['\u06AF', '\uFB92', '\uFB94', '\uFB95', '\uFB93', 4],
		['\u0686', '\uFB7A', '\uFB7C', '\uFB7D', '\uFB7B', 4],
		['\u06A9', '\uFB8E', '\uFB90', '\uFB91', '\uFB8F', 4],
		['\u06CC', '\uFEEF', '\uFEF3', '\uFEF4', '\uFEF0', 4]
		];
		
		
		
		re = new EReg('^\u0627\u0644\u0644\u0647$', "");
		
	}
	
	public static function get_reshaped_glyph(target, location):Dynamic
	{
		
		if (ARABIC_GLYPHS.exists(target))
		return ARABIC_GLYPHS.get(target)[location];
		else
		return target;
	}
	public static function get_glyph_type(target):Int
	{	
		if (ARABIC_GLYPHS.exists(target))
			return ARABIC_GLYPHS.get(target)[5];
		else
			return 2;
	}
	public static function is_haraka(target):Bool
	{
		return HARAKAT.indexOf(target)!= -1;
	}
	public static function replace_jalalah(unshaped_word):String
	{
		
		return re.replace(unshaped_word, '\uFDF2');
		
	}
	
	public static function replace_lam_alef(unshaped_word:String):String
	{
		var list_word:Array<String> = unshaped_word.split("");
		var letter_before:String = "";
		
		for (i in 0... unshaped_word.length)
		{
			if (!is_haraka(list_word[i]) && list_word[i] != DEFINED_CHARACTERS_ORGINAL_LAM)
				letter_before = list_word[i];
			if (list_word[i] == DEFINED_CHARACTERS_ORGINAL_LAM)
			{
				var candidate_lam:String = list_word[i];
				var lam_position:Int = i;
				var haraka_position:Int = i + 1;
				
				while (haraka_position < unshaped_word.length && is_haraka(list_word[haraka_position]))
					haraka_position += 1;
					
				var lam_alef:String="";
				if (haraka_position < unshaped_word.length)
					if (lam_position > 0 && ArabicReshaper.get_glyph_type(letter_before) > 2)
						lam_alef = ArabicReshaper.get_lam_alef(list_word[haraka_position], candidate_lam, false);
					else
						lam_alef = ArabicReshaper.get_lam_alef(list_word[haraka_position], candidate_lam, true);
					if (lam_alef != '')
					{
						list_word[lam_position] = lam_alef;
						list_word[haraka_position] = ' ';
					}
			}		
		}
			
		return StringTools.replace(list_word.join(""), " ", " ");
	}
	
	public static function get_lam_alef(candidate_alef, candidate_lam, is_end_of_word:Bool):String
	{
		var shift_rate:Int = 1;	
		var reshaped_lam_alef = '';
		if (is_end_of_word)
			shift_rate += 1;
		
		if (DEFINED_CHARACTERS_ORGINAL_LAM == candidate_lam)
			if (DEFINED_CHARACTERS_ORGINAL_ALF_UPPER_MDD == candidate_alef)
				reshaped_lam_alef = LAM_ALEF_GLYPHS[0][shift_rate];
			
		if (DEFINED_CHARACTERS_ORGINAL_ALF_UPPER_HAMAZA == candidate_alef)
			reshaped_lam_alef = LAM_ALEF_GLYPHS[1][shift_rate];
		
		if (DEFINED_CHARACTERS_ORGINAL_ALF == candidate_alef)
			reshaped_lam_alef = LAM_ALEF_GLYPHS[2][shift_rate];
		
		if (DEFINED_CHARACTERS_ORGINAL_ALF_LOWER_HAMAZA == candidate_alef)
			reshaped_lam_alef = LAM_ALEF_GLYPHS[3][shift_rate];
	
		return reshaped_lam_alef;
	}
	
	
	
}
