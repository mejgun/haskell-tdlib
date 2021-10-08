-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchEmojis where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Searches for emojis by keywords. Supported only if the file database is enabled 
-- 
-- __text__ Text to search for
-- 
-- __exact_match__ True, if only emojis, which exactly match text needs to be returned
-- 
-- __input_language_codes__ List of possible IETF language tags of the user's input language; may be empty if unknown
data SearchEmojis = 

 SearchEmojis { input_language_codes :: Maybe [String], exact_match :: Maybe Bool, text :: Maybe String }  deriving (Eq)

instance Show SearchEmojis where
 show SearchEmojis { input_language_codes=input_language_codes, exact_match=exact_match, text=text } =
  "SearchEmojis" ++ cc [p "input_language_codes" input_language_codes, p "exact_match" exact_match, p "text" text ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SearchEmojis where
 toJSON SearchEmojis { input_language_codes = input_language_codes, exact_match = exact_match, text = text } =
  A.object [ "@type" A..= T.String "searchEmojis", "input_language_codes" A..= input_language_codes, "exact_match" A..= exact_match, "text" A..= text ]

instance T.FromJSON SearchEmojis where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchEmojis" -> parseSearchEmojis v
   _ -> mempty
  where
   parseSearchEmojis :: A.Value -> T.Parser SearchEmojis
   parseSearchEmojis = A.withObject "SearchEmojis" $ \o -> do
    input_language_codes <- o A..:? "input_language_codes"
    exact_match <- o A..:? "exact_match"
    text <- o A..:? "text"
    return $ SearchEmojis { input_language_codes = input_language_codes, exact_match = exact_match, text = text }
 parseJSON _ = mempty
