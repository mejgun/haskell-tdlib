-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TranslateText where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Translates a text to the given language. Returns a 404 error if the translation can't be performed
-- 
-- __text__ Text to translate
-- 
-- __from_language_code__ A two-letter ISO 639-1 language code of the language from which the message is translated. If empty, the language will be detected automatically
-- 
-- __to_language_code__ A two-letter ISO 639-1 language code of the language to which the message is translated
data TranslateText = 

 TranslateText { to_language_code :: Maybe String, from_language_code :: Maybe String, text :: Maybe String }  deriving (Eq)

instance Show TranslateText where
 show TranslateText { to_language_code=to_language_code, from_language_code=from_language_code, text=text } =
  "TranslateText" ++ U.cc [U.p "to_language_code" to_language_code, U.p "from_language_code" from_language_code, U.p "text" text ]

instance T.ToJSON TranslateText where
 toJSON TranslateText { to_language_code = to_language_code, from_language_code = from_language_code, text = text } =
  A.object [ "@type" A..= T.String "translateText", "to_language_code" A..= to_language_code, "from_language_code" A..= from_language_code, "text" A..= text ]

instance T.FromJSON TranslateText where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "translateText" -> parseTranslateText v
   _ -> mempty
  where
   parseTranslateText :: A.Value -> T.Parser TranslateText
   parseTranslateText = A.withObject "TranslateText" $ \o -> do
    to_language_code <- o A..:? "to_language_code"
    from_language_code <- o A..:? "from_language_code"
    text <- o A..:? "text"
    return $ TranslateText { to_language_code = to_language_code, from_language_code = from_language_code, text = text }
 parseJSON _ = mempty
