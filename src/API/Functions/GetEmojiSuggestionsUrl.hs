-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetEmojiSuggestionsUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetEmojiSuggestionsUrl = 
 GetEmojiSuggestionsUrl { language_code :: String }  -- deriving (Show)

instance T.ToJSON GetEmojiSuggestionsUrl where
 toJSON (GetEmojiSuggestionsUrl { language_code = language_code }) =
  A.object [ "@type" A..= T.String "getEmojiSuggestionsUrl", "language_code" A..= language_code ]
-- getEmojiSuggestionsUrl GetEmojiSuggestionsUrl  { language_code :: String } 

