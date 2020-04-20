-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ParseMarkdown where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

--main = putStrLn "ok"

data ParseMarkdown = 
 ParseMarkdown { text :: FormattedText.FormattedText }  -- deriving (Show)

instance T.ToJSON ParseMarkdown where
 toJSON (ParseMarkdown { text = text }) =
  A.object [ "@type" A..= T.String "parseMarkdown", "text" A..= text ]
-- parseMarkdown ParseMarkdown  { text :: FormattedText.FormattedText } 

