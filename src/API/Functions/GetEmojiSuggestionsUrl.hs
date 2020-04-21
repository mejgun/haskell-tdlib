-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetEmojiSuggestionsUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetEmojiSuggestionsUrl = 
 GetEmojiSuggestionsUrl { language_code :: String }  deriving (Show)

instance T.ToJSON GetEmojiSuggestionsUrl where
 toJSON (GetEmojiSuggestionsUrl { language_code = language_code }) =
  A.object [ "@type" A..= T.String "getEmojiSuggestionsUrl", "language_code" A..= language_code ]



instance T.FromJSON GetEmojiSuggestionsUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getEmojiSuggestionsUrl" -> parseGetEmojiSuggestionsUrl v

   _ -> mempty ""
  where
   parseGetEmojiSuggestionsUrl :: A.Value -> T.Parser GetEmojiSuggestionsUrl
   parseGetEmojiSuggestionsUrl = A.withObject "GetEmojiSuggestionsUrl" $ \o -> do
    language_code <- o A..: "language_code"
    return $ GetEmojiSuggestionsUrl { language_code = language_code }