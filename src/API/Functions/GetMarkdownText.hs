-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMarkdownText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

--main = putStrLn "ok"

data GetMarkdownText = 
 GetMarkdownText { text :: FormattedText.FormattedText }  -- deriving (Show)

instance T.ToJSON GetMarkdownText where
 toJSON (GetMarkdownText { text = text }) =
  A.object [ "@type" A..= T.String "getMarkdownText", "text" A..= text ]
-- getMarkdownText GetMarkdownText  { text :: FormattedText.FormattedText } 

