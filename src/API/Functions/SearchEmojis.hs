-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchEmojis where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchEmojis = 
 SearchEmojis { input_language_code :: Maybe String, exact_match :: Maybe Bool, text :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SearchEmojis where
 toJSON (SearchEmojis { input_language_code = input_language_code, exact_match = exact_match, text = text }) =
  A.object [ "@type" A..= T.String "searchEmojis", "input_language_code" A..= input_language_code, "exact_match" A..= exact_match, "text" A..= text ]

instance T.FromJSON SearchEmojis where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchEmojis" -> parseSearchEmojis v
   _ -> mempty
  where
   parseSearchEmojis :: A.Value -> T.Parser SearchEmojis
   parseSearchEmojis = A.withObject "SearchEmojis" $ \o -> do
    input_language_code <- o A..:? "input_language_code"
    exact_match <- o A..:? "exact_match"
    text <- o A..:? "text"
    return $ SearchEmojis { input_language_code = input_language_code, exact_match = exact_match, text = text }