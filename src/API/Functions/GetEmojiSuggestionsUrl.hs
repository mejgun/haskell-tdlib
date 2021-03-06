-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetEmojiSuggestionsUrl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns an HTTP URL which can be used to automatically log in to the translation platform and suggest new emoji replacements. The URL will be valid for 30 seconds after generation 
-- 
-- __language_code__ Language code for which the emoji replacements will be suggested
data GetEmojiSuggestionsUrl = 

 GetEmojiSuggestionsUrl { language_code :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetEmojiSuggestionsUrl where
 toJSON (GetEmojiSuggestionsUrl { language_code = language_code }) =
  A.object [ "@type" A..= T.String "getEmojiSuggestionsUrl", "language_code" A..= language_code ]

instance T.FromJSON GetEmojiSuggestionsUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getEmojiSuggestionsUrl" -> parseGetEmojiSuggestionsUrl v
   _ -> mempty
  where
   parseGetEmojiSuggestionsUrl :: A.Value -> T.Parser GetEmojiSuggestionsUrl
   parseGetEmojiSuggestionsUrl = A.withObject "GetEmojiSuggestionsUrl" $ \o -> do
    language_code <- o A..:? "language_code"
    return $ GetEmojiSuggestionsUrl { language_code = language_code }